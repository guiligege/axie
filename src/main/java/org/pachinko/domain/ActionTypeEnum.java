package org.pachinko.domain;

/**
 * 产品类型
 */

public enum ActionTypeEnum {



    //申请退款
    TO_REFUND("买家申请退款",5),

    //请等待货物
    GOOD_SEND_WAIT("由于交易系统延迟，卖家确认已发货，请耐心等待30分钟",16),

    //卖家已退款
    HAS_REFUND("卖家已退款",9),
    //拒绝退款,平台介入
    DISPUTE("纠纷中",10),

    //纠纷
    DISPUTE_CLOSE("纠纷关闭，订单关闭",6),

    //纠纷完成，买家责任
    DISPUTE_FINISH("纠纷关闭，订单完成",17),

    //卖家已退款
    TO_PLATFORM_REFUND("待平台退款买家",18),


    //关闭
    CLOSE("关闭",19),
    //撤销
    CANCEL("撤销",7),
    //完结
    FINISH("完结",8),


    /*****非业务状态******/
    //已收货 log状态
    HAS_RECIEVED("已收货",15),
    //自动收货 log状态
    AUTO_RECIEVED("已收货",14),
    //取消退款，并完成
    CLOSE_REFUND_FINISH("纠纷关闭，订单完成",21),
    //买家已拿到退款
    RECIEVED_REFUND("买家已拿到退款",22),
    //卖家已退款
    REFUSE_REFUND("卖家拒绝退款",23),
    //判决买家责任
    BUYER_RESPONSE("判决买家责任",24),
    //判决卖家责任
    SELLER_RESPONSE("判决卖家责任",25),
    //普通对话
    CHAT("买卖家对话",26),

    //充值
    PLATFORM_OK_PAY("充值成功",30),

    //充值
    PLATFORM_NO_PAY("未到账",31),

    //等待提现
    PLATFORM_WITHDRAW_WAIT("等待提现",32),

    //提现成功
    PLATFORM_WITHDRAW_OK("提现成功",32),

    //发起充值
    SELLER_PAY("发起充值",33),

    //撤销
    SYSTEM_CANCEL("系统撤销",34),

    FEN_ZHANG("分账",35),


    ;

    private String name;
    private int status;

    ActionTypeEnum(String name, int status) {
        this.name = name;
        this.status=status;
    }


    public String getName(){
        return name;
    }

    public int getStatus(){
        return status;
    }

}