package org.pachinko.dao;

import java.util.List;

import org.pachinko.entity.ActionLog;

public interface IActionLogDao {

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbg.generated
     */
    int insert(ActionLog record);

    /**
     * 根据订单查询动作记录，create time倒叙
     *
     * @param orderId
     * @return
     */
    List<ActionLog> selectActionLogByOrderId(Long orderId);

}