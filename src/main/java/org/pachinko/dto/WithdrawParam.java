package org.pachinko.dto;

import java.math.BigDecimal;

import lombok.Data;

@Data
public class WithdrawParam {

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
}
