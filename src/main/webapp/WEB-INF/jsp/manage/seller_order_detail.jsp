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

    <jsp:include page="../caidan.jsp"></jsp:include>
    <!--End topbar header-->
    <div class="clearfix"></div>

    <div class="content-wrapper" style="margin-left: 120px;">
        <div class="container-fluid" style="width: 65%;">
            <!-- Breadcrumb-->
            <div class="row pt-2 pb-2">
                <div class="col-sm-9">
                    <h4 class="page-title"><a href="/order/todoOrderManage.htm">返回列表页</a> 》订单详情</h4>
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

                                        <c:if test="${orderVO.status ==1 && orderVO.mode ==0}">
                                            买家未支付
                                        </c:if>
                                        <c:if test="${orderVO.status ==2 && orderVO.mode ==0}">
                                            买家已支付，待您发货
                                        </c:if>
                                        <c:if test="${orderVO.status ==3 && orderVO.mode ==0}">
                                            已发货，待买家收货
                                        </c:if>
                                        <c:if test="${orderVO.status ==5 && orderVO.mode ==0}">
                                            买家要求退款
                                        </c:if>
                                        <c:if test="${orderVO.status ==9 && orderVO.mode ==0}">
                                            卖家已退款
                                        </c:if>

                                        <c:if test="${orderVO.status ==1 && orderVO.mode ==1}">
                                            买家未发货
                                        </c:if>
                                        <c:if test="${orderVO.status ==2 && orderVO.mode ==1}">
                                            买家已发货，待您付款
                                        </c:if>
                                        <c:if test="${orderVO.status ==3 && orderVO.mode ==1}">
                                            已付款，待买家确认收款
                                        </c:if>
                                        <c:if test="${orderVO.status ==5 && orderVO.mode ==1}">
                                            买家要求退货
                                        </c:if>
                                        <c:if test="${orderVO.status ==9 && orderVO.mode ==1}">
                                            卖家已退货
                                        </c:if>

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
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="ronin" class="col-sm-2 col-form-label" style="color: red">买家ronin钱包</label>
                                    <div class="col-sm-10">
                                        <input type="text" disabled class="form-control" id="ronin" placeholder="如：ronin:5xxxxxx6bc2d9c7f0bf6731556071281bf75xxxb" value="${orderVO.buyerRonin}">

                                        <c:if test="${orderVO.status ==2 && orderVO.mode ==0}">
                                            <button type="button" style="margin-top: 5px;font-size: 12px;color: red" id="sendGoods">
                                                    复制买家钱包 - 去ronin发货
                                            </button>
                                        </c:if>

                                        <c:if test="${orderVO.status ==5 && orderVO.mode ==0}">
                                            <button type="button" style="margin-top: 5px;font-size: 12px;color: red" id="refund">
                                                复制买家钱包 - 去ronin退款
                                            </button>
                                        </c:if>

                                        <c:if test="${orderVO.status ==2 && orderVO.mode ==1}">
                                            <button type="button" style="margin-top: 5px;font-size: 12px;color: red" id="sendGoods1">
                                                复制买家钱包 - 去ronin付款
                                            </button>
                                        </c:if>

                                        <c:if test="${orderVO.status ==5 && orderVO.mode ==1}">
                                            <button type="button" style="margin-top: 5px;font-size: 12px;color: red" id="refund1">
                                                复制买家钱包 - 去ronin退货
                                            </button>
                                        </c:if>
                                    </div>
                                </div>

                                <!--已支付展示-->
                                <c:if test="${orderVO.status ==2  && orderVO.mode ==0}">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label"></label>
                                        <div class="col-sm-10">
                                            <button type="button" class="btn btn-dark shadow-dark px-5"
                                                    onclick="void(0);" id = "hasSendButton">您发货完成后，点击确认已发货</button>
                                        </div>
                                    </div>
                                </c:if>

                                <c:if test="${orderVO.status ==5  && orderVO.mode ==0}">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label"></label>
                                        <div class="col-sm-10">
                                            <button type="button" class="btn btn-dark shadow-dark px-5"
                                                    onclick="void(0);" id = "refundButton">您退款完成后，点击确认已退款</button>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">不同意退款理由</label>
                                        <div class="col-sm-10">

                                           <%-- <input type="text" class="form-control" id="refuse" placeholder="如果不同意退款，写入80字以内理由，并点击拒绝退款">   --%>
                                            <textarea rows="3" cols="20" class="form-control" id="refuseReason" placeholder="如果不同意退款，写入80字以内理由，并点击拒绝退款"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label"></label>
                                        <div class="col-sm-10">
                                            <button type="button" class="btn btn-dark shadow-dark px-5"
                                                    onclick="void(0);" id = "refuseButton">拒绝退款</button>
                                        </div>
                                    </div>
                                </c:if>


                                <c:if test="${orderVO.status ==2  && orderVO.mode ==1}">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label"></label>
                                        <div class="col-sm-10">
                                            <button type="button" class="btn btn-dark shadow-dark px-5"
                                                    onclick="void(0);" id = "hasSendButton1">您付完款后，点击确认已付款</button>
                                        </div>
                                    </div>
                                </c:if>

                                <c:if test="${orderVO.status ==5  && orderVO.mode ==1}">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label"></label>
                                        <div class="col-sm-10">
                                            <button type="button" class="btn btn-dark shadow-dark px-5"
                                                    onclick="void(0);" id = "refundButton1">您退货完成后，点击确认已退货</button>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">不同意退货理由</label>
                                        <div class="col-sm-10">

                                                <%-- <input type="text" class="form-control" id="refuse" placeholder="如果不同意退款，写入80字以内理由，并点击拒绝退款">   --%>
                                            <textarea rows="3" cols="20" class="form-control" id="refuseReason" placeholder="如果不同意退货，写入80字以内理由，并点击拒绝退货"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label"></label>
                                        <div class="col-sm-10">
                                            <button type="button" class="btn btn-dark shadow-dark px-5"
                                                    onclick="void(0);" id = "refuseButton1">拒绝退货</button>
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
                Copyright © Axie 游戏市场
            </div>
        </div>
    </footer>
    <!--End footer-->

