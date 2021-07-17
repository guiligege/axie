package org.pachinko.entity;

import lombok.Data;

import java.util.Date;

@Data
public class UserAvatar {

    private Integer id;
    private String name;
    private String path;
    private Integer status;
    private Date created;
    private Date updated;

}
