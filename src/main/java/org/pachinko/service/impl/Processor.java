package org.pachinko.service.impl;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Processor implements InitializingBean {

    /**
     * 组织缓存服务任务
     */
    @Autowired
    private CoinTimerTask coinTimerTask;

    //30分跑一次。
    Long TIME =  30*60L*1000;
    @Override
    public void afterPropertiesSet() throws Exception {

        //从diamond取定时任务时间。
        //Timer timer = new Timer();
        //timer.schedule(coinTimerTask, 200L, TIME);

        //分账定时任务
        //Timer timer = new Timer();
        //timer.schedule(coinTimerTask, 200L, TIME);
    }
}