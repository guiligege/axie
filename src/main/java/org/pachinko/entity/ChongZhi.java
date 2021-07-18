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
    public static final String TIXIAN_SUCCESS_TAG = "tixian";

    private static final BigDecimal DEFAULT = new BigDecimal(0.000000);

    private Long id;

    //sellerid
    private Integer sellerId;
    private String sellerNick;
    private String sellerRonin;

    private String platformRonin;

    //押金
    private BigDecimal chongzhiPrice;
    //手续费（当前押金，往期结算手续费汇总）
    private BigDecimal feePrice;

    //创建 更新时间
    private Date created;
    private Date updated;
    private String createTimeStr;

    //1、已充值(待平台确认充值)；2、已确认到账，开通服务；3、未到账；4、待提现，暂停服务；5、已提现成功
    private Integer status = 0;

}