package org.pachinko.entity;

import java.math.BigDecimal;
import java.util.Date;

import lombok.Data;

/**
 * 提现
 */
@Data
public class Withdraw {

    public static final String WITHDRAW_SUCCESS_TAG = "tixian";

    private Long id;

    //sellerid
    private Integer sellerId;
    private String sellerNick;
    private String sellerRonin;

    //保证金
    private BigDecimal chongzhiPrice;
    //交易费用
    private BigDecimal feePrice;
    //提现额度
    private BigDecimal withdrawPrice;

    //创建 更新时间
    private Date created;
    private Date updated;
    private String createTimeStr;

    //1、待提现；2、提现成功；
    private Integer status = 0;

}