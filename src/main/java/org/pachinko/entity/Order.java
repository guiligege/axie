package org.pachinko.entity;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class Order {

  //3、订单：id/商品id/商品类型/卖家id/卖家ronin/买家id/买家ronin/单价/数量/总价格/订单状态（处理中/已支付/已发货/已确认/纠纷中/撤销/完结）
    private static final BigDecimal DEFAULT = new BigDecimal(0.000000);

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

    //交易失败数
    private BigDecimal totalPrice;

    //创建 更新时间
    private Date created;
    private Date updated;
    private String createTimeStr;

    //订单状态（处理中：1/已支付：2/已发货：3/已确认：4/纠纷中：5/纠纷关闭，订单关闭：6/撤销：7/完结：8）
    private Integer status = 0;

    /**
     * 0:商家卖；1：商家买
     */
    private Integer mode;

  /**
   * 写入时的数据补充
   */
  public void caculateTotalPrice(){

    totalPrice = singlePrice.multiply(new BigDecimal(buyCount));
  }

  public void fillSeller(Integer sellerId,String sellerNick,String sellerRonin){

    this.sellerId = sellerId;
    this.sellerNick = sellerNick;
    this.sellerRonin= sellerRonin;
  }

  public void fillBuyer(Integer buyerId,String buyerNick,String buyerRonin){

    this.buyerId = buyerId;
    this.buyerNick = buyerNick;
    this.buyerRonin= buyerRonin;
  }

  public void fillBaseOrder(BigDecimal singlePrice,int count,Integer mode){

    this.singlePrice = singlePrice;
    this.buyCount = count;
    this.created=new Date();
    this.updated = new Date();
    this.status=1;
    if(null == mode){
      this.mode = 0;
    }else{
      this.mode = mode;
    }

  }

  public void fillProduct(Long productId,String productName,String productType){

    this.productId=productId;
    this.productName=productName;
    this.productType=productType;
  }

  public String getCreateTimeStr(){
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String str = format.format(this.created);
    return str;
  }

}