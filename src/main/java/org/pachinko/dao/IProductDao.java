package org.pachinko.dao;

import java.util.List;

import org.pachinko.dto.ProductPageQuery;
import org.pachinko.entity.Product;

public interface IProductDao {

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbg.generated
     */
    int insert(Product record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(Product record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbg.generated
     */
    Product selectByPrimaryKey(Long id);

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
     * 分页查询数据
     * @param pageQuery
     * @return
     */
    List<Product> queryProductListBySellerId(ProductPageQuery pageQuery);

}