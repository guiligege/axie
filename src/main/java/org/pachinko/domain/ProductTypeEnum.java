package org.pachinko.domain;

/**
 * 产品类型
 */
public enum ProductTypeEnum {

    //(药水)
    SLP("SLP",100,1),

    //Axie Infinity
    AXS("AXS",1,2),

    //动物
    AXIE("AXIE",1,3),

    //土地
    LAND("LAND",1,4),
    ;

    private String name;
    private int sellCount;
    private int type;

    ProductTypeEnum(String name,int sellCount,int type) {
        this.name = name;
        this.sellCount=sellCount;
        this.type=type;
    }

    public String getName(){
        return name;
    }

    public int getSellCount(){
        return sellCount;
    }

    public int getType(){
        return type;
    }

}