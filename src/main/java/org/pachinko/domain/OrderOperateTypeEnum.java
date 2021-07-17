package org.pachinko.domain;

/**
 * 订单操作类型
 */
public enum OrderOperateTypeEnum {

/**
 * 2、撤销
 * 1、新增
 * 3，纠纷
 * 4、买家确认支付
 * 5、卖家确认发货
 * 6、纠纷关闭，订单关闭
 * */
    Cancel("撤销",2),
    ADD("新增",1),
    Dispute("纠纷",3),
    HAS_PAY("买家确认支付",4),
    HAS_SEND("卖家确认发货",5),
    DisputeClose("纠纷关闭，订单关闭",6),
    ;

    private String name;
    private int type;

    OrderOperateTypeEnum(String name, int type) {
        this.name = name;
        this.type=type;
    }

    public String getName(){
        return name;
    }

    public int getType(){
        return type;
    }

}