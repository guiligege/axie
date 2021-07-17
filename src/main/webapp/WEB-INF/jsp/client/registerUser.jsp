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

    <jsp:include page="../new_header.jsp"></jsp:include>

    <div class="clearfix"></div>

    <div class="content-wrapper" style="margin-left: 120px;">
        <div class="container-fluid" style="width: 65%;">
            <!-- Breadcrumb-->
            <div class="row pt-2 pb-2">
                <div class="col-sm-9">
                    <h4 class="page-title">用户注册</h4>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">

                    <div class="card">
                        <div class="card-body">

                            <hr>
                            <form action="">
                                <div class="form-group row">
                                    <label for="ronin" class="col-sm-2 col-form-label">ronin钱包(登录名)</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="ronin" placeholder="如：ronin:5xxxxxx6bc2d9c7f0bf6731556071281bf75xxxb">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="nickname" class="col-sm-2 col-form-label">昵称</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="nickname" placeholder="输入昵称">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="email" class="col-sm-2 col-form-label">email</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="email" placeholder="输入您的有效邮箱">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="dailiCode" class="col-sm-2 col-form-label">邀请码</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="dailiCode" placeholder="输入邀请码（群里吼）">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="newPassword" class="col-sm-2 col-form-label">密码</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" id="newPassword" placeholder="输入密码">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="confirmPassword" class="col-sm-2 col-form-label">确认密码</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" id="confirmPassword" placeholder="确认密码">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label"></label>
                                    <div class="col-sm-10">
                                        <button type="button" class="btn btn-dark shadow-dark px-5"  onclick="void(0);" id = "registerButton">注册</button>
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
                Copyright © 2021
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
        var ronin = $("#ronin").val();
        var email = $("#email").val();
        var dailiCode = $("#dailiCode").val();

        var pwd = $("#newPassword").val();
        var nickname = $("#nickname").val();
        var confirmPassword = $("#confirmPassword").val();

        if(ronin == ''){
            alert("ronin钱包不能为空！");
            return;
        }

        if(email == ''){
            alert("邮箱不能为空！");
            return;
        }
        if(pwd == ''){
            alert("密码不能为空或小于6位！");
            return;
        }
        if(nickname == ''){
            alert("昵称不能为空！");
            return;
        }
        if(confirmPassword != pwd){
            alert("确认密码不一致！");
            return;
        }

        if(dailiCode == ''){
            alert("邀请码不能为空！");
            return;
        }

        var pattern = /^ronin:.*/;
        if(!pattern.test(ronin) || ronin.length != 46){
            alert("ronin钱包格式不对！");
            return;
        }

        //发起post

        $.ajax({
            type: "POST",
            url: "/user/register.htm",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(GetJsonData()),
            dataType: "json",
            success: function (message) {

                if(message.code == 200){
                    window.location.href = "/tologin.htm";
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
                ronin:ronin,
                email:email,
                dailiCode:dailiCode,
                password:pwd,
                nick:nickname,
            };
            return json;
        }
    });

</script>
</html>
