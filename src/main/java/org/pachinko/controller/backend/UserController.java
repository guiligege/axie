package org.pachinko.controller.backend;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;

import lombok.extern.slf4j.Slf4j;
import org.pachinko.domain.ChongzhiStatusEnum;
import org.pachinko.domain.OrderStatusEnum;
import org.pachinko.domain.ProductStatusEnum;
import org.pachinko.domain.Result;
import org.pachinko.dto.ChongzhiParam;
import org.pachinko.dto.OrderPageQuery;
import org.pachinko.dto.ProductPageQuery;
import org.pachinko.dto.TixianParam;
import org.pachinko.dto.UserDTO;
import org.pachinko.dto.UserParam;
import org.pachinko.entity.ChongZhi;
import org.pachinko.entity.Order;
import org.pachinko.entity.Product;
import org.pachinko.entity.User;
import org.pachinko.entity.Withdraw;
import org.pachinko.exception.ExceptionEnum;
import org.pachinko.service.IChongzhiService;
import org.pachinko.service.IOrderService;
import org.pachinko.service.IProductService;
import org.pachinko.service.IUserService;
import org.pachinko.service.IWithdrawService;
import org.pachinko.utils.AesUtils;
import org.pachinko.utils.CheckPermissionUtil;
import org.pachinko.utils.Constants;
import org.pachinko.utils.CookieUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
@Slf4j
public class UserController extends PCKBaseController {

    public static final String AXIESHOP_COM = ".axieshop.cc";
    @Autowired
    private IUserService userService;

    @Autowired
    private IChongzhiService chongzhiService;

    @Autowired
    private IOrderService orderService;
    @Autowired
    private IProductService productService;
    @Autowired
    private IWithdrawService withdrawService;



    @RequestMapping(value = "/success.htm", method = RequestMethod.GET)
    public ModelAndView success(HttpServletRequest request, HttpServletResponse response) {

        return new ModelAndView("success");
    }

    @RequestMapping(value = "/error.htm", method = RequestMethod.GET)
    public ModelAndView error(HttpServletRequest request, HttpServletResponse response ,@RequestParam("errorMsg") String errorMsg) {

        request.setAttribute("errorMsg", errorMsg);
        return new ModelAndView("error");
    }

    @RequestMapping(value = "/tologin.htm", method = RequestMethod.GET)
    public ModelAndView tologin(HttpServletRequest request, HttpServletResponse response) {

        log.warn("tologin...");

        return new ModelAndView("/client/tologin");
    }

    /**
     * 用户注册页面
     */
    @RequestMapping(method=RequestMethod.GET,value="/toregiter.htm")
    public ModelAndView registerMethod(HttpServletRequest request, HttpServletResponse response) throws Exception{

        log.warn("toregiter...");

        return new ModelAndView("/client/registerUser");
    }

    /**
     * 用户注册页面
     */
    @RequestMapping(method=RequestMethod.GET,value="/detailTest.htm")
    public ModelAndView detailTest(HttpServletRequest request, HttpServletResponse response) throws Exception{

        log.warn("toregiter...");

        return new ModelAndView("/detailTest");
    }

    @RequestMapping(value ="/login/loginByPwd.htm",method =RequestMethod.POST )
    @ResponseBody
    public Result<Boolean> login(HttpServletRequest request,
                                 HttpServletResponse response,
                                 @RequestBody UserParam userParam) {

        Result<Boolean> result = new Result<Boolean>();

        if(StringUtils.isEmpty(userParam.getRonin())
            || StringUtils.isEmpty(userParam.getPassword())){

            log.warn("login param error!");
            return result.error(ExceptionEnum.INPUT_PARAM_ERROR);
        }

        UserDTO  userDTO = userService.loginByChecker(userParam.getRonin(),userParam.getPassword());
        if(null == userDTO){

            //登录失败
            log.warn("name or pwd is error!");
            return result.error(ExceptionEnum.INPUT_PARAM_ERROR);
        }

        //add cookie
        String parentDomain = AXIESHOP_COM;
        String loginCookie = JSONObject.toJSONString(userDTO);
        String cookieValue = null;
        try {
            cookieValue = AesUtils.encrypt2Hex(loginCookie,AesUtils.SECRET);
        } catch (Exception e) {
            log.error("addHttpOnlyCookie cookie error,",e);
        }

        if (!StringUtils.isEmpty(parentDomain)) {
            if (!StringUtils.isEmpty(loginCookie)) {

                CookieUtils.addHttpOnlyCookie(response, CookieUtils.LOGIN_COOKIE,cookieValue,parentDomain);
            }
        }

        return result;
    }