</div><!--End wrapper-->

</body>

<script src="/js/jquery.min.js"></script>

<script >

    $("#hasSendButton,#hasSendButton1").click(function(){
        //校验参数

        var orderId = $("#orderId").val();

        //发起post

        $.ajax({
            type: "POST",
            url: "/order/hasSendGood.htm",
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


    $("#refuseButton,#refuseButton1").click(function(){
        //校验参数

        var orderId = $("#orderId").val();
        var refuseReason = $("#refuseReason").val();
        //发起post

        $.ajax({
            type: "POST",
            url: "/order/refuseRefund.htm",
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
                refuseReason:refuseReason
            };
            return json;
        }
    });


    $("#refundButton,#refundButton1").click(function(){
        //校验参数

        var orderId = $("#orderId").val();

        //发起post

        $.ajax({
            type: "POST",
            url: "/order/hasRefund.htm",
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
    $("#sendGoods,#sendGoods1").on('click',function(){
        var ronin = $("#ronin").val();
//        var text='复制的文字';
        var flag = copyText(ronin);
        alert(flag ? "复制卖家RONIN钱包成功，请去ronin交易！" : "复制卖家RONIN钱包失败,请手工复制后去ronin交易！");
    });

    $("#refund,#refund1").on('click',function(){
        var ronin = $("#ronin").val();
//        var text='复制的文字';
        var flag = copyText(ronin);
        alert(flag ? "复制卖家RONIN钱包成功，请去ronin退款！" : "复制卖家RONIN钱包失败,请手工复制后去ronin退款！");
    });


</script>
</html>
