package org.pachinko.service;

import java.util.List;

import org.pachinko.dto.ProductPageQuery;
import org.pachinko.dto.ProductParam;
import org.pachinko.entity.Product;

/**
 * 用户服务
 */
public interface IProductService {

    /****卖家服务*****/

    /**
     * 新增商品
     *
     * @param productParam
     * @return
     */
    int addProduct(ProductParam productParam);

    /**
     * 发布商品
     *
     * @param productParam
     * @return
     */
    int publishProduct(ProductParam productParam);

    /**
     * 下架商品
     *
     * @param productParam
     * @return
     */
    int offlineProduct(ProductParam productParam);

    /**
     * 更新
     *
     * @param productParam
     * @param
     * @return
     */
    int updateProduct(ProductParam productParam);


    int justUpdateProduct(ProductParam productParam);



    /*****买家服务******/

    /**
     * 单个查询(详情)
     *
     * @param productId
     * @return
     */
    Product getProductById(Long productId);

    /**
     * 分页查询
     *
     * @param productParam
     * @return
     */
    List<Product> queryProductList(ProductParam productParam);

    /**
     * 分页查询数据
     * @param pageQuery
     * @return
     */
    List<Product> pageQueryProduct(ProductPageQuery pageQuery);

    /**
     * 分页查询数据数量
     * @param pageQuery
     * @return
     */
    Integer pageQueryProductCount(ProductPageQuery pageQuery);

    /**
     * 查询卖家的商品
     * @param pageQuery
     * @return
     */
    List<Product> queryProductListBySellerId(ProductPageQuery pageQuery);
}
