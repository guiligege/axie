package org.pachinko.domain;

/**
 * 产品类型
 */
public enum ProductOperateTypeEnum {

    /**
     * 1、锁库存增加（下单）
     * 2、主库存扣减，锁库存释放（订单支付）
     * 3，锁库存释放（订单直接取消）
     * 4、已支付，纠纷退款完毕，订单取消，主库存扣减恢复
     */
    LockCountAdd("锁库存增加（下单）",1),

    PAY("主库存扣减，锁库存释放（订单支付）",2),

    CancelOrder("锁库存释放（订单直接取消）",3),

    DISPUTE_CANCEL("已支付，纠纷退款完毕，订单取消，主库存扣减恢复",4),
    ;

    private String name;
    private int type;

    ProductOperateTypeEnum(String name, int type) {
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