package org.pachinko.domain;

/**
 * 订单状态meiju
 */
public enum WithdrawStatusEnum {

    //1、已充值(待平台确认充值)；2、已确认到账，开通服务；3、未到账；4、待提现，暂停服务；5、已提现成功
    //已充值
    SELLER_WITHDRAW("卖家已发起，待提现",1),

    //已确认到账，开通服务
    PLATFORM_OK_PAY("提现成功",2),
    ;

    private String name;
    private int status;

    WithdrawStatusEnum(String name, int status) {
        this.name = name;
        this.status=status;
    }

    public String getName(){
        return name;
    }

    public int getStatus(){
        return status;
    }

    public static WithdrawStatusEnum getOrderStatusEnum(int status) {

        for (WithdrawStatusEnum orderStatusEnum : WithdrawStatusEnum.values()) {
            if (orderStatusEnum.status == status) {
                return orderStatusEnum;
            }
        }
        return null;
    }

}