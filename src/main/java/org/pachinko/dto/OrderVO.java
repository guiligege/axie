package org.pachinko.dto;

import java.math.BigDecimal;
import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {

    private Long id;
    private Long productId;
    private String productName;
    private String productType;
    private String outerId;

    //sellerid
    private Integer sellerId;
    private String sellerNick;
    private String sellerRonin;

    //buyerid
    private Integer buyerId;
    private String buyerNick;
    private String buyerRonin;

    //单价
    private BigDecimal singlePrice;

    //数量
    private int buyCount;

    //交易失败数
    private BigDecimal totalPrice;

    //创建 更新时间
    private Date created;
    private Date updated;

    //订单状态（处理中：1/已支付：2/已发货：3/已确认：4/纠纷中：5/纠纷关闭，订单关闭：6/撤销：7/完结：8）
    private Integer status;
    private String statusName;

    private String productUrl;

    /**
     * 0:商家卖；1：商家买
     */
    private Integer mode;

}
