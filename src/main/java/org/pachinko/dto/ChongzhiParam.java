package org.pachinko.dto;

import java.math.BigDecimal;

import lombok.Data;

/**
 * Description:
 */
@Data
public class ChongzhiParam {

    private Long id;

    /**
     * 保证金
     */
    private BigDecimal earnestMoney;
    /**
     * (从session取)
     */
    private String buyerRonin;
    private String platformRonin;
    private int  status;

    /**
     * 保证金
     */
    private String earnestMoneyStr;
}
