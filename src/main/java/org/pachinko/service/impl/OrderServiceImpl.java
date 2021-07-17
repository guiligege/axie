package org.pachinko.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.pachinko.dao.IOrderDao;
import org.pachinko.domain.ActionTypeEnum;
import org.pachinko.domain.OrderStatusEnum;
import org.pachinko.domain.ProductOperateTypeEnum;
import org.pachinko.dto.OrderPageQuery;
import org.pachinko.dto.OrderParam;
import org.pachinko.dto.ProductParam;
import org.pachinko.entity.ActionLog;
import org.pachinko.entity.Order;
import org.pachinko.service.IActionLogService;
import org.pachinko.service.IOrderService;
import org.pachinko.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service("orderService")
public class OrderServiceImpl implements IOrderService {

    @Autowired
    private IOrderDao orderDao;

    @Autowired
    private IProductService productService;
    @Autowired
    private IActionLogService actionLogService;


    private static final String ROLE_BUYER = "买家";
    private static final String ROLE_SELLER = "卖家";
    private static final String PLATFORM = "平台";
    private static final int rakeRate = 15;
    private static final int PERCENT = 1000;


    /**
     * 获取当前用户的fee(计算当前小二fee)
     * @param sellerId
     * @return
     */
    @Override
    public BigDecimal getFee(Integer sellerId){

        //check order (无进行中订单)
        OrderPageQuery pageQuery  = new OrderPageQuery();
        List<Integer> someStatus = new ArrayList<Integer>();
        someStatus.add(OrderStatusEnum.FINISH.getStatus());
        pageQuery.setSomeStatus(someStatus);
        pageQuery.setSellerId(sellerId);
        List<Order> orderList = this.queryProductListByUserId(pageQuery);

        if(CollectionUtils.isEmpty(orderList)){
            return new BigDecimal(0);
        }

        BigDecimal totalOrderPrice = new BigDecimal(0);
        for(Order order : orderList){
            totalOrderPrice.add(order.getTotalPrice());
        }

        BigDecimal resultFee = totalOrderPrice
            .multiply(new BigDecimal(rakeRate))
            .divide(new BigDecimal(PERCENT),8,BigDecimal.ROUND_DOWN);
        log.warn("resultFee is:{},totalOrderPrice:{},rakeRate:{},PERCENT:{}");
        return resultFee;
    }

    /**
     * 新增订单（锁库存增加）
     *
     * 锁定库存
     * @param orderParam
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Long addOrder(OrderParam orderParam) {

        Order  order  = new Order();

        //fillProduct(Long productId,String productName,String productType)
        order.fillProduct(orderParam.getProductId(),orderParam.getProductName(),orderParam.getProductType());

        //fillSeller(Integer sellerId,String sellerNick,String sellerRonin)
        order.fillSeller(orderParam.getSellerId(),orderParam.getSellerNick(),orderParam.getSellerRonin());
        order.fillBuyer(orderParam.getBuyerId(),orderParam.getBuyerNick(),orderParam.getBuyerRonin());
        order.fillBaseOrder(orderParam.getSinglePrice(),orderParam.getBuyCount(),orderParam.getMode());
        order.caculateTotalPrice();

        //加订单
        orderDao.insert(order);

        //goods 锁库存
        ProductParam productParam = new ProductParam();
        productParam.setId(orderParam.getProductId());
        productParam.setBuyCount(orderParam.getBuyCount());
        productParam.setProductOperateType(ProductOperateTypeEnum.LockCountAdd.getType());
        productService.updateProduct(productParam);
        return order.getId();
    }

    /**
     * 订单取消 （锁库存扣减）
     *
     * 涉及商品补回数量。
     *
     * @param orderParam
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int cancelOrder(OrderParam orderParam) {

        Order order = getOrderById(orderParam.getId());
        if(order == null){
            log.warn("cancelOrder order not exist!id:{}",orderParam.getId());
            return  0;
        }

        order.setStatus(OrderStatusEnum.CANCEL.getStatus());
        order.setUpdated(new Date());
        orderDao.updateByPrimaryKey(order);

        //log
        ActionLog actionLog = new ActionLog();
        actionLog.buildBaseActionLog(order.getId(),order.getBuyerId(),order.getBuyerNick(),ROLE_BUYER);
        actionLog.buildAction(ActionTypeEnum.CANCEL,ActionTypeEnum.CANCEL.getName());
        actionLogService.addActionLog(actionLog);

        //goods 锁库存
        ProductParam productParam = new ProductParam();
        productParam.setId(orderParam.getProductId());
        productParam.setBuyCount(orderParam.getBuyCount());
        productParam.setProductOperateType(ProductOperateTypeEnum.CancelOrder.getType());
        productService.updateProduct(productParam);
        return 1;
    }

    /**
     * 买家点击已支付 （锁库存扣减，主库存扣减）
     *
     *
     * @param orderParam
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int hasPay(OrderParam orderParam) {

        Order order = getOrderById(orderParam.getId());
        if(order == null){
            log.warn("cancelOrder order not exist!id:{}",orderParam.getId());
            return  0;
        }

        order.setStatus(OrderStatusEnum.HAS_PAY.getStatus());
        order.setUpdated(new Date());
        orderDao.updateByPrimaryKey(order);

        //goods 锁库存
        ProductParam productParam = new ProductParam();
        productParam.setId(orderParam.getProductId());
        productParam.setBuyCount(orderParam.getBuyCount());
        productParam.setProductOperateType(ProductOperateTypeEnum.PAY.getType());
        productService.updateProduct(productParam);
        return 1;
    }


    /***买家***/
    /**
     * 收货，完结
     *
     * 30分钟不确认收货，自动完结
     *
     * //todo
     *
     * 涉及分账。
     *
     * @param orderParam
     * @return
     */
    @Override
    public int hasRecivedGood(OrderParam orderParam,Order order) {

        if(order  == null){
            order = getOrderById(orderParam.getId());
        }
        this.hasFinish(order);

        //log
        ActionLog actionLog = new ActionLog();
        actionLog.buildBaseActionLog(order.getId(),order.getBuyerId(),order.getBuyerNick(),ROLE_BUYER);
        actionLog.buildAction(ActionTypeEnum.HAS_RECIEVED,ActionTypeEnum.HAS_RECIEVED.getName());
        actionLogService.addActionLog(actionLog);
        return 1;
    }

