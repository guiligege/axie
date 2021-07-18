package org.pachinko.service.impl;

import java.util.TimerTask;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 所有分账从这里走。
 */
@Slf4j
@Service("fenzhangTimerTask")
public class FenzhangTimerTask extends TimerTask {

    @Autowired
    private IFenzhangService fenzhangService;

    @Override
    public void run() {

        Long startTime = System.currentTimeMillis();
        /**
         * 分账 7天内已完结订单。
         */
        fenzhangService.fenzhangOrder();
        log.warn("cost time:{}s", (System.currentTimeMillis() - startTime) / 1000);
    }

}
