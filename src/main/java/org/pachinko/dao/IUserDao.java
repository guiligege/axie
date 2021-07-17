package org.pachinko.dao;

import java.util.List;

import org.pachinko.entity.User;

public interface IUserDao {


    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbg.generated
     */
    int insert(User record);


    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(Integer id);


    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbg.generated
     */
    User selectByPrimaryKey(Integer id);


    User selectByLoginId(String loginId);

    User selectByNick(String nick);

    List<User> selectByDaili(String dailiCode);

    User selectDailiByCode(String dailiCode);

    //代理数据统计
    int countUserByDailyCode(String dailiCode);


}