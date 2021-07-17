package org.pachinko.service;

import java.util.List;

import org.pachinko.entity.ActionLog;

/**
 * 用户服务
 */
public interface IActionLogService {

    /**
     * 新增actionLog
     *
     * @param actionLog
     * @return
     */
    int addActionLog(ActionLog actionLog);

    /**
     * 查询actionLog 列表
     * @param orderId
     * @return
     */
    List<ActionLog> selectActionLogByOrderId(Long orderId);


}
