
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no">

    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="msapplication-tap-highlight" content="no">
    <style>

        .top-fixed-down {
            margin-top: -80px;
        }
        .stui-header__menu li {
            float: left;
            margin-top: 15px;
            margin-right: 15px;
        }
        ul {
            display: block;
            list-style-type: disc;
            margin-block-start: 1em;
            margin-block-end: 1em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
            padding-inline-start: 40px;
        }
        .stui-header__menu li a {
            display: inline-block;
            padding: 3px 8px 4px;
            font-size: 16px;
            border-radius: 2px;
            color: #333333;
            text-decoration: none;
        }
        .stui-header__top {
            position: fixed;
            top: 0;
            z-index: 999;
            width: 100%;
            min-height: 80px;
            box-shadow: 0 1px 4px rgba(0, 0, 0, 0.1);
            background-color: rgba(255,255,255,.95);
        }
        .top-fixed {
            -webkit-transition: .5s;
            -o-transition: .5s;
            -moz-transition: .5s;
            -ms-transition: .5s;
            transition: .5s;
        }
        .top-fixed-up {
            margin-top: 0 !important;
        }
        .container {
            position: relative;
            padding-right: 15px;
            padding-left: 15px;
            margin-right: auto;
            margin-left: auto;
        }
        .row {
            position: relative;
            margin-right: -15px;
            margin-left: -15px;
        }
        .stui-header__logo {
            margin-top: 15px;
            float: left;
        }
        .stui-header__side {
            float: right;
        }
        .stui-header__menu {
            position: relative;
            margin-left: 330px;
            float: left;
        }
        ul, li {
            list-style-type: none;
        }
        .stui-header__menu li a {
            display: inline-block;
            padding: 3px 8px 4px;
            font-size: 15px;
            border-radius: 2px;
            color: #333333;
        }
        .stui-header__menu li.active a {
            background-color: #FF9900;
            color: #FFFFFF;
        }
        .hide, .visible-lg, .visible-md, .visible-sm, .visible-xs, .visible-mi {
            display: none !important;
        }

        <!--tx filter-->
        .mod_list_filter {
            position: relative;
            margin: 0 0 40px;
            padding: 1px 26px;
            border-radius: 4px;
            background-color: #f8f8f8;
            font-size: 13px;
        }

        .mod_list_filter .filter_result {
            position: absolute;
            top: 26px;
            right: 26px;
            line-height: 32px;
        }
        .hl {
            color: #ff5c38;
        }

        .mod_list_filter .filter_line {
            position: relative;
            margin: 26px 0;
            padding-left: 90px;
        }
        .mod_list_filter .filter_label {
            position: absolute;
            top: 0;
            left: 0;
            min-width: 50px;
            margin-right: 20px;
            padding: 0 5px;
            border-radius: 16px 0 16px 16px;
            background-color: #7f7f8b;
            color: #fff;
            line-height: 32px;
            text-align: center;
            font-size: 13px;
        }
        .mod_list_filter .filter_item {
            display: inline-block;
            margin: 2px 0;
            padding: 0 10px;
            border-radius: 15px;
            color: #999;
            line-height: 28px;
            vertical-align: top;
            font-size: 13px;
        }
        .mod_list_filter .current {
            position: relative;
            background-color: #f7eae8;
            color: #ff5c38;
            font-weight: 700;
        }
        .mod_list_filter .filter_item {
            display: inline-block;
            margin: 2px 0;
            padding: 0 10px;
            border-radius: 15px;
            color: #999;
            line-height: 28px;
            vertical-align: top;
        }

        <!--tx filter end-->

        <!--list-->
        .mod_figure {
            *zoom: 1;
            position: relative;
            margin-right: -18px;
            margin-bottom: -40px;
            font-size: 0;
            letter-spacing: -5px;
        }
        .mod_figure .list_item {
            *zoom: 1;
            display: inline-block;
            *display: inline;
            position: relative;
            margin: 0 18px 40px 0;
            padding: 0;
            color: #999;
            font-size: 12px;
            letter-spacing: normal;
            vertical-align: top;
        }
        .mod_figure_v_default .list_item {
            width: 185px;
        }

        .mod_figure_v_default .figure, .mod_figure_v_default .figure_keyframes {
            width: 194px;
            height: 146px;
        }
        .mod_figure .figure {
            margin-bottom: 14px;
            border-radius: 4px;
        }
        a:active, a:visited {
            outline: 0 none;
        }
        .figure {
            *zoom: 1;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            display: block;
            position: relative;
            width: 100%;
            user-select: none;
        }
        a {
            color: #111;
        }
        a {
            text-decoration: none;
            cursor: pointer;
        }
        .mod_figure .list_item {
            *zoom: 1;
            display: inline-block;
            *display: inline;
            position: relative;
            margin: 0 18px 40px 0;
            padding: 0;
            color: #999;
            font-size: 12px;
            letter-spacing: normal;
            vertical-align: top;
        }
        .mod_figure .figure_pic {
            transition: box-shadow .15s linear,-webkit-filter .3s ease-out;

            display: block;
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 4px;
            background: #f8f8f8;
            background-color: rgba(236,236,236,.1);
            user-select: none;

            font-size: 12px;
            letter-spacing: normal;
        }
        img {
            -ms-interpolation-mode: bicubic;
            display: inline-block;
            vertical-align: bottom;
        }
        fieldset, iframe, img {
            border: 0;
        }
        a {
            color: #111;
            cursor: pointer;
        }

        .figure .figure_caption {
            position: absolute;
            right: 0;
            bottom: 0;
            left: 0;
            width: auto;
            height: 20px;
            padding: 10px 10px 4px;
            overflow: hidden;
            border-radius: 0 0 4px 4px;
            background: linear-gradient(0deg,#000,#000 25.5%,#000 70%,#000);
            background: linear-gradient(0deg,rgba(0,0,0,.5),rgba(0,0,0,.3) 25.5%,rgba(0,0,0,.08) 70%,rgba(0,0,0,0));
            color: #fff;
            font-size: 13px;
            letter-spacing: normal;
            line-height: 20px;
            text-overflow: ellipsis;
            white-space: nowrap;
            cursor: pointer;
            user-select: none;
        }

        .figure_detail_two_row {
            height: 44px;
            overflow: hidden;
            color: #999;
            font-size: 12px;
            letter-spacing: normal;
        }
        .mod_figure .bold {
            font-weight: 700;
            letter-spacing: 0;
        }

        a:active, a:visited {
            outline: 0 none;
        }
        .figure_title {
            font-size: 14px;
        }
        .figure_title_two_row {
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 2;
            word-wrap: break-word;
            display: -webkit-box;
            height: auto;
            max-height: 44px;
            overflow: hidden;
            letter-spacing: 1px;
            line-height: 23px;
            white-space: normal;
            word-break: break-all;
        }
        .figure_title {
            display: block;
            width: 100%;
            overflow: hidden;
            font-size: 15px;
            font-weight: 400;
            line-height: 22px;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .figure_desc {
            display: block;
            width: 100%;
            margin-top: 3px;
            overflow: hidden;
            font-size: 13px;
            line-height: 20px;
            text-overflow: ellipsis;
            white-space: nowrap;
            cursor: default;
            letter-spacing: normal;
        }

        .mod_row_box {
            position: relative;
            width: 100%;
            margin-bottom: 40px;
        }
        .mod_row_box .mod_bd, .mod_row_box .mod_hd, .mod_row_box_special {
            width: 1250px;
            z-index: 2;
            position: relative;
            margin: 0 auto;
        }
        .mod_list_filter .current {
            position: relative;
            background-color: #f7eae8;
            color: #ff5c38;
            font-weight: 700;
        }

        <!--分页-->
            .mod_pages {
                margin: 40px auto;
                font-size: 0;
                text-align: center;
            }
        .mod_pages .page_prev {
            margin-right: 15px;
        }
        .mod_pages a {
            display: inline-block;
            min-width: 10px;
            height: 30px;
            margin: 0 5px;
            padding: 0 10px;
            border: 1px solid #d8d8d8;
            border-radius: 2px;
            color: #5a5a5a;
            font-size: 14px;
            line-height: 30px;
            text-align: center;
            *vertical-align: top;
        }
        a:active, a:visited {
            outline: 0 none;
        }
        .mod_pages .current, .mod_pages .current:hover {
            border-color: #ff6428;
            background-color: #ff6428;
            color: #fff;
        }
        .mod_pages .disabled {
            cursor: default;
            filter: alpha(opacity=50);
            opacity: .5;
        }
        .mod_pages .page_next {
            margin-left: 15px;
        }

        <!--head-->

            .site_head_channel {
                z-index: 101;
                position: fixed;
                background-color: rgba(255,255,255,.95);
            }
        .site_head {
            top: 0;
            left: 0;
            width: 100%;
            min-width: 1000px;
            height: 68px;
            background: #fff;
            color: #666;
            font-size: 12px;
        }
        .site_head .head_inner {
            width: 1200px;
        }
        .site_head .head_inner {
            height: 68px;
            margin: 0 auto;
        }
        .site_logo {
            position: relative;
            width: 135px;
            margin-top: 16px;
            float: left;
            overflow: hidden;
        }
        h1 {
            font-size: 1em;
        }
        .site_logo .link_logo {
            display: block;
            width: 135px;
            height: 36px;
            background: url(https://vm.gtimg.cn/tencentvideo/vstyle/web/v6/style/img/common/sprite_head_logo.svg) 0 -36px no-repeat;
            text-indent: -300px;
        }
        .site_head a {
            text-decoration: none;
        }
        .site_channel {
            position: relative;
            margin: 22px 0 0 30px;
            float: left;
            font-size: 0;
            letter-spacing: -3px;
            line-height: 26px;
        }

        .site_channel .channel_nav {
            margin-right: 12px;
            display: inline-block;
            position: relative;
            color: #111;
            font-size: 18px;
            letter-spacing: normal;
            vertical-align: top;
            font-weight: 500;
        }

        .site_channel .active{
            margin-right: 12px;
            display: inline-block;
            position: relative;
            color: #ff5c38;
            font-size: 18px;
            letter-spacing: normal;
            vertical-align: top;
            font-weight: 500;

        }


        .site_head a {
            text-decoration: none;
        }
        a:active, a:visited {
            outline: 0 none;
        }
    </style>
</head>

<jsp:include page="header.jsp"></jsp:include>
<body>

<div class="mod_row_box">
    <div class="mod_bd _mod_listpage">
    <div class="mod_list_filter" style="    position: relative;
    margin: 0 0 20px;
    padding: 1px 26px;
    border-radius: 4px;
    background-color: #F8F8F8;
    font-size: 13px;">
        <div class="filter_result " data-total="1494" data-pagemax="50"><span class="hl"></span>筛选结果
        </div>

        <div class="filter_line filter_line_0 " data-key="sort">
            <span class="filter_label">排序</span>

            <a href="/" class="filter_item current">价格从低到高</a>
            <a href="/" class="filter_item ">价格从高到低</a>
            <%--<c:if test="${order ==0}">
                <a href="/list-${type}-0-0-0.htm" class="filter_item current">最新</a>
                <a href="/list-${type}-0-1-0.htm" class="filter_item ">好评</a>
            </c:if>
            <c:if test="${order ==1}">
                <a href="/list-${type}-0-0-0.htm" class="filter_item ">最新</a>
                <a href="/list-${type}-0-1-0.htm" class="filter_item current">好评</a>
            </c:if>--%>
        </div>

        <div class="filter_line filter_line_3 none" data-key="iarea">
            <span class="filter_label">种类</span>
            <a href="/list--0-0-0.htm" class="filter_item">全部</a>
            <a href="/list--0.htm" class="filter_item">Fish</a>
            <a href="/list--0.htm" class="filter_item">Beast</a>
            <a href="/list--0.htm" class="filter_item">Bird</a>
            <a href="/list--0.htm" class="filter_item current">Plant</a>
            <a href="/list--0.htm" class="filter_item ">Bug</a>
            <a href="/list--0.htm" class="filter_item ">Reptile</a>
            <a href="/list--0.htm" class="filter_item ">Mech</a>
            <a href="/list--0.htm" class="filter_item ">Dawn</a>
            <a href="/list--0.htm" class="filter_item ">Dusk</a>

            <%--<c:forEach var="subType1" items="${subTypes}" varStatus="index">
                <c:choose>
                    <c:when test="${subType1.key ==subType}">
                        <a href="/list-${type}-${subType1.key}-${order}-0.htm" class="filter_item current">${subType1.value}</a>
                    </c:when>
                    <c:otherwise>
                        <a href="/list-${type}-${subType1.key}-${order}-0.htm" class="filter_item">${subType1.value}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>--%>
        </div>

        <div class="filter_line filter_line_3 none" data-key="iarea">
            <span class="filter_label">是蛋么</span>
            <a href="/list--0-0-0.htm" class="filter_item current">全部</a>
            <a href="/list--0.htm" class="filter_item">不是蛋</a>
            <a href="/list--0.htm" class="filter_item">是蛋</a>
        </div>

       <%-- <div class="filter_line filter_line_3 none" data-key="iarea">
            <span class="filter_label">类型</span>
            <c:if test="${subType ==0}">
                <a href="/list-${type}-0-0-0.htm" class="filter_item current">全部</a>
            </c:if>
            <c:if test="${subType !=0}">
                <a href="/list-${type}-0-0-0.htm" class="filter_item ">全部</a>
            </c:if>

            <c:forEach var="subType1" items="${subTypes}" varStatus="index">
                <c:choose>
                    <c:when test="${subType1.key ==subType}">
                        <a href="/list-${type}-${subType1.key}-${order}-0.htm" class="filter_item current">${subType1.value}</a>
                    </c:when>
                    <c:otherwise>
                        <a href="/list-${type}-${subType1.key}-${order}-0.htm" class="filter_item">${subType1.value}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>--%>

    </div>

    <div class="mod_figure mod_figure_v_default mod_figure_list_box">


        <div class="list_item">
            <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone" class="figure"  title="测试测试" >
                <img class="figure_pic" src="https://marketplace.axieinfinity.com/static/image/love-potion.png" alt="测试测试">
                <div class="figure_caption"> 单价：0.1155，数量：1</div>
            </a>
            <div class="figure_detail figure_detail_two_row">
                <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone"
                   title="测试" class="figure_title figure_title_two_row bold">
                    单价：0.1155，数量：1
                </a>
            </div>
        </div>

        <div class="list_item">
            <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone" class="figure"  title="测试测试" >
                <img class="figure_pic" src="https://storage.googleapis.com/assets.axieinfinity.com/axies/1232391/axie/axie-full-transparent.png" alt="测试测试">
                <div class="figure_caption">0.115</div>
            </a>
            <div class="figure_detail figure_detail_two_row">
                <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone"
                   title="测试" class="figure_title figure_title_two_row bold">
                    0.1155
                </a>
            </div>
        </div>

        <div class="list_item">
            <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone" class="figure"  title="测试测试" >
                <img class="figure_pic" src="https://storage.googleapis.com/assets.axieinfinity.com/axies/1232391/axie/axie-full-transparent.png" alt="测试测试">
                <div class="figure_caption">0.115</div>
            </a>
            <div class="figure_detail figure_detail_two_row">
                <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone"
                   title="测试" class="figure_title figure_title_two_row bold">
                    0.1155
                </a>
            </div>
        </div>

        <div class="list_item">
            <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone" class="figure"  title="测试测试" >
                <img class="figure_pic" src="https://storage.googleapis.com/assets.axieinfinity.com/axies/1232391/axie/axie-full-transparent.png" alt="测试测试">
                <div class="figure_caption">0.115</div>
            </a>
            <div class="figure_detail figure_detail_two_row">
                <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone"
                   title="测试" class="figure_title figure_title_two_row bold">
                    0.1155
                </a>
            </div>
        </div>

        <div class="list_item">
            <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone" class="figure"  title="测试测试" >
                <img class="figure_pic" src="https://storage.googleapis.com/assets.axieinfinity.com/axies/1232391/axie/axie-full-transparent.png" alt="测试测试">
                <div class="figure_caption">0.115</div>
            </a>
            <div class="figure_detail figure_detail_two_row">
                <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone"
                   title="测试" class="figure_title figure_title_two_row bold">
                    0.1155
                </a>
            </div>
        </div>

        <div class="list_item">
            <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone" class="figure"  title="测试测试" >
                <img class="figure_pic" src="https://storage.googleapis.com/assets.axieinfinity.com/axies/1232391/axie/axie-full-transparent.png" alt="测试测试">
                <div class="figure_caption">0.115</div>
            </a>
            <div class="figure_detail figure_detail_two_row">
                <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone"
                   title="测试" class="figure_title figure_title_two_row bold">
                    0.1155
                </a>
            </div>
        </div>

        <div class="list_item">
            <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone" class="figure"  title="测试测试" >
                <img class="figure_pic" src="https://storage.googleapis.com/assets.axieinfinity.com/axies/1232391/axie/axie-full-transparent.png" alt="测试测试">
                <div class="figure_caption">0.115</div>
            </a>
            <div class="figure_detail figure_detail_two_row">
                <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone"
                   title="测试" class="figure_title figure_title_two_row bold">
                    0.1155
                </a>
            </div>
        </div>

        <div class="list_item">
            <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone" class="figure"  title="测试测试" >
                <img class="figure_pic" src="https://storage.googleapis.com/assets.axieinfinity.com/axies/1232391/axie/axie-full-transparent.png" alt="测试测试">
                <div class="figure_caption">0.115</div>
            </a>
            <div class="figure_detail figure_detail_two_row">
                <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone"
                   title="测试" class="figure_title figure_title_two_row bold">
                    0.1155
                </a>
            </div>
        </div>

        <div class="list_item">
            <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone" class="figure"  title="测试测试" >
                <img class="figure_pic" src="https://storage.googleapis.com/assets.axieinfinity.com/axies/1232391/axie/axie-full-transparent.png" alt="测试测试">
                <div class="figure_caption">0.115</div>
            </a>
            <div class="figure_detail figure_detail_two_row">
                <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone"
                   title="测试" class="figure_title figure_title_two_row bold">
                    0.1155
                </a>
            </div>
        </div>

        <div class="list_item">
            <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone" class="figure"  title="测试测试" >
                <img class="figure_pic" src="https://storage.googleapis.com/assets.axieinfinity.com/axies/1232391/axie/axie-full-transparent.png" alt="测试测试">
                <div class="figure_caption">0.115</div>
            </a>
            <div class="figure_detail figure_detail_two_row">
                <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone"
                   title="测试" class="figure_title figure_title_two_row bold">
                    0.1155
                </a>
            </div>
        </div>
        <div class="list_item">
            <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone" class="figure"  title="测试测试" >
                <img class="figure_pic" src="https://storage.googleapis.com/assets.axieinfinity.com/axies/1232391/axie/axie-full-transparent.png" alt="测试测试">
                <div class="figure_caption">0.115</div>
            </a>
            <div class="figure_detail figure_detail_two_row">
                <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone"
                   title="测试" class="figure_title figure_title_two_row bold">
                    0.1155
                </a>
            </div>
        </div>
        <div class="list_item">
            <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone" class="figure"  title="测试测试" >
                <img class="figure_pic" src="https://storage.googleapis.com/assets.axieinfinity.com/axies/1232391/axie/axie-full-transparent.png" alt="测试测试">
                <div class="figure_caption">0.115</div>
            </a>
            <div class="figure_detail figure_detail_two_row">
                <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone"
                   title="测试" class="figure_title figure_title_two_row bold">
                    0.1155
                </a>
            </div>
        </div>
        <div class="list_item">
            <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone" class="figure"  title="测试测试" >
                <img class="figure_pic" src="https://storage.googleapis.com/assets.axieinfinity.com/axies/1232391/axie/axie-full-transparent.png" alt="测试测试">
                <div class="figure_caption">0.115</div>
            </a>
            <div class="figure_detail figure_detail_two_row">
                <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone"
                   title="测试" class="figure_title figure_title_two_row bold">
                    0.1155
                </a>
            </div>
        </div>
        <div class="list_item">
            <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone" class="figure"  title="测试测试" >
                <img class="figure_pic" src="https://storage.googleapis.com/assets.axieinfinity.com/axies/1232391/axie/axie-full-transparent.png" alt="测试测试">
                <div class="figure_caption">0.115</div>
            </a>
            <div class="figure_detail figure_detail_two_row">
                <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone"
                   title="测试" class="figure_title figure_title_two_row bold">
                    0.1155
                </a>
            </div>
        </div>
        <div class="list_item">
            <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone" class="figure"  title="测试测试" >
                <img class="figure_pic" src="https://storage.googleapis.com/assets.axieinfinity.com/axies/1232391/axie/axie-full-transparent.png" alt="测试测试">
                <div class="figure_caption">0.115</div>
            </a>
            <div class="figure_detail figure_detail_two_row">
                <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone"
                   title="测试" class="figure_title figure_title_two_row bold">
                    0.1155
                </a>
            </div>
        </div>
        <div class="list_item">
            <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone" class="figure"  title="测试测试" >
                <img class="figure_pic" src="https://storage.googleapis.com/assets.axieinfinity.com/axies/1232391/axie/axie-full-transparent.png" alt="测试测试">
                <div class="figure_caption">0.115</div>
            </a>
            <div class="figure_detail figure_detail_two_row">
                <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone"
                   title="测试" class="figure_title figure_title_two_row bold">
                    0.1155
                </a>
            </div>
        </div>
        <div class="list_item">
            <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone" class="figure"  title="测试测试" >
                <img class="figure_pic" src="https://storage.googleapis.com/assets.axieinfinity.com/axies/1232391/axie/axie-full-transparent.png" alt="测试测试">
                <div class="figure_caption">0.115</div>
            </a>
            <div class="figure_detail figure_detail_two_row">
                <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone"
                   title="测试" class="figure_title figure_title_two_row bold">
                    0.1155
                </a>
            </div>
        </div>
        <div class="list_item">
            <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone" class="figure"  title="测试测试" >
                <img class="figure_pic" src="https://storage.googleapis.com/assets.axieinfinity.com/axies/1232391/axie/axie-full-transparent.png" alt="测试测试">
                <div class="figure_caption">0.115</div>
            </a>
            <div class="figure_detail figure_detail_two_row">
                <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone"
                   title="测试" class="figure_title figure_title_two_row bold">
                    0.1155
                </a>
            </div>
        </div>
        <div class="list_item">
            <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone" class="figure"  title="测试测试" >
                <img class="figure_pic" src="https://storage.googleapis.com/assets.axieinfinity.com/axies/1232391/axie/axie-full-transparent.png" alt="测试测试">
                <div class="figure_caption">0.115</div>
            </a>
            <div class="figure_detail figure_detail_two_row">
                <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone"
                   title="测试" class="figure_title figure_title_two_row bold">
                    0.1155
                </a>
            </div>
        </div>
        <div class="list_item">
            <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone" class="figure"  title="测试测试" >
                <img class="figure_pic" src="https://storage.googleapis.com/assets.axieinfinity.com/axies/1232391/axie/axie-full-transparent.png" alt="测试测试">
                <div class="figure_caption">0.115</div>
            </a>
            <div class="figure_detail figure_detail_two_row">
                <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone"
                   title="测试" class="figure_title figure_title_two_row bold">
                    0.1155
                </a>
            </div>
        </div>
        <div class="list_item">
            <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone" class="figure"  title="测试测试" >
                <img class="figure_pic" src="https://storage.googleapis.com/assets.axieinfinity.com/axies/1232391/axie/axie-full-transparent.png" alt="测试测试">
                <div class="figure_caption">0.115</div>
            </a>
            <div class="figure_detail figure_detail_two_row">
                <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone"
                   title="测试" class="figure_title figure_title_two_row bold">
                    0.1155
                </a>
            </div>
        </div>
        <div class="list_item">
            <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone" class="figure"  title="测试测试" >
                <img class="figure_pic" src="https://storage.googleapis.com/assets.axieinfinity.com/axies/1232391/axie/axie-full-transparent.png" alt="测试测试">
                <div class="figure_caption">0.115</div>
            </a>
            <div class="figure_detail figure_detail_two_row">
                <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone"
                   title="测试" class="figure_title figure_title_two_row bold">
                    0.1155
                </a>
            </div>
        </div>
        <div class="list_item">
            <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone" class="figure"  title="测试测试" >
                <img class="figure_pic" src="https://storage.googleapis.com/assets.axieinfinity.com/axies/1232391/axie/axie-full-transparent.png" alt="测试测试">
                <div class="figure_caption">0.115</div>
            </a>
            <div class="figure_detail figure_detail_two_row">
                <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone"
                   title="测试" class="figure_title figure_title_two_row bold">
                    0.1155
                </a>
            </div>
        </div>
        <div class="list_item">
            <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone" class="figure"  title="测试测试" >
                <img class="figure_pic" src="https://storage.googleapis.com/assets.axieinfinity.com/axies/1232391/axie/axie-full-transparent.png" alt="测试测试">
                <div class="figure_caption">0.115</div>
            </a>
            <div class="figure_detail figure_detail_two_row">
                <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone"
                   title="测试" class="figure_title figure_title_two_row bold">
                    0.1155
                </a>
            </div>
        </div>
        <div class="list_item">
            <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone" class="figure"  title="测试测试" >
                <img class="figure_pic" src="https://storage.googleapis.com/assets.axieinfinity.com/axies/1232391/axie/axie-full-transparent.png" alt="测试测试">
                <div class="figure_caption">0.115</div>
            </a>
            <div class="figure_detail figure_detail_two_row">
                <a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone"
                   title="测试" class="figure_title figure_title_two_row bold">
                    0.1155
                </a>
            </div>
        </div>
        <%--<c:forEach var="dianying" items="${dianyingList}" varStatus="index">
        <div class="list_item">
            <a href="/${dianying.id}/detail.htm" class="figure"  title="${dianying.title}" >
                <img class="figure_pic" src="${dianying.localImg ==null?dianying.img:dianying.localImg}" alt="${dianying.title}">
                <div class="figure_caption">${dianying.tips}</div>
            </a>
            <div class="figure_detail figure_detail_two_row">
                <a href="/${dianying.id}/detail.htm"
                   title="${dianying.title}" class="figure_title figure_title_two_row bold">
                        ${dianying.title}
                </a>
            </div>
        </div>
        </c:forEach>--%>


        <div class="mod_pages" style="margin-left: 300px;" >
            <a href="/list-.htm" class="page_prev" _stat="pages_index:paging_prev">上一页</a>
            <span class="_items">

 <a href="/list-1.htm" class="page_num current">1</a>
                 <a href="/list-1.htm" class="page_num current">2</a>
                <a href="javascript:;" class="page_ellipsis">...</a>
			<a href="/list--20.htm" class="page_num" >20</a></span>
            <a href="/list-.htm" class="page_next" >下一页</a>
        </div>

        <!---- todo
        <div class="mod_pages" style="margin-left: 300px;" >
            <a href="/list-${type}-${subType}-${order}-${pre}.htm" class="page_prev" _stat="pages_index:paging_prev">上一页</a>
            <span class="_items">
                <c:forEach var="x" begin="1" end="9" step="1">
                    <c:choose>
                        <c:when test="${x ==current}">
                            <a href="/list-${type}-${subType}-${order}-${x}.htm" class="page_num current">${x}</a>
                        </c:when>
                        <c:otherwise>
                            <a href="/list-${type}-${subType}-${order}-${x}.htm" class="page_num">${x}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>


                <a href="javascript:;" class="page_ellipsis">...</a>
			<a href="/list-${type}-${subType}-${order}-20.htm" class="page_num" >20</a></span>
            <a href="/list-${type}-${subType}-${order}-${next}.htm" class="page_next" >下一页</a>
        </div>-->
    </div>

</div>
</div>

</body>

</html>