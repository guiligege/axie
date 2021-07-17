
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="zh-CN" xml:lang="zh-CN" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>管理平台登录页</title>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="favicon.ico" />

    <link href="/css/base.css" rel="stylesheet" type="text/css" />
    <link href="/css/fontware4.3/font-awesome.min.css" rel="stylesheet"
          type="text/css" />
    <link href="/css/login.css" rel="stylesheet" type="text/css" />

</head>

<body class="login">
    <!-- BEGIN LOGO -->
<div class="logo">
    <h3 class="form-title color_white" style="font-size: 1.9em">管理平台</h3>
</div>

<!-- BEGIN LOGIN -->
<div class="content" style="margin-left: 500px;">
    <!-- BEGIN LOGIN FORM -->
   没有权限！

</div>

</body>
<script src="/js/jquery.min.js"></script>

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

        //发起post
        $.post("/admin/login.htm",{
                nickname:username,
                password:pwd,
            },
            function(data){
                alert("success!");
            });
    });

</script>

</html>