    @RequestMapping(value ="/user/register.htm",method =RequestMethod.POST )
    @ResponseBody
    public Result<Boolean> register(HttpServletRequest request,
                                    HttpServletResponse response,
                                    @RequestBody UserParam userParam) {

        Result<Boolean> result = new Result<Boolean>();

        if(StringUtils.isEmpty(userParam.getRonin())
            || StringUtils.isEmpty(userParam.getPassword())
            || StringUtils.isEmpty(userParam.getNick())
            || StringUtils.isEmpty(userParam.getEmail())
            || StringUtils.isEmpty(userParam.getDailiCode())
            ){

            log.warn("registe param error!");
            return result.error(ExceptionEnum.INPUT_PARAM_ERROR);
        }

        try{
            //如果邀请码不匹配，不允许注册
            if(null == userService.selectDailiByCode(userParam.getDailiCode())){
                log.warn("DailiCode param error!");
                return result.error(ExceptionEnum.ERROR_DAILI_CODE);
            }
            //已注册
            if(null != userService.getByRonin(userParam.getRonin())){
                log.warn("DailiCode param error!");
                return result.error(ExceptionEnum.ERROR_USER_EXSIt);
            }
            //已注册
            if(null != userService.getByNick(userParam.getNick())){
                log.warn("DailiCode param error!");
                return result.error(ExceptionEnum.ERROR_USER_EXSIt);
            }

            userService.registByRonin(userParam);
        }catch (Throwable t){
            log.error("registByRonin error,",t);
            result.error(ExceptionEnum.SYSTEM_ERROR);
        }
        return result;
    }

