package org.pachinko.service.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.collections4.MapUtils;
import org.pachinko.dto.ChongzhiParam;
import org.pachinko.entity.ChongZhi;
import org.pachinko.entity.FeeDetail;
import org.pachinko.entity.Order;
import org.pachinko.entity.User;
import org.pachinko.entity.Withdraw;
import org.pachinko.service.IChongzhiService;
import org.pachinko.service.IFeeDetailService;
import org.pachinko.service.IOrderService;
import org.pachinko.service.IUserService;
import org.pachinko.service.IWithdrawService;
import org.pachinko.utils.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service("fenzhangService")
public class FenzhangServiceImpl implements IFenzhangService{

    @Autowired
    private IOrderService orderService;
    @Autowired
    private IFeeDetailService feeDetailService;
    @Autowired
    private IUserService userService;
    @Autowired
    private IChongzhiService chongzhiService;
    @Autowired
    private IWithdrawService withdrawService;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int sellerWithdraw(Withdraw record) {

        //1、冻结保证金
        //2、新增提现单
        withdrawService.insert(record);

        //有保证金且保证金为启用状态
        ChongZhi sellerChongzhi =  chongzhiService.selectBySellerId(record.getSellerId());

        ChongzhiParam chongzhiParam = new ChongzhiParam();
        //chongzhiParam.setFeePrice(sellerChongzhi.getFeePrice().add(record.getFeePrice()));
        chongzhiParam.setId(sellerChongzhi.getId());

        //冻结保证金,并记录总的提现金额
        chongzhiService.chongzhiFreeze(chongzhiParam);
        return 0;
    }



    /**
     * 订单分账到平台
     *
     * @return
     */
    @Override
    public int fenzhangOrder() {

        List<Order> orderList = orderService.queryLastOrders();

        if(CollectionUtils.isEmpty(orderList)){
            log.warn("orderList is empty!");
            return 0;
        }

        //循环执行
        Map<Integer,BigDecimal> sellerFenzhangMap = new HashMap<>();
        for(Order order:orderList){

            //计算每个卖家需要分账的额度
            //查询订单用户分账金额
            BigDecimal totalOrderPrice = new BigDecimal(0);
            totalOrderPrice.add(order.getTotalPrice());

            BigDecimal resultFee = totalOrderPrice
                .multiply(new BigDecimal(Constants.PLATFORM_PERCENT))
                .divide(new BigDecimal(Constants.PERCENT),8,BigDecimal.ROUND_DOWN);

            if(sellerFenzhangMap.get(order.getSellerId()) == null){

                sellerFenzhangMap.put(order.getSellerId(),resultFee);
            }else{
                //累加
                sellerFenzhangMap.put(order.getSellerId(),
                    sellerFenzhangMap.get(order.getSellerId()).add(resultFee)
                );
            }
        }

        //分账
        this.realFenzhang(orderList,sellerFenzhangMap);
        return 1;
    }

    /**
     * 真正分账
     * @param orderList
     * @param sellerFenzhangMap
     */
    @Transactional(rollbackFor = Exception.class)
    public void realFenzhang(List<Order>  orderList,Map<Integer,BigDecimal> sellerFenzhangMap){

        //todo 4、提现不再计算fee。仅判断是否有未结算订单，如果有禁止提现。
        if(CollectionUtils.isEmpty(orderList) || MapUtils.isEmpty(sellerFenzhangMap)){

            log.warn("realFenzhang input is empty!");
            return;
        }

        //标记为分账，且记录分账信息
        for(Order order : orderList){

            //1、记录fee 明细表
            //2、更新完结订单为已结算。
            if(order == null){
                log.warn("cancelOrder order not exist!id:{}",order.getId());
                continue;
            }

            User user = userService.getByUserId(order.getBuyerId());
            User inviteUser =userService.selectDailiByCode(user.getDailiCode());

            //记录分账信息
            FeeDetail feeDetail = new FeeDetail();
            feeDetail.buildFeeDetail(order, Constants.PLATFORM_PERCENT,inviteUser.getPercentage(),inviteUser.getId());
            feeDetailService.insert(feeDetail);

            //更新订单 为已分账
            order.setUpdated(new Date());
            order.setFenzhang(1);
            orderService.updateByPrimaryKey(order);
        }

        //3、更新保证金的fee字段。
        for(Integer sellerId : sellerFenzhangMap.keySet()){

            //有保证金且保证金为启用状态
            ChongZhi sellerChongzhi =  chongzhiService.selectBySellerId(sellerId);
            sellerChongzhi.setFeePrice(sellerChongzhi.getFeePrice().add(sellerFenzhangMap.get(sellerId)));
            chongzhiService.updateByPrimaryKey(sellerChongzhi);

            log.warn("sellerId :{},fee cost:{}",sellerId,sellerFenzhangMap.get(sellerId));
        }

    }
}
