package org.pachinko.domain;

/**
 * 产品类型
 */
public enum SubTypeEnum {

    //鱼
    FISH("FISH",1),

    //草
    Plant("Plant",2),

    //虫
    BUG("BUG",3),

    //兽
    Beast("Beast",4),

    //鸟
    Bird("Bird",5),

    //爬虫
    Reptile("Reptile",6),

    //机械
    Mech("Mech",7),

    //黎明
    Dawn("Dawn",8),

    //黄昏
    Dusk("Dusk",9),
    ;

    private String name;
    private int typeValue;

    SubTypeEnum(String name, int typeValue) {
        this.name = name;
        this.typeValue=typeValue;
    }

    public String getName(){
        return name;
    }

    public int getType(){
        return typeValue;
    }

    public static SubTypeEnum getSubType(int type){

        for(SubTypeEnum subTypeEnum:SubTypeEnum.values()){

            if(subTypeEnum.typeValue == type){
                return subTypeEnum;
            }
        }
        return null;
    }

}