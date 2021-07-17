package org.pachinko.dto;

import java.math.BigDecimal;

import lombok.Data;

/**
 * Description:
 */
@Data
public class ProductPageQuery extends BasePageQuery{

    private String productType;
    private Integer subType;
    private BigDecimal singlePrice;
    private Integer status;
    private Integer isEgg;

    private Integer sellerId;

    /**
     * 1\singlePrice asc
     * 2\singlePrice desc
     */
    private Integer orderBy;

    //1,买；2，卖
    private Integer productMode;


}
