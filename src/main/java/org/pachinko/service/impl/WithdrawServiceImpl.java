package org.pachinko.service.impl;

import java.util.Date;
import java.util.List;

import lombok.extern.slf4j.Slf4j;
import org.pachinko.dao.IWithdrawDao;
import org.pachinko.domain.ActionTypeEnum;
import org.pachinko.domain.WithdrawStatusEnum;
import org.pachinko.dto.WithdrawParam;
import org.pachinko.entity.ActionLog;
import org.pachinko.entity.Withdraw;
import org.pachinko.service.IActionLogService;
import org.pachinko.service.IUserService;
import org.pachinko.service.IWithdrawService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service("withdrawService")
public class WithdrawServiceImpl implements IWithdrawService {

    @Autowired
    private IWithdrawDao withdrawDao;

    private static final String ROLE_BUYER = "买家";
    private static final String ROLE_SELLER = "卖家";
    private static final String PLATFORM = "平台";

    @Autowired
    private IActionLogService actionLogService;

    @Autowired
    private IUserService userService;

    @Override
    public int insert(Withdraw record) {
        record.setStatus(WithdrawStatusEnum.SELLER_WITHDRAW.getStatus());
        return withdrawDao.insert(record);
    }

    @Override
    public int sellerWithdraw(Withdraw record) {


        this.insert(record);

        return 0;
    }

    @Override
    public int platformWithdrawOk(WithdrawParam withdrawParam) {

        try{
            Withdraw withdraw = withdrawDao.selectByPrimaryKey(withdrawParam.getId());
            if(withdraw == null){
                log.warn("platformWithdrawOk not exist!id:{}",withdrawParam.getId());
                return  0;
            }

            withdraw.setStatus(WithdrawStatusEnum.PLATFORM_OK_PAY.getStatus());
            withdraw.setUpdated(new Date());
            withdrawDao.updateByPrimaryKey(withdraw);

            //log
            ActionLog actionLog = new ActionLog();
            actionLog.buildBaseActionLog(withdraw.getId(),withdraw.getSellerId(),withdraw.getSellerNick(),PLATFORM);
            actionLog.buildAction(ActionTypeEnum.PLATFORM_WITHDRAW_OK,ActionTypeEnum.PLATFORM_WITHDRAW_OK.getName());
            actionLogService.addActionLog(actionLog);
        }catch (Throwable t){
            log.error("chongzhiOk error,t",t);
        }

        return 1;
    }

    @Override
    public int updateByPrimaryKey(Withdraw record) {
        return withdrawDao.updateByPrimaryKey(record);
    }

    @Override
    public List<Withdraw> queryWithdrawList(){

        return withdrawDao.queryWithdrawList();
    }

    @Override
    public Withdraw selectWithdrawBySellerId(Integer sellerId) {
        return withdrawDao.selectBySeller(sellerId);
    }

}
