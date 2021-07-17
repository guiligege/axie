package org.pachinko.entity;

import java.math.BigDecimal;
import java.util.Date;

import lombok.Data;

/**
 * 保证金流水
 */
@Data
public class depositDetail {

    private Integer id;
    /**
     * 保证金
     */
    private BigDecimal deposit;

    /**
     * 操作类型：1，上缴，0，赎回
     */
    private int  type;

    /**
     * 记录卖家，归还时的信息。
     */
    /**
       * seller
       */
    private Integer sellerId;
    private String sellNick;
    private String sellRonin;

    //创建 更新时间
    private Date created;
    private Date updated;

    //赎回状态（赎回中：0，已赎回：1，已上缴：2）
    private Integer status = 0;

    public void fillSeller(Integer sellerId,String sellNick,String sellRonin){

        this.sellerId = sellerId;
        this.sellNick = sellNick;
        this.sellRonin= sellRonin;
    }

    public void fillBaseDeposit(BigDecimal deposit,int  type,int status){

        this.deposit  = deposit;
        this.type=type;
        this.created=new Date();
        this.updated = new Date();
        this.status=status;
    }
}