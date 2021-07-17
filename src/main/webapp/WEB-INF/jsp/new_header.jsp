<%-- 剥离出来的头部 --%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="topbar-nav" style="margin-bottom: 20px;">
    <nav class="navbar navbar-expand fixed-top bg-white">
        <img src="/img/logo.png" style="width:66px;height:36px" > Axie 游戏市场


        <c:choose>
            <c:when test="${flag =='AXIE'}">
                    <span style="margin-left: 20px;font-size: 20px;line-height: 20px;">
                         <a href="/cproduct/list-AXIE-2-0-0-1-1.htm"  style="color: coral;">我要买Axie</a>
                    </span>
            </c:when>
            <c:otherwise>
                    <span style="margin-left: 20px;">
                         <a href="/cproduct/list-AXIE-2-0-0-1-1.htm" style="color: #5e72e4;">我要买Axie</a>
                    </span>
            </c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${flag =='SLP'}">
                    <span style="margin-left: 20px;font-size: 20px;line-height: 20px;">
                         <a href="/cproduct/list-SLP-2-0-0-1-1.htm"  style="color: coral;">我要买/卖爱情药水（SLP）</a>
                    </span>
            </c:when>
            <c:otherwise>
                    <span style="margin-left: 20px;">
                        <a href="/cproduct/list-SLP-2-0-0-1-1.htm" style="color: #5e72e4;">我要买/卖爱情药水（SLP）</a>
                    </span>
            </c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${flag =='AXS'}">
                    <span style="margin-left: 20px;font-size: 20px;line-height: 20px;">
                         <a href="/cproduct/list-AXS-2-0-0-1-1.htm"  style="color: coral;">我要买/卖繁殖道具（AXS）</a>
                    </span>
            </c:when>
            <c:otherwise>
                    <span style="margin-left: 20px;">
                        <a href="/cproduct/list-AXS-2-0-0-1-1.htm" style="color: #5e72e4;">我要买/卖繁殖道具（AXS）</a>
                    </span>
            </c:otherwise>
        </c:choose>


        <c:choose>
            <c:when test="${flag =='order'}">
                             <span style="margin-left: 20px;font-size: 20px;line-height: 20px;">
                                 <a href="/order/buyerOrderManage.htm" style="color: coral;">我的订单</a>
                             </span>
            </c:when>
            <c:otherwise>
                            <span style="margin-left: 20px;">
                                 <a href="/order/buyerOrderManage.htm" style="color: #5e72e4;">我的订单</a>
                            </span>
            </c:otherwise>
        </c:choose>

        <span style="margin-left: 20px;">
                <a href="/product/productManage.htm" target="_blank" style="color: #5e72e4;">卖家入口</a>
            </span>

        <c:choose>
            <c:when test="${ empty user}">
                <span style="margin-left: 200px;">
                        <a href="/tologin.htm" target="_blank" style="color: coral;">登录</a>
                </span>
                <span style="margin-left: 20px;">
                        <a href="/toregiter.htm" target="_blank" style="color: coral;">注册</a>
                </span>
            </c:when>
            <c:otherwise>
                <span style="margin-left: 20px;">
                        欢迎：${user.nick}
                </span>
            </c:otherwise>
        </c:choose>

    </nav>
</header>

