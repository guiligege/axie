package org.pachinko.dto;

import java.math.BigDecimal;
import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {

    //2、商品：id/商品名/描述/商品类型/商品外部id/商品外部地址/卖家id/卖家昵称/ronin/价格weth/售卖最小单位（SLP 100为单位/axs 1为单位/axie 1位单位）/总数量。
    private static final BigDecimal DEFAULT = new BigDecimal(0.000000);

    private Long id;
    private String desc;
    private String type;
    /**
     * 创建时，手工填选（axie 有不同类型）
     * 其他类型统一为0
     *
     */
    private int subType;
    private String subTypeName;

    // AXIE("AXIE",1,3), //AXIE
    //LAND("LAND",1,4), //土地
    //id（可传）
    private String outerId;
    //url（）
    private String outerUrl;
    //外部的图片
    private String outerImg;

    //sellerid
    private Integer sellerId;
    //交易成功数
    private String sellNick;
    //交易失败数
    private String sellRonin;

    //价格eth（必须传值）
    private BigDecimal singlePrice = DEFAULT;

    //其他平台卖价
    private BigDecimal showPrice;

    //最小售卖数量
    private int minSellAccount;

    //总数
    private int totalCount;

    //锁定数量（订单未完结的数量）
    private int lockCount;

    //创建 更新时间
    private Date created;
    private Date updated;

    //未上架：0，售卖中 1，，已下架：2
    private Integer status = 0;

    //0:不是蛋，1，是
    private Integer isEgg = 0;

    //状态名
    private String  statusName;
    //展示数量
    private int showCount;

    //1,商家买；2，商家卖
    private Integer productMode;

}
