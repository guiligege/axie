
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no">
    <title>播放器例子-封面</title>
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
        .stui-pannel-bd{
            font-size: 13px;
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
        .bofangqi {
            width: 70%;
            margin-left: 215px;
            margin-top: 15px;
        }

        .stui-pannel-bg {
            background-color: #FFFFFF;
            box-shadow: 0 1px 2px rgba(0,0,0,.05);
        }
        .stui-pannel-bg {
            border-radius: 2px;
        }
        .stui-pannel {
            position: relative;
            margin-bottom: 20px;
        }
        .stui-pannel-box {
            padding: 0px;
        }
        .stui-pannel_hd {
            padding: 10px;
        }
        .stui-pannel__head.active {
            height: 10px;
        }
        .stui-pannel__head {
            position: relative;
            height: 30px;
        }
        .text-muted {
            color: #999999;
        }
        .stui-pannel__head .more {
            line-height: 30px;
        }
        .pull-right {
            float: right !important;
        }
        .stui-pannel__head .title {
            float: left;
            margin: 0;
            padding-right: 10px;
            line-height: 24px;
        }
        .col-pd {
            position: relative;
            min-height: 1px;
            padding: 0px;
            margin-top: 20px;
            font-size: 13px;
            border-top: 1px solid #d2e4f7;
        }
        .stui-content__playlist {
            position: relative;
        }
        .stui-content__playlist li a:hover, .stui-content__playlist li.active a {
            border: 1px solid #FF9900;
            background-color: #FF9900;
            color: #FFFFFF;
        }

        .stui-content__playlist li {
            float: left;
            margin-bottom: 6px;
            margin-right: 6px;
        }
        .stui-content__playlist li a {
            border: 1px solid #EEEEEE;
        }

        .stui-content__playlist li a {
            border: 1px solid #EEEEEE;
            color: #333333;
            text-decoration: none;
        }
        .text-overflow a{
            color:black;
        }

        .stui-content__playlist li a:hover, .stui-content__playlist li.active a {
            border: 1px solid #FF9900;
            background-color: #FF9900;
            color: #FFFFFF;
        }

        .stui-content__playlist li a {
            display: inline-block;
            padding: 5px 20px;
            border-radius: 5px;
            text-decoration: none;
        }

        .stui-pannel_hd {
            padding: 10px;
        }
        .stui-pannel__head {
            position: relative;
            height: 30px;
        }
        .stui-pannel-bg {
            background-color: #FFFFFF;
            box-shadow: 0 1px 2px rgba(0,0,0,.05);
        }


        .stui-pannel-bg {
            border-radius: 2px;
        }
        .stui-pannel {
            position: relative;
            margin-bottom: 20px;
            margin-top: 115px;
        }
        .stui-pannel1 {
            position: relative;
            margin-bottom: 20px;
            margin-top: 35px;
        }
        .detail-content{
            font-size: 13px;
        }

        .col-md-6 {
            width: 12%;
            margin-right: 20px;
        }
        .col-md-1, .col-md-10, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-md-wide-1, .col-md-wide-10, .col-md-wide-15, .col-md-wide-2, .col-md-wide-25, .col-md-wide-3, .col-md-wide-35, .col-md-wide-4, .col-md-wide-45, .col-md-wide-5, .col-md-wide-55, .col-md-wide-6, .col-md-wide-65, .col-md-wide-7, .col-md-wide-75, .col-md-wide-8, .col-md-wide-85, .col-md-wide-9, .col-md-wide-95 {
            float: left;
        }
        .stui-vodlist__thumb {
            display: block;
            position: relative;
            padding-top: 150%;
            background: url(../img/load.gif) no-repeat;
            background-position: 50% 50%;
            background-size: cover;
        }
        a, button {
            text-decoration: none;
            outline: none;
            -webkit-tap-highlight-color: rgba(0,0,0,0);
        }

        .stui-vodlist__detail .title {
            font-size: 14px;
            margin-bottom: 0;
        }
        .text-overflow {
            width: 100%;
            overflow: hidden;
            text-overflow: ellipsis;
            -o-text-overflow: ellipsis;
            white-space: nowrap;
        }
        .stui-vodlist__detail .text {
            min-height: 19px;
            font-size: 12px;
            margin-bottom: 0;
            margin-top: 5px;
        }
        .text-overflow {
            width: 100%;
            overflow: hidden;
            text-overflow: ellipsis;
            -o-text-overflow: ellipsis;
            white-space: nowrap;
        }
        p {
            margin: 0 0 10px;
        }
        .text-muted {
            color: #999999;
        }
        .stui-vodlist__thumb .play {
            display: none;
            position: absolute;
            top: 0;
            z-index: 1;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.1) url(../img/play.png) center no-repeat;
        }
        .pic-text, .pic-title-b {
            background-repeat: no-repeat;
            background-image: linear-gradient(transparent,rgba(0,0,0,.5));
            color: #FFFFFF;
        }
        .pic-text {
            display: block;
            width: 100%;
            position: absolute;
            bottom: 0;
            left: 0;
            padding: 0px 0px;
            font-size: 12px;
            overflow: hidden;
            text-overflow: ellipsis;
            -o-text-overflow: ellipsis;
            white-space: nowrap;
        }
        .text-right {
            text-align: right;
        }

        .text-center {
            text-align: center;
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
        .stui-pannel-bd a{
            color: black;
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

    </style>
</head>
<header class="stui-header__top clearfix">
    <div class="container">
        <div class="row">
            <div class="stui-header_bd clearfix">
                <div class="stui-header__logo">
                    <a class="logo" href="/"></a>
                </div>
                <ul class="stui-header__menu type-slide">
                    <%--<li ><a href="/">首页</a></li>--%>
                    <li ><a href="/1/0/list.htm">电影</a></li>
                    <li ><a href="/2/0/list.htm">电视剧</a></li>
                    <li class="active"><a href="/3/0/list.htm">动漫</a></li>
                    <li ><a href="/4/0/list.htm">福利</a></li>
                    <%--<li class="visible-xs"><a href="/type/20.html">马圈</a></li>
                    <li><a href="/label/rank.html">排行</a></li>
                    <li><a href="/label/tuijian.html">推荐</a></li>
                    <li><a href="/map.html">最近更新</a></li>--%>
                </ul>
            </div>
        </div>
    </div>
</header>
<body>

<div class="mod_row_box">
    <div class="mod_bd _mod_listpage">
        <div class="stui-pannel-bd" style="font-size: 13px;color: black;">
            当前位置:<a href="/">首页</a> > <a href="/type/4.html">动漫</a> > <a href="/vod/50578.html">万界仙踪第2季</a> > <span   style="color: #FF9900">第01集在线观看</span>
        </div>
        <div id="dplayer" class="bofangqi"></div>
        <!--bofangqi-->

        <div class="stui-pannel_bd col-pd clearfix">
            <ul class="stui-content__playlist clearfix">
                <li class="active"><a href="/play/50578-1-1.html">第01集</a></li>
                <li><a href="/play/50578-1-2.html">第02集</a></li>
                <li><a href="/play/50578-1-3.html">第03集</a></li>
                <li><a href="/play/50578-1-4.html">第04集</a></li>
                <li><a href="/play/50578-1-5.html">第05集</a></li>
                <li><a href="/play/50578-1-6.html">第06集</a></li>
                <li><a href="/play/50578-1-7.html">第07集</a></li>
                <li><a href="/play/50578-1-8.html">第08集</a></li>
                <li><a href="/play/50578-1-9.html">第09集</a></li>
                <li><a href="/play/50578-1-10.html">第10集</a></li>
                <li><a href="/play/50578-1-11.html">第11集</a></li>
                <li><a href="/play/50578-1-12.html">第12集</a></li>
                <li><a href="/play/50578-1-13.html">第13集</a></li>
                <li><a href="/play/50578-1-14.html">第14集</a></li>
                <li><a href="/play/50578-1-15.html">第15集</a></li>
                <li><a href="/play/50578-1-16.html">第16集</a></li>
                <li><a href="/play/50578-1-17.html">第17集</a></li>
                <li><a href="/play/50578-1-18.html">第18集</a></li>
            </ul>
        </div>
        <!--剧集-->

        <div class="stui-pannel stui-pannel-bg clearfix">
            <div class="stui-pannel-box">
                <div class="stui-pannel_hd">
                    <div class="stui-pannel__head clearfix">
                        <h3 class="title">
                            剧情简介
                        </h3>
                    </div>
                </div>
                <div class="stui-pannel_bd">
                    <p class="col-pd detail">
                        <span class="detail-content" style="">家族大会之后，炎绝在逃亡路上被叶星云设局击毙，炎武一族实力骤减。玄冥世家蠢蠢欲动，绑架叶雪云想借机与青羽世家摊牌，却被叶星云安插在宁城的密探羽音发觉，最后叶星云亲自前往玄冥地牢，不但救出叶雪云，更在机缘巧合下寻到丢失多年的神物——玄鸟之羽。玄鸟之羽引起天地异象，绝世秘境通天古墓再次现世，各方势力集结宁城，最终谁将得到通天古墓中的绝世珍宝……</span>
                    </p>
                </div>
            </div>
        </div>
        <!--说明-->
        <div class="stui-pannel1 stui-pannel-bg clearfix">
            <div class="stui-pannel-box">
                <div class="stui-pannel_hd">
                    <div class="stui-pannel__head clearfix">
                        <h3 class="title">
                            猜你喜欢
                        </h3>
                    </div>
                </div>
            </div>
        </div>

        <div class="mod_figure mod_figure_v_default mod_figure_list_box">

            <div class="list_item">
                <a href="https://v.qq.com/x/cover/m441e3rjq9kwpsc.html" class="figure" target="scene=%E9%A2%91%E9%81%93%E9%A1%B5&amp;pagename=%E5%8A%A8%E6%BC%AB%E9%A2%91%E9%81%93&amp;columnname=%E6%9C%80%E7%83%AD_%E5%86%85%E5%9C%B0_%E5%88%97%E8%A1%A8%E9%A1%B5&amp;controlname=listpage&amp;cid=m441e3rjq9kwpsc&amp;vid=&amp;pid=&amp;datatype=1&amp;playertype=1&amp;controlidx=0&amp;columnidx=0&amp;plat_bucketid=9231004&amp;cmd=1" tabindex="-1" data-float="m441e3rjq9kwpsc" title="斗罗大陆" data-floatid="4">
                    <img class="figure_pic" src="//puui.qpic.cn/vcover_vt_pic/0/m441e3rjq9kwpsc1531129675/220" alt="斗罗大陆" onerror="picerr(this,'v')">

                    <div class="figure_caption">更新至56集</div>
                </a>
                <div class="figure_detail figure_detail_two_row">
                    <a href="https://v.qq.com/x/cover/m441e3rjq9kwpsc.html" target="scene=%E9%A2%91%E9%81%93%E9%A1%B5&amp;pagename=%E5%8A%A8%E6%BC%AB%E9%A2%91%E9%81%93&amp;columnname=%E6%9C%80%E7%83%AD_%E5%86%85%E5%9C%B0_%E5%88%97%E8%A1%A8%E9%A1%B5&amp;controlname=listpage&amp;cid=m441e3rjq9kwpsc&amp;vid=&amp;pid=&amp;datatype=1&amp;playertype=1&amp;controlidx=0&amp;columnidx=0&amp;plat_bucketid=9231004" title="斗罗大陆" class="figure_title figure_title_two_row bold">斗罗大陆</a>

                    <div class="figure_desc" title="此生不悔入唐门">此生不悔入唐门</div>

                </div>

            </div>

            <div class="list_item">
                <a href="https://v.qq.com/x/cover/ei44lqqq0fsg5aq.html" class="figure" target="scene=%E9%A2%91%E9%81%93%E9%A1%B5&amp;pagename=%E5%8A%A8%E6%BC%AB%E9%A2%91%E9%81%93&amp;columnname=%E6%9C%80%E7%83%AD_%E5%86%85%E5%9C%B0_%E5%88%97%E8%A1%A8%E9%A1%B5&amp;controlname=listpage&amp;cid=ei44lqqq0fsg5aq&amp;vid=&amp;pid=&amp;datatype=1&amp;playertype=1&amp;controlidx=1&amp;columnidx=0&amp;plat_bucketid=9231004" tabindex="-1" data-float="ei44lqqq0fsg5aq" title="雄兵连之诸天降临" data-floatid="3">
                    <img class="figure_pic" src="//puui.qpic.cn/vcover_vt_pic/0/ei44lqqq0fsg5aq1547432177/220" alt="雄兵连之诸天降临" onerror="picerr(this,'v')">

                    <div class="figure_caption">更新至22集</div>

                </a>
                <div class="figure_detail figure_detail_two_row">
                    <a href="https://v.qq.com/x/cover/ei44lqqq0fsg5aq.html" target="scene=%E9%A2%91%E9%81%93%E9%A1%B5&amp;pagename=%E5%8A%A8%E6%BC%AB%E9%A2%91%E9%81%93&amp;columnname=%E6%9C%80%E7%83%AD_%E5%86%85%E5%9C%B0_%E5%88%97%E8%A1%A8%E9%A1%B5&amp;controlname=listpage&amp;cid=ei44lqqq0fsg5aq&amp;vid=&amp;pid=&amp;datatype=1&amp;playertype=1&amp;controlidx=1&amp;columnidx=0&amp;plat_bucketid=9231004" title="雄兵连之诸天降临" class="figure_title figure_title_two_row bold">雄兵连之诸天降临</a>

                    <div class="figure_desc" title="抗击外星入侵">抗击外星入侵</div>

                </div>

            </div>

            <div class="list_item">
                <a href="https://v.qq.com/x/cover/y0jueuihog64xhb.html" class="figure" target="scene=%E9%A2%91%E9%81%93%E9%A1%B5&amp;pagename=%E5%8A%A8%E6%BC%AB%E9%A2%91%E9%81%93&amp;columnname=%E6%9C%80%E7%83%AD_%E5%86%85%E5%9C%B0_%E5%88%97%E8%A1%A8%E9%A1%B5&amp;controlname=listpage&amp;cid=y0jueuihog64xhb&amp;vid=&amp;pid=&amp;datatype=1&amp;playertype=1&amp;controlidx=2&amp;columnidx=0&amp;plat_bucketid=9231004" tabindex="-1" data-float="y0jueuihog64xhb" title="万界神主" data-floatid="2">
                    <img class="figure_pic" src="//puui.qpic.cn/vcover_vt_pic/0/y0jueuihog64xhb1545968657/220" alt="万界神主" onerror="picerr(this,'v')">

                    <div class="figure_caption">更新至41集</div>

                </a>
                <div class="figure_detail figure_detail_two_row">
                    <a href="https://v.qq.com/x/cover/y0jueuihog64xhb.html" target="scene=%E9%A2%91%E9%81%93%E9%A1%B5&amp;pagename=%E5%8A%A8%E6%BC%AB%E9%A2%91%E9%81%93&amp;columnname=%E6%9C%80%E7%83%AD_%E5%86%85%E5%9C%B0_%E5%88%97%E8%A1%A8%E9%A1%B5&amp;controlname=listpage&amp;cid=y0jueuihog64xhb&amp;vid=&amp;pid=&amp;datatype=1&amp;playertype=1&amp;controlidx=2&amp;columnidx=0&amp;plat_bucketid=9231004" title="万界神主" class="figure_title figure_title_two_row bold">万界神主</a>

                    <div class="figure_desc" title="陨落古神，遨游苍蓝">陨落古神，遨游苍蓝</div>

                </div>

            </div>

            <div class="list_item">
                <a href="https://v.qq.com/x/cover/y0jueuihog64xhb.html" class="figure" target="scene=%E9%A2%91%E9%81%93%E9%A1%B5&amp;pagename=%E5%8A%A8%E6%BC%AB%E9%A2%91%E9%81%93&amp;columnname=%E6%9C%80%E7%83%AD_%E5%86%85%E5%9C%B0_%E5%88%97%E8%A1%A8%E9%A1%B5&amp;controlname=listpage&amp;cid=y0jueuihog64xhb&amp;vid=&amp;pid=&amp;datatype=1&amp;playertype=1&amp;controlidx=2&amp;columnidx=0&amp;plat_bucketid=9231004" tabindex="-1" data-float="y0jueuihog64xhb" title="万界神主" data-floatid="2">
                    <img class="figure_pic" src="//puui.qpic.cn/vcover_vt_pic/0/y0jueuihog64xhb1545968657/220" alt="万界神主" onerror="picerr(this,'v')">

                    <div class="figure_caption">更新至41集</div>

                </a>
                <div class="figure_detail figure_detail_two_row">
                    <a href="https://v.qq.com/x/cover/y0jueuihog64xhb.html" target="scene=%E9%A2%91%E9%81%93%E9%A1%B5&amp;pagename=%E5%8A%A8%E6%BC%AB%E9%A2%91%E9%81%93&amp;columnname=%E6%9C%80%E7%83%AD_%E5%86%85%E5%9C%B0_%E5%88%97%E8%A1%A8%E9%A1%B5&amp;controlname=listpage&amp;cid=y0jueuihog64xhb&amp;vid=&amp;pid=&amp;datatype=1&amp;playertype=1&amp;controlidx=2&amp;columnidx=0&amp;plat_bucketid=9231004" title="万界神主" class="figure_title figure_title_two_row bold">万界神主</a>

                    <div class="figure_desc" title="陨落古神，遨游苍蓝">陨落古神，遨游苍蓝</div>

                </div>

            </div>

            <div class="list_item">
                <a href="https://v.qq.com/x/cover/y0jueuihog64xhb.html" class="figure" target="scene=%E9%A2%91%E9%81%93%E9%A1%B5&amp;pagename=%E5%8A%A8%E6%BC%AB%E9%A2%91%E9%81%93&amp;columnname=%E6%9C%80%E7%83%AD_%E5%86%85%E5%9C%B0_%E5%88%97%E8%A1%A8%E9%A1%B5&amp;controlname=listpage&amp;cid=y0jueuihog64xhb&amp;vid=&amp;pid=&amp;datatype=1&amp;playertype=1&amp;controlidx=2&amp;columnidx=0&amp;plat_bucketid=9231004" tabindex="-1" data-float="y0jueuihog64xhb" title="万界神主" data-floatid="2">
                    <img class="figure_pic" src="//puui.qpic.cn/vcover_vt_pic/0/y0jueuihog64xhb1545968657/220" alt="万界神主" onerror="picerr(this,'v')">

                    <div class="figure_caption">更新至41集</div>

                </a>
                <div class="figure_detail figure_detail_two_row">
                    <a href="https://v.qq.com/x/cover/y0jueuihog64xhb.html" target="scene=%E9%A2%91%E9%81%93%E9%A1%B5&amp;pagename=%E5%8A%A8%E6%BC%AB%E9%A2%91%E9%81%93&amp;columnname=%E6%9C%80%E7%83%AD_%E5%86%85%E5%9C%B0_%E5%88%97%E8%A1%A8%E9%A1%B5&amp;controlname=listpage&amp;cid=y0jueuihog64xhb&amp;vid=&amp;pid=&amp;datatype=1&amp;playertype=1&amp;controlidx=2&amp;columnidx=0&amp;plat_bucketid=9231004" title="万界神主" class="figure_title figure_title_two_row bold">万界神主</a>

                    <div class="figure_desc" title="陨落古神，遨游苍蓝">陨落古神，遨游苍蓝</div>

                </div>

            </div>
        </div>
    </div>
    <!--推荐-->

    <div class="stui-foot clearfix">
        <div class="col-pd text-center hidden-xs">若本站收录的资源侵犯了您的权益，请发邮件至：jiaosmcom@hotmail.com，我们会及时删除侵权内容！<br>Copyright © 2019 www.jiaosm520.com All Rights Reserved.</div>
    </div>

</div>
</div>



<script src="https://cdn.jsdelivr.net/npm/hls.js@latest"></script>
<script src="/js/DPlayer.min.js"></script>

<!--baidu-->
<script>
    const dp = new DPlayer({
        container: document.getElementById('dplayer'),
        video: {
            pic: 'http://vodplayerinfo-10005041.file.myqcloud.com/3035579109/vod_paster_pause/paster_pause1469013308.jpg',
            url: 'http://bili.meijuzuida.com/20190617/18182_10e198c4/index.m3u8',
//            url: 'https://www.img.haokanyuan.com/201804/26/BuVhMWIa/index.m3u8',
//            url: 'https://bili.meijuzuida.com/share/38350940d98a0cfddfa72b890eaa1fe0',
            type: 'hls'
        }
    });
</script>
<script>
    (function(){
        var bp = document.createElement('script');
        var curProtocol = window.location.protocol.split(':')[0];
        if (curProtocol === 'https') {
            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
        }
        else {
            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
        }
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(bp, s);
    })();
</script>


</body>
</html>