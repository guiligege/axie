package org.pachinko.service.impl;

import java.util.Date;
import java.util.List;

import lombok.extern.slf4j.Slf4j;
import org.pachinko.dao.IChongzhiDao;
import org.pachinko.domain.ActionTypeEnum;
import org.pachinko.domain.ChongzhiStatusEnum;
import org.pachinko.dto.ChongzhiParam;
import org.pachinko.entity.ActionLog;
import org.pachinko.entity.ChongZhi;
import org.pachinko.service.IActionLogService;
import org.pachinko.service.IChongzhiService;
import org.pachinko.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service("chongzhiService")
public class ChongzhiServiceImpl implements IChongzhiService {

    @Autowired
    private IChongzhiDao chongzhiDao;

    private static final String ROLE_BUYER = "买家";
    private static final String ROLE_SELLER = "卖家";
    private static final String PLATFORM = "平台";

    @Autowired
    private IActionLogService actionLogService;

    @Autowired
    private IUserService userService;

    @Override
    public int insert(ChongZhi record) {

        chongzhiDao.insert(record);

        //log
        ActionLog actionLog = new ActionLog();
        actionLog.buildBaseActionLog(record.getId(),record.getSellerId(),record.getSellerNick(),PLATFORM);
        actionLog.buildAction(ActionTypeEnum.SELLER_PAY,ActionTypeEnum.SELLER_PAY.getName());
        actionLog.setActionGroup(1);
        actionLogService.addActionLog(actionLog);
        return 1;
    }

    @Override
    public int updateByPrimaryKey(ChongZhi record) {
        return chongzhiDao.updateByPrimaryKey(record);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int chongzhiOk(ChongzhiParam chongzhiParam){

        try{
            ChongZhi chongZhi = chongzhiDao.selectByPrimaryKey(chongzhiParam.getId());
            if(chongZhi == null){
                log.warn("cancelOrder order not exist!id:{}",chongzhiParam.getId());
                return  0;
            }

            chongZhi.setStatus(ChongzhiStatusEnum.PLATFORM_OK_PAY.getStatus());
            chongZhi.setUpdated(new Date());
            chongzhiDao.updateByPrimaryKey(chongZhi);

            //todo 更新用户状态。为可发布商品
            userService.updateTag(chongZhi.getSellerRonin(),true);

            //log
            ActionLog actionLog = new ActionLog();
            actionLog.buildBaseActionLog(chongZhi.getId(),chongZhi.getSellerId(),chongZhi.getSellerNick(),PLATFORM);
            actionLog.buildAction(ActionTypeEnum.PLATFORM_OK_PAY,ActionTypeEnum.PLATFORM_OK_PAY.getName());
            actionLog.setActionGroup(1);
            actionLogService.addActionLog(actionLog);
        }catch (Throwable t){
            log.error("chongzhiOk error,t",t);
        }

        return 1;
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public int chongzhiFreeze(ChongzhiParam chongzhiParam){

        try{
            ChongZhi chongZhi = chongzhiDao.selectByPrimaryKey(chongzhiParam.getId());
            if(chongZhi == null){
                log.warn("cancelOrder order not exist!id:{}",chongzhiParam.getId());
                return  0;
            }

            //更新充值单和 总fee
            chongZhi.setStatus(ChongzhiStatusEnum.WAIT_TI_XIAN.getStatus());
            chongZhi.setUpdated(new Date());
            if(chongzhiParam.getFeePrice()!= null){
                chongZhi.setFeePrice(chongzhiParam.getFeePrice());
            }

            chongzhiDao.updateByPrimaryKey(chongZhi);

            //todo 更新用户状态。为可发布商品
            userService.updateTag(chongZhi.getSellerRonin(),false);

            //log
            ActionLog actionLog = new ActionLog();
            actionLog.buildBaseActionLog(chongZhi.getId(),chongZhi.getSellerId(),chongZhi.getSellerNick(),PLATFORM);
            actionLog.buildAction(ActionTypeEnum.PLATFORM_WITHDRAW_WAIT,ActionTypeEnum.PLATFORM_WITHDRAW_WAIT.getName());
            actionLog.setActionGroup(1);
            actionLogService.addActionLog(actionLog);
        }catch (Throwable t){
            log.error("chongzhiOk error,t",t);
        }

        return 1;
    }

    @Override
    public int chongzhiNotOk(ChongzhiParam chongzhiParam){

        ChongZhi chongZhi = chongzhiDao.selectByPrimaryKey(chongzhiParam.getId());
        if(chongZhi == null){
            log.warn("cancelOrder order not exist!id:{}",chongzhiParam.getId());
            return  0;
        }

        chongZhi.setStatus(ChongzhiStatusEnum.PLATFORM_NO_PAY.getStatus());
        chongZhi.setUpdated(new Date());
        chongzhiDao.updateByPrimaryKey(chongZhi);

        //log
        ActionLog actionLog = new ActionLog();
        actionLog.buildBaseActionLog(chongZhi.getId(),chongZhi.getSellerId(),chongZhi.getSellerNick(),PLATFORM);
        actionLog.buildAction(ActionTypeEnum.PLATFORM_NO_PAY,ActionTypeEnum.PLATFORM_NO_PAY.getName());
        actionLog.setActionGroup(1);
        actionLogService.addActionLog(actionLog);
        return 1;
    }

    @Override
    public ChongZhi selectBySellerId(Integer sellerId) {
        return chongzhiDao.selectBySellerId(sellerId);
    }

    @Override
    public List<ChongZhi> queryChongZhiList() {

        return chongzhiDao.queryChongZhiList();
    }


}
