
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

        <!--简介-->
        .container_detail_top {
            z-index: 3;
            padding: 16px 0 20px;
            border-top: 1px solid #eee;
            border-bottom: 1px solid #eee;
            background: #f9f9f9;
        }
        .site_container {
            position: relative;
            width: 100%;
        }
        .mod_row_box .mod_bd, .mod_row_box .mod_hd, .mod_row_box_special, .site_container .container_inner {
            width: 1200px;
        }
        .site_container .container_inner {
            margin: 0 auto;
            transition: width .2s ease-in-out;
        }
        .mod_figure_detail {
            position: relative;
        }
        .mod_figure_detail .detail_pic {
            position: absolute;
            top: 0;
            left: 0;
            width: 392px;
            height: 328px;
            padding-top: 4px;
        }
        a:active, a:visited {
            outline: 0 none;
        }
        a {
            color: #111;
        }
        a {
            text-decoration: none;
            cursor: pointer;
        }
        .mod_figure_detail .detail_pic .figure_pic, .mod_figure_detail .detail_pic img {
            display: block;
            width: 100%;
            height: 100%;
        }
        .figure_pic, .figure_video {
            border-radius: 4px;
        }
        img {
            vertical-align: bottom;
        }
        fieldset, iframe, img {
            border: 0;
        }
        .mod_figure_detail .detail_video {
            position: relative;
            min-height: 520px;
            margin-left: 550px;
        }
        .mod_figure_detail .video_score {
            position: absolute;
            top: 0;
            right: 0;
        }
        .mod_figure_detail .video_score .score_v {
            width: 66px;
            height: 34px;
            color: #ff5c38;
            text-align: center;
        }
        .mod_figure_detail .video_score .score_v .score {
            margin-right: 5px;
            font-size: 24px;
            line-height: 34px;
        }
        .mod_figure_detail .video_score .score_v .f {
            font-size: 12px;
            line-height: 34px;
        }
        .mod_figure_detail .video_score .score_db {
            position: relative;
            width: 63px;
            height: 18px;
            border: 1px solid #2fa62f;
            border-radius: 10px;
            font-size: 0;
        }
        a:active, a:visited {
            outline: 0 none;
        }
        a {
            color: #111;
        }

        .mod_figure_detail .video_score .score_db .db {
            display: inline-block;
            width: 28px;
            border-radius: 9px 0 0 9px;
            background: #2fa62f;
            color: #fff;
            font-size: 12px;
            line-height: 18px;
            text-align: center;
            text-indent: 2px;
        }
        .mod_figure_detail .video_score .score_db .score {
            display: inline-block;
            width: 30px;
            color: #2fa62f;
            font-size: 12px;
            line-height: 18px;
            text-align: center;
        }
        .mod_figure_detail .video_title_collect {
            position: relative;
            margin-bottom: 1px;
        }
        .mod_figure_detail .video_title_cn {
            margin-right: 15px;
            color: #222;
            font-size: 28px;
            font-weight: 400;
            line-height: 34px;
        }

        .video_title_collect .title_en {
            padding-left: 8px;
            color: #666;
            font-size: 14px;
        }
        .video_title_collect .dot {
            display: inline-block;
            position: relative;
            top: -3px;
            width: 4px;
            height: 4px;
            margin: 0 6px;
            border-radius: 50%;
            background: #999;
        }
        b, cite, code, em, i, small, th {
            font-size: 1em;
            font-style: normal;
            font-weight: 500;
        }
        .video_title_collect .type {
            color: #999;
            font-size: 14px;
        }
        .mod_figure_detail .video_title_cn {
            font-weight: 400;
            line-height: 34px;
        }

        .mod_figure_detail .type_tit {
            color: #999;
        }
        .mod_figure_detail .type_txt {
            color: #666;
        }

        .mod_figure_detail .video_type_even .type_item {
            width: 383px;
        }
        .mod_figure_detail .type_item {
            padding-right: 3px;
            overflow: hidden;
            font-size: 14px;
            line-height: 30px;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        .mod_figure_detail .video_desc {
            position: relative;
            max-height: 80px;
            margin-bottom: 6px;
            overflow: hidden;
            font-size: 12px;
            line-height: 20px;
            text-align: justify;
        }

        .mod_figure_detail .video_btn {
            position: absolute;
            bottom: 0;
            left: 0;
            height: 40px;
        }
        .mod_figure_detail .btn_primary_md {
            min-width: 68px;
        }
        .mod_figure_detail .btn_primary {
            margin-right: 16px;
            padding: 0 25px;
            border-width: 2px;
            border-radius: 20px;
            font-size: 16px;
            line-height: 36px;
            text-align: center;
        }
        .btn_primary {
            background-color: #ff6428;
            color: #fff;
            display: inline-block;
            border: 1px solid #ff6428;
            cursor: pointer;
        }
        .mod_figure_detail .btn_primary .icon_sm {
            position: relative;
            top: 10px;
            width: 18px;
            height: 18px;
            margin-right: 4px;
            vertical-align: top;
        }
        .svg_icon {
            display: inline-block;
            pointer-events: none;
        }
        .mod_figure_detail .btn_primary {
            margin-right: 16px;
            padding: 0 25px;
            border-width: 2px;
            border-radius: 20px;
            font-size: 16px;
            line-height: 38px;
            line-height: 36px;
            text-align: center;
        }
        .btn_primary {
            background-color: #ff6428;
            color: #fff;
        }

        <!---detail ok-->

            .container_main {
                padding-top: 28px;
            }

        .wrapper {
            z-index: 1;
            position: relative;
            margin-bottom: 20px;
        }
        .wrapper_main {
            width: 820px;
            float: left;
            transition: width .2s ease-in-out;
        }
        .mod_row_episode {
            margin-bottom: 0;
        }
        .mod_bd, .mod_hd {
            position: relative;
        }
        .mod_episode {
            margin: 2px -8px 10px -7px;
            font-size: 0;
        }
        .mod_episode .item {
            display: inline-block;
            position: relative;
            font-size: 14px;
            letter-spacing: normal;
            text-align: center;
            vertical-align: top;
            cursor: pointer;
        }
        .mod_episode .item a {
            display: block;
            width: 39px;
            height: 39px;
            margin: 0 8px 15px 7px;
            overflow: hidden;
            border-radius: 20px;
            background-color: #ebebeb;
            color: #222;
            line-height: 39px;
            text-overflow: ellipsis;
        }
        .mod_row {
            margin-bottom: 20px;
        }
        .mod_bd, .mod_hd {
            position: relative;
        }
        .mod_title {
            zoom: 1;
            position: relative;
            margin-bottom: 18px;
            overflow: hidden;
            font-size: 0;
            white-space: nowrap;
        }
        .mod_title .title {
            color: #222;
            font-size: 30px;
            font-weight: 400;
        }
        .mod_title .title {
            zoom: 1;
            display: inline-block;
            max-width: 192px;
            margin-right: 10px;
            line-height: 1.2;
        }
        .mod_figures {
            margin-bottom: 20px;
            font-size: 0;
            letter-spacing: -5px;
        }
        .mod_row .mod_figure_h_default .figures_list, .mod_row .mod_figure_v_default .figures_list {
            white-space: normal;
        }

        .mod_figures .figures_list {
            margin: -10px;
        }
        .mod_figure_h_default .list_item {
            width: 191px;
        }
        .mod_figures .list_item {
            display: inline-block;
            position: relative;
            margin: 5px;
            padding: 5px 5px 5px 4px;
            color: #999;
            font-size: 12px;
            letter-spacing: normal;
            vertical-align: top;
        }

        .wrapper_side .mod_box {
            width: 340px;
            margin-bottom: 15px;
        }
        .mod_title {
            zoom: 1;
            position: relative;
            margin-bottom: 18px;
            overflow: hidden;
            font-size: 0;
            white-space: nowrap;
        }
        .mod_title .title {
            color: #222;
            font-size: 30px;
            font-weight: 400;
            zoom: 1;
            display: inline-block;
            max-width: 192px;
            margin-right: 10px;
            line-height: 1.2;
        }

        .mod_tools {
            position: absolute;
            top: 5px;
            right: 0;
            font-size: 14px;
        }
        .mod_tools a {
            color: #666;
        }
        .mod_hotlist .item_1, .mod_hotlist .item_3, .mod_hotlist .item_5, .mod_hotlist .item_7, .mod_hotlist .item_9 {
            background-color: #f5f5f5;
        }
        .mod_hotlist .item {
            display: block;
            position: relative;
            margin-bottom: 0;
            padding-left: 10px;
            line-height: 40px;
        }
        .mod_hotlist .item a {
            display: block;
        }
        .mod_hotlist .item_1 .num {
            background-color: #ff0d29;
        }
        .mod_hotlist .num {
            display: inline-block;
            width: 22px;
            height: 22px;
            margin: 10px 4px 0 0;
            border-radius: 2px;
            color: #fff;
            font-family: PingFangSC-Regular,Microsoft Yahei;
            line-height: 22px;
            text-align: center;
            vertical-align: top;
        }
        .mod_hotlist .name {
            display: inline-block;
            max-width: 16em;
            overflow: hidden;
            font-size: 14px;
            text-overflow: ellipsis;
            vertical-align: top;
            white-space: nowrap;
        }


        <!--tuijian-->
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
            width: 185px;
            height: 259px;
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
            margin-top: 100px;
        }
        .mod_row_box .mod_bd, .mod_row_box .mod_hd, .mod_row_box_special {
            width: 1200px;
            z-index: 2;
            position: relative;
            margin: 0 auto;
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
<body>

<jsp:include page="header.jsp"></jsp:include>

<div class="site_container container_detail_top" style="margin-top: 30px;">
    <div class="container_inner">
        <div class="mod_figure_detail mod_figure_detail_en cf">
            <a href="/" class="detail_pic" target="_blank" itemprop="url">
                <img class="figure_pic" src="https://storage.googleapis.com/assets.axieinfinity.com/axies/1232391/axie/axie-full-transparent.png" alt="测试测试" itemprop="image" _stat="info:poster">
            </a>
            <div class="detail_video" style="
    border-color: black;
    border-style: dotted;
    border: groove;
">

                <div class="video_title_collect cf">
                    <h1 class="video_title_cn">
                        <a target="_blank" _stat="info:title" href="http://v.qq.com/x/cover/m441e3rjq9kwpsc.html">关于Axie</a><span class="title_en" itemprop="alternateName"></span><i class="dot"></i><span class="type"></span>
                    </h1>
                </div>

                <div class="video_type cf">

                    <div class="type_item" style="margin-left: 50px;">
                        <span class="type_tit">商品id:</span>
                        <span class="type_txt">1214365</span>
                    </div>

                    <div class="type_item" style="margin-left: 50px;">
                        <span class="type_tit">类 别:</span>
                        <span class="type_txt">鱼</span>
                    </div>

                    <div class="type_item" style="margin-left: 50px;">
                        <span class="type_tit">数 量:</span>
                        <span class="type_txt">1</span>
                    </div>

                    <div class="type_item" style="margin-left: 50px;">
                        <span class="type_tit">价格:</span>
                        <span class="type_txt">0.12</span>
                    </div>

                    <div class="type_item" style="margin-left: 50px;">
                        <span class="type_tit">AXIE详情参数:</span>
                        <span class="type_txt"><a href="https://marketplace.axieinfinity.com/axie/1214365?referrer=axie.zone" target="_blank">点击查看</a></span>
                    </div>


                </div>

                <div class="video_desc" style="margin-left: 50px;">
                    <span class="desc_tit">描述：</span>
                    <span class="desc_txt">
						<span class="txt _desc_txt_lineHight" itemprop="description">测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试</span>
					</span>
                </div>

                <hr />
                <div class="video_type cf">
                    <div class="type_item" style="margin-left: 20px;font-size: 12px;">
                        <span class="type_tit" style="color: red">
                            特别说明：1、为了防止卖家不发货，卖家需上缴保证金。产生纠纷由保证金账户垫付。) </span>
                    </div>
                    <div class="type_item" style="margin-left: 20px;font-size: 12px;">
                        <span class="type_txt" style="color: red"> 3、下单付款后，需确认已支付，卖家发货后，会点击确认发货，如果30分钟对方未响应，可以发起纠纷。平台24小时内会处理。</span>
                    </div>
                    <div class="type_item" style="margin-left: 20px;font-size: 12px;">
                        <span class="type_txt" style="color: red"> 3、下单付款后，需确认已支付，卖家发货后，会点击确认发货，如果30分钟对方未响应，可以发起纠纷。平台24小时内会处理。</span>
                    </div>
                </div>
                <hr />

                <div class="video_type cf">
                    <div class="type_item" style="margin-left: 50px;margin-top: 20px;">
                        <span class="type_tit" style="color: red">购买数量:</span>
                        <span class="type_txt">1</span>
                    </div>
                </div>

                <!-- playsrc from outer -->
                <div class="_playsrc">

                    <div class="video_btn" data-name="qq" _current="qq">

                        <a href="/" class="btn_primary btn_primary_md " target="_blank" _stat="info:playbtn">
                            <span class="icon_text">立即下单</span>
                        </a>
                    </div>

                </div>

            </div>
        </div>
    </div>
</div>


</body>



</html>