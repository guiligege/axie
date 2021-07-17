package org.pachinko.dto;

import lombok.Data;

/**
 * 用户信息入参
 */
@Data
public class UserParam {


    /**
     * loginname and ronin account
     */
    private String ronin;
    private String password;

    private String nick;
    private String email;
    private String dailiCode;
}