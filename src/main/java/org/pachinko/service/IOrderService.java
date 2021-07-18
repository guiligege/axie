package org.pachinko.service;

import java.math.BigDecimal;
import java.util.List;

import org.pachinko.dto.OrderPageQuery;
import org.pachinko.dto.OrderParam;
import org.pachinko.entity.Order;

/**
 * 用户服务
 */
public interface IOrderService {

    /****卖家服务*****/

    /**
     * 新增订单
     *
     * @param orderParam
     * @return
     */
    Long addOrder(OrderParam orderParam);

    /**
     * 买家取消订单
     *
     * @param orderParam
     * @return
     */
    int cancelOrder(OrderParam orderParam,boolean isSystem);

    /**
     * 发起退款
     * @param orderParam
     * @return
     */
    int refund(OrderParam orderParam);

    /**
     * 关闭退款，完结订单（30分钟内未关闭或平台介入，那么自动关闭，完结订单。）
     * @param orderParam
     * @return
     */
    int cancleRefundFinishOrder(OrderParam orderParam);

    /**
     * 卖家已退款
     * @param orderParam
     * @return
     */
    int sellerHasRefund(OrderParam orderParam);

    /**
     * 买家确认已退款
     * @param orderParam
     * @return
     */
    int buyerHasRefund(OrderParam orderParam);


    /**
     * 纠纷
     *
     * @param orderParam
     * @return
     */
    int disputeOrder(OrderParam orderParam);

    /**
     * 更新
     *
     * @param orderParam
     * @param
     * @return
     */
    int updateOrder(OrderParam orderParam);

    int hasRecivedGood(OrderParam orderParam,Order order,boolean isSystem);

    int autoRecivedGood(OrderParam orderParam);

    int hasPay(OrderParam orderParam);

    int hasFinish(Order param);


    /******卖家服务******/

    int hasSendGood(OrderParam orderParam);

    /**
     * 拒绝退款
     * @param orderParam
     * @return
     */
    int refuseRefund(OrderParam orderParam);


    int waitGoodsSend(OrderParam orderParam);


    /****平台***/
    int judgeBuyerResponse(OrderParam orderParam);

    int judgeSellerResponse(OrderParam orderParam);

    /*****买家服务******/

    /**
     * 单个查询(详情)
     *
     * @param orderId
     * @return
     */
    Order getOrderById(Long orderId);


    /**
     * 查询我的订单
     * @param pageQuery
     * @return
     */
    List<Order> queryProductListByUserId(OrderPageQuery pageQuery);

    /**
     * 协商记录
     * @param userId
     * @param orderId
     * @param content
     * @return
     */
    int addLog(Integer userId,Long orderId,String content);

    BigDecimal getFee(Integer sellerId);

    List<Order> queryOrderList(OrderPageQuery pageQuery);

    List<Order> getHasFinishOrders(Integer sellerId);

    /**
     * 分账
     * @param
     * @return
     */
    //int fenzhangOrder();

    int updateByPrimaryKey(Order order);

    /**
     * 查询最近几天的已完成，未分账订单
     * @return
     */
    List<Order> queryLastOrders();
}
