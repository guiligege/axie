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
                    <h4 class="page-title">卖家充值保证金（收保证金仅维护游戏交易双方权益，2天后无未完结订单可提现）</h4>
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
                                        <label  class="col-sm-2 col-form-label">保证金说明：</label>
                                        <div class="col-sm-10">
                                            <p style="font-size: 12px;color: red;">1、为了防止卖家不发货，卖家需要交保证金。如果产生纠纷，卖家责任（未发货/货不对板等），将由保证金赔付；</p>
                                            <p style="font-size: 12px;color: red;">2、收保证金仅维护游戏交易双方权益，2天后无未完结订单可申请提现，平台会在24小时内处理。</p>
                                            <p style="font-size: 12px;color: red;">3、卖家最大可售卖商品金额 == 卖家保证金。</p>
                                            <p style="font-size: 12px;color: red;">4、交保证金后，1个工作日内开通售卖服务。</p>
                                            <p style="font-size: 12px;color: red;">6、卖家发货后，买家需确认收货或申请退款。如果48小时内未确认收货或申请退款，默认确认收货。</p>
                                        </div>
                                    </div>


                                    <div class="form-group row" >
                                        <label for="weth" class="col-sm-2 col-form-label">保证金（单位WETH，通过ronin充值）</label>
                                        <div class="col-sm-10">
                                            <select name="subtype" id="weth" style="font-size: 16px;margin-top: 10px;width: 200px;">
                                                <option value="0.5" selected="selected">0.5 WETH</option>
                                                <option value="1">1 WETH</option>
                                                <option value="2">2 WETH</option>
                                                <option value="5">5 WETH</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group row" >
                                        <label for="myronin" class="col-sm-2 col-form-label" style="color: red">我的ronin钱包（用该钱包转账）</label>
                                        <div class="col-sm-10">
                                            <input type="text" disabled class="form-control"  id="myronin" value="${myronin}">
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="platformronin" class="col-sm-2 col-form-label" style="color: red">平台ronin钱包</label>
                                        <div class="col-sm-10">
                                            <input type="text" disabled class="form-control"  id="platformronin" value="${platformronin}">
                                            <button type="button" style="margin-top: 5px;font-size: 12px;color: red" id="sendGoods">
                                                复制平台钱包 - 去ronin转账
                                            </button>
                                        </div>
                                    </div>

                                    <div class="form-group row" style="margin-top: 40px;">
                                        <label class="col-sm-2 col-form-label"></label>
                                        <div class="col-sm-10">
                                            <button type="button" class="btn btn-dark shadow-dark px-5"  onclick="void(0);" id = "registerButton">确认已交保证金</button>
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


    $("#registerButton").click(function(){
        //校验参数

        var weth = $("#weth").val();
        var platformronin = $("#platformronin").val();
        //格式校验
        if(weth == ''){
            alert("充值金额不能为空！");
            return;
        }
        if(platformronin == ''){
            alert("平台ronin账号不能为空！");
            return;
        }

        //发起post

        $.ajax({
            type: "POST",
            url: "/chongzhi.htm",
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
                earnestMoney:weth,
                platformRonin:platformronin,
            };
            return json;
        }
    });


    function copyText(text) {
        var textarea = document.createElement("textarea");
        var currentFocus = document.activeElement;
        document.body.appendChild(textarea);
        textarea.value = text;
        textarea.focus();
        if (textarea.setSelectionRange)
            textarea.setSelectionRange(0, textarea.value.length);
        else
            textarea.select();
        try {
            var flag = document.execCommand("copy");
        } catch(eo){
            var flag = false;
        }
        document.body.removeChild(textarea);
        currentFocus.focus();
        return flag;
    }

    $("#sendGoods").on('click',function(){
        var ronin = $("#ronin").val();
//        var text='复制的文字';
        var flag = copyText(ronin);
        alert(flag ? "复制卖家RONIN钱包成功，请去ronin交保证金！" : "复制卖家RONIN钱包失败,请手工复制后去ronin交保证金！");
    });

</script>
</html>
