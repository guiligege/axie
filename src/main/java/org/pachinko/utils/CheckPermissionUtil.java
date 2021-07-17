package org.pachinko.utils;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONObject;

import org.pachinko.dto.UserDTO;
import org.springframework.util.StringUtils;

public class CheckPermissionUtil {

    /**
     * 判断 是否已登录，未登录需要登录
     * @param request
     * @param cookieName
     * @return
     */
    public static boolean hasPermission(HttpServletRequest request, String cookieName){

        String loginInfo = CookieUtils.getCookieValue(request,cookieName);
        if(StringUtils.isEmpty(loginInfo)){
            return false;
        }

        //是否已经过期
        UserDTO userDTO = JSONObject.parseObject(loginInfo, UserDTO.class);
        if( !userDTO.hasExpire() ){
            return true;
        }
        return false;
    }

    /**
     * 从cookie渲染userinfo
     * @param request
     * @param cookieName
     * @return
     */
    public static UserDTO getUserDTOFromCookie(HttpServletRequest request, String cookieName){

        String loginInfo = CookieUtils.getCookieValue(request,cookieName);
        if(StringUtils.isEmpty(loginInfo)){
            return null;
        }

        //是否已经过期
        UserDTO userDTO = JSONObject.parseObject(loginInfo, UserDTO.class);
        return userDTO;
    }
}