    /**
     * 收货，完结
     *
     * 30分钟不确认收货，自动完结
     *
     * //todo
     *
     * 涉及分账。
     *
     * @param order
     * @return
     */
    @Override
    public int hasFinish( Order order) {

        if(order == null){
            log.warn("cancelOrder order not exist!");
            return  0;
        }

        order.setStatus(OrderStatusEnum.FINISH.getStatus());
        order.setUpdated(new Date());
        orderDao.updateByPrimaryKey(order);
        return 1;
    }

    /**
     * 收货，完结
     *
     * 30分钟不确认收货，自动完结
     *
     * //todo
     *
     * 涉及分账。
     *
     * @param orderParam
     * @return
     */
    @Override
    public int autoRecivedGood(OrderParam orderParam) {

        Order order = getOrderById(orderParam.getId());
        this.hasRecivedGood(orderParam,order);

        //log
        ActionLog actionLog = new ActionLog();
        actionLog.buildBaseActionLog(order.getId(),order.getBuyerId(),order.getBuyerNick(),ROLE_BUYER);
        actionLog.buildAction(ActionTypeEnum.AUTO_RECIEVED,ActionTypeEnum.AUTO_RECIEVED.getName());
        actionLogService.addActionLog(actionLog);
        return 1;
    }

    /**
     * 纠纷
     * @param orderParam
     * @return
     */
    @Override
    public int disputeOrder(OrderParam orderParam) {

        Order order = getOrderById(orderParam.getId());
        if(order == null){
            log.warn("cancelOrder order not exist!id:{}",orderParam.getId());
            return  0;
        }

        order.setStatus(OrderStatusEnum.DISPUTE.getStatus());
        order.setUpdated(new Date());
        orderDao.updateByPrimaryKey(order);

        //log
        ActionLog actionLog = new ActionLog();
        actionLog.buildBaseActionLog(order.getId(),order.getBuyerId(),order.getBuyerNick(),ROLE_BUYER);
        actionLog.buildAction(ActionTypeEnum.DISPUTE,ActionTypeEnum.DISPUTE.getName());
        actionLogService.addActionLog(actionLog);

        return 1;
    }

