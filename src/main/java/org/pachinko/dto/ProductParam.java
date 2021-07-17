package org.pachinko.dto;

import java.math.BigDecimal;

import lombok.Data;

/**
 * Description:
 */
@Data
public class ProductParam {


    private Long id;
    private String name;
    private String desc;
    private String type;

    /**
     * 创建时，手工填选（axie 有不同类型）
     * 其他类型统一为0
     *
     */
    private Integer subType;
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
    private BigDecimal singlePrice;

    //其他平台卖价
    private BigDecimal showPrice;

    // //未上架：0，售卖中 1，，已下架：2
    private Integer status;
    //
    private Integer isEgg;
    //1,买；2，卖
    private Integer productMode;

    //总数
    private Integer totalCount;

    /**
     * 本次购买数量（下单时），交易成功后扣减数量（交易成功后，锁库存释放，真实库存扣减）
     */
    private Integer buyCount;

    /**
     * 1、锁库存增加（下单）
     * 2、主库存扣减，锁库存释放（订单支付）
     * 3，锁库存释放（订单直接取消）
     * 4、已支付，纠纷退款完毕，订单取消，主库存扣减恢复
     */
    private Integer productOperateType;

    private String singlePriceStr;

    private String showPriceStr;
}
