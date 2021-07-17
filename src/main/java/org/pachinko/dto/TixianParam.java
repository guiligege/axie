package org.pachinko.dto;

import lombok.Data;

/**
 * Description:
 */
@Data
public class TixianParam {

    /**
     * 保证金
     */
    private String earnestMoney;
    /**
 (从session取)
     */
    private String myronin;
    private int  status;
}
