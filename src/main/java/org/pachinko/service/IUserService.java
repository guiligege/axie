package org.pachinko.service;

import org.pachinko.dto.UserDTO;
import org.pachinko.dto.UserParam;
import org.pachinko.entity.User;

/**
 * 用户服务
 */
public interface IUserService {

    /**
     * 通过微信信息登录
     *
     * @param ronin
     * @param pwd
     * @return
     */
    UserDTO loginByChecker(String ronin, String pwd);

    /**
     * 注册
     *
     * @param userParam
     * @param
     * @return
     */
    int registByRonin(UserParam userParam);

    /**
     * 查询
     *
     * @param ronin
     * @return
     */
    User getByRonin(String ronin);

    /**
     * 查询
     *
     * @param userId
     * @return
     */
    User getByUserId(Integer userId);

    /**
     * 冻结
     *
     * @param ronin
     * @param operator
     * @return
     */
    boolean freeze(String ronin, String operator);

    /**
     * 是否有权限发布商品
     *
     * @param ronin
     * @return
     */
    boolean checkUserPermission(String ronin);

    User selectDailiByCode(String dailiCode);

    User getByNick(String nick);

    /**
     * 更新用户保证金信息
     * @param ronin
     * @return
     */
    boolean updateTag(String ronin,boolean ischongzhi);

}
