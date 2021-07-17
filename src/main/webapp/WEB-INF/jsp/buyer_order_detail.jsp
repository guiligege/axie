<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@ taglib prefix="shopel" uri="/WEB-INF/pagetag.tld" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Axie 游戏市场</title>
    <!--favicon-->
    <link rel="icon" href="/css/Rukada/assets/images/favicon.ico" type="image/x-icon">
    <!-- simplebar CSS-->
    <link href="/css/Rukada/assets/plugins/simplebar/css/simplebar.css" rel="stylesheet"/>
    <!-- Bootstrap core CSS-->
    <link href="/css/Rukada/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- animate CSS-->
    <link href="/css/Rukada/assets/css/animate.css" rel="stylesheet" type="text/css"/>
    <!-- Icons CSS-->
    <link href="/css/Rukada/assets/css/icons.css" rel="stylesheet" type="text/css"/>
    <!-- Sidebar CSS-->
    <link href="/css/Rukada/assets/css/sidebar-menu.css" rel="stylesheet"/>
    <!-- Custom Style-->
    <link href="/css/Rukada/assets/css/app-style.css" rel="stylesheet"/>

</head>

<body>

<!-- Start wrapper-->
<div id="wrapper">

   <%-- <jsp:include page="caidan.jsp"></jsp:include>--%>
       <jsp:include page="new_header.jsp"></jsp:include>
    <!--End topbar header-->
    <div class="clearfix"></div>

    <div class="content-wrapper" style="margin-left: 120px;">
        <div class="container-fluid" style="width: 80%;">
            <!-- Breadcrumb-->
            <div class="row pt-2 pb-2">
                <div class="col-sm-9">
                    <h4 class="page-title"><a href="/order/buyerOrderManage.htm">返回列表页</a> 》订单详情</h4>
                </div>
            </div>
            <!-- End Breadcrumb-->

            <div class="row">
                <div class="col-lg-12">

                    <div class="card">
                        <div class="card-body">

                            <hr>
                            <form action="">

                                <input type="hidden" value="${orderVO.id}" id="orderId"/>

                                <c:if test="${productVO.type == 'AXIE' || productVO.type == 'LAND'}">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">商品图片</label>
                                        <div class="col-sm-10">
                                            <a href="/" class="detail_pic" target="_blank" itemprop="url">
                                                <img style="width: 196px;height: 164px;" class="figure_pic" src="https://storage.googleapis.com/assets.axieinfinity.com/axies/${productVO.outerId}/axie/axie-full-transparent.png" alt="测试测试" itemprop="image" _stat="info:poster">
                                            </a>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${productVO.type == 'AXIE' || productVO.type == 'LAND'}">
                                    <div class="form-group row">
                                        <label  class="col-sm-2 col-form-label">AXIE道具详情</label>
                                        <div class="col-sm-10">
                                            <a href="https://marketplace.axieinfinity.com/axie/${productVO.outerId}?referrer=axie.zone" target="_blank">去官方市场，查看详细数据</a>
                                        </div>
                                    </div>
                                </c:if>

                                <c:if test="${productVO.type == 'SLP'}">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">商品图片</label>
                                        <div class="col-sm-10">
                                            <a href="/" class="detail_pic" target="_blank" itemprop="url">
                                                <img style="width: 95px;" class="figure_pic" src="/img/love-potion.png" alt="测试测试" itemprop="image" _stat="info:poster">
                                            </a>
                                        </div>
                                    </div>
                                </c:if>

                                <c:if test="${productVO.type == 'AXS'}">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">商品图片</label>
                                        <div class="col-sm-10">
                                            <a href="/" class="detail_pic" target="_blank" itemprop="url">
                                                <img style="width: 95px;" class="figure_pic" src="/img/axs.png" alt="测试测试" itemprop="image" _stat="info:poster">
                                            </a>
                                        </div>
                                    </div>
                                </c:if>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">商品</label>
                                    <div class="col-sm-10">
                                        ${orderVO.productType}
                                    </div>
                                </div>



                                <c:if test="${orderVO.productType == 'AXIE' || orderVO.productType == 'LAND'}">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">AxieId</label>
                                        <div class="col-sm-10">
                                                ${productVO.outerId}
                                        </div>
                                    </div>
                                </c:if>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">买家昵称</label>
                                    <div class="col-sm-10">
                                        ${orderVO.buyerNick}
                                    </div>
                                </div>


                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">单价</label>
                                    <div class="col-sm-10">
                                        ${orderVO.singlePrice}
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">数量</label>
                                    <div class="col-sm-10">
                                        ${orderVO.buyCount}
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">总价</label>
                                    <div class="col-sm-10">
                                        ${orderVO.totalPrice}
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">订单状态</label>
                                    <div class="col-sm-10" style="color: red">

                                        <!-----买家买货逻辑start---->
                                        <c:if test="${orderVO.status ==1 && orderVO.mode ==0}">
                                            未支付
                                        </c:if>
                                        <c:if test="${orderVO.status ==2 && orderVO.mode ==0}">
                                            已支付，待卖家发货
                                        </c:if>
                                        <c:if test="${orderVO.status ==3 && orderVO.mode ==0}">
                                            已发货，待您确认收货
                                        </c:if>
                                        <c:if test="${orderVO.status ==5 && orderVO.mode ==0}">
                                            买家申请退款中
                                        </c:if>
                                        <c:if test="${orderVO.status ==9 && orderVO.mode ==0}">
                                            卖家已退款
                                        </c:if>
                                        <!-----买家买货逻辑end---->

                                        <!-----买家卖货逻辑start---->
                                        <c:if test="${orderVO.status ==1 && orderVO.mode ==1}">
                                            买家未发货
                                        </c:if>
                                        <c:if test="${orderVO.status ==2 && orderVO.mode ==1}">
                                            已发货，待卖家付款
                                        </c:if>
                                        <c:if test="${orderVO.status ==3 && orderVO.mode ==1}">
                                            卖家已付款，待您确认收款
                                        </c:if>
                                        <c:if test="${orderVO.status ==5 && orderVO.mode ==1}">
                                            买家申请退货中
                                        </c:if>
                                        <c:if test="${orderVO.status ==9 && orderVO.mode ==1}">
                                            卖家已退货
                                        </c:if>
                                        <!-----买家卖货逻辑end---->

                                        <c:if test="${orderVO.status ==10}">
                                            平台介入中
                                        </c:if>
                                        <c:if test="${orderVO.status ==6}">
                                            退款关闭，订单关闭
                                        </c:if>
                                        <c:if test="${orderVO.status ==7}">
                                            撤销订单
                                        </c:if>
                                        <c:if test="${orderVO.status ==8}">
                                            完结
                                        </c:if>
                                        <c:if test="${orderVO.status ==18}">
                                            待平台退款买家
                                        </c:if>

                                        <c:if test="${orderVO.status ==16 && orderVO.mode ==0}">
                                            由于交易系统延迟，卖家确认已发货，请耐心等待30分钟
                                        </c:if>
                                        <c:if test="${orderVO.status ==16 && orderVO.mode ==1}">
                                            由于交易系统延迟，卖家确认已付款，请耐心等待30分钟
                                        </c:if>

                                        <c:if test="${orderVO.status ==19}">
                                            关闭
                                        </c:if>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">卖家昵称</label>
                                    <div class="col-sm-10">
                                        ${orderVO.sellerNick}
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="ronin" class="col-sm-2 col-form-label" style="color: red">卖家ronin钱包</label>
                                    <div class="col-sm-10">
                                        <input type="text" disabled class="form-control" id="ronin" placeholder="如：ronin:5xxxxxx6bc2d9c7f0bf6731556071281bf75xxxb" value="${orderVO.buyerRonin}">

                                        <c:if test="${orderVO.status ==1  && orderVO.mode ==0}">
                                            <button type="button" style="margin-top: 5px;font-size: 12px;color: red"  id="topay">

                                                复制卖家钱包 - 去ronin付款
                                            </button>
                                        </c:if>
                                        <c:if test="${orderVO.status ==1  && orderVO.mode ==1}">
                                            <button type="button" style="margin-top: 5px;font-size: 12px;color: red"  id="topay">

                                                复制卖家钱包 - 去ronin发货
                                            </button>
                                        </c:if>

                                    </div>
                                </div>

                                <!--已支付展示-->

                                <!-----买家买货逻辑---->
                                <c:if test="${orderVO.status ==1  && orderVO.mode ==0}">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label"></label>
                                    <div class="col-sm-10">
                                        <button type="button" class="btn btn-dark shadow-dark px-5"
                                                onclick="void(0);" id = "hasPayButton">支付完成后 - 通知卖家已支付</button>

                                        <button type="button" class="btn btn-dark shadow-dark px-5"
                                                onclick="void(0);" id = "cancelButton">撤销订单</button>
                                    </div>
                                </div>
                                </c:if>

                                <c:if test="${orderVO.status ==2  && orderVO.mode ==0}">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label"></label>
                                        <div class="col-sm-10">
                                            <button type="button" class="btn btn-dark shadow-dark px-5"
                                                    onclick="void(0);" id = "refundButton">申请退款</button>
                                        </div>
                                    </div>
                                </c:if>

                                <c:if test="${orderVO.status ==3  && orderVO.mode ==0}">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label"></label>
                                        <div class="col-sm-10">
                                            <button type="button" class="btn btn-dark shadow-dark px-5"
                                                    onclick="void(0);" id = "receiveButton">确认收货</button>

                                            <button type="button" class="btn btn-dark shadow-dark px-5"
                                                    onclick="void(0);" id = "refundButton1">未收到货 - 申请退款</button>
                                        </div>
                                    </div>
                                </c:if>


                                <c:if test="${(orderVO.status ==5 || orderVO.status ==9 || orderVO.status ==16) && orderVO.mode ==0}">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label"></label>
                                        <div class="col-sm-10">
                                            <button type="button" class="btn btn-dark shadow-dark px-5"
                                                    onclick="void(0);" id = "receiveButton1">已收货 - 完结订单</button>

                                            <button type="button" class="btn btn-dark shadow-dark px-5"
                                                    onclick="void(0);" id = "hasRefundButton">已退款 - 关闭订单</button>

                                            <a  class="btn btn-dark shadow-dark px-5" href="/order/${orderVO.id}/record.htm" target="_blank">去协商</a>

                                            <button type="button" class="btn btn-dark shadow-dark px-5"
                                                    onclick="void(0);" id = "disputeButton">平台介入</button>


                                        </div>
                                    </div>
                                </c:if>


                                <c:if test="${(orderVO.status ==10 || orderVO.status ==18) && orderVO.mode ==0}">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label"></label>
                                        <div class="col-sm-10">
                                            <button type="button" class="btn btn-dark shadow-dark px-5"
                                                    onclick="void(0);" id = "receiveButton3">确认收货 - 完结订单</button>

                                            <button type="button" class="btn btn-dark shadow-dark px-5"
                                                    onclick="void(0);" id = "hasRefundButton1">已退款 - 关闭订单</button>

                                            <a  class="btn btn-dark shadow-dark px-5" href="/order/${orderVO.id}/record.htm" target="_blank">去协商</a>
                                        </div>
                                    </div>
                                </c:if>


                                <!-----买家买货逻辑end---->
                                <!-----买家卖货逻辑 start---->

                                <!-----买家卖货逻辑 end---->


                                <c:if test="${orderVO.status ==19 || orderVO.status ==7 || orderVO.status ==8}">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label"></label>
                                        <div class="col-sm-10">
                                            <a href="/order/${orderVO.id}/record.htm" target="_blank">查看协商历史</a>
                                        </div>
                                    </div>
                                </c:if>

                            </form>
                        </div>
                    </div>

                </div>
            </div><!--End Row-->

        </div>
        <!-- End container-fluid-->

    </div><!--End content-wrapper-->
    <!--Start Back To Top Button-->
    <a href="javaScript:void();" class="back-to-top"><i class="fa fa-angle-double-up"></i> </a>
    <!--End Back To Top Button-->

    <!--Start footer-->
    <footer class="footer">
        <div class="container">
            <div class="text-center">
                Copyright © 2021
            </div>
        </div>
    </footer>
    <!--End footer-->

