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
    <jsp:include page="caidan.jsp"></jsp:include>
    <!--End topbar header-->
    <div class="clearfix"></div>

    <div class="content-wrapper">
        <div class="container-fluid">
            <!-- Breadcrumb-->
            <div class="row pt-2 pb-2">
                <div class="col-sm-9">
                    <h4 class="page-title">提现</h4>
                </div>
            </div>
            <!-- End Breadcrumb-->

            <div class="row">
                <div class="col-lg-12">

                    <div class="card">
                        <div class="card-body">

                            <hr>
                            <form action="">
                                <%--<div class="form-group row">
                                    <label for="username" class="col-sm-2 col-form-label">当前余额</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" disabled id="money" placeholder="当前余额">
                                    </div>
                                </div>--%>
                                <div class="form-group row">
                                    <label for="username" class="col-sm-2 col-form-label">用户名</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control"  id="username" placeholder="输入用户名">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="changeMoney" class="col-sm-2 col-form-label">提现金额</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="changeMoney" placeholder="输入提现金额">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label"></label>
                                    <div class="col-sm-10">
                                        <button type="button" class="btn btn-dark shadow-dark px-5"  onclick="void(0);" id = "registerButton">提现</button>
                                    </div>
                                </div>
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

    $("#registerButton").click(function(){
        //校验参数

        var username = $("#username").val();
        var changeMoney = $("#changeMoney").val();

        if(username == ''){
            alert("用户名不能为空！");
            return;
        }

        if(changeMoney == ''){
            alert("提现不能为空！");
            return;
        }

        //发起post

        $.ajax({
            type: "POST",
            url: "/user/tixian.htm",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(GetJsonData()),
            dataType: "json",
            success: function (message) {

                if(message.code == 200){
                    window.location.href = "/admin/tosuccess.htm";
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
                loginId:username,
                tixian:changeMoney,
            };
            return json;
        }
    });

</script>
</html>
