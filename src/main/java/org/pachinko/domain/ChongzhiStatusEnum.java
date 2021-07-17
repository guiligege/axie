package org.pachinko.domain;

/**
 * 订单状态meiju
 */
public enum ChongzhiStatusEnum {

    //1、已充值(待平台确认充值)；2、已确认到账，开通服务；3、未到账；4、待提现，暂停服务；5、已提现成功
    //已充值
    SELLER_HAS_PAY("已充值(待平台确认充值)",1),

    //已确认到账，开通服务
    PLATFORM_OK_PAY("已确认到账，开通服务",2),

    //未到账
    PLATFORM_NO_PAY("未到账",3),

    WAIT_TI_XIAN("待提现，暂停服务",4),

    TI_XIAN_SUCCESS("已提现成功",5),
    ;

    private String name;
    private int status;

    ChongzhiStatusEnum(String name, int status) {
        this.name = name;
        this.status=status;
    }

    public String getName(){
        return name;
    }

    public int getStatus(){
        return status;
    }

    public static ChongzhiStatusEnum getOrderStatusEnum(int status) {

        for (ChongzhiStatusEnum orderStatusEnum : ChongzhiStatusEnum.values()) {
            if (orderStatusEnum.status == status) {
                return orderStatusEnum;
            }
        }
        return null;
    }

}