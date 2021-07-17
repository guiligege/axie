package org.pachinko.domain;

/**
 * 订单状态meiju
 */
public enum ProductStatusEnum {

    //未上架：0，售卖中 1，，已下架：2
    //未支付
    NO_SELL("未上架",0),
    //已支付
    ONLINE("售卖中",1),
    //已发货
    OFFLINE("已下架",2),
    ;

    private String name;
    private int status;

    ProductStatusEnum(String name, int status) {
        this.name = name;
        this.status=status;
    }

    public String getName(){
        return name;
    }

    public int getStatus(){
        return status;
    }

    public static ProductStatusEnum getProductStatusEnumByCode(int code){

        for(ProductStatusEnum productStatusEnum:ProductStatusEnum.values()){
            if(productStatusEnum.getStatus() == code){
                return productStatusEnum;
            }
        }
        return null;
    }

}