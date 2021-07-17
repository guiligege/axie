package org.pachinko.controller.frontend;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.pachinko.controller.backend.PCKBaseController;
import org.pachinko.domain.ProductStatusEnum;
import org.pachinko.domain.SubType;
import org.pachinko.domain.SubTypeEnum;
import org.pachinko.dto.ProductPageQuery;
import org.pachinko.dto.ProductVO;
import org.pachinko.dto.UserDTO;
import org.pachinko.entity.Product;
import org.pachinko.service.IProductService;
import org.pachinko.service.IUserService;
import org.pachinko.utils.CheckPermissionUtil;
import org.pachinko.utils.CookieUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/cproduct")
@Slf4j
public class CProductController extends PCKBaseController {

    @Autowired
    private IUserService userService;

    @Autowired
    private IProductService productService;

    private static final  int PAGE_SIZE = 24;

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
            return new ModelAndView("404");
        }

        ProductVO productVO = new ProductVO();
        BeanUtils.copyProperties(product,productVO);

        //name
        productVO.setStatusName(ProductStatusEnum.getProductStatusEnumByCode(product.getStatus()).getName());
        //count
        productVO.setShowCount(product.getTotalCount()-product.getLockCount());
        if(productVO.getSubType()!=0){
            productVO.setSubTypeName(SubTypeEnum.getSubType(productVO.getSubType()).getName());
        }

        UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);
        if(null != userDTO){
            request.setAttribute("user", userDTO);
        }

        ////回显示数据
        request.setAttribute("productVO", productVO);
        return new ModelAndView("realdetail");
    }


    /**
     * 列表
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/list-{type}-{mode}-{subType}-{isEgg}-{order}-{currentPageNum}.htm", method = RequestMethod.GET)
    public ModelAndView list(HttpServletRequest request, HttpServletResponse response
        , @PathVariable(value = "type") String type
        , @PathVariable(value = "mode") Integer mode
        , @PathVariable(value = "subType") Integer subType
        , @PathVariable(value = "isEgg") Integer isEgg
        , @PathVariable(value = "order") Integer order
        , @PathVariable(value = "currentPageNum") Integer currentPageNum
    ) {

        //init
        if(currentPageNum == null || currentPageNum ==0){
            currentPageNum = 1;
        }

        ProductPageQuery pageQuery = new ProductPageQuery();
        //类型
        pageQuery.setProductType(type);
        //买卖
        if(mode == null || mode ==0){
            pageQuery.setProductMode(1);
        }else{
            pageQuery.setProductMode(mode);
        }

        //子类型（axie有）
        if(null == subType || subType<=0){
        }else{
            pageQuery.setSubType(subType);
        }

        if(null == order || order<=0){
            order = 1;

        }
        pageQuery.setOrderBy(order);
        pageQuery.setStatus(ProductStatusEnum.ONLINE.getStatus());

        //是否蛋
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
        //int totalPage=0;
        //int totalCount = productService.pageQueryProductCount(pageQuery);
        //if(0 == totalCount){
        //
        //}else{
        //    productList = productService.pageQueryProduct(pageQuery);
        //    totalPage = totalCount+1/PAGE_SIZE;
        //}

        productList = productService.pageQueryProduct(pageQuery);

        //回显示数据
        request.setAttribute("productList", productList);
        request.setAttribute("type", type);


        request.setAttribute("order", order);
        request.setAttribute("isEgg", isEgg);
        request.setAttribute("mode", mode);
        //返回子类型
        if("AXIE".equals(type)){
            request.setAttribute("subTypes", SubType.getAllSubTypes());
        }
        request.setAttribute("subType", subType);

        request.setAttribute("flag", type);

        if(CollectionUtils.isEmpty(productList)){

            request.setAttribute("pre", currentPageNum <=1?1:currentPageNum-1);
            request.setAttribute("current", currentPageNum);
            request.setAttribute("next", currentPageNum);
        }else{

            request.setAttribute("pre", currentPageNum <=1?1:currentPageNum-1);
            request.setAttribute("current", currentPageNum);
            request.setAttribute("next", currentPageNum+1);
        }

        UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);
        if(null != userDTO){
            request.setAttribute("user", userDTO);
        }

        //最大页码
        //request.setAttribute("totalPage", totalPage);
        //todo
        return new ModelAndView("product_list");
    }

}