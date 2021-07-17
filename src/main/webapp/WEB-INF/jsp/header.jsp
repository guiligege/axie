<%-- 剥离出来的头部 --%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="site_head site_head_channel" id="new_vs_header">
    <div class="head_inner">
        <%--<h1 class="site_logo"><a href="https://v.qq.com/" class="link_logo" >精选视频</a></h1>--%>
        <div class="site_channel">

            <a href="/list-1-0-0-0.htm" class="active channel_nav channel_nav_0 _channel_nav_精选">AXIES</a>
           <%-- <c:choose>
                <c:when test="${type ==0}">
                    <a href="/list-1-0-0-0.htm" class="active channel_nav channel_nav_0 _channel_nav_精选">AXIES</a>
                </c:when>
                <c:otherwise>
                    <a href="/list-1-0-0-0.htm" class="channel_nav channel_nav_0 _channel_nav_精选">AXIES</a>
                </c:otherwise>
            </c:choose>--%>
            <c:choose>
                <c:when test="${type ==1}">
                    <a href="/list-1-0-0-0.htm" class="active channel_nav channel_nav_2 _channel_nav_电影" >药水</a>
                </c:when>
                <c:otherwise>
                    <a href="/list-1-0-0-0.htm" class="channel_nav channel_nav_2 _channel_nav_电影" >药水</a>
                </c:otherwise>
            </c:choose>
            <%--<c:choose>
                <c:when test="${type ==2}">
                    <a href="/list-2-0-0-0.htm" class="active channel_nav channel_nav_1 _channel_nav_电视剧" >LANDS</a>
                </c:when>
                <c:otherwise>
                    <a href="/list-2-0-0-0.htm" class="channel_nav channel_nav_1 _channel_nav_电视剧" >LANDS</a>
                </c:otherwise>
            </c:choose>--%>
        </div>
    </div>
</div>

