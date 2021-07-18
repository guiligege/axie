package org.pachinko.domain;


public enum FeeStatusEnum {


    NO_PAY("未分给邀请人",0),

    HAS_PAY("已分给邀请人",1),
    ;

    private String name;
    private int status;

    FeeStatusEnum(String name, int status) {
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