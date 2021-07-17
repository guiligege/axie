package org.pachinko.exception;

public enum ExceptionEnum {

    SUCCESS(200,"SUCCESS"),


    INPUT_PARAM_ERROR(10001,"参数错误"),
    ERROR_OLD_PWD_ERROR(10002,"旧密码错误"),
    SYSTEM_ERROR(20001,"系统异常"),
    ERROR_USER_EXSIt(30001,"已注册"),
    ERROR_USER_NOT_EXSIT(30002,"用户不存在"),
    ERROR_MONEY_TOO_MANY(30003,"金额不足"),
    PARAM_ERROR(10000,"密码已存在"),
    UNKNOW_ERROR(10030,"未知异常！"),
    PWD_ERROR(10039,"密码过于简单！"),
    PHONE_ERROR(10405,"密码不匹配"),
    REGISTE_TIMES_OVER(10006,"已注册"),

    LOGIN_PWD_ERROR(10006,"登录密码错误"),

    ERROR_USER_NOT_LOGIN(-101, "登录失败"),
    ERROR_USER_LOGIN_FAILED(-102, "登录失败"),
    ERROR_USER_UPDATE_FAILED(-103, "用户信息更新失败"),
    ERROR_USER_NOT_EXIST(-104, "用户不存在"),
    ERROR_USER_NOT_ADMIN(-105, "只有管理员才可以进行的才做"),
    ERROR_USER_AMOUNT_INVALID(-106, "金额不正确"),

    ERROR_USERNAME_PWD(30012,"用户名或密码不匹配"),

    NOT_LOGIN(40001,"未登录"),
    MAX_COUNT_LIMIT(50001,"超过最大可售数量"),
    NOT_PERMISSON(60001,"无权限操作"),
    ERROR_DAILI_CODE(70001,"无效邀请码"),

    TIXIAN_CHECK_ERROR(80001,"提现前提：订单必须全部关闭/取消/完成，下架所有售卖商品！"),

    TIXIAN_CHHONGZHI_ERROR(80002,"卖家保证金状态不对"),

    NO_CHHONGZHI(80003,"发布商品请先缴纳保证金，上架商品总价需要小于等于保证金！"),
    NO_EnoughMoney(80004,"上架商品总价和未完结订单总价，需要小于等于保证金！"),
    ;

    private Integer code;
    private String message;

    ExceptionEnum(Integer code, String message){
        this.code=code;
        this.message=message;
    }

    ExceptionEnum(Integer code){
        this.code=code;
    }

    public Integer getCode(){
        return this.code;
    }

    public String getMessage(){
        return message;
    }

}