</div><!--End wrapper-->

</body>

<script src="/js/jquery.min.js"></script>

<script >

    //支付完成后 - 通知卖家已支付
    $("#hasPayButton").click(function(){
        //校验参数
        var orderId = $("#orderId").val();

        //发起post
        $.ajax({
            type: "POST",
            url: "/order/hasPay.htm",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(GetJsonData()),
            dataType: "json",
            success: function (message) {

                if(message.code == 200){
                    window.location=location;
                }else{
                    alert(message.message);
                }
            },
            error: function (message) {
                $("#request-process-patent").html("提交数据失败！");
            }
        });

        function GetJsonData() {
            var json = {
                id:orderId,
            };
            return json;
        }
    });


    //撤销订单
    $("#cancelButton").click(function(){
        //校验参数

        var orderId = $("#orderId").val();
        //发起post

        $.ajax({
            type: "POST",
            url: "/order/cancelOrder.htm",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(GetJsonData()),
            dataType: "json",
            success: function (message) {

                if(message.code == 200){
                    window.location=location;
                }else{
                    alert(message.message);
                }
            },
            error: function (message) {
                $("#request-process-patent").html("提交数据失败！");
            }
        });

        function GetJsonData() {
            var json = {
                id:orderId,
            };
            return json;
        }
    });


    //申请退款
    $("#refundButton,#refundButton1").click(function(){
        //校验参数

        var orderId = $("#orderId").val();

        //发起post

        $.ajax({
            type: "POST",
            url: "/order/refund.htm",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(GetJsonData()),
            dataType: "json",
            success: function (message) {

                if(message.code == 200){
                    window.location=location;
                }else{
                    alert(message.message);
                }
            },
            error: function (message) {
                $("#request-process-patent").html("提交数据失败！");
            }
        });

        function GetJsonData() {
            var json = {
                id:orderId,
            };
            return json;
        }
    });


    //申请退款
    $("#receiveButton,#receiveButton1,#receiveButton3").click(function(){
        //校验参数

        var orderId = $("#orderId").val();

        //发起post

        $.ajax({
            type: "POST",
            url: "/order/hasRecivedGood.htm",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(GetJsonData()),
            dataType: "json",
            success: function (message) {

                if(message.code == 200){
                    window.location=location;
                }else{
                    alert(message.message);
                }
            },
            error: function (message) {
                $("#request-process-patent").html("提交数据失败！");
            }
        });

        function GetJsonData() {
            var json = {
                id:orderId,
            };
            return json;
        }
    });

    //已退款
    $("#hasRefundButton,#hasRefundButton1").click(function(){
        //校验参数

        var orderId = $("#orderId").val();

        //发起post

        $.ajax({
            type: "POST",
            url: "/order/buyerHasRefund.htm",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(GetJsonData()),
            dataType: "json",
            success: function (message) {

                if(message.code == 200){
                    window.location=location;
                }else{
                    alert(message.message);
                }
            },
            error: function (message) {
                $("#request-process-patent").html("提交数据失败！");
            }
        });

        function GetJsonData() {
            var json = {
                id:orderId,
            };
            return json;
        }
    });

    //已退款
    $("#disputeButton").click(function(){
        //校验参数
        var orderId = $("#orderId").val();
        //发起post
        $.ajax({
            type: "POST",
            url: "/order/dispute.htm",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(GetJsonData()),
            dataType: "json",
            success: function (message) {

                if(message.code == 200){
                    window.location=location;
                }else{
                    alert(message.message);
                }
            },
            error: function (message) {
                $("#request-process-patent").html("提交数据失败！");
            }
        });

        function GetJsonData() {
            var json = {
                id:orderId,
            };
            return json;
        }
    });

    //留言
    $("#recordButton").click(function(){
        //校验参数
        var orderId = $("#orderId").val();
        var record = $("#content").val();

        //发起post
        $.ajax({
            type: "POST",
            url: "/order/record.htm",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(GetJsonData()),
            dataType: "json",
            success: function (message) {

                if(message.code == 200){
                    window.location=location;
                }else{
                    alert(message.message);
                }
            },
            error: function (message) {
                $("#request-process-patent").html("提交数据失败！");
            }
        });

        function GetJsonData() {
            var json = {
                id:orderId,
                record:record
            };
            return json;
        }
    });


    function copyText(text) {
        var textarea = document.createElement("textarea");
        var currentFocus = document.activeElement;
        document.body.appendChild(textarea);
        textarea.value = text;
        textarea.focus();
        if (textarea.setSelectionRange)
            textarea.setSelectionRange(0, textarea.value.length);
        else
            textarea.select();
        try {
            var flag = document.execCommand("copy");
        } catch(eo){
            var flag = false;
        }
        document.body.removeChild(textarea);
        currentFocus.focus();
        return flag;
    }
    $("#topay").on('click',function(){
        var ronin = $("#ronin").val();
//        var text='复制的文字';
        var flag = copyText(ronin);
        alert(flag ? "复制卖家RONIN钱包成功，请去ronin交易！" : "复制卖家RONIN钱包失败,请手工复制后去ronin交易！");
    });


</script>
</html>
