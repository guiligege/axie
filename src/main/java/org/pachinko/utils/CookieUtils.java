package org.pachinko.utils;

import java.net.URLDecoder;
import java.util.regex.Pattern;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

/**
 * cookie工具
 */
@Slf4j
public class CookieUtils {


    private final static Pattern httpPattern = Pattern.compile("^(http|https){1}://(.*?)/");
    public final static String LOGIN_COOKIE = "cookie3";

    public static void setUserCookie(HttpServletRequest request, HttpServletResponse response, String key) {

        String loginCookie = key;
        String requestUrl = request.getRequestURL().toString();
        String parentDomain = getParentDomain(requestUrl);

        if (StringUtils.isNotBlank(parentDomain)) {
            if (StringUtils.isNotEmpty(loginCookie)) {
                String cookieValue = null;
                try {
                    cookieValue = AesUtils.encrypt2Hex(loginCookie,AesUtils.SECRET);
                    addHttpOnlyCookie(response,LOGIN_COOKIE,cookieValue,parentDomain);
                } catch (Exception e) {
                    log.error("addHttpOnlyCookie cookie error,",e);
                }
            }
        }
    }
    public static void deleteUserCookie(HttpServletRequest request, HttpServletResponse response, String key) {

        String loginCookie = key;
        String requestUrl = request.getRequestURL().toString();
        String parentDomain = getParentDomain(requestUrl);

        if (StringUtils.isNotBlank(parentDomain)) {
            if (StringUtils.isNotEmpty(loginCookie)) {
                try {
                    deleteCookie(request,response,LOGIN_COOKIE,parentDomain);
                } catch (Exception e) {
                    log.error("delete cookie error,",e);
                }
            }
        }
    }



    public static String getParentDomain(String requestUrl) {
        String parentDomain = "huaqiaochengyule.com";

        return parentDomain;
    }

    public static String getCookieValue(HttpServletRequest request, String cookieName) {

        String cookieValue = getCookieValue(request, cookieName, false, "utf-8");

        if(StringUtils.isEmpty(cookieValue)){
            return null;
        }
        try{

            cookieValue = AesUtils.decryptHex(cookieValue,AesUtils.SECRET);
        }catch (Exception e){
            log.error("error",e);
        }
        return cookieValue;
    }

    public static String getCookieValue(HttpServletRequest request, String cookieName, boolean decode, String charset) {
        String cookieValue = null;
        try {
            Cookie cookie = getCookie(request, cookieName);
            if (cookie == null || cookie.getValue() == null) {
                return null;
            }
            if (!decode) {
                return cookie.getValue();
            }
            if (charset != null) {
                return URLDecoder.decode(cookieValue);
            }
            return URLDecoder.decode(cookieValue, charset);
        } catch (Exception e) {
            log.warn("unsupported encoding cookie value,cookieName=" + cookieName + ",cookieValue=" + cookieValue);
        }

        return cookieValue;
    }

    public static Cookie getCookie(HttpServletRequest request, String cookieName) {
        Cookie[] cookies = request.getCookies();
        String cookieValue = null;
        try {
            if(cookies == null || cookieName == null || cookieName.trim().isEmpty()){
                return null;
            }
            for (Cookie cookie : cookies) {
                if (cookie != null && cookie.getName() != null && cookie.getName().equals(cookieName)) {
                    return cookie;
                }
            }

        } catch (Exception e) {
            log.error("unsupported encoding cookie value,cookieName=" + cookieName + ",cookieValue=" + cookieValue, e);
        }

        return null;
    }
    public static void addHttpOnlyCookie(HttpServletResponse response, String name, String value, String domain) {
        Cookie cookie = new Cookie(name, value);
        cookie.setDomain(domain);
        cookie.setHttpOnly(true);
        cookie.setPath("/");
        response.addCookie(cookie);

    }

    public static void deleteCookie(HttpServletRequest request, HttpServletResponse response, String cookieName, String domainHost) {
        Cookie cookie = getCookie(request, cookieName);
        if (cookie != null) {
            cookie.setMaxAge(0);
            cookie.setPath("/");
            cookie.setDomain(domainHost);
            response.addCookie(cookie);
        }
    }
}
