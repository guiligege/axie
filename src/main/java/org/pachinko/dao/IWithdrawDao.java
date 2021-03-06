package org.pachinko.dao;

import java.util.List;

import org.pachinko.entity.Withdraw;

public interface IWithdrawDao {

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbg.generated
     */
    int insert(Withdraw record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(Withdraw record);

    Withdraw selectByPrimaryKey(Long id);

    Withdraw selectBySeller(Integer sellerId);


    List<Withdraw> queryWithdrawList();

}