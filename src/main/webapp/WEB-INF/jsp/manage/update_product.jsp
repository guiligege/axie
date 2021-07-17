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
                    <h4 class="page-title">更新商品</h4>
                </div>
            </div>
            <!-- End Breadcrumb-->

            <div class="row">
                <div class="col-lg-12">

                    <div class="card">
                        <div class="card-body">

                            <hr>
                            <form action="">
                                <input value="${product.id}" id="productId" type="hidden" disabled />

                                <c:if test="${product.type =='AXIE'}">
                                    <div class="form-group row">
                                        <label for="isegg" class="col-sm-2 col-form-label">是否胚胎</label>
                                        <div class="col-sm-10">
                                            <select name="egg" id="isegg" style="font-size: 12px;">
                                                <c:if test="${product.isEgg ==0}">
                                                    <option value="0" selected="selected">否</option>
                                                    <option value="1">是</option>
                                                </c:if>
                                                <c:if test="${product.isEgg ==1}">
                                                    <option value="0" >否</option>
                                                    <option value="1" selected="selected">是</option>
                                                </c:if>
                                            </select>
                                        </div>
                                    </div>
                                </c:if>

                                <div class="form-group row">
                                    <label for="showPrice" class="col-sm-2 col-form-label">官方单价（单位：weth）</label>
                                    <div class="col-sm-10">
                                        <input type="text" value="${product.showPrice}" class="form-control" id="showPrice" placeholder="0.10012">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="singlePrice" class="col-sm-2 col-form-label">单价（单位：weth）</label>
                                    <div class="col-sm-10">
                                        <input type="text" value="${product.singlePrice}" class="form-control" id="singlePrice" placeholder="0.1">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="totalCount" class="col-sm-2 col-form-label">商品总量</label>
                                    <div class="col-sm-10">
                                        <input type="text" value="${product.totalCount}" class="form-control" id="totalCount" placeholder="1">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="lockCount" class="col-sm-2 col-form-label">冻结总量（交易中）</label>
                                    <div class="col-sm-10">
                                        <input type="text" value="${product.lockCount}" disabled class="form-control" id="lockCount" placeholder="1">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="desc" class="col-sm-2 col-form-label">desc</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="desc" value="${product.desc}"  placeholder="xxxx">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label"></label>
                                    <div class="col-sm-10">
                                        <button type="button" class="btn btn-dark shadow-dark px-5"  onclick="void(0);" id = "updateButton">更新商品（更新后为下架状态，需重新上架）</button>
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
                Copyright © Axie市场
            </div>
        </div>
    </footer>
    <!--End footer-->

</div><!--End wrapper-->

</body>

<script src="/js/jquery.min.js"></script>

<script >

    $("#updateButton").click(function(){

        //校验参数
        var productId = $("#productId").val();
        var isegg = $("#isegg").val();
        var showPrice = $("#showPrice").val();
        var singlePrice = $("#singlePrice").val();
        var totalCount = $("#totalCount").val();
        var desc = $("#desc").val();

        if(showPrice == ''){
            showPrice = singlePrice;
        }
        if(isegg == ''){
            isegg = 0;
        }

        //发起post

        $.ajax({
            type: "POST",
            url: "/product/update.htm",
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
                id:productId,
                isEgg:parseInt(isegg),
                showPriceStr:showPrice,
                singlePriceStr:singlePrice,
                totalCount:parseInt(totalCount),
                desc:desc,
            };
            return json;
        }
    });

</script>
</html>
