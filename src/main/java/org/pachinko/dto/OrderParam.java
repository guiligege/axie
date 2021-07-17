package org.pachinko.dto;

import java.math.BigDecimal;

import lombok.Data;

/**
 * Description:
 */
@Data
public class OrderParam {


    private Long id;
    private Long productId;
    private String productName;
    private String productType;

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

    //总价
    private BigDecimal totalPrice;


    //订单状态（处理中：1/已支付：2/已发货：3/买家确认收货：4/纠纷中：5/纠纷关闭，订单关闭：6/撤销：7/完结：8）
    private Integer status = 0;

    /**
     * 0:商家卖；1：商家买
     */
    private Integer mode = 0;

    /**
     * 2、撤销
     * 1、新增
     * 3，纠纷
     * 4、买家确认支付
     * 5、卖家确认发货
     * 6、买家确认收货
     */
    private int orderOperateType;

    /**
     * 拒绝退款原因/留言内容等
     */
    private String record;

    /**
     * 写入时的数据补充
     */
    public void caculateTotalPrice(){

        totalPrice = singlePrice.multiply(new BigDecimal(buyCount));
    }
}
