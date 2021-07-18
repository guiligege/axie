package org.pachinko.service.impl;

import java.util.Collections;
import java.util.List;

import org.pachinko.dao.IFeeDetailDao;
import org.pachinko.dto.FeeParam;
import org.pachinko.entity.FeeDetail;
import org.pachinko.service.IFeeDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("feeDetailService")
public class FeeDetailServiceImpl implements IFeeDetailService {

    @Autowired
    private IFeeDetailDao feeDetailDao;

    @Override
    public int insert(FeeDetail record) {

        return feeDetailDao.insert(record);
    }

    @Override
    public int updateByPrimaryKey(FeeDetail record) {

        return feeDetailDao.updateByPrimaryKey(record);
    }

    @Override
    public FeeDetail selectByPrimaryKey(Integer orderId) {

        return feeDetailDao.selectByPrimaryKey(orderId);
    }

    @Override
    public List<FeeDetail> selectListByInvitationUserId(FeeParam feeParam) {

        if(feeParam.getInviteId() == null){
            return Collections.emptyList();
        }

        return feeDetailDao.selectListByInvitationUserId(feeParam);
    }
}
