package org.pachinko.dto;

import java.util.Date;

import lombok.Data;

/**
 * 用户信息
 */
@Data
public class UserDTO {

    private Integer id;

    private String nick;

    private String ronin;

    private Date createTime;

    private Date expireTime;

    //pwd md5
    private String md5Code;


    public void buildBaseUserDTO(Integer id,String nick,String ronin){
        this.id = id;
        this.nick = nick;
        this.ronin = ronin;
    }

    public void buildExpire(Date expireTime,String md5Code){
        this.createTime = new Date();
        this.expireTime = expireTime;
        this.md5Code = md5Code;
    }

    public boolean hasExpire(){

        if(null == expireTime){
            return  true;
        }

        if(expireTime.after(new Date())){
            return false;
        }else{
            return true;
        }
    }
}