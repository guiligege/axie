package org.pachinko.service.impl;

import java.util.Collections;
import java.util.List;

import lombok.extern.slf4j.Slf4j;
import org.pachinko.dao.IActionLogDao;
import org.pachinko.entity.ActionLog;
import org.pachinko.service.IActionLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service("actionLogService")
public class ActionLogServiceImpl implements IActionLogService {

    @Autowired
    private IActionLogDao actionLogDao;

    @Override
    public int addActionLog(ActionLog actionLog) {
        int actionId = actionLogDao.insert(actionLog);
        return actionId;
    }

    @Override
    public List<ActionLog> selectActionLogByOrderId(Long orderId) {

        if(null ==orderId ){
            return Collections.EMPTY_LIST;
        }
        List<ActionLog> actionLogs  = actionLogDao.selectActionLogByOrderId(orderId);
        return actionLogs;
    }
}
