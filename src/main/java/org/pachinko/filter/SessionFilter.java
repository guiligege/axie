package org.pachinko.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;
import org.pachinko.utils.CheckPermissionUtil;
import org.pachinko.utils.Constants;
import org.pachinko.utils.CookieUtils;

/**
 * session filter
 */
@Slf4j
public class SessionFilter implements Filter {

    private String[] excepUrls= {"tologin.htm","cproduct","/success.htm","/error.htm","/tologin.htm","/toregiter.htm"
        ,"/login/loginByPwd.htm","/user/register.htm"};

    @Override
    public void init(FilterConfig cfg) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        // 如果 sessionKey 为空，则直接放行

        //         * 请求 http://127.0.0.1:8080/webApp/home.jsp?&a=1&b=2 时
        //          * request.getRequestURL()： http://127.0.0.1:8080/webApp/home.jsp
        //         * request.getContextPath()： /webApp
        //         * request.getServletPath()：/home.jsp
        //         * request.getRequestURI()： /webApp/home.jsp
        //         * request.getQueryString()：a=1&b=2
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        String servletPath = request.getServletPath();

        log.warn("servletPath:{}",servletPath);
        // 如果请求的路径与forwardUrl相同，或请求的路径是排除的URL时，则直接放行
        for(String excludeUrl : excepUrls){
            if ( servletPath.indexOf(excludeUrl)>0 ) {

                chain.doFilter(req, res);
                return;
            }
        }

        // 如果Session为空，则跳转到指定页面
        if (!CheckPermissionUtil.hasPermission(request, CookieUtils.LOGIN_COOKIE)) {
            String redirect = "/tologin.htm";
            response.sendRedirect(Constants.BASE_DOMAIN + redirect);
            return;
        } else {
            chain.doFilter(req, res);
        }
    }

    @Override
    public void destroy() {
    }
}