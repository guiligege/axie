package org.pachinko.entity;

import java.math.BigDecimal;
import java.util.Date;

import lombok.Data;

/**
 * 充值
 */
@Data
public class ChongZhi {

    public static final String CHONGZHI_SUCCESS_TAG = "chongzhi";

    private static final BigDecimal DEFAULT = new BigDecimal(0.000000);

    private Long id;

    //sellerid
    private Integer sellerId;
    private String sellerNick;
    private String sellerRonin;

    private String platformRonin;

    //单价
    private BigDecimal chongzhiPrice;

    //创建 更新时间
    private Date created;
    private Date updated;
    private String createTimeStr;

    //充值时：已支付(待平台确认支付)：1；已确认到账：2；未到账：3；已开通服务：
    // 提现时：4；待提现关闭服务：5；已提现完成：6；）
    private Integer status = 0;

}