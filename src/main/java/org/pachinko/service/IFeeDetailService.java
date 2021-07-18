package org.pachinko.service;

import java.util.List;

import org.pachinko.dto.FeeParam;
import org.pachinko.entity.FeeDetail;

public interface IFeeDetailService {

    int insert(FeeDetail record);

    int updateByPrimaryKey(FeeDetail record);

    FeeDetail selectByPrimaryKey(Integer orderId);

    List<FeeDetail> selectListByInvitationUserId(FeeParam feeParam);
}