    @RequestMapping(value = "/to_chongzhi.htm", method = RequestMethod.GET)
    public ModelAndView tochongzhi(HttpServletRequest request, HttpServletResponse response) {

        if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)){
            return new ModelAndView("/error.htm?errorMsg='未登录'");
        }

        UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);
        request.setAttribute("platformronin", Constants.PLATFORM_RONIN);
        request.setAttribute("myronin", userDTO.getRonin());

        return new ModelAndView("/manage/chongzhi");
    }

    @RequestMapping(value = "/to_tixian.htm", method = RequestMethod.GET)
    public ModelAndView to_tixian(HttpServletRequest request, HttpServletResponse response) {


        //回显，可提现金额，和保证金额度
        //0、查询当前用户是否可提现。（是否有未支付订单，是否有未下架商品）
        //1、查询当我用户的保证金金额
        //2、查询当前用户费用
        //3、返回金额 == 保证金 - 费用
        if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)){
            return new ModelAndView("/error.htm?errorMsg='未登录'");
        }

        UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);

        Integer sellerId = userDTO.getId();
        String userRonin = userDTO.getRonin();

        //查询保证金
        ChongZhi sellerChongzhi =  chongzhiService.selectBySellerId(sellerId);
        if(sellerChongzhi ==  null
            || sellerChongzhi.getStatus() != ChongzhiStatusEnum.PLATFORM_OK_PAY.getStatus()
            || sellerChongzhi.getChongzhiPrice() == null
            || sellerChongzhi.getChongzhiPrice().compareTo( new BigDecimal(0.01)) < 0){

            request.setAttribute("hasChongzhi", false);
            return new ModelAndView("/manage/tixian");
        }else{
            request.setAttribute("hasChongzhi", true);
        }

        //查询保证金 check
        Withdraw withdraw = withdrawService.selectWithdrawBySellerId(sellerId);
        //查询当前用户是否可提现。（是否有未支付订单，是否有未下架商品）
        if(!precheck(sellerId) || withdraw!=null){
            request.setAttribute("canWithdraw", false);
            return new ModelAndView("/manage/tixian");
        }else{
            request.setAttribute("canWithdraw", true);
        }

        //费用计算根据用户当前的费率计算
        BigDecimal fee = orderService.getFee(sellerId);
        BigDecimal returnMoney = sellerChongzhi.getChongzhiPrice().subtract(fee);

        request.setAttribute("platformronin", Constants.PLATFORM_RONIN);
        request.setAttribute("myronin", userRonin);
        request.setAttribute("fee", fee);
        request.setAttribute("returnMoney", returnMoney);
        request.setAttribute("chongzhiMoney", sellerChongzhi.getChongzhiPrice());
        return new ModelAndView("/manage/tixian");
    }




    @RequestMapping(value ="/tixian.htm",method =RequestMethod.POST )
    @ResponseBody
    public Result<Boolean> tixian(HttpServletRequest request,
                                    HttpServletResponse response,
                                    @RequestBody TixianParam tixianParam) {

        Result<Boolean> result = new Result<Boolean>();

        try{

            //校验登录
            if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)){
                return result.error(ExceptionEnum.NOT_LOGIN);
            }

            UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);
            //从session 拿登录信息填充进去。
            Integer sellerId = userDTO.getId();
            String sellerNick=userDTO.getNick();
            String sellerRonin = userDTO.getRonin();

            //precheck
            Withdraw oldWithdraw = withdrawService.selectWithdrawBySellerId(sellerId);

            if(!precheck(sellerId)  || oldWithdraw != null){
                return  result.error(ExceptionEnum.TIXIAN_CHECK_ERROR);
            }

            //有保证金且保证金为启用状态
            ChongZhi sellerChongzhi =  chongzhiService.selectBySellerId(sellerId);
            if(sellerChongzhi ==  null  || sellerChongzhi.getStatus() != ChongzhiStatusEnum.PLATFORM_OK_PAY.getStatus()){
                return  result.error(ExceptionEnum.TIXIAN_CHHONGZHI_ERROR);
            }

            //费用计算根据用户当前的费率计算
            BigDecimal fee = orderService.getFee(sellerId);
            BigDecimal returnMoney = sellerChongzhi.getChongzhiPrice().subtract(fee);

            Withdraw withdraw = new Withdraw();
            withdraw.setChongzhiPrice(sellerChongzhi.getChongzhiPrice());
            withdraw.setFeePrice(fee);
            withdraw.setWithdrawPrice(returnMoney);
            withdraw.setSellerId(sellerId);
            withdraw.setSellerNick(sellerNick);
            withdraw.setSellerRonin(sellerRonin);
            withdrawService.insert(withdraw);

        }catch (Throwable t){
            log.error("tixian error,",t);
            result.error(ExceptionEnum.SYSTEM_ERROR);
        }
        return result;
    }

    private boolean precheck(Integer sellerId){

        //check order (无进行中订单)
        OrderPageQuery pageQuery  = new OrderPageQuery();
        pageQuery.setSomeStatus(OrderStatusEnum.getAvaliableStatus());
        pageQuery.setSellerId(sellerId);
        List<Order> orderList = orderService.queryProductListByUserId(pageQuery);
        if(!CollectionUtils.isEmpty(orderList)){
            return false;
        }

        //check product （无售卖商品）
        ProductPageQuery productPageQuery = new ProductPageQuery();
        productPageQuery.setStatus(ProductStatusEnum.ONLINE.getStatus());
        productPageQuery.setSellerId(sellerId);
        List<Product> productList = productService.queryProductListBySellerId(productPageQuery);
        if(!CollectionUtils.isEmpty(productList)){
            return false;
        }

        return true;
    }

    @RequestMapping(value ="/chongzhi.htm",method =RequestMethod.POST )
    @ResponseBody
    public Result<Boolean> chongzhi(HttpServletRequest request,
                               HttpServletResponse response,
                               @RequestBody ChongzhiParam chongzhiParam) {

        Result<Boolean> result = new Result<Boolean>();

        try{

            //校验登录
            if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)){
                return result.error(ExceptionEnum.NOT_LOGIN);
            }
            UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);

            //从session 拿登录信息填充进去。
            ChongZhi chongZhi  = new ChongZhi();
            if(chongzhiParam.getEarnestMoney() != null){
                chongZhi.setChongzhiPrice(chongzhiParam.getEarnestMoney());
            }
            chongZhi.setPlatformRonin(Constants.PLATFORM_RONIN);
            chongZhi.setStatus(ChongzhiStatusEnum.SELLER_HAS_PAY.getStatus());

            chongZhi.setSellerId(userDTO.getId());
            chongZhi.setSellerNick(userDTO.getNick());
            chongZhi.setSellerRonin(userDTO.getRonin());

            chongzhiService.insert(chongZhi);
        }catch (Throwable t){
            log.error("registByRonin error,",t);
            result.error(ExceptionEnum.SYSTEM_ERROR);
        }
        return result;
    }

    @RequestMapping(value ="/chongzhiOK.htm",method =RequestMethod.POST )
    @ResponseBody
    public Result<Boolean> chongzhiOK(HttpServletRequest request,
                               HttpServletResponse response,
                               @RequestBody ChongzhiParam chongzhiParam) {

        Result<Boolean> result = new Result<Boolean>();

        try{
            if(chongzhiParam.getId() == null){
                return  result.error(ExceptionEnum.INPUT_PARAM_ERROR);
            }

            //logincheck
            if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)){
                return result.error(ExceptionEnum.NOT_LOGIN);
            }

            UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);
            User user = userService.getByRonin(userDTO.getRonin());
            if(!user.isAdmin()){
                return result.error(ExceptionEnum.NOT_PERMISSON);
            }

            chongzhiService.chongzhiOk(chongzhiParam);
        }catch (Throwable t){
            log.error("registByRonin error,",t);
            result.error(ExceptionEnum.SYSTEM_ERROR);
        }
        return result;
    }

    @RequestMapping(value ="/chongzhiNotOK.htm",method =RequestMethod.POST )
    @ResponseBody
    public Result<Boolean> chongzhiNotOK(HttpServletRequest request,
                                      HttpServletResponse response,
                                      @RequestBody ChongzhiParam chongzhiParam) {

        Result<Boolean> result = new Result<Boolean>();

        try{

            if(chongzhiParam.getId() == null){
                return  result.error(ExceptionEnum.INPUT_PARAM_ERROR);
            }

            //logincheck
            if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)){
                return result.error(ExceptionEnum.NOT_LOGIN);
            }

            UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);
            User user = userService.getByRonin(userDTO.getRonin());

            if(!user.isAdmin()){
                return result.error(ExceptionEnum.NOT_PERMISSON);
            }
            chongzhiService.chongzhiNotOk(chongzhiParam);
        }catch (Throwable t){
            log.error("registByRonin error,",t);
            result.error(ExceptionEnum.SYSTEM_ERROR);
        }
        return result;
    }

    /**
     * 列表
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/tochongzhilist.htm", method = RequestMethod.GET)
    public ModelAndView chongzhiList(HttpServletRequest request, HttpServletResponse response) {


        //logincheck
        if(!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)){
            ModelAndView mv = new ModelAndView("redirect:/error.htm?errorMsg=not_login");
            return mv;
        }

        UserDTO userDTO = CheckPermissionUtil.getUserDTOFromCookie(request, CookieUtils.LOGIN_COOKIE);
        User user = userService.getByRonin(userDTO.getRonin());
        if(!user.isAdmin()){
            ModelAndView mv = new ModelAndView("redirect:/error.htm?errorMsg=no_permission");
            return mv;
        }

        List<ChongZhi>  orderList = chongzhiService.queryChongZhiList();

        //回显示数据
        request.setAttribute("chongzhiList", orderList);
        //
        return new ModelAndView("/manage/chongzhi_manage");
    }

}