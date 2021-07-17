package org.pachinko.service;

import java.util.List;

import org.pachinko.dto.ChongzhiParam;
import org.pachinko.entity.ChongZhi;

/**
 * 用户服务
 */
public interface IChongzhiService {

    /**
     * 新增actionLog
     *
     * @param record
     * @return
     */
    int insert(ChongZhi record);

    /**
     * record
     *
     * @param record
     * @return
     */
    int updateByPrimaryKey(ChongZhi record);


    ChongZhi selectBySellerId(Integer sellerId);


    List<ChongZhi> queryChongZhiList();


    int chongzhiOk(ChongzhiParam chongzhiParam);

    public int chongzhiNotOk(ChongzhiParam chongzhiParam);


}
