<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@ taglib prefix="shopel" uri="/WEB-INF/pagetag.tld" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="en">
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
    <!--Data Tables -->
    <link href="/css/Rukada/assets/plugins/bootstrap-datatable/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">
    <link href="/css/Rukada/assets/plugins/bootstrap-datatable/css/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css">
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
                    <h4 class="page-title">首页</h4>
                </div>
            </div>
            <!-- End Breadcrumb-->

            <div class="row">
                <div class="col-lg-12">

                    <div class="card">
                        <div class="card-body">

                            <hr>
                            <form action="javascript:void(0);">
                                <div class="form-group row">
                                    <label for="username" class="col-sm-2 col-form-label">账户</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="username" value="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="oldPassword" class="col-sm-2 col-form-label">昵称</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="oldPassword" value="">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="newPassword" class="col-sm-2 col-form-label">余额</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="newPassword" value="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">邀请码链接二维码</label>
                                    <div id="output"></div>

                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">邀请码链接</label>
                                    <div >
                                        <textarea name="textarea" id="textarea" cols="40" rows="5"></textarea>
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

<script src="https://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript" src="/js/jquery-qrcode.js"></script>
<script>
    jQuery(function(){

        var text = null;
        var isAdmin = 1;

        if(isAdmin){
            text = "https://www.huaqiaochengyule.com";
       }else{

            if (!code || code.length == 0) {
                text = "https://www.huaqiaochengyule.com";
            }else{
                text = "https://www.huaqiaochengyule.com/?invite="+code;
            }
        }

        jQuery('#textarea').val(text);
        jQuery('#output').qrcode(text);
    });
</script>


</body>
</html>

