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
                    <h4 class="page-title">发布商品</h4>
                </div>
            </div>
            <!-- End Breadcrumb-->

            <div class="row">
                <div class="col-lg-12">

                    <div class="card">
                        <div class="card-body">

                            <hr>
                            <form action="">

                                <div class="form-group row">
                                    <label for="producttype" class="col-sm-2 col-form-label">商品类型</label>
                                    <div class="col-sm-10">
                                       <%-- <input type="text" class="form-control" id="username" placeholder="商品类型">--%>
                                        <select name="type" id="producttype" style="font-size: 12px;">
                                            <option value="SLP">SLP药水</option>
                                            <option value="AXS">AXS</option>
                                            <option value="AXIE">AXIE</option>
                                           <%-- <option value="LAND">LAND</option>--%>
                                        </select>
                                    </div>
                                </div>


                                <div class="form-group row">
                                    <label for="productMode" class="col-sm-2 col-form-label">买or卖</label>
                                    <div class="col-sm-10">
                                        <select name="subtype" id="productMode" style="font-size: 12px;">
                                            <option value="1">买</option>
                                            <option value="2" selected="selected">卖</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row" style="display: none" id="typeNode">
                                    <label for="productsubtype" class="col-sm-2 col-form-label">哪种Axie</label>
                                    <div class="col-sm-10">
                                        <select name="subtype" id="productsubtype" style="font-size: 12px;">
                                            <option value="1">FISH</option>
                                            <option value="2">Plant</option>
                                            <option value="3">BUG</option>
                                            <option value="4">Beast</option>
                                            <option value="5">Bird</option>
                                            <option value="6">Reptile</option>
                                            <option value="7">Mech</option>
                                            <option value="8">Dawn</option>
                                            <option value="9">Dusk</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row"  style="display: none"  id="iseggNode">
                                    <label for="isegg" class="col-sm-2 col-form-label">是否胚胎</label>
                                    <div class="col-sm-10">
                                        <select name="egg" id="isegg" style="font-size: 12px;">
                                            <option value="0" >否</option>
                                            <option value="1" >是</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row" style="display: none"  id="axieNode">
                                    <label for="axieId" class="col-sm-2 col-form-label">Axie的编号</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="axieId" placeholder="12345">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="showPrice" class="col-sm-2 col-form-label">官方单价（单位：weth）</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="showPrice" placeholder="0.00020000">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="singlePrice" class="col-sm-2 col-form-label">单价（单位：weth）</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="singlePrice" placeholder="0.00015000">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="totalCount" class="col-sm-2 col-form-label">商品总量</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="totalCount" placeholder="1">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="desc" class="col-sm-2 col-form-label">desc</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="desc" placeholder="xxxx">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label"></label>
                                    <div class="col-sm-10">
                                        <button type="button" class="btn btn-dark shadow-dark px-5"  onclick="void(0);" id = "registerButton">发布商品（发布后，需单独上架）</button>
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

    $('#producttype').change(function() {
        //一:
        console.log($(this).val());
        //二:
        var options=$("#producttype option:selected");
        console.log(options.val());
        if(options.val() == 'AXIE'){

            $('#typeNode').show();
            $('#iseggNode').show();
            $('#axieNode').show();
        }
        if(options.val() != 'AXIE'){

            $('#typeNode').hide();
            $('#iseggNode').hide();
            $('#axieNode').hide();
        }

        if(options.val() == 'LAND'){
            $('#axieNode').show();
        }
        if(options.val() != 'AXIE' && options.val() != 'LAND'){
            $('#axieNode').hide();
        }
    });


    $("#registerButton").click(function(){
        //校验参数

        var producttype = $("#producttype").val();

        var showPrice = $("#showPrice").val();
        var singlePrice = $("#singlePrice").val();
        var totalCount = $("#totalCount").val();
        var productMode = $("#productMode").val();
        var desc = $("#desc").val();

        var productsubtype = $("#productsubtype").val();
        var isegg = $("#isegg").val();

        var axieId = $("#axieId").val();

        if(producttype !='AXIE' ){
            productsubtype = 0;
            isegg = 0;
        }

        if(producttype !='AXIE' && producttype !='LAND'){
            axieId = "";
        }

        if(producttype =='AXIE' || producttype =='LAND'){
            if(axieId == ''){
                alert("axieId 不能为空！");
                return ;
            }
        }

        //格式校验

        var numpattern = /^[1-9]\d*$/;
        if(axieId != ''){
            if(!numpattern.test(axieId)){

                alert("axieId必须是小于100000000的整数");
                return ;
            }
        }

        if(numpattern.test(axieId)){
            if(parseInt(axieId)>100000000){
                alert("axieId必须是小于100000000的整数");
                return ;
            }
        }


        //浮点数
        var pattern = /[1-9]\d*.\d*|0.\d*[1-9]\d*/;
        if(!pattern.test(showPrice)){
            alert("官方单价格式不对！必须是小数");
            return ;
        }
        if(!pattern.test(singlePrice)){
            alert("单价格式不对！必须是小数");
            return ;
        }

        if(!numpattern.test(totalCount)){

            alert("官商品总量必须是小于10000000的整数");
            return ;
        }

        if(numpattern.test(totalCount)){
            if(parseInt(totalCount)>10000000){
                alert("官商品总量必须是小于10000000的整数");
                return ;
            }
        }

        if(desc != ''){
            if(desc.length>50){

                alert("描述最多50个字！");
                return ;
            }
        }


        //发起post

        $.ajax({
            type: "POST",
            url: "/product/add.htm",
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
                desc:desc,
                type:producttype,
                subType:parseInt(productsubtype),
                isEgg:parseInt(isegg),
                outerId:axieId,
                showPriceStr:showPrice,
                singlePriceStr:singlePrice,
                totalCount:parseInt(totalCount),
                productMode:parseInt(productMode)
            };
            return json;
        }
    });

</script>
</html>
