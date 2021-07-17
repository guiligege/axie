package org.pachinko.service.impl;

import java.util.List;

import lombok.extern.slf4j.Slf4j;
import org.pachinko.dao.IProductDao;
import org.pachinko.domain.ProductOperateTypeEnum;
import org.pachinko.domain.ProductStatusEnum;
import org.pachinko.dto.ProductPageQuery;
import org.pachinko.dto.ProductParam;
import org.pachinko.entity.Product;
import org.pachinko.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Slf4j
@Service("productService")
public class ProductServiceImpl implements IProductService {

    @Autowired
    private IProductDao productDao;


    //https://storage.googleapis.com/assets.axieinfinity.com/axies/723771/axie/axie-full-transparent.png（图片）
    //https://marketplace.axieinfinity.com/axie/780875（详情）
    /**
     * 新增商品
     * @param productParam
     * @return
     */
    @Override
    public int addProduct(ProductParam productParam) {

        Product product = new Product();
        //fillBaseProduct(String name,String desc,String type,BigDecimal singlePrice,BigDecimal showPrice,int totalCount)
        product.fillBaseProduct(productParam.getName(),productParam.getDesc(),productParam.getSinglePrice(),productParam.getShowPrice(),productParam.getTotalCount(),productParam.getIsEgg(),productParam.getProductMode());

        product.fillProductType(productParam.getType(),productParam.getSubType(),productParam.getSubTypeName());

        //fillSeller(Integer sellerId,String sellNick,String sellRonin)
        product.fillSeller(productParam.getSellerId(),productParam.getSellNick(),productParam.getSellRonin());

        //fillOther(String outerId,String outerUrl,String outerImg)
        product.fillOther(productParam.getOuterId(),productParam.getOuterUrl(),productParam.getOuterImg());

        int result =  productDao.insert(product);
        return result;
    }

    /**
     * 发布
     *
     * @param productParam
     * @return
     */
    @Override
    public int publishProduct(ProductParam productParam) {

        productParam.setStatus(1);
        return updateProduct(productParam);
    }

    /**
     * 下架
     * @param productParam
     * @return
     */
    @Override
    public int offlineProduct(ProductParam productParam) {

        productParam.setStatus(2);
        return updateProduct(productParam);
    }

    /**
     * 更新
     * @param productParam
     * @return
     */
    @Override
    public int updateProduct(ProductParam productParam) {

        Product  product = getProductById(productParam.getId());
        if( product == null){
            log.warn("updateProduct product is null");
            return 0;
        }

        if(null != productParam.getShowPrice()){
            product.setShowPrice(productParam.getShowPrice());
        }

        if(null != productParam.getSinglePrice()){
            product.setSinglePrice(productParam.getSinglePrice());
        }

        if(product.getStatus() != productParam.getStatus()){
            product.setStatus(productParam.getStatus());
        }

        if(!StringUtils.isEmpty(productParam.getOuterId())){
            product.setOuterId(productParam.getOuterId());
        }

        if(!StringUtils.isEmpty(productParam.getOuterImg())){
            product.setOuterImg(productParam.getOuterImg());
        }

        if(!StringUtils.isEmpty(productParam.getOuterUrl())){
            product.setOuterUrl(productParam.getOuterUrl());
        }
        if(!StringUtils.isEmpty(productParam.getDesc())){
            product.setDesc(productParam.getDesc());
        }
        if(null != productParam.getTotalCount() && productParam.getTotalCount() >= product.getLockCount()){
            product.setDesc(productParam.getDesc());
        }
        if(null != productParam.getIsEgg()){
            product.setIsEgg(productParam.getIsEgg());
        }

        if(null != productParam.getTotalCount()){
            product.setTotalCount(productParam.getTotalCount());
        }

        //add lock and totalcount
        buildProduct(product,productParam);

        productDao.updateByPrimaryKey(product);
        return 0;
    }

    @Override
    public int justUpdateProduct(ProductParam productParam) {

        productParam.setStatus(ProductStatusEnum.OFFLINE.getStatus());
        return this.updateProduct(productParam);
    }

    private void buildProduct(Product  product,ProductParam productParam){

        //默认无操作
        if(null == productParam.getProductOperateType() || productParam.getProductOperateType() == 0){
            return;
        }

        //锁库存
        if(ProductOperateTypeEnum.LockCountAdd.getType() == productParam.getProductOperateType()){

            product.setLockCount(product.getLockCount() + productParam.getBuyCount());
        }else if(ProductOperateTypeEnum.PAY.getType() == productParam.getProductOperateType()){
            //下单时以及锁库存需要恢复，总库存需要扣减
            product.setLockCount(product.getLockCount() - productParam.getBuyCount());
            product.setTotalCount(product.getTotalCount() - productParam.getBuyCount());

        }else if(ProductOperateTypeEnum.CancelOrder.getType() == productParam.getProductOperateType()){

            //下单时以及锁库存需要恢复，总库存需要扣减
            product.setLockCount(product.getLockCount() - productParam.getBuyCount());
        }else if(ProductOperateTypeEnum.DISPUTE_CANCEL.getType() == productParam.getProductOperateType()){

            //下单时以及锁库存需要恢复，总库存需要扣减
            product.setLockCount(product.getLockCount() - productParam.getBuyCount());
            product.setTotalCount(product.getTotalCount() + productParam.getBuyCount());
        }
    }

    /**
     * 点查
     * @param productId
     * @return
     */
    @Override
    public Product getProductById(Long productId) {

        return productDao.selectByPrimaryKey(productId);
    }

    @Override
    public List<Product> queryProductList(ProductParam productParam) {
        return null;
    }

    /**
     * 查询卖家商品信息（我售卖的）
     * @param pageQuery
     * @return
     */
    @Override
    public List<Product> queryProductListBySellerId(ProductPageQuery pageQuery) {

        if(pageQuery.getSellerId() == 0){
            return null;
        }

        List<Product> products = productDao.queryProductListBySellerId(pageQuery);
        return products;
    }

    /**
     * 分页查询
     * @param pageQuery
     * @return
     */
    @Override
    public List<Product> pageQueryProduct(ProductPageQuery pageQuery) {

        //拼接参数
        return productDao.pageQueryProduct(pageQuery);
    }

    /**
     * 分页数量
     * @param pageQuery
     * @return
     */
    @Override
    public Integer pageQueryProductCount(ProductPageQuery pageQuery) {

        try{
            int count = productDao.pageQueryProductCount(pageQuery);
            return count;
        }catch (Throwable t){
            log.error("pageQueryProductCount error",t);
        }
        return  0;
    }
}
