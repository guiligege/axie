package org.pachinko.controller.backend;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;
import org.pachinko.domain.OrderOperateTypeEnum;
import org.pachinko.domain.OrderStatusEnum;
import org.pachinko.domain.Result;
import org.pachinko.dto.OrderPageQuery;
import org.pachinko.dto.OrderParam;
import org.pachinko.dto.OrderVO;
import org.pachinko.dto.ProductVO;
import org.pachinko.dto.UserDTO;
import org.pachinko.entity.ActionLog;
import org.pachinko.entity.Order;
import org.pachinko.entity.Product;
import org.pachinko.entity.User;
import org.pachinko.exception.ExceptionEnum;
import org.pachinko.service.IActionLogService;
import org.pachinko.service.IOrderService;
import org.pachinko.service.IProductService;
import org.pachinko.service.IUserService;
import org.pachinko.utils.CheckPermissionUtil;
import org.pachinko.utils.CookieUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/order")
@Slf4j
public class OrderController extends PCKBaseController {

    @Autowired
    private IUserService userService;

    @Autowired
    private IOrderService orderService;
    @Autowired
    private IProductService productService;
    @Autowired
    private IActionLogService actionLogService;

    private static final  int PAGE_SIZE = 24;


    @RequestMapping(value ="/addOrder.htm",method =RequestMethod.POST )
    @ResponseBody
    public Result<Long> add(HttpServletRequest request,
                                    HttpServletResponse response,
                                    @RequestBody OrderParam orderParam) {

        Result<Long> result = new Result<Long>();
        //校验登录
        if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)){
            return result.error(ExceptionEnum.NOT_LOGIN);
        }

        UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);
        try{
            Product product = productService.getProductById(orderParam.getProductId());

            orderParam.setOrderOperateType(OrderOperateTypeEnum.ADD.getType());

            orderParam.setProductId(product.getId());
            orderParam.setProductName(product.getName());
            orderParam.setProductType(product.getType());

            orderParam.setBuyerId(userDTO.getId());
            orderParam.setBuyerNick(userDTO.getNick());
            orderParam.setBuyerRonin(userDTO.getRonin());

            orderParam.setSellerId(product.getSellerId());
            orderParam.setSellerNick(product.getSellNick());
            orderParam.setSellerRonin(product.getSellRonin());
            orderParam.setStatus(OrderStatusEnum.NO_PAY.getStatus());

            //用商品的价格
            orderParam.setSinglePrice(product.getSinglePrice());
            orderParam.setBuyCount(orderParam.getBuyCount());
            orderParam.caculateTotalPrice();

            //precheck 最大数量校验
            if(product.avaliableCount() < orderParam.getBuyCount()){
                return result.error(ExceptionEnum.MAX_COUNT_LIMIT);
            }

            //mode
            // //1,商家买；2，商家卖
            if(product.getProductMode() == 2){
                orderParam.setMode(0);
            }else{
                orderParam.setMode(1);
            }

            //订单新增
            Long orderId = orderService.addOrder(orderParam);
            result.setData(orderId);
        }catch (Throwable t){
            log.error("registByRonin error,",t);
            result.error(ExceptionEnum.SYSTEM_ERROR);
        }
        return result;
    }

    /********买家动作***********/

    @RequestMapping(value ="/hasPay.htm",method =RequestMethod.POST )
    @ResponseBody
    public Result<Integer> hasPay(HttpServletRequest request,
                                       HttpServletResponse response,
                                       @RequestBody OrderParam orderParam) {

        Result<Integer> result = new Result<Integer>();

        ////校验登录
        if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)){
            return result.error(ExceptionEnum.NOT_LOGIN);
        }

        UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);
        Order order = orderService.getOrderById(orderParam.getId());

        if(!userDTO.getId().equals(order.getBuyerId())){

            return result.error(ExceptionEnum.NOT_PERMISSON);
        }

        try{
            OrderParam updateOrderParam = new OrderParam();
            updateOrderParam.setId(orderParam.getId());
            updateOrderParam.setProductId(order.getProductId());
            updateOrderParam.setBuyCount(order.getBuyCount());
            //撤销
            int resultId = orderService.hasPay(updateOrderParam);
            result.setData(resultId);
        }catch (Throwable t){
            log.error("registByRonin error,",t);
            result.error(ExceptionEnum.SYSTEM_ERROR);
        }
        return result;
    }

    @RequestMapping(value ="/cancelOrder.htm",method =RequestMethod.POST )
    @ResponseBody
    public Result<Integer> cancelOrder(HttpServletRequest request,
                                       HttpServletResponse response,
                                       @RequestBody OrderParam orderParam) {

        Result<Integer> result = new Result<Integer>();

        //校验登录
        if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)){
            return result.error(ExceptionEnum.NOT_LOGIN);
        }

        UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);
        User user = userService.getByUserId(userDTO.getId());
        Order order = orderService.getOrderById(orderParam.getId());

        if(!user.getId().equals(order.getBuyerId())
            && !user.isAdmin()){

            return result.error(ExceptionEnum.NOT_PERMISSON);
        }

        try{
            OrderParam updateOrderParam = new OrderParam();
            updateOrderParam.setId(orderParam.getId());
            updateOrderParam.setProductId(order.getProductId());
            updateOrderParam.setBuyCount(order.getBuyCount());
            //撤销
            int resultId = orderService.cancelOrder(updateOrderParam);
            result.setData(resultId);
        }catch (Throwable t){
            log.error("registByRonin error,",t);
            result.error(ExceptionEnum.SYSTEM_ERROR);
        }
        return result;
    }



    @RequestMapping(value ="/hasRecivedGood.htm",method =RequestMethod.POST )
    @ResponseBody
    public Result<Integer> hasRecivedGood(HttpServletRequest request,
                                       HttpServletResponse response,
                                       @RequestBody OrderParam orderParam) {

        Result<Integer> result = new Result<Integer>();

        //校验登录
        if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)){
            return result.error(ExceptionEnum.NOT_LOGIN);
        }

        UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);
        Order order = orderService.getOrderById(orderParam.getId());
        if(!userDTO.getId().equals(order.getBuyerId())){

            return result.error(ExceptionEnum.NOT_PERMISSON);
        }

        try{
            OrderParam updateOrderParam = new OrderParam();
            updateOrderParam.setId(orderParam.getId());
            updateOrderParam.setProductId(order.getProductId());
            updateOrderParam.setBuyCount(order.getBuyCount());
            //撤销
            int resultId = orderService.hasRecivedGood(updateOrderParam,null);
            result.setData(resultId);
        }catch (Throwable t){
            log.error("registByRonin error,",t);
            result.error(ExceptionEnum.SYSTEM_ERROR);
        }
        return result;
    }

    /**
     * 买家-发起退款申请
     * @param request
     * @param response
     * @param orderParam
     * @return
     */
    @RequestMapping(value ="/refund.htm",method =RequestMethod.POST )
    @ResponseBody
    public Result<Integer> refund(HttpServletRequest request,
                                          HttpServletResponse response,
                                          @RequestBody OrderParam orderParam) {

        Result<Integer> result = new Result<Integer>();

        //校验登录
        if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)){
            return result.error(ExceptionEnum.NOT_LOGIN);
        }
        //
        UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);
        Order order = orderService.getOrderById(orderParam.getId());
        if(!userDTO.getId().equals(order.getBuyerId())){

            return result.error(ExceptionEnum.NOT_PERMISSON);
        }

        try{
            OrderParam updateOrderParam = new OrderParam();
            updateOrderParam.setId(orderParam.getId());
            updateOrderParam.setProductId(order.getProductId());
            updateOrderParam.setBuyCount(order.getBuyCount());
            //撤销
            int resultId = orderService.refund(updateOrderParam);
            result.setData(resultId);
        }catch (Throwable t){
            log.error("registByRonin error,",t);
            result.error(ExceptionEnum.SYSTEM_ERROR);
        }
        return result;
    }

    /**
     * 买家-撤销退款单，完结订单
     * @param request
     * @param response
     * @param orderParam
     * @return
     */
    @RequestMapping(value ="/cancelRefund.htm",method =RequestMethod.POST )
    @ResponseBody
    public Result<Integer> cancelRefund(HttpServletRequest request,
                                        HttpServletResponse response,
                                        @RequestBody OrderParam orderParam) {

        Result<Integer> result = new Result<Integer>();

        //校验登录
        if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)){
            return result.error(ExceptionEnum.NOT_LOGIN);
        }
        //
        UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);
        Order order = orderService.getOrderById(orderParam.getId());
        if(!userDTO.getId().equals(order.getBuyerId())){

            return result.error(ExceptionEnum.NOT_PERMISSON);
        }

        try{
            OrderParam updateOrderParam = new OrderParam();
            updateOrderParam.setId(orderParam.getId());
            updateOrderParam.setProductId(order.getProductId());
            updateOrderParam.setBuyCount(order.getBuyCount());
            //撤销
            int resultId = orderService.cancleRefundFinishOrder(updateOrderParam);
            result.setData(resultId);
        }catch (Throwable t){
            log.error("registByRonin error,",t);
            result.error(ExceptionEnum.SYSTEM_ERROR);
        }
        return result;
    }

    /**
     * 买家-已收到退款
     * @param request
     * @param response
     * @param orderParam
     * @return
     */
    @RequestMapping(value ="/buyerHasRefund.htm",method =RequestMethod.POST )
    @ResponseBody
    public Result<Integer> buyerHasRefund(HttpServletRequest request,
                                  HttpServletResponse response,
                                  @RequestBody OrderParam orderParam) {

        Result<Integer> result = new Result<Integer>();

        //校验登录
        if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)){
            return result.error(ExceptionEnum.NOT_LOGIN);
        }
        //
        UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);
        Order order = orderService.getOrderById(orderParam.getId());
        if(!userDTO.getId().equals(order.getBuyerId())){

            return result.error(ExceptionEnum.NOT_PERMISSON);
        }

        try{
            OrderParam updateOrderParam = new OrderParam();
            updateOrderParam.setId(orderParam.getId());
            updateOrderParam.setProductId(order.getProductId());
            updateOrderParam.setBuyCount(order.getBuyCount());
            //撤销
            int resultId = orderService.buyerHasRefund(updateOrderParam);
            result.setData(resultId);
        }catch (Throwable t){
            log.error("registByRonin error,",t);
            result.error(ExceptionEnum.SYSTEM_ERROR);
        }
        return result;
    }


    /**
     * 买家-申请平台介入
     * @param request
     * @param response
     * @param orderParam
     * @return
     */
    @RequestMapping(value ="/dispute.htm",method =RequestMethod.POST )
    @ResponseBody
    public Result<Integer> dispute(HttpServletRequest request,
                                  HttpServletResponse response,
                                  @RequestBody OrderParam orderParam) {

        Result<Integer> result = new Result<Integer>();

        //校验登录
        if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)){
            return result.error(ExceptionEnum.NOT_LOGIN);
        }
        //
        UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);
        Order order = orderService.getOrderById(orderParam.getId());
        if(!userDTO.getId().equals(order.getBuyerId())){

            return result.error(ExceptionEnum.NOT_PERMISSON);
        }

        try{
            OrderParam updateOrderParam = new OrderParam();
            updateOrderParam.setId(orderParam.getId());
            updateOrderParam.setProductId(order.getProductId());
            updateOrderParam.setBuyCount(order.getBuyCount());
            //撤销
            int resultId = orderService.disputeOrder(updateOrderParam);
            result.setData(resultId);
        }catch (Throwable t){
            log.error("registByRonin error,",t);
            result.error(ExceptionEnum.SYSTEM_ERROR);
        }
        return result;
    }


    /**
     * 卖家详情
     * @param request
     * @param response
     * @param id
     * @return
     */
    @RequestMapping(value = "/{id}/detail.htm", method = RequestMethod.GET)
    public ModelAndView detail(HttpServletRequest request, HttpServletResponse response,
                               @PathVariable(value = "id") Long id) {

        log.warn("order detail.htm code is{}",id);
        if(null == id){
            return new ModelAndView("/error.htm?errorMsg='无权限'");
        }

        //校验登录
        if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)){
            log.warn("未登录");
            return new ModelAndView("/error.htm?errorMsg='未登录'");
        }

        Order order = orderService.getOrderById(id);
        UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);
        if(!userDTO.getId().equals(order.getSellerId())){

            log.warn("user is no permission: id:{}",userDTO.getId());
            return new ModelAndView("/error.htm?errorMsg='无权限'");
        }

        OrderVO orderVO = new OrderVO();
        BeanUtils.copyProperties(order,orderVO);

        //
        String statusName = (null == OrderStatusEnum.getOrderStatusEnum(orderVO.getStatus()))?"":OrderStatusEnum.getOrderStatusEnum(orderVO.getStatus()).getName();
        orderVO.setStatusName(statusName);

        Product product = productService.getProductById(order.getProductId());
        if(null != product){
            orderVO.setProductUrl(product.getOuterUrl());
        }

        ProductVO productVO = new ProductVO();
        BeanUtils.copyProperties(product,productVO);


        ////回显示数据
        request.setAttribute("productVO", productVO);
        request.setAttribute("orderVO", orderVO);
        return new ModelAndView("/manage/seller_order_detail");
    }



    /**
     * 详情
     * @param request
     * @param response
     * @param id
     * @return
     */
    @RequestMapping(value = "/{id}/buyerdetail.htm", method = RequestMethod.GET)
    public ModelAndView buyerdetail(HttpServletRequest request, HttpServletResponse response,
                               @PathVariable(value = "id") Long id) {

        log.warn("order detail.htm code is{}",id);
        if(null == id){
            ModelAndView mv = new ModelAndView("redirect:/error.htm?errorMsg=not_permission");
            return mv;
        }

        //校验登录
        if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)){
            log.warn("not login");
            ModelAndView mv = new ModelAndView("redirect:/error.htm?errorMsg=no_login");
            return mv;
        }
        UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);
        if(null != userDTO){
            request.setAttribute("user", userDTO);
        }
        User user = userService.getByUserId(userDTO.getId());

        Order order = orderService.getOrderById(id);
        if(order == null){
            log.warn("not login");
            ModelAndView mv = new ModelAndView("redirect:/error.htm?errorMsg=no_permission");
            return mv;
        }

        if(!userDTO.getId().equals(order.getBuyerId())
            && !user.isAdmin()){

            log.warn("user is no permission: id:{}",userDTO.getId());
            ModelAndView mv = new ModelAndView("redirect:/error.htm?errorMsg=no_permission");
            return mv;
        }

        OrderVO orderVO = new OrderVO();
        BeanUtils.copyProperties(order,orderVO);

        //
        String statusName = (null == OrderStatusEnum.getOrderStatusEnum(orderVO.getStatus()))?"":OrderStatusEnum.getOrderStatusEnum(orderVO.getStatus()).getName();
        orderVO.setStatusName(statusName);

        //商品
        Product product = productService.getProductById(order.getProductId());
        if(null != product){
            orderVO.setProductUrl(product.getOuterUrl());
        }

        ProductVO productVO = new ProductVO();
        BeanUtils.copyProperties(product,productVO);


        ////回显示数据
        request.setAttribute("productVO", productVO);
        request.setAttribute("orderVO", orderVO);
        return new ModelAndView("/buyer_order_detail");
    }


    /********转发请求**********/
    @RequestMapping(value = "/orderManage.htm", method = RequestMethod.GET)
    public ModelAndView orderManage(HttpServletRequest request, HttpServletResponse response) {

        //校验登录
        if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)){

            log.warn("未登录");
            //重定向到列表页面
            ModelAndView mv = new ModelAndView("redirect:/error.htm?errorMsg=not_login");
            return mv;
        }
        UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);
        //String url ="/order/list-"+userDTO.getId()+"-0-0-0.htm";
        String url ="/order/list-0-"+userDTO.getId()+"-0-0.htm";

        //重定向到列表页面
        ModelAndView mv = new ModelAndView("redirect:"+url);
        return mv;
    }

    @RequestMapping(value = "/todoOrderManage.htm", method = RequestMethod.GET)
    public ModelAndView todoOrderManage(HttpServletRequest request, HttpServletResponse response) {

        String url ="/order/list-0-1-0-0.htm";
        //重定向到列表页面
        ModelAndView mv = new ModelAndView("redirect:"+url);
        return mv;
    }

    @RequestMapping(value = "/disputeOrderManage.htm", method = RequestMethod.GET)
    public ModelAndView disputeOrderManage(HttpServletRequest request, HttpServletResponse response) {

        //校验登录
        if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)){

            log.warn("未登录");
            //重定向到列表页面
            ModelAndView mv = new ModelAndView("redirect:/error.htm?errorMsg=not_login");
            return mv;
        }
        UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);
        //String url ="/order/list-0-userDTO.getId()-0-0.htm";
        String url ="/order/list-0-"+userDTO.getId()+"-1-1.htm";
        //重定向到列表页面
        ModelAndView mv = new ModelAndView("redirect:"+url);
        return mv;
    }


    @RequestMapping(value = "/buyerOrderManage.htm", method = RequestMethod.GET)
    public ModelAndView buyerOrderManage(HttpServletRequest request, HttpServletResponse response) {

        //校验登录
        if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)){

            log.warn("未登录");
            //重定向到列表页面
            ModelAndView mv = new ModelAndView("redirect:/error.htm?errorMsg=not_login");
            return mv;
        }

        UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);
        String url ="/order/list-"+userDTO.getId()+"-0-0-0.htm";

        //重定向到列表页面
        ModelAndView mv = new ModelAndView("redirect:"+url);
        return mv;
    }



    /**
     * 列表
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/list-{buyerId}-{sellerId}-{isActive}-{disputeStatus}.htm", method = RequestMethod.GET)
    public ModelAndView list(HttpServletRequest request, HttpServletResponse response
        , @PathVariable(value = "buyerId") Integer buyerId
        , @PathVariable(value = "sellerId") Integer sellerId
                             //isActive 1:有效的，0：所有的
        , @PathVariable(value = "isActive") Integer isActive
        , @PathVariable(value = "disputeStatus") Integer disputeStatus
    ) {

        if(null == buyerId && sellerId == null){

            //重定向到列表页面
            ModelAndView mv = new ModelAndView("redirect:/error.htm?errorMsg=not_login");
            return mv;
        }
        //校验登录
        if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)){

            log.warn("未登录");
            //重定向到列表页面
            ModelAndView mv = new ModelAndView("redirect:/error.htm?errorMsg=not_login");
            return mv;
        }

        UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);
        if(null != userDTO){
            request.setAttribute("user", userDTO);
        }
        User user = userService.getByUserId(userDTO.getId());

        if(!user.isAdmin()){

            if(!userDTO.getId().equals(sellerId)
                && !userDTO.getId().equals(buyerId)){

                log.warn("user is no permission: id:{}",userDTO.getId());
                ModelAndView mv = new ModelAndView("redirect:/error.htm?errorMsg=no_permission");
                return mv;
            }
        }


        //init
        OrderPageQuery pageQuery = new OrderPageQuery();
        if(null != buyerId && buyerId!=0){
            pageQuery.setBuyerId(buyerId);
        }

        if(null != sellerId && sellerId!=0){
            pageQuery.setSellerId(sellerId);
        }

        if(null != isActive && isActive == 1){
            List<Integer> someStatus = OrderStatusEnum.getAvaliableStatus();
            pageQuery.setSomeStatus(someStatus);
        }

        if(null != disputeStatus && disputeStatus == 1){
            List<Integer> someStatus = OrderStatusEnum.getDisputeStatus();
            pageQuery.setSomeStatus(someStatus);
        }


        List<Order>  orderList = orderService.queryProductListByUserId(pageQuery);

        //回显示数据
        request.setAttribute("orderList", orderList);

        if(null != sellerId && sellerId!=0){

            return new ModelAndView("/manage/order_manage");
        }

        //回显示数据
        request.setAttribute("flag", "order");

        return new ModelAndView("order_list");
    }



    /**********卖家动作***********/
    @RequestMapping(value ="/hasSendGood.htm",method =RequestMethod.POST )
    @ResponseBody
    public Result<Integer> hasSendGood(HttpServletRequest request,
                                       HttpServletResponse response,
                                       @RequestBody OrderParam orderParam) {

        Result<Integer> result = new Result<Integer>();

        //校验登录
        if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)){
            return result.error(ExceptionEnum.NOT_LOGIN);
        }

        UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);
        Order order = orderService.getOrderById(orderParam.getId());
        if(!userDTO.getId().equals(order.getSellerId())){

            return result.error(ExceptionEnum.NOT_PERMISSON);
        }

        try{
            OrderParam updateOrderParam = new OrderParam();
            updateOrderParam.setId(orderParam.getId());
            updateOrderParam.setProductId(order.getProductId());
            updateOrderParam.setBuyCount(order.getBuyCount());
            //撤销
            int resultId = orderService.hasSendGood(updateOrderParam);
            result.setData(resultId);
        }catch (Throwable t){
            log.error("registByRonin error,",t);
            result.error(ExceptionEnum.SYSTEM_ERROR);
        }
        return result;
    }

    @RequestMapping(value ="/hasRefund.htm",method =RequestMethod.POST )
    @ResponseBody
    public Result<Integer> hasRefund(HttpServletRequest request,
                                     HttpServletResponse response,
                                     @RequestBody OrderParam orderParam) {

        Result<Integer> result = new Result<Integer>();

        //校验登录
        if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)){
            return result.error(ExceptionEnum.NOT_LOGIN);
        }

        UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);
        Order order = orderService.getOrderById(orderParam.getId());
        if(!userDTO.getId().equals(order.getSellerId())){

            return result.error(ExceptionEnum.NOT_PERMISSON);
        }

        try{
            OrderParam updateOrderParam = new OrderParam();
            updateOrderParam.setId(orderParam.getId());
            updateOrderParam.setProductId(order.getProductId());
            updateOrderParam.setBuyCount(order.getBuyCount());
            //撤销
            int resultId = orderService.sellerHasRefund(updateOrderParam);
            result.setData(resultId);
        }catch (Throwable t){
            log.error("registByRonin error,",t);
            result.error(ExceptionEnum.SYSTEM_ERROR);
        }
        return result;
    }

    @RequestMapping(value ="/refuseRefund.htm",method =RequestMethod.POST )
    @ResponseBody
    public Result<Integer> refuseRefund(HttpServletRequest request,
                                        HttpServletResponse response,
                                        @RequestBody OrderParam orderParam) {

        Result<Integer> result = new Result<Integer>();

        //校验登录
        if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)){
            return result.error(ExceptionEnum.NOT_LOGIN);
        }

        UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);
        Order order = orderService.getOrderById(orderParam.getId());
        if(!userDTO.getId().equals(order.getSellerId())){

            return result.error(ExceptionEnum.NOT_PERMISSON);
        }

        try{
            OrderParam updateOrderParam = new OrderParam();
            updateOrderParam.setId(orderParam.getId());
            updateOrderParam.setProductId(order.getProductId());
            updateOrderParam.setBuyCount(order.getBuyCount());
            //撤销
            int resultId = orderService.refuseRefund(updateOrderParam);
            result.setData(resultId);
        }catch (Throwable t){
            log.error("registByRonin error,",t);
            result.error(ExceptionEnum.SYSTEM_ERROR);
        }
        return result;
    }

    @RequestMapping(value ="/waitGoods.htm",method =RequestMethod.POST )
    @ResponseBody
    public Result<Integer> waitGoods(HttpServletRequest request,
                                        HttpServletResponse response,
                                        @RequestBody OrderParam orderParam) {

        Result<Integer> result = new Result<Integer>();

        //校验登录
        if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)){
            return result.error(ExceptionEnum.NOT_LOGIN);
        }

        UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);
        Order order = orderService.getOrderById(orderParam.getId());
        if(!userDTO.getId().equals(order.getSellerId())){

            return result.error(ExceptionEnum.NOT_PERMISSON);
        }

        try{
            OrderParam updateOrderParam = new OrderParam();
            updateOrderParam.setId(orderParam.getId());
            updateOrderParam.setProductId(order.getProductId());
            updateOrderParam.setBuyCount(order.getBuyCount());
            //撤销
            int resultId = orderService.waitGoodsSend(updateOrderParam);
            result.setData(resultId);
        }catch (Throwable t){
            log.error("registByRonin error,",t);
            result.error(ExceptionEnum.SYSTEM_ERROR);
        }
        return result;
    }

    @RequestMapping(value ="/record.htm",method =RequestMethod.POST )
    @ResponseBody
    public Result<Integer> record(HttpServletRequest request,
                                     HttpServletResponse response,
                                     @RequestBody OrderParam orderParam) {

        Result<Integer> result = new Result<Integer>();

        //校验登录
        if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)){
            return result.error(ExceptionEnum.NOT_LOGIN);
        }

        Order order = orderService.getOrderById(orderParam.getId());
        UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);
        if(!order.getBuyerId().equals(userDTO.getId())
           && !order.getSellerId().equals(userDTO.getId())){

            return result.error(ExceptionEnum.UNKNOW_ERROR);
        }

        try{
            //log
            int resultId = orderService.addLog(userDTO.getId(),orderParam.getId(),orderParam.getRecord());
            result.setData(resultId);
        }catch (Throwable t){
            log.error("registByRonin error,",t);
            result.error(ExceptionEnum.SYSTEM_ERROR);
        }
        return result;
    }


    /**
     * 详情
     * @param request
     * @param response
     * @param id
     * @return
     */
    @RequestMapping(value = "/{id}/record.htm", method = RequestMethod.GET)
    public ModelAndView recordList(HttpServletRequest request, HttpServletResponse response,
                                    @PathVariable(value = "id") Long id) {

        log.warn("order detail.htm code is{}",id);
        if(null == id){
            ModelAndView mv = new ModelAndView("redirect:/error.htm?errorMsg=not_permission");
            return mv;
        }

        //校验登录
        if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)){
            log.warn("未登录");
            ModelAndView mv = new ModelAndView("redirect:/error.htm?errorMsg=not_login");
            return mv;
        }

        Order order = orderService.getOrderById(id);
        UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);
        if(!userDTO.getId().equals(order.getBuyerId())
            && !userDTO.getId().equals(order.getSellerId())){

            log.warn("user is no permission: id:{}",userDTO.getId());
            ModelAndView mv = new ModelAndView("redirect:/error.htm?errorMsg=not_permission");
            return mv;
        }

        OrderVO orderVO = new OrderVO();
        BeanUtils.copyProperties(order,orderVO);

        //
        String statusName = (null == OrderStatusEnum.getOrderStatusEnum(orderVO.getStatus()))?"":OrderStatusEnum.getOrderStatusEnum(orderVO.getStatus()).getName();
        orderVO.setStatusName(statusName);

        List<ActionLog> actionLogList = actionLogService.selectActionLogByOrderId(id);

        ////回显示数据
        //商品
        Product product = productService.getProductById(order.getProductId());
        if(null != product){
            orderVO.setProductUrl(product.getOuterUrl());
        }

        ProductVO productVO = new ProductVO();
        BeanUtils.copyProperties(product,productVO);

        ////回显示数据
        request.setAttribute("productVO", productVO);

        request.setAttribute("orderVO", orderVO);
        request.setAttribute("actionLogList", actionLogList);
        return new ModelAndView("/record_detail");
    }


}