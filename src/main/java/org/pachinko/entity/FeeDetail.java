package org.pachinko.entity;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Date;

import lombok.Data;

/**
 * 费用详情
 */
@Data
public class FeeDetail {

  //3、fee明细：订单id/分账金额/分账比例/ronin/卖家id。（对账用）。
    private static final BigDecimal DEFAULT = new BigDecimal(0.000000);

  /**
   * 基础分账分母
   */
  private static final BigDecimal BASE_PERCENT =  new BigDecimal(1000);

    private Long id;
    private Long orderId;
    private BigDecimal totalPrice;

    /**
     * 分账比例 15，代表15/1000(系统默认，user从User上面来)
     */
    private int percent;
    /**
     * 用户分账比例 默认15% - 100，高级30% -300，
     */
    private int userPercent;
    /**
     * 邀请人id
     */
    private Integer invitationUserId;
    /**
     * 总分账额度
     */
    private BigDecimal fee = DEFAULT;
    /**
     * 用户分账
     */
    private BigDecimal userFee = DEFAULT;

    /**
     * 记录卖家，为了扣手续费
     */
    /**
       * seller
       */
    private Integer sellerId;
    private String sellNick;
    private String sellRonin;

    /**
     * 记录买家为了分成
     */
    /**
     * buyer
     */
    private Integer buyerId;
    private String buyerNick;
    private String buyerRonin;

    //创建 更新时间
    private Date created;
    private Date updated;

    //分账状态（待分账：0，已分账：1）
    private Integer status = 0;

  /**
   * 构建费用fee(系统 抽成比例)
   * @param order
   * @return
   */
  public FeeDetail buildFeeDetail(Order order,int percent,int userPercent,Integer invitationUserId){


      FeeDetail feeDetail = new FeeDetail();
      feeDetail.orderId = order.getId();
      feeDetail.created = new Date();
      feeDetail.updated = new Date();

      if(percent ==0){
        feeDetail.percent = 15;
      }else{
        feeDetail.percent = percent;
      }

      if(userPercent!=0){
        feeDetail.userPercent = userPercent;
      }

      feeDetail.setTotalPrice(order.getTotalPrice());
      feeDetail.sellerId = order.getSellerId();
      feeDetail.sellNick = order.getSellerNick();
      feeDetail.sellRonin = order.getSellerRonin();

      feeDetail.buyerId = order.getBuyerId();
      feeDetail.buyerNick = order.getBuyerNick();
      feeDetail.buyerRonin = order.getBuyerRonin();
      //未发给邀请人
      feeDetail.status = 0;

      //获取fee
      feeDetail.fee = feeDetail.caculateFee();
      feeDetail.setUserFee(feeDetail.caculateUserFee());

      //邀请人
      feeDetail.setInvitationUserId(invitationUserId);

      return feeDetail;
    }

    /**
     * todo check
     * 计算费用
     * @return
     */
    private BigDecimal caculateFee(){

        return this.totalPrice.multiply(new BigDecimal(this.getPercent())).divide(BASE_PERCENT,8, RoundingMode.DOWN);
    }

  /**
   * todo check
   * 计算费用
   * @return
   */
  private BigDecimal caculateUserFee(){

    return caculateFee().multiply(new BigDecimal(this.getUserPercent())).divide(BASE_PERCENT,8, RoundingMode.DOWN);
  }
}