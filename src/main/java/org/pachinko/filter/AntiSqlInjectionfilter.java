package org.pachinko.filter;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AntiSqlInjectionfilter implements Filter {

    @Override
    public void destroy() {
        // TODO Auto-generated method stub
    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {
        // TODO Auto-generated method stub
    }

    @Override
    public void doFilter(ServletRequest args0, ServletResponse args1,
                         FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req=(HttpServletRequest)args0;
        HttpServletResponse res=(HttpServletResponse)args1;
        //获得所有请求参数名
        Enumeration params = req.getParameterNames();
        StringBuffer sql = new StringBuffer("");
        while (params.hasMoreElements()) {
            //得到参数名
            String name = params.nextElement().toString();
            //得到参数对应值
            String[] value = req.getParameterValues(name);
            for (int i = 0; i < value.length; i++) {
                //sql = sql + value[i];
                sql.append(value[i]);
            }
        }
        //System.out.println("============================SQL"+sql);
        //有sql关键字，跳转到error.html
        if (sqlValidate(sql.toString())) {
            //throw new IOException("您发送请求中的参数中含有非法字符");
            log.error("sqlValidate error,您发送请求中的参数中含有非法字符");
            res.sendRedirect("/error.htm");
            return;
        } else {
            log.warn("sql success!");
            chain.doFilter(args0,args1);
        }
    }

    //效验
    protected static boolean sqlValidate(String str) {
        //统一转为小写
        str = str.toLowerCase();
        /**
         * 过滤掉的sql关键字，可以手动添加
         */
        String badStr = "'|and|exec|insert|select|delete|grant|like|drop|update|count|*|%|chr|mid|master|truncate|char|declare|;|or|-|+|,";

        String[] badStrs = badStr.split("\\|");
        for (int i = 0; i < badStrs.length; i++) {
            if (str.indexOf(badStrs[i]) >= 0) {
                return true;
            }
        }
        return false;
    }
}
