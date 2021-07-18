package org.pachinko.service;

import java.util.List;

import org.pachinko.dto.WithdrawParam;
import org.pachinko.entity.Withdraw;

/**
 * 用户服务
 */
public interface IWithdrawService {

    /**
     * 新增actionLog
     *
     * @param record
     * @return
     */
    int insert(Withdraw record);

    //int sellerWithdraw(Withdraw record);

    int platformWithdrawOk(WithdrawParam record);

    /**
     * record
     *
     * @param record
     * @return
     */
    int updateByPrimaryKey(Withdraw record);


    List<Withdraw> queryWithdrawList();

    Withdraw selectWithdrawBySellerId(Integer sellerId);

}
