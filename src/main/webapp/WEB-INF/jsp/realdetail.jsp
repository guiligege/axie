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
   <%-- <jsp:include page="caidan.jsp"></jsp:include>--%>
    <!--End sidebar-wrapper-->

    <!--Start topbar header-->
    <jsp:include page="new_header.jsp"></jsp:include>

    <!--End topbar header-->
    <div class="clearfix"></div>

    <div class="content-wrapper" style="margin-left: 120px;">
        <div class="container-fluid" style="width: 65%;">
            <!-- Breadcrumb-->
            <div class="row pt-2 pb-2">
                <div class="col-sm-9">
                    <h4 class="page-title">
                        <c:choose>
                            <c:when test="${productVO.type =='AXIE'}">
                                <a href="/cproduct/list-AXIE-1-0-0-1-1.htm"  style="color: #5e72e4;">返回Axie列表</a>
                            </c:when>
                            <c:when test="${productVO.type =='SLP'}">
                                <a href="/cproduct/list-SLP-1-0-0-1-1.htm"  style="color: #5e72e4;">返回药水列表</a>
                            </c:when>
                            <c:when test="${productVO.type =='AXS'}">
                                <a href="/cproduct/list-AXS-1-0-0-1-1.htm"  style="color: #5e72e4;">返回繁殖道具列表</a>
                            </c:when>
                            <c:otherwise>
                                <a href="/order/buyerOrderManage.htm"  style="color: #5e72e4;">返回首页</a>
                            </c:otherwise>
                        </c:choose>

                        》<span style="color: coral;">游戏道具</span></h4>
                </div>
            </div>
            <!-- End Breadcrumb-->

            <div class="row">
                <div class="col-lg-12">

                    <div class="card">
                        <div class="card-body">

                            <input type="hidden" value="${productVO.id}" id="productId">
                            <input type="hidden" value="${productVO.type}" id="productType">
                            <input type="hidden" value="${user.id}" id="userId">
                            <hr>
                            <form action="">

                                <c:if test="${productVO.type == 'AXIE' || productVO.type == 'LAND'}">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">商品图片</label>
                                    <div class="col-sm-10">
                                        <a href="/" class="detail_pic" target="_blank" itemprop="url">
                                            <img style="width: 196px;height: 164px;" class="figure_pic" src="https://storage.googleapis.com/assets.axieinfinity.com/axies/${productVO.outerId}/axie/axie-full-transparent.png" alt="商品" itemprop="image" _stat="info:poster">
                                        </a>
                                    </div>
                                </div>
                                </c:if>
                                <c:if test="${productVO.type == 'AXIE' || productVO.type == 'LAND'}">
                                    <div class="form-group row">
                                        <label  class="col-sm-2 col-form-label">AXIE道具详情</label>
                                        <div class="col-sm-10">
                                            <a href="https://marketplace.axieinfinity.com/axie/${productVO.outerId}?referrer=axie.zone" target="_blank">去官方市场，查看详细数据</a>
                                        </div>
                                    </div>
                                </c:if>

                                <c:if test="${productVO.type == 'SLP'}">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">商品图片</label>
                                    <div class="col-sm-10">
                                        <a href="/" class="detail_pic" target="_blank" itemprop="url">
                                            <img style="width: 95px;" class="figure_pic" src="/img/love-potion.png" alt="测试测试" itemprop="image" _stat="info:poster">
                                        </a>
                                    </div>
                                </div>
                                </c:if>

                                <c:if test="${productVO.type == 'AXS'}">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">商品图片</label>
                                        <div class="col-sm-10">
                                            <a href="/" class="detail_pic" target="_blank" itemprop="url">
                                                <img style="width: 95px;" class="figure_pic" src="/img/axs.png" alt="" itemprop="image" _stat="info:poster">
                                            </a>
                                        </div>
                                    </div>
                                </c:if>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">商品类型</label>
                                    <div class="col-sm-10">
                                        ${productVO.type}
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">商品交易模式</label>
                                    <div class="col-sm-10">
                                        <c:if test="${productVO.productMode == 2}">
                                            您购买商品
                                        </c:if>
                                        <c:if test="${productVO.productMode == 1}">
                                            您售卖商品
                                        </c:if>
                                    </div>
                                </div>

                                <c:if test="${productVO.type == 'AXIE'}">
                                    <div class="form-group row">
                                        <label  class="col-sm-2 col-form-label">类 别</label>
                                        <div class="col-sm-10">
                                                ${productVO.subTypeName}
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label  class="col-sm-2 col-form-label">是否蛋</label>
                                        <div class="col-sm-10">
                                                ${productVO.isEgg==0?"不是":"是"}
                                        </div>
                                    </div>
                                </c:if>

                                <div class="form-group row">
                                    <label  class="col-sm-2 col-form-label">道具描述</label>
                                    <div class="col-sm-10">
                                        ${productVO.desc}
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label  class="col-sm-2 col-form-label">单价|市场价</label>
                                    <div class="col-sm-10">
                                        单价：${productVO.singlePrice} WETH |市场价：${productVO.showPrice} WETH
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label  class="col-sm-2 col-form-label">道具总量</label>
                                    <div class="col-sm-10">
                                        ${productVO.totalCount - productVO.lockCount}
                                    </div>
                                    <input type="hidden" value="${productVO.totalCount - productVO.lockCount}" id="count">
                                </div>


                                <hr />
                                <%--<div class="form-group row">
                                    <label  class="col-sm-2 col-form-label">免责声明：</label>
                                    <div class="col-sm-10">
                                        <p style="font-size: 12px;color: red;">1、为了防止卖家不发货，卖家已缴保证金。产生纠纷由保证金账户垫付，请放心交易；</p>
                                        <p style="font-size: 14px;color: red;">下单交易流程：</p>
                                        <p style="font-size: 12px;color: red;">1、下单后，买家转账卖家ronin钱包后，需确认已支付；</p>
                                        <p style="font-size: 12px;color: red;">2、卖家确认到账后，卖家发货，并通知买家确认发货；如果30分钟对方未响应，可以发起退款；卖家和平台会在24小时内会处理。</p>
                                        <p style="font-size: 12px;color: red;">3、买家收到货后，需确认收货。至此交易流程完毕</p>
                                    </div>
                                </div>--%>
                                <div class="form-group row">
                                    <p style="font-size: 12px;"><span style="color: red">免责声明</span>：为了防止卖家不发货，卖家<span style="color: red">已缴保证金</span>。产生纠纷由保证金账户垫付（<span style="color: red">请用ronin
                                    </span>交易,钱包交易有交易流水，其他交易或场外交易本平台不保证安全，<span style="color: red">产生的损失，自行担责</span>。）</p>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-10">

                                        <p style="font-size: 14px;">买家买东西处理流程：</p>
                                        <p style="font-size: 12px;">1、买家发起订单<span style="color: red">（30分未付款，自动关闭）</span></p>
                                        <p style="font-size: 12px;">2、买家付款，确认支付（未付款点击付款，将被拉入<span style="color: red">黑名单</span>。）</p>
                                        <p style="font-size: 12px;">3、买家付款后，卖家确认发货（6小时内不确认发货，自动发起退款申请）</p>
                                        <p style="font-size: 12px;">4、买家确认收货。<span style="color: red">（2天内不确认收货或发起退款申请，系统自动收货）</span></p>
                                    </div>
                                </div>
                                <hr />
                                <div class="form-group row">
                                    <div class="col-sm-10">
                                        <p style="font-size: 14px;">买家卖东西处理流程：</p>
                                        <p style="font-size: 12px;">1、买家发起订单<span style="color: red">（30分未付款，自动关闭）</span></p>
                                        <p style="font-size: 12px;">2、买家发货，确认已发货（如果未发货点击已发货，将被拉入<span style="color: red">黑名单</span>。）</p>
                                        <p style="font-size: 12px;">3、买家发货后，卖家确认付款（6小时内不确认付款，自动发起退货申请）</p>
                                        <p style="font-size: 12px;">4、买家确认收款。<span style="color: red">（2天内不确认收款或发起退货申请，系统自动确认收款）</span></p>
                                    </div>
                                </div>

                                <hr />
                                <div class="form-group row">
                                    <label  class="col-sm-2 col-form-label">购买数量(SLP最少交易100个)</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" placeholder="输入购买数量" id="buyCount" />
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label"></label>
                                    <div class="col-sm-10">
                                        <button type="button" class="btn btn-dark shadow-dark px-5"  onclick="void(0);" id = "orderButton">立即下单（默认认可免责声明）</button>
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

    $("#orderButton").click(function(){
        //校验参数
        var userId = $("#userId").val();
        var buyCount = $("#buyCount").val();
        var count = $("#count").val();
        var productId = $("#productId").val();
        var productType = $("#productType").val();

        if(userId == ''){
            window.location.href = "/tologin.htm";
            return;
        }

        if(buyCount == ''){
            alert("购买数量不能是空！");
            return;
        }


        var r = /^\+?[1-9][0-9]*$/;
        if (!r.test(buyCount)){
            alert("请输入正整数！");
            return;
        }

        if(parseInt(count) < parseInt(buyCount)){
            alert("不能购买大于最大可购买数量！");
            return;
        }

        if(productType == 'SLP')
        if(parseInt(buyCount) < 100){
            alert("SLP不能购买小于100个！");
            return;
        }

        //发起post

        $.ajax({
            type: "POST",
            url: "/order/addOrder.htm",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(GetJsonData()),
            dataType: "json",
            success: function (message) {

                if(message.code == 200){
                    window.location.href = "/order/"+message.data+"/buyerdetail.htm";
                }else if(message.code == 40001){
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
                productId:parseInt(productId),
                buyCount:buyCount,
            };
            return json;
        }
    });




</script>
</html>
