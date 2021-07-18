package org.pachinko.service.impl;

import java.util.Calendar;
import java.util.List;
import java.util.TimerTask;

import lombok.extern.slf4j.Slf4j;
import org.pachinko.domain.OrderStatusEnum;
import org.pachinko.dto.OrderPageQuery;
import org.pachinko.dto.OrderParam;
import org.pachinko.entity.Order;
import org.pachinko.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

@Slf4j
@Service("coinTimerTask")
public class CoinTimerTask extends TimerTask {

    @Autowired
    private IOrderService orderService;

    private static final Long CANCEL_TIME = 30*60L*1000L;
    //12小时还在未发货状态，发起退款申请
    private static final Long REFUND_TIME =12*60*60L*1000L;
    //最终确认收货时间（2天内 还在已发货状态，默认收货）
    private static final Long RECIEVED_TIME =48*60*60L*1000L;

    @Override
    public void run() {

        Long startTime = System.currentTimeMillis();

        OrderPageQuery pageQuery = new OrderPageQuery();
        List<Integer> someStatus = OrderStatusEnum.getJobStatus();
        pageQuery.setSomeStatus(someStatus);

        //当前时间-20分
        Calendar calendar=Calendar.getInstance();
        calendar.add(Calendar.MINUTE,-20);

        //当前时间+4天
        Calendar newCalendar=Calendar.getInstance();
        newCalendar.add(Calendar.DAY_OF_MONTH,+4);

        pageQuery.setStartTime(calendar.getTime());
        pageQuery.setEndTime(newCalendar.getTime());

        List<Order>  orderList = orderService.queryOrderList(pageQuery);
        if(CollectionUtils.isEmpty(orderList)){
            log.warn("orderList is empty!");
            return;
        }

        //循环执行
        for(Order order:orderList){

            //是否单子创建 时间大于30分钟。
            if(order.getCreated().getTime()+CANCEL_TIME < System.currentTimeMillis()){
                continue;
            }else{
                orderProcess(order);
            }
        }

        log.warn("cost time:{}s", (System.currentTimeMillis() - startTime) / 1000);
    }

    private void orderProcess(Order order){

        //未支付处理
        if(order.getStatus() == OrderStatusEnum.NO_PAY.getStatus()){

            //未支付，自动取消订单
            noPayProcess(order);
            return;
        }else if(order.getStatus() == OrderStatusEnum.HAS_PAY.getStatus()){

            if(order.getCreated().getTime()+REFUND_TIME < System.currentTimeMillis()){
                log.warn("has pay not in limit time id:{}",order.getId());
                return;
            }
            //已支付未发货，自动发起退款
            hasPayProcess(order);
            return;
        }else if(order.getStatus() == OrderStatusEnum.SEND_GOODS.getStatus()){

            if(order.getCreated().getTime()+RECIEVED_TIME < System.currentTimeMillis()){
                log.warn("send goods not in limit time id:{}",order.getId());
                return;
            }
            
            //已发货48小时后，自动确认收货。
            hasSendGoodsProcess(order);
            return;
        }
    }

    /**
     * 未支付，撤销订单
     * @param order
     */
    private void noPayProcess(Order order){

        //30分钟未支付，自动关闭
        OrderParam orderParam = new OrderParam();
        orderParam.setId(order.getId());
        orderParam.setBuyCount(order.getBuyCount());
        orderParam.setProductId(order.getProductId());
        orderService.cancelOrder(orderParam,true);
        return;
    }

    /**
     * 已支付发起退款
     * @param order
     */
    private void hasPayProcess(Order order){
        //6小时内不确认发货，自动发起退款申请
        OrderParam orderParam = new OrderParam();
        orderParam.setId(order.getId());
        orderParam.setBuyCount(order.getBuyCount());
        orderParam.setProductId(order.getProductId());
        orderService.autoRecivedGood(orderParam);
        return;
    }

    private void hasSendGoodsProcess(Order order){

        //2天内不确认收款或发起退货申请，系统自动收款
        OrderParam orderParam = new OrderParam();
        orderParam.setId(order.getId());
        orderParam.setBuyCount(order.getBuyCount());
        orderParam.setProductId(order.getProductId());
        orderService.refund(orderParam);
        return;
    }

}
