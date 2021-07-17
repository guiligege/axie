<%-- 剥离出来的头部 --%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="sidebar-wrapper" >
    <div class="brand-logo">
        <a href="/admin/index.htm">
            <%--<h5 class="logo-text">Axie游戏交易管理系统</h5>--%>
                <h5 class="logo-text">Axie游戏交易管理系统</h5>
        </a>
    </div>
    <ul class="sidebar-menu do-nicescrol">
        <li class="sidebar-header">功能菜单</li>
        <%--<li>
            <a href="/admin/index.htm" class="waves-effect">
                <span>个人中心</span>
            </a>
        </li>--%>

        <li>
            <span onclick="clicklishi1();" class="waves-effect" style="margin-left: 18px;margin-bottom: 10px;color: #7f9bcc; margin-top: 10px;">商品管理</span>

            <ul class="sidebar-submenu menu-open" id = "lishi1" style="display: block">
                <li><a href="/product/toAdd.htm" style="font-size: 12px;margin-left: 10px;">发布商品（买或卖）</a></li>
                <li><a href="/product/productManage.htm"  style="font-size: 12px;margin-left: 10px;">我的商品（上下架）</a></li>
            </ul>
        </li>
        <li>
            <span onclick="clicklishi2();" class="waves-effect" style="margin-left: 18px;margin-bottom: 10px;color: #7f9bcc; margin-top: 10px;">订单管理</span>

            <ul class="sidebar-submenu menu-open" id = "lishi2"  style="display: block">
                <li><a href="/order/orderManage.htm"  style="font-size: 12px;margin-left: 10px;">所有订单</a></li>
                <%--<li><a href="/order/todoOrderManage.htm"  style="font-size: 12px;margin-left: 10px;">待处理订单</a></li>--%>
                <li><a href="/order/disputeOrderManage.htm"  style="font-size: 12px;margin-left: 10px;">纠纷订单</a></li>
            </ul>
        </li>
        <li>
            <span onclick="clicklishi();" class="waves-effect" style="margin-left: 18px;margin-bottom: 10px;color: #7f9bcc; margin-top: 10px;">保证金</span>

            <ul class="sidebar-submenu menu-open" id = "lishi"  style="display: block">
                <li><a href="/to_chongzhi.htm"  style="font-size: 12px;margin-left: 10px;">充值</a></li>
                <li><a href="/to_tixian.htm"  style="font-size: 12px;margin-left: 10px;">提现</a></li>
            </ul>
        </li>
        <%--<li>
            <a href="/admin/toreset.htm" class="waves-effect">
                <span>分成情况</span>
            </a>
        </li>--%>
        <%--<li>
            <a href="/admin/toreset.htm" class="waves-effect">
                <span>修改密码</span>
            </a>
        </li>--%>
        <li>
            <a href="/admin/exist.htm" class="waves-effect">
                <span>退出</span>
            </a>
        </li>
    </ul>
</div>
<!--End sidebar-wrapper-->

<!--Start topbar header-->
<header class="topbar-nav">
    <nav class="navbar navbar-expand fixed-top bg-white">

    </nav>
</header>
<script>
    
    function clickbaobiao() {
        if($('#baobiao').css("display") != 'none') {
            $('#baobiao').hide();
        }else{
            $('#baobiao').show();
        }
    }
    function clicklishi() {
        if($('#lishi').css("display") != 'none') {
            $('#lishi').hide();
        }else{
            $('#lishi').show();
        }
    }

    function clicklishi1() {
        if($('#lishi1').css("display") != 'none') {
            $('#lishi1').hide();
        }else{
            $('#lishi1').show();
        }
    }
    function clicklishi2() {
        if($('#lishi2').css("display") != 'none') {
            $('#lishi2').hide();
        }else{
            $('#lishi2').show();
        }
    }

    function clickhuiyuan() {
        if($('#huiyuan').css("display") != 'none') {
            $('#huiyuan').hide();
        }else{
            $('#huiyuan').show();
        }
    }

    function clickhuiyuanlist() {
        if($('#huiyuanlist').css("display") != 'none') {
            $('#huiyuanlist').hide();
        }else{
            $('#huiyuanlist').show();
        }
    }

    function clickdaili() {
        if($('#daili').css("display") != 'none') {
            $('#daili').hide();
        }else{
            $('#daili').show();
        }
    }

</script>