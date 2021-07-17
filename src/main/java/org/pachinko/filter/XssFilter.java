package org.pachinko.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class XssFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws
        IOException, ServletException {
        //使用包装器
        XssFilterWrapper xssFilterWrapper=new XssFilterWrapper((HttpServletRequest) servletRequest);
        filterChain.doFilter(xssFilterWrapper,servletResponse);
    }

    @Override
    public void destroy() {

    }
}
