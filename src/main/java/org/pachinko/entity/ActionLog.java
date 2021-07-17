package org.pachinko.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;
import org.pachinko.domain.ActionTypeEnum;

/**
 * 退款详情页面需要
 */
@Data
public class ActionLog {

    private Long id;
    private Long orderId;

    //账号
    private Integer accountId;
    private String nick;
    private String role;

    //动作
    private Integer actionType;
    private String actionName;
    //内容
    private String content;

    //创建 更新时间
    private Date created;
    private Date updated;

    private String createTimeStr;

    //场景0：支付，1，充值，2，提现
    private Integer sceneType;
    //分组：0；默认交易场景，1：充值/提现
    private Integer actionGroup = 0;

    public void buildBaseActionLog(Long orderId,Integer accountId,String nick,String role){

        this.orderId = orderId;
        this.accountId = accountId;
        this.nick = nick;
        this.role = role;
    }

    public void buildAction(ActionTypeEnum orderStatusEnum, String content){

        this.actionType = orderStatusEnum.getStatus();
        this.actionName=  orderStatusEnum.getName();
        this.content  = content;
    }

    public String getCreateTimeStr(){

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String str = format.format(this.created);
        return str;
    }

}