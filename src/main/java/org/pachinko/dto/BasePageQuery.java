package org.pachinko.dto;

import lombok.Data;

/**
 * Description:
 */
@Data
public class BasePageQuery {

    private int currentNum;
    private int pageSize;
    private int totalPageSize;
    private int totalSize;
    private int offset;


}
