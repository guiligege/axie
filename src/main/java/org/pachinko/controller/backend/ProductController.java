package org.pachinko.controller.backend;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.pachinko.domain.ChongzhiStatusEnum;
import org.pachinko.domain.OrderStatusEnum;
import org.pachinko.domain.ProductStatusEnum;
import org.pachinko.domain.ProductTypeEnum;
import org.pachinko.domain.Result;
import org.pachinko.domain.SubType;
import org.pachinko.domain.SubTypeEnum;
import org.pachinko.dto.OrderPageQuery;
import org.pachinko.dto.ProductPageQuery;
import org.pachinko.dto.ProductParam;
import org.pachinko.dto.ProductVO;
import org.pachinko.dto.UserDTO;
import org.pachinko.entity.ChongZhi;
import org.pachinko.entity.Order;
import org.pachinko.entity.Product;
import org.pachinko.entity.User;
import org.pachinko.exception.ExceptionEnum;
import org.pachinko.service.IChongzhiService;
import org.pachinko.service.IOrderService;
import org.pachinko.service.IProductService;
import org.pachinko.service.IUserService;
import org.pachinko.utils.CheckPermissionUtil;
import org.pachinko.utils.CookieUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/product")
@Slf4j
public class ProductController extends PCKBaseController {

    public static final String CHONGZHI = "chongzhi";
    @Autowired
    private IUserService userService;

    @Autowired
    private IProductService productService;

    @Autowired
    private IChongzhiService chongzhiService;

    @Autowired
    private IOrderService orderService;

    private static final  int PAGE_SIZE = 24;