    /**
     * 买家发起退款
     * @param orderParam
     * @return
     */
    @Override
    public int refund(OrderParam orderParam) {

        Order order = getOrderById(orderParam.getId());
        if(order == null){
            log.warn("cancelOrder order not exist!id:{}",orderParam.getId());
            return  0;
        }

        order.setStatus(OrderStatusEnum.TO_REFUND.getStatus());
        order.setUpdated(new Date());
        orderDao.updateByPrimaryKey(order);

        //log
        ActionLog actionLog = new ActionLog();
        actionLog.buildBaseActionLog(order.getId(),order.getBuyerId(),order.getBuyerNick(),ROLE_BUYER);
        actionLog.buildAction(ActionTypeEnum.TO_REFUND,ActionTypeEnum.TO_REFUND.getName());
        actionLogService.addActionLog(actionLog);
        return 1;
    }

    @Override
    public int cancleRefundFinishOrder(OrderParam orderParam) {

        Order order = getOrderById(orderParam.getId());
        if(order == null){
            log.warn("cancelOrder order not exist!id:{}",orderParam.getId());
            return  0;
        }

        order.setStatus(OrderStatusEnum.FINISH.getStatus());
        order.setUpdated(new Date());
        orderDao.updateByPrimaryKey(order);

        //log
        ActionLog actionLog = new ActionLog();
        actionLog.buildBaseActionLog(order.getId(),order.getBuyerId(),order.getBuyerNick(),ROLE_BUYER);
        actionLog.buildAction(ActionTypeEnum.CLOSE_REFUND_FINISH,ActionTypeEnum.CLOSE_REFUND_FINISH.getName());
        actionLogService.addActionLog(actionLog);
        return 1;
    }

    @Override
    public int updateOrder(OrderParam orderParam) {
        return 0;
    }

    @Override
    public Order getOrderById(Long orderId) {

        return orderDao.selectByPrimaryKey(orderId);
    }

    @Override
    public List<Order> queryProductListByUserId(OrderPageQuery pageQuery) {

        if((pageQuery.getBuyerId() == null || pageQuery.getBuyerId() == 0)
            && (pageQuery.getSellerId() == null ||pageQuery.getSellerId() == 0)){

            return null;
        }

        return orderDao.queryOrderListByUserId(pageQuery);
    }


    /**********卖家操作***********/
    /**
     * 卖家点击已发货
     *
     * @param orderParam
     * @return
     */
    @Override
    public int hasSendGood(OrderParam orderParam) {

        Order order = getOrderById(orderParam.getId());
        if(order == null){
            log.warn("cancelOrder order not exist!id:{}",orderParam.getId());
            return  0;
        }

        order.setStatus(OrderStatusEnum.SEND_GOODS.getStatus());
        order.setUpdated(new Date());
        orderDao.updateByPrimaryKey(order);
        return 1;
    }

    /**
     * 卖家已退款
     *
     * @param orderParam
     * @return
     */
    @Override
    public int sellerHasRefund(OrderParam orderParam) {

        Order order = getOrderById(orderParam.getId());
        if(order == null){
            log.warn("cancelOrder order not exist!id:{}",orderParam.getId());
            return  0;
        }

        order.setStatus(OrderStatusEnum.HAS_REFUND.getStatus());
        order.setUpdated(new Date());
        orderDao.updateByPrimaryKey(order);

        //log
        ActionLog actionLog = new ActionLog();
        actionLog.buildBaseActionLog(order.getId(),order.getSellerId(),order.getSellerNick(),ROLE_SELLER);
        actionLog.buildAction(ActionTypeEnum.HAS_REFUND,ActionTypeEnum.HAS_REFUND.getName());
        actionLogService.addActionLog(actionLog);

        return 1;
    }

    /**
     * 买家已经拿到退款 （24小时内自动判拿到）
     * @param orderParam
     * @return
     */
    @Override
    public int buyerHasRefund(OrderParam orderParam) {
        Order order = getOrderById(orderParam.getId());
        if(order == null){
            log.warn("cancelOrder order not exist!id:{}",orderParam.getId());
            return  0;
        }

        order.setStatus(OrderStatusEnum.CLOSE.getStatus());
        order.setUpdated(new Date());
        orderDao.updateByPrimaryKey(order);

        //log
        ActionLog actionLog = new ActionLog();
        actionLog.buildBaseActionLog(order.getId(),order.getBuyerId(),order.getBuyerNick(),ROLE_BUYER);
        actionLog.buildAction(ActionTypeEnum.RECIEVED_REFUND,ActionTypeEnum.RECIEVED_REFUND.getName());
        actionLogService.addActionLog(actionLog);
        return 1;
    }

