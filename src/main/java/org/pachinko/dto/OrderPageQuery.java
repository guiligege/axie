package org.pachinko.dto;

import java.util.List;

import lombok.Data;

/**
 * Description:
 */
@Data
public class OrderPageQuery extends BasePageQuery{

    private Integer status;
    private Integer buyerId;
    private Integer sellerId;
    private List<Integer> someStatus;
}
