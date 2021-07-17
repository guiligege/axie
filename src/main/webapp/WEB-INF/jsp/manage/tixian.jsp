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
    <title>Axie市场</title>
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
    <jsp:include page="../caidan.jsp"></jsp:include>
    <!--End sidebar-wrapper-->

    <!--Start topbar header-->
    <header class="topbar-nav">
        <nav class="navbar navbar-expand fixed-top bg-white">

        </nav>
    </header>
    <!--End topbar header-->
    <div class="clearfix"></div>

    <div class="content-wrapper">
        <div class="container-fluid" style="width: 80%;">
            <!-- Breadcrumb-->
            <div class="row pt-2 pb-2">
                <div class="col-sm-9">
                    <h4 class="page-title">提现保证金 - 推广期仅收取交易金额的1.5%的优惠费率（官方为<span style="color: red">4.75%</span>）</h4>
                </div>
            </div>
            <!-- End Breadcrumb-->

            <div class="row">
                <div class="col-lg-12">

                    <div class="card">
                        <div class="card-body">

                            <hr>
                            <form action="">

                                <c:if test="${!hasChongzhi}">
                                    <div class="form-group row" >
                                        <label  class="col-sm-2 col-form-label"></label>
                                        <div class="col-sm-10" style="color:red;">
                                            您还未充值保证金
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${!canWithdraw}">
                                    <div class="form-group row" >
                                        <label  class="col-sm-2 col-form-label"></label>
                                        <div class="col-sm-10" style="color:red;">
                                            您有未完成订单或未下架商品。请完结订单或下架后再提现。或已经正在提现。
                                        </div>
                                    </div>
                                </c:if>

                                <c:if test="${canWithdraw && hasChongzhi}">

                                    <div class="form-group row">
                                        <label  class="col-sm-2 col-form-label">提现说明：</label>
                                        <div class="col-sm-10">
                                            <p style="font-size: 12px;color: red;">1、为了防止卖家不发货，卖家需要交保证金。如果产生纠纷，卖家责任（未发货/货不对板等），将由保证金赔付；</p>
                                            <p style="font-size: 12px;color: red;">2、为保障买家权益，卖家需无未完结订单，可申请提现，平台会在24小时内处理。</p>
                                            <p style="font-size: 12px;color: red;">3、提现前需下架所有在售商品，提现后，将无法再售卖商品。</p>
                                            <p style="font-size: 12px;color: red;">4、提现保证金，会根据用户ronin原路退回。</p>
                                        </div>
                                    </div>



                                    <div class="form-group row" >
                                        <label  class="col-sm-2 col-form-label">您的保证金额度(单位 WETH)</label>
                                        <div class="col-sm-10">
                                            <input type="text" disabled class="form-control"  id="chongzhi" value="${chongzhiMoney}">
                                        </div>
                                    </div>

                                    <div class="form-group row" >
                                        <label for="myronin" class="col-sm-2 col-form-label" style="color: red">交易收费(单位 WETH)</label>
                                        <div class="col-sm-10">
                                            <input type="text" disabled class="form-control"  id="fee" value="${fee}">
                                        </div>
                                    </div>

                                    <div class="form-group row" >
                                        <label for="returnMoney" class="col-sm-2 col-form-label" style="color: red">预计提现额度(单位 WETH)</label>
                                        <div class="col-sm-10">
                                            <input type="text" disabled class="form-control"  id="returnMoney" value="${returnMoney}">
                                        </div>
                                    </div>

                                    <div class="form-group row" >
                                        <label for="myronin" class="col-sm-2 col-form-label" style="color: red">您的ronin钱包（用于退回保证金）</label>
                                        <div class="col-sm-10">
                                            <input type="text" disabled class="form-control"  id="myronin" value="${myronin}">
                                        </div>
                                    </div>

                                    <div class="form-group row" style="margin-top: 40px;">
                                        <label class="col-sm-2 col-form-label"></label>
                                        <div class="col-sm-10">
                                            <button type="button" class="btn btn-dark shadow-dark px-5"  onclick="void(0);" id = "registerButton">确认退回保证金（退回后将无法售卖商品）</button>
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
                Copyright © Axie市场
            </div>
        </div>
    </footer>
    <!--End footer-->

</div><!--End wrapper-->

</body>

<script src="/js/jquery.min.js"></script>

<script >


    $("#registerButton").click(function(){
        //校验参数

        var returnMoney = $("#returnMoney").val();
        var myronin = $("#myronin").val();
        var chongzhi = $("#chongzhi").val();
        //格式校验
        if(chongzhi == ''){
            alert("充值金额不能为空！");
            return;
        }

        if(chongzhi < 0.01){
            alert("充值金额不能小于0.01！");
            return;
        }
        if(myronin == ''){
            alert("ronin账号不能为空！");
            return;
        }

        //发起post
        $.ajax({
            type: "POST",
            url: "/tixian.htm",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(GetJsonData()),
            dataType: "json",
            success: function (message) {

                if(message.code == 200){
                    window.location.href = "/success.htm";
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
                earnestMoney:returnMoney,
                myronin:myronin,
            };
            return json;
        }
    });

</script>
</html>
