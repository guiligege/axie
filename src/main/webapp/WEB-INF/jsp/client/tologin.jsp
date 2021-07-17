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
    <title>登录页</title>
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

    <jsp:include page="../new_header.jsp"></jsp:include>

    <div class="clearfix"></div>

    <div class="content-wrapper">
        <div class="container-fluid">

            <div class="row" style="margin-left: 200px;margin-top: 100px;">

                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-title">帐号登录</div>
                            <hr>
                            <form>
                                <div class="form-group">
                                    <label for="l-username">RONIN钱包(登录名)</label>
                                    <input type="text" class="form-control form-control-rounded input-shadow" id="l-username" placeholder="如：ronin:5xxxxxx6bc2d9c7f0bf6731556071281bf75xxxb">
                                </div>

                                <div class="form-group">
                                    <label for="l-password">密码</label>
                                    <input type="password" class="form-control form-control-rounded input-shadow" id="l-password" placeholder="输入密码">
                                </div>

                                <div class="form-group">
                                    <button type="button" onclick="void(0);" id="subButton" class="btn btn-dark btn-round shadow-dark px-5">登录</button>
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
                Copyright © 2021
            </div>
        </div>
    </footer>
    <!--End footer-->

</div><!--End wrapper-->

</body>

<script src="/js/jquery.min.js"></script>
<script charset="utf-8" src="/js/md5.js"></script>

<script >

    $("#subButton").click(function(){
        //校验参数

        var username = $("#l-username").val();
        var pwd = $("#l-password").val();

        if(username == ''){
            alert("用户名不能为空！");
            return;
        }

        if(pwd == ''){
            alert("密码不能为空！");
            return;
        }

        $.ajax({
            type: "POST",
            url: "/login/loginByPwd.htm",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(GetJsonData()),
            dataType: "json",
            success: function (message) {
                if(message.code == 200){
                    window.location.href = "/index.htm";
                }else{
                   alert("账号或密码错误！");
                }

            },
            error: function (message) {
                $("#request-process-patent").html("提交数据失败！");
            }
        });

        function GetJsonData() {
            var json = {
                ronin:username,
                password:pwd
            };
            return json;
        }
    });

</script>
</html>