    /**
     * 卖家拒绝退款
     *
     * @param orderParam
     * @return
     */
    @Override
    public int refuseRefund(OrderParam orderParam) {

        Order order = getOrderById(orderParam.getId());
        if(order == null){
            log.warn("cancelOrder order not exist!id:{}",orderParam.getId());
            return  0;
        }

        order.setStatus(OrderStatusEnum.DISPUTE.getStatus());
        order.setUpdated(new Date());
        orderDao.updateByPrimaryKey(order);

        //log
        ActionLog actionLog = new ActionLog();
        actionLog.buildBaseActionLog(order.getId(),order.getSellerId(),order.getSellerNick(),ROLE_SELLER);
        actionLog.buildAction(ActionTypeEnum.REFUSE_REFUND,ActionTypeEnum.REFUSE_REFUND.getName());
        actionLogService.addActionLog(actionLog);
        return 1;
    }

    /**
     * 卖家 - 让买家等待货物抵达
     *
     * @param orderParam
     * @return
     */
    @Override
    public int waitGoodsSend(OrderParam orderParam) {

        Order order = getOrderById(orderParam.getId());
        if(order == null){
            log.warn("cancelOrder order not exist!id:{}",orderParam.getId());
            return  0;
        }

        order.setStatus(OrderStatusEnum.GOOD_SEND_WAIT.getStatus());
        order.setUpdated(new Date());
        orderDao.updateByPrimaryKey(order);

        //log
        ActionLog actionLog = new ActionLog();
        actionLog.buildBaseActionLog(order.getId(),order.getSellerId(),order.getSellerNick(),ROLE_SELLER);
        actionLog.buildAction(ActionTypeEnum.GOOD_SEND_WAIT,ActionTypeEnum.GOOD_SEND_WAIT.getName());
        actionLogService.addActionLog(actionLog);
        return 1;
    }

    @Override
    public int judgeBuyerResponse(OrderParam orderParam) {

        Order order = getOrderById(orderParam.getId());
        if (order == null) {
            log.warn("cancelOrder order not exist!id:{}", orderParam.getId());
            return 0;
        }

        order.setStatus(OrderStatusEnum.FINISH.getStatus());
        order.setUpdated(new Date());
        orderDao.updateByPrimaryKey(order);

        //log
        ActionLog actionLog = new ActionLog();
        actionLog.buildBaseActionLog(order.getId(),0,"平台",PLATFORM);
        actionLog.buildAction(ActionTypeEnum.BUYER_RESPONSE,ActionTypeEnum.BUYER_RESPONSE.getName());
        actionLogService.addActionLog(actionLog);
        return 1;
    }

    @Override
    public int judgeSellerResponse(OrderParam orderParam) {

        Order order = getOrderById(orderParam.getId());
        if (order == null) {
            log.warn("cancelOrder order not exist!id:{}", orderParam.getId());
            return 0;
        }

        order.setStatus(OrderStatusEnum.TO_PLATFORM_REFUND.getStatus());
        order.setUpdated(new Date());
        orderDao.updateByPrimaryKey(order);

        //log
        ActionLog actionLog = new ActionLog();
        actionLog.buildBaseActionLog(order.getId(),0,"平台",PLATFORM);
        actionLog.buildAction(ActionTypeEnum.SELLER_RESPONSE,ActionTypeEnum.SELLER_RESPONSE.getName());
        actionLogService.addActionLog(actionLog);
        return 1;
    }


    @Override
    public int addLog(Integer userId,Long orderId,String content) {

        Order order = getOrderById(orderId);
        if (order == null) {
            log.warn("cancelOrder order not exist!id:{}", orderId);
            return 0;
        }

        //log
        ActionLog actionLog = new ActionLog();
        if(userId.equals(order.getBuyerId())){
            actionLog.buildBaseActionLog(order.getId(),order.getBuyerId(),order.getBuyerNick(),ROLE_BUYER);
        }
        if(userId.equals(order.getSellerId())){
            actionLog.buildBaseActionLog(order.getId(),order.getSellerId(),order.getSellerNick(),ROLE_SELLER);
        }else{
            log.error("add log error!");
            return 0;
        }
        actionLog.buildAction(ActionTypeEnum.CHAT,content);
        actionLogService.addActionLog(actionLog);
        return 1;
    }

}