    @RequestMapping(value = "/productManage.htm", method = RequestMethod.GET)
    public ModelAndView productManage(HttpServletRequest request, HttpServletResponse response) {

        //login check
        if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)){
            log.warn("未登录");
            //return new ModelAndView("/error.htm?errorMsg='no login'");
            ModelAndView mv = new ModelAndView("redirect:/error.htm?errorMsg=not_login");
            return mv;
        }

        UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);

        String url ="/product/list-"+userDTO.getId()+"-0-0-0-0-1.htm";
        //重定向到列表页面
        ModelAndView mv = new ModelAndView("redirect:"+url);
        return mv;
    }



    @RequestMapping(value = "/toAdd.htm", method = RequestMethod.GET)
    public ModelAndView toAdd(HttpServletRequest request, HttpServletResponse response) {

        //login check
        if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)){
            log.warn("未登录");
            ModelAndView mv = new ModelAndView("redirect:/error.htm?errorMsg=not_login");
            return mv;
        }

        return new ModelAndView("/manage/add_product");
    }

    @RequestMapping(value = "/{code}/toUpdate.htm", method = RequestMethod.GET)
    public ModelAndView toUpdate(HttpServletRequest request, HttpServletResponse response,
                                 @PathVariable(value = "code") Long code) {

        if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)) {
            ModelAndView mv = new ModelAndView("redirect:/error.htm?errorMsg=not_login");
            return mv;
        }

        Product product = productService.getProductById(code);
        if(null == product){
            ModelAndView mv = new ModelAndView("redirect:/error.htm?errorMsg=no_product");
            return mv;
        }

        //权限校验
        UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);
        if(!userDTO.getId().equals(product.getSellerId())){
            ModelAndView mv = new ModelAndView("redirect:/error.htm?errorMsg=no_permission");
            return mv;
        }

        ProductVO productVO = new ProductVO();
        BeanUtils.copyProperties(product,productVO);

        //name
        productVO.setStatusName(ProductStatusEnum.getProductStatusEnumByCode(product.getStatus()).getName());
        //count
        productVO.setShowCount(product.getTotalCount()-product.getLockCount());

        ////回显示数据
        request.setAttribute("product", productVO);

        return new ModelAndView("/manage/update_product");
    }


    @RequestMapping(value ="/add.htm",method =RequestMethod.POST )
    @ResponseBody
    public Result<Boolean> add(HttpServletRequest request,
                                    HttpServletResponse response,
                                    @RequestBody ProductParam productParam) {

        Result<Boolean> result = new Result<Boolean>();
        try{

            if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)) {
                return result.error(ExceptionEnum.NOT_LOGIN);
            }

            //权限校验
            UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);
            //1，判断用户是否已交押金
            User user = userService.getByUserId(userDTO.getId());
            if(!CHONGZHI.equals(user.getTag())){
                return result.error(ExceptionEnum.NO_CHHONGZHI);
            }

            //url:
            ////https://storage.googleapis.com/assets.axieinfinity.com/axies/1384594/axie/axie-full-transparent.png
            productParam.setSellerId(userDTO.getId());
            productParam.setSellNick(userDTO.getNick());
            productParam.setSellRonin(userDTO.getRonin());

            productParam.setStatus(ProductStatusEnum.NO_SELL.getStatus());

            productParam.setName(productParam.getType());
            if(null != productParam.getSubType() && productParam.getSubType() !=0){
                productParam.setSubType(productParam.getSubType());
                productParam.setSubTypeName(SubTypeEnum.getSubType(productParam.getSubType()).getName());
            }

            //showPriceStr:showPrice, singlePriceStr:singlePrice,
            if(null != productParam.getShowPriceStr() &&
                !StringUtils.isEmpty(productParam.getShowPriceStr().trim())){
                productParam.setShowPrice(new BigDecimal((productParam.getShowPriceStr().trim())));
            }

            if(null != productParam.getSinglePriceStr() &&
                !StringUtils.isEmpty(productParam.getSinglePriceStr().trim())){
                productParam.setSinglePrice(new BigDecimal((productParam.getSinglePriceStr().trim())));
            }
            if(!StringUtils.isEmpty(productParam.getOuterId())){
                productParam.setOuterId(productParam.getOuterId());
                //
                productParam.setOuterUrl("https://marketplace.axieinfinity.com/axie/"+productParam.getOuterId()+"?referrer=axie.zone");
                productParam.setOuterImg("https://storage.googleapis.com/assets.axieinfinity.com/axies/"+productParam.getOuterId()+"/axie/axie-full-transparent.png");
            }
            if(productParam.getType().equals(ProductTypeEnum.SLP.getName())){
                productParam.setOuterUrl("");
                productParam.setOuterImg("love-potion.png");
            }

            productService.addProduct(productParam);
        }catch (Throwable t){
            log.error("registByRonin error,",t);
            result.error(ExceptionEnum.SYSTEM_ERROR);
        }
        return result;
    }

    @RequestMapping(value ="/update.htm",method =RequestMethod.POST )
    @ResponseBody
    public Result<Boolean> update(HttpServletRequest request,
                               HttpServletResponse response,
                               @RequestBody ProductParam productParam) {

        Result<Boolean> result = new Result<Boolean>();
        try{

            //showPriceStr:showPrice, singlePriceStr:singlePrice,
            if(null != productParam.getShowPriceStr() &&
                !StringUtils.isEmpty(productParam.getShowPriceStr().trim())){
                productParam.setShowPrice(new BigDecimal((productParam.getShowPriceStr().trim())));
            }

            if(null != productParam.getSinglePriceStr() &&
                !StringUtils.isEmpty(productParam.getSinglePriceStr().trim())){
                productParam.setSinglePrice(new BigDecimal((productParam.getSinglePriceStr().trim())));
            }

            productService.justUpdateProduct(productParam);
        }catch (Throwable t){
            log.error("registByRonin error,",t);
            result.error(ExceptionEnum.SYSTEM_ERROR);
        }
        return result;
    }

    @RequestMapping(value ="/online.htm",method =RequestMethod.POST )
    @ResponseBody
    public Result<Boolean> online(HttpServletRequest request,
                               HttpServletResponse response,
                               @RequestBody ProductParam productParam) {

        Result<Boolean> result = new Result<Boolean>();
        try{

            if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)) {
                return result.error(ExceptionEnum.NOT_LOGIN);
            }

            //权限校验
            UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);
            if(productParam.getId() == null){
                return result.error(ExceptionEnum.INPUT_PARAM_ERROR);
            }

            Product  product = productService.getProductById(productParam.getId());
            if(!product.getSellerId().equals(userDTO.getId())){
                return result.error(ExceptionEnum.NOT_PERMISSON);
            }

            //1，判断用户是否已交押金
            //2，判断用户上架商品是否已经超过押金。
            User user = userService.getByUserId(userDTO.getId());
            if(!CHONGZHI.equals(user.getTag())){
                return result.error(ExceptionEnum.NO_CHHONGZHI);
            }

            //交易中的总金额和上架中商品的总金额 <=保证金-fee
            BigDecimal onlinePrice = product.getSinglePrice().multiply(new BigDecimal(product.getTotalCount()-product.getLockCount()));

            if(!checkHasEnoughMoney(user.getId(),onlinePrice)){
                return result.error(ExceptionEnum.NO_EnoughMoney);
            }

            productService.publishProduct(productParam);
        }catch (Throwable t){
            log.error("online error,",t);
            result.error(ExceptionEnum.SYSTEM_ERROR);
        }
        return result;
    }

    /**
     * 判断是否足够保证金
     * @param userId
     * @param onlinePrice
     * @return
     */
    private boolean checkHasEnoughMoney(Integer userId,BigDecimal  onlinePrice){

        //1、查询所有未交易完结订单
        //2、查询所有上架商品
        //3、查询保证金
        //4、查询fee
        BigDecimal nowTotal = new BigDecimal(0);
        //订单总价
        OrderPageQuery pageQuery  = new OrderPageQuery();
        pageQuery.setSomeStatus(OrderStatusEnum.getAvaliableStatus());
        pageQuery.setSellerId(userId);
        List<Order> orderList = orderService.queryProductListByUserId(pageQuery);
        if(!CollectionUtils.isEmpty(orderList)){
            for(Order order:orderList){
                nowTotal = nowTotal.add(order.getTotalPrice());
            }
        }

        //check product （无售卖商品）
        ProductPageQuery productPageQuery = new ProductPageQuery();
        productPageQuery.setStatus(ProductStatusEnum.ONLINE.getStatus());
        productPageQuery.setSellerId(userId);
        List<Product> productList = productService.queryProductListBySellerId(productPageQuery);
        //商品总价
        if(!CollectionUtils.isEmpty(productList)){
            for(Product product:productList){
                nowTotal = nowTotal.add(
                    product.getSinglePrice()
                    .multiply(new BigDecimal(product.avaliableCount()))
                );
            }
        }

        //有保证金且保证金为启用状态
        ChongZhi sellerChongzhi =  chongzhiService.selectBySellerId(userId);
        if(sellerChongzhi ==  null  || sellerChongzhi.getStatus() != ChongzhiStatusEnum.PLATFORM_OK_PAY.getStatus()){
            return  false;
        }

        BigDecimal fee = orderService.getFee(userId);

        //当前可上线金额；
        nowTotal = sellerChongzhi.getChongzhiPrice().subtract(nowTotal).subtract(fee);

        if(onlinePrice.compareTo(nowTotal)>0){
            log.warn("onlinePrice 超过限制");
            return false;
        }else{
            log.warn("onlinePrice ok");
            return true;
        }

    }

    @RequestMapping(value ="/offline.htm",method =RequestMethod.POST )
    @ResponseBody
    public Result<Boolean> offline(HttpServletRequest request,
                                  HttpServletResponse response,
                                  @RequestBody ProductParam productParam) {

        Result<Boolean> result = new Result<Boolean>();
        try{

            if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)) {
                return result.error(ExceptionEnum.NOT_LOGIN);
            }

            if(productParam.getId() == null){
                return result.error(ExceptionEnum.INPUT_PARAM_ERROR);
            }

            productService.offlineProduct(productParam);
        }catch (Throwable t){
            log.error("online error,",t);
            result.error(ExceptionEnum.SYSTEM_ERROR);
        }
        return result;
    }

    /**
     * 详情
     * @param request
     * @param response
     * @param code
     * @return
     */
    @RequestMapping(value = "/{code}/detail.htm", method = RequestMethod.GET)
    public ModelAndView detail(HttpServletRequest request, HttpServletResponse response,
                               @PathVariable(value = "code") Long code) {

        log.warn("detail.htm code is{}",code);

        Product product = productService.getProductById(code);
        if(null == product){
            return new ModelAndView("/error.htm?errorMsg=no_permission");
        }

        ProductVO productVO = new ProductVO();
        BeanUtils.copyProperties(product,productVO);

        //name
        productVO.setStatusName(ProductStatusEnum.getProductStatusEnumByCode(product.getStatus()).getName());
        //count
        productVO.setShowCount(product.getTotalCount()-product.getLockCount());

        ////回显示数据
        request.setAttribute("productVO", productVO);
        return new ModelAndView("/client/detail");
    }


    /**
     * 列表
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/list-{sellerId}-{type}-{subType}-{isEgg}-{order}-{currentPageNum}.htm", method = RequestMethod.GET)
    public ModelAndView list(HttpServletRequest request, HttpServletResponse response
        , @PathVariable(value = "sellerId") Integer sellerId
        , @PathVariable(value = "type") String type
        , @PathVariable(value = "subType") Integer subType
        , @PathVariable(value = "isEgg") Integer isEgg
        , @PathVariable(value = "order") Integer order
        , @PathVariable(value = "currentPageNum") Integer currentPageNum
    ) {

        if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)){
            ModelAndView mv = new ModelAndView("redirect:/error.htm?errorMsg=not_login");
            return mv;
        }

        UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);
        if(!userDTO.getId().equals(sellerId) || StringUtils.isEmpty(type)){

            ModelAndView mv = new ModelAndView("redirect:/error.htm?errorMsg=not_permission");
            return mv;
        }

        //init
        if(currentPageNum == null || currentPageNum ==0){
            currentPageNum = 1;
        }

        ProductPageQuery pageQuery = new ProductPageQuery();

        //如果是卖家，不需要传Type
        if(null != sellerId && sellerId != 0){
            if(!StringUtils.isEmpty(type) && !"0".equals(type)){
                pageQuery.setProductType(type);
            }
        }else{
            pageQuery.setProductType(type);
        }


        if(null == subType || subType<=0){
        }else{
            pageQuery.setSubType(subType);
        }
        if(null != sellerId && sellerId != 0){
            pageQuery.setSellerId(sellerId);
        }

        if(null == order || order<=0){
            pageQuery.setOrderBy(1);
        }else{
            pageQuery.setOrderBy(order);
        }

        if(null != isEgg  && isEgg != 0){
            pageQuery.setIsEgg(isEgg);
        }

        pageQuery.setCurrentNum(currentPageNum == null ? 0 : currentPageNum);
        if (pageQuery.getCurrentNum() <= 1) {
            pageQuery.setOffset(0);
        } else {
            pageQuery.setOffset((pageQuery.getCurrentNum() - 1) * PAGE_SIZE);
        }
        pageQuery.setPageSize(PAGE_SIZE);

        List<Product> productList = null;
        int totalPage=0;
        int totalCount = productService.pageQueryProductCount(pageQuery);
        if(0 == totalCount){

        }else{
            productList = productService.pageQueryProduct(pageQuery);
            totalPage = totalCount+1/PAGE_SIZE;
        }

        //回显示数据
        request.setAttribute("productList", productList);
        request.setAttribute("type", type);
        request.setAttribute("subType", subType);
        request.setAttribute("order", order);
        request.setAttribute("isEgg", isEgg);
        //返回子类型
        request.setAttribute("subTypes", SubType.getAllSubTypes());
        request.setAttribute("pre", currentPageNum <=1?1:currentPageNum-1);
        request.setAttribute("current", currentPageNum);
        request.setAttribute("next", currentPageNum >=20?20:currentPageNum+1);
        //最大页码
        request.setAttribute("totalPage", totalPage);

        if(sellerId !=null){
            //如果是卖家，到卖家商品列表 页面
            return new ModelAndView("/manage/product_manage");
        }
        //
        return new ModelAndView("/client/product_list");
    }

}