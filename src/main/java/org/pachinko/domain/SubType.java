package org.pachinko.domain;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

/**
 * 产品类型
 */
@Data
public class SubType {

    private String name;
    private int typeValue;

    SubType(String name, int typeValue) {
        this.name = name;
        this.typeValue=typeValue;
    }

    SubType(){

    }

    public String getName(){
        return name;
    }

    public int getType(){
        return typeValue;
    }

    public static List<SubType> getAllSubTypes(){

        List<SubType> subTypes = new ArrayList<SubType>();
        for(SubTypeEnum subTypeEnum:SubTypeEnum.values()){
            SubType subType = new SubType(subTypeEnum.getName(),subTypeEnum.getType());
            subTypes.add(subType);
        }
        return subTypes;
    }

}