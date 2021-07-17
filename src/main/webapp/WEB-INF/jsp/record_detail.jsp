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

    <!--Start sidebar-wrapper-->
    <%-- <jsp:include page="caidan.jsp"></jsp:include>--%>
    <!--End sidebar-wrapper-->

    <!--Start topbar header-->
    <jsp:include page="new_header.jsp"></jsp:include>

    <!--End topbar header-->
    <div class="clearfix"></div>

    <div class="content-wrapper" style="margin-left: 120px;">
        <div class="container-fluid" style="width: 65%;">
            <!-- Breadcrumb-->
            <div class="row pt-2 pb-2">
                <div class="col-sm-9">
                    <h4 class="page-title"><a href="" style="color: black;">返回订单列表</a>》<span style="color: coral;">协商历史</span></h4>
                </div>
            </div>
            <!-- End Breadcrumb-->

            <div class="row">
                <div class="col-lg-12">

                    <div class="card">
                        <div class="card-body">

                            <input type="hidden" value="${orderVO.id}" id="orderId">
                            <hr>
                            <form action="">

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

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">商品类型</label>
                                    <div class="col-sm-10">
                                        ${productVO.type}
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">订单状态</label>
                                    <div class="col-sm-10" style="color: red">

                                        <c:if test="${orderVO.status ==1}">
                                            未支付
                                        </c:if>
                                        <c:if test="${orderVO.status ==2}">
                                            已支付，待卖家发货
                                        </c:if>
                                        <c:if test="${orderVO.status ==3}">
                                            已发货，待您确认收货
                                        </c:if>
                                        <c:if test="${orderVO.status ==5}">
                                            买家申请退款中
                                        </c:if>
                                        <c:if test="${orderVO.status ==9}">
                                            卖家已退款
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
                                        <c:if test="${orderVO.status ==18}">
                                            待平台退款买家
                                        </c:if>
                                        <c:if test="${orderVO.status ==16}">
                                            由于交易系统延迟，卖家确认已发货，请耐心等待30分钟
                                        </c:if>

                                        <c:if test="${orderVO.status ==19}">
                                            关闭
                                        </c:if>
                                        <c:if test="${orderVO.status ==7}">
                                            撤销
                                        </c:if>
                                        <c:if test="${orderVO.status ==8}">
                                            完结
                                        </c:if>
                                    </div>
                                </div>

                                <hr />
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">留言历史</label>
                                </div>
                            <c:forEach var="action" items="${actionLogList}" varStatus="index">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">${action.role}</label>
                                    <div class="col-sm-10">
                                        <p>执行动作：${action.actionName}</p>
                                        <textarea rows="3" cols="60" disabled>留言内容：${action.content} - ${action.createTimeStr}</textarea>
                                    </div>
                                </div>
                            </c:forEach>


                        <c:if test="${orderVO.status !=1 && orderVO.status !=2 && orderVO.status !=3 && orderVO.status !=19 && orderVO.status !=7
                         && orderVO.status !=8}">
                                <hr />
                                <div class="form-group row">
                                    <label  class="col-sm-2 col-form-label">发表留言</label>
                                    <div class="col-sm-10">
                                        <textarea rows="3" cols="60"  placeholder="留言最多50字" id="recordtxt"></textarea>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label"></label>
                                    <div class="col-sm-10">
                                        <button type="button" class="btn btn-dark shadow-dark px-5"  onclick="void(0);" id = "recordButton">留言</button>
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

    //留言
    $("#recordButton").click(function(){
        //校验参数
        var orderId = $("#orderId").val();
        var record = $("#recordtxt").val();

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

</script>
</html>
