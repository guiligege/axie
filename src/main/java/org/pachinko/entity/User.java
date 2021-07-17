package org.pachinko.entity;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Objects;

import lombok.Data;
import org.pachinko.utils.UUIDCodeUtil;

@Data
public class User {

    public enum UserType {
        Buyer("Buyer"),
        Admin("admin"),
        ;

        private String value;

        UserType(String value) {
            this.value = value;
        }

        public String getValue(){
            return value;
        }
    }

    /**
     * 默认押金
     */
    public static final BigDecimal DEFAULT = new BigDecimal(0.000000);
    private static final int  DEFAULT_PERCENT=200;

    private Integer id;
    private String nick;
    private String password;
    private String email;
    private String ronin;

    /**
     * 标记
     */
    private String tag;

    /**
     * 作为卖家，交易成功数
     */
    private int sellCount;
    /**
     * 作为卖家，交易失败数
     */
    private int sellFailCount;

    /**
     * 1:有效，0，冻结
     */
    private Integer status = 0;

    private String type;

    /**
     * 押金
     */
    private BigDecimal deposit;

    /**
     * 抽成比例，分母为千，千分之几。
     */
    private int percentage;

    /**
     * 邀请我的代理code
     */
    private String dailiCode;

    /**
     * 我的代理code
     */
    private String myDailyCode;

    /**
     * 结算时间
     */
    private Date settlementTime;
    /**
     * 创建 更新时间
     */
    private Date created;
    private Date updated;

    public boolean isAdmin() {
        return UserType.Admin.value.equals(type);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o){
            return true;
        }
        User user = (User) o;
        return Objects.equals(id, user.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    /**
     * 创建时，填充数据
     * @param nick
     * @param password
     * @param email
     * @param ronin
     * @param dailiCode
     */
    public void fillBaseUser(String nick,String password,String email,String ronin,String dailiCode){

        this.nick=nick;
        this.password=password;
        this.email=email;
        this.ronin=ronin;
        //邀请我的代理code
        this.dailiCode = dailiCode;

        this.type= UserType.Buyer.value;
        this.created=new Date();
        this.updated = new Date();
        this.status=1;
        this.percentage = DEFAULT_PERCENT;
        this.deposit = DEFAULT;
        //我的代理code
        this.myDailyCode = UUIDCodeUtil.getRandomDaili(6);
    }

}