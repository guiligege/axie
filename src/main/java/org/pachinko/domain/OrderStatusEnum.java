package org.pachinko.domain;

import java.util.List;

import com.google.common.collect.Lists;

/**
 * 订单状态meiju
 */
public enum OrderStatusEnum {

    //订单状态（未支付：1；已支付：2；已发货：3；纠纷中：5；纠纷关闭，订单关闭：6；撤销：7/完结：8）
    //未支付
    NO_PAY("未支付",1),
    //已支付
    HAS_PAY("已支付",2),
    //已发货
    SEND_GOODS("已发货",3),

    //已收货
    //RECIVED_GOODS("确认收货",11),

    //申请退款
    TO_REFUND("买家申请退款",5),

    //请等待货物
    GOOD_SEND_WAIT("由于交易系统延迟，卖家确认已发货，请耐心等待30分钟",16),

    //卖家已退款
    HAS_REFUND("卖家已退款",9),
    //拒绝退款,平台介入
    DISPUTE("纠纷中",10),

    //纠纷
    //DISPUTE_CLOSE("纠纷关闭，订单关闭",6),

    //纠纷完成，买家责任
    //DISPUTE_FINISH("纠纷关闭，订单完成",17),

    //待平台退款买家
    TO_PLATFORM_REFUND("待平台退款买家",18),


    //关闭
    CLOSE("关闭",19),
    //撤销
    CANCEL("撤销",7),
    //完结
    FINISH("完结",8),


    ;

    private String name;
    private int status;

    OrderStatusEnum(String name, int status) {
        this.name = name;
        this.status=status;
    }

    public String getName(){
        return name;
    }

    public int getStatus(){
        return status;
    }

    public static  OrderStatusEnum getOrderStatusEnum(int status) {

        for (OrderStatusEnum orderStatusEnum : OrderStatusEnum.values()) {
            if (orderStatusEnum.status == status) {
                return orderStatusEnum;
            }
        }
        return null;
    }

    public static List<Integer> getAvaliableStatus(){

        List<Integer> avaliableStatus = Lists.newArrayList();
        avaliableStatus.add(NO_PAY.status);
        avaliableStatus.add(HAS_PAY.status);
        avaliableStatus.add(SEND_GOODS.status);
        avaliableStatus.add(DISPUTE.status);
        avaliableStatus.add(TO_REFUND.status);
        avaliableStatus.add(GOOD_SEND_WAIT.status);
        avaliableStatus.add(HAS_REFUND.status);
        avaliableStatus.add(TO_PLATFORM_REFUND.status);

        return avaliableStatus;
    }

    public static List<Integer> getDisputeStatus(){

        List<Integer> avaliableStatus = Lists.newArrayList();
        avaliableStatus.add(DISPUTE.status);
        avaliableStatus.add(TO_REFUND.status);
        avaliableStatus.add(GOOD_SEND_WAIT.status);
        avaliableStatus.add(TO_PLATFORM_REFUND.status);
        avaliableStatus.add(HAS_REFUND.status);
        return avaliableStatus;
    }

}