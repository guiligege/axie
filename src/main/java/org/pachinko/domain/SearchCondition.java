package org.pachinko.domain;

import lombok.Data;

/**
 * Description:
 */
@Data
public class SearchCondition {

    private Integer type;
    private Integer subType;
    private Double score;
    private String location;
    private String language;
    private int status;

    private int offset;
    private int count;
    private Integer order;
    //private String director;
    //private String star;

}
