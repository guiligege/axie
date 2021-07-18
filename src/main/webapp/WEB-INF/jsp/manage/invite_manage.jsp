<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@ taglib prefix="shopel" uri="/WEB-INF/pagetag.tld" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Axie游戏交易平台 - 后台管理系统</title>
    <!--favicon-->
    <link rel="icon" href="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/images/favicon.ico" type="image/x-icon">
    <!-- simplebar CSS-->
    <link href="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/plugins/simplebar/css/simplebar.css" rel="stylesheet"/>
    <link href="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/plugins/bootstrap-datatable/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">
    <link href="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/plugins/bootstrap-datatable/css/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css">
    <link href="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/css/animate.css" rel="stylesheet" type="text/css"/>
    <link href="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/css/icons.css" rel="stylesheet" type="text/css"/>
    <link href="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/css/sidebar-menu.css" rel="stylesheet"/>
    <link href="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/css/app-style.css" rel="stylesheet"/>

</head>

<body>

<!-- Start wrapper-->
<div id="wrapper">

    <!--Start sidebar-wrapper-->
    <jsp:include page="../caidan.jsp"></jsp:include>

    <!--End topbar header-->

    <div class="clearfix"></div>

    <div class="content-wrapper">
        <div class="container-fluid">
            <!-- End Breadcrumb-->
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header"><i class="fa fa-table"></i>奖励流水（满0.02WETH 可提现）</div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <input type="hidden" id="totalFee" value="${totalFee}"/>
                                <table id="default-datatable" class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>订单id</th>
                                        <th>订单金额</th>
                                        <th>邀请人id</th>
                                        <th>买家昵称</th>
                                        <th>平台费用</th>
                                        <th>您的奖励</th>
                                        <th>状态</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                <c:forEach var="fee" items="${feeDetailsList}" varStatus="index">
                                    <tr>
                                        <td>${fee.orderId}</td>
                                        <td>${fee.totalPrice}</td>
                                        <td>${fee.invitationUserId}</td>
                                        <td>${fee.buyerNick}</td>
                                        <td>${fee.fee}</td>
                                        <td>${fee.userFee}</td>
                                        <td style="color: red">
                                            <c:if test="${fee.status ==0}">
                                                待提现
                                            </c:if>
                                            <c:if test="${order.status ==1}">
                                                已分成
                                            </c:if>
                                        </td>
                                        <td></td>
                                        </tr>
                                </c:forEach>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>总奖励:${totalFee}</td>
                                    <td></td>
                                    <td>
                                        <button type="button" onclick="void(0);" class="upButton" myAttr="${order.id}">提现奖励</button>
                                    </td>
                                </tr>
                                    </tbody>

                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- End Row-->

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
                Copyright © Axie游戏交易平台
            </div>
        </div>
    </footer>
    <!--End footer-->

</div><!--End wrapper-->


<!-- Bootstrap core JavaScript-->
<script src="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/js/jquery.min.js"></script>


<!--Data Tables js-->

<script>


    //上架
    $(".upButton").click(function(){
        //校验参数
        var totalFee = $("#totalFee").val();

        if(parseFloat(totalFee) < 0.02){
            alert("满0.02WETH 可提现");
            return;
        }

        //发起post
        $.ajax({
            type: "POST",
            url: "/inviteTixian.htm",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(GetJsonData()),
            dataType: "json",
            success: function (message) {

                if(message.code == 200){
                    location.reload();
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
                totalFee:totalFee
            };
            return json;
        }
    });

</script>
</body>
</html>

