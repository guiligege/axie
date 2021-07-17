package org.pachinko.domain;

import lombok.Data;

/**
 * Description:

 */
@Data
public class SearchConditionDTO {

    private Integer type;
    private Integer subType;
    private Double score;
    private String location;
    private String language;
    private Integer order;

    private Integer currentNum;
    private Integer pageSize;
    //private String director;
    //private String star;

}
