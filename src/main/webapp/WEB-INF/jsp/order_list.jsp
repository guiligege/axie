<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@ taglib prefix="shopel" uri="/WEB-INF/pagetag.tld" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Axie游戏市场</title>
    <!--favicon-->
    <link rel="icon" href="/css/Rukada/assets/images/favicon.ico" type="image/x-icon">
    <!-- simplebar CSS-->
    <link href="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/plugins/simplebar/css/simplebar.css" rel="stylesheet"/>
    <!-- Bootstrap core CSS-->
    <link href="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <!--Data Tables -->
    <link href="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/plugins/bootstrap-datatable/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">
    <link href="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/plugins/bootstrap-datatable/css/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css">
    <!-- animate CSS-->
    <link href="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/css/animate.css" rel="stylesheet" type="text/css"/>
    <!-- Icons CSS-->
    <link href="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/css/icons.css" rel="stylesheet" type="text/css"/>
    <!-- Sidebar CSS-->
    <link href="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/css/sidebar-menu.css" rel="stylesheet"/>
    <!-- Custom Style-->
    <link href="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/css/app-style.css" rel="stylesheet"/>

</head>

<body>

<!-- Start wrapper-->
<div id="wrapper">

    <!--Start sidebar-wrapper-->
    <jsp:include page="new_header.jsp"></jsp:include>

    <!--End topbar header-->

    <div class="clearfix"></div>

    <div class="content-wrapper" style="margin-left: 0px;">
        <div class="container-fluid">
            <!-- End Breadcrumb-->
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header"><i class="fa fa-table"></i>订单管理》最近100笔订单</div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="default-datatable" class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>订单id</th>
                                        <th>商品类型</th>
                                        <%--<th>商品图片</th>--%>
                                        <th>买家昵称</th>
                                        <th>卖家昵称</th>
                                        <th>单价&数量</th>
                                        <th>总价</th>
                                        <th>状态</th>
                                        <th>创建时间</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                <c:forEach var="order" items="${orderList}" varStatus="index">
                                    <tr>
                                        <td>${order.id}</td>
                                        <td>${order.productType}</td>
                                        <%--<td>img</td>--%>
                                        <td>${order.buyerNick}</td>
                                        <td>${order.sellerNick}</td>
                                        <td>${order.singlePrice} * ${order.buyCount}</td>
                                        <td>${order.totalPrice}</td>
                                        <td style="color: red">
                                            <!-----买家买货逻辑start---->
                                            <c:if test="${order.status ==1 && order.mode ==0}">
                                                未支付
                                            </c:if>
                                            <c:if test="${order.status ==2 && order.mode ==0}">
                                                已支付，待卖家发货
                                            </c:if>
                                            <c:if test="${order.status ==3 && order.mode ==0}">
                                                已发货，待您确认收货
                                            </c:if>
                                            <c:if test="${order.status ==5 && order.mode ==0}">
                                                买家申请退款中
                                            </c:if>
                                            <c:if test="${order.status ==9 && order.mode ==0}">
                                                卖家已退款
                                            </c:if>
                                            <!-----买家买货逻辑end---->

                                            <!-----买家卖货逻辑start---->
                                            <c:if test="${order.status ==1 && order.mode ==1}">
                                                买家未发货
                                            </c:if>
                                            <c:if test="${order.status ==2 && order.mode ==1}">
                                                已发货，待卖家付款
                                            </c:if>
                                            <c:if test="${order.status ==3 && order.mode ==1}">
                                                卖家已付款，待您确认收款
                                            </c:if>
                                            <c:if test="${order.status ==5 && order.mode ==1}">
                                                买家申请退货中
                                            </c:if>
                                            <c:if test="${order.status ==9 && order.mode ==1}">
                                                卖家已退货
                                            </c:if>
                                            <!-----买家卖货逻辑end---->

                                            <c:if test="${order.status ==10}">
                                                平台介入中
                                            </c:if>
                                            <c:if test="${order.status ==6}">
                                                退款关闭，订单关闭
                                            </c:if>
                                            <c:if test="${order.status ==7}">
                                                撤销订单
                                            </c:if>
                                            <c:if test="${order.status ==8}">
                                                完结
                                            </c:if>
                                            <c:if test="${order.status ==18}">
                                                待平台退款买家
                                            </c:if>

                                            <c:if test="${order.status ==16 && order.mode ==0}">
                                                由于交易系统延迟，卖家确认已发货，请耐心等待30分钟
                                            </c:if>
                                            <c:if test="${order.status ==16 && order.mode ==1}">
                                                由于交易系统延迟，卖家确认已付款，请耐心等待30分钟
                                            </c:if>

                                            <c:if test="${order.status ==19}">
                                                关闭
                                            </c:if>
                                        </td>
                                        <td>${order.createTimeStr}</td>

                                        <td>
                                            <c:choose>
                                                <c:when test="${order.status ==1}">
                                                    <a href="/order/${order.id}/buyerdetail.htm" target="_blank">去支付</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="/order/${order.id}/buyerdetail.htm" target="_blank">查看详情</a>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        </tr>
                                </c:forEach>
                                    </tbody>

                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- End Row-->

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
                Copyright © Axie游戏交易平台
            </div>
        </div>
    </footer>
    <!--End footer-->

</div><!--End wrapper-->


<!-- Bootstrap core JavaScript-->
<script src="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/js/jquery.min.js"></script>
<script src="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/js/popper.min.js"></script>
<script src="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/js/bootstrap.min.js"></script>

<!-- simplebar js -->
<script src="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/plugins/simplebar/js/simplebar.js"></script>
<!-- waves effect js -->
<script src="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/js/waves.js"></script>
<!-- sidebar-menu js -->
<script src="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/js/sidebar-menu.js"></script>
<!-- Custom scripts -->
<script src="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/js/app-script.js"></script>

<!--Data Tables js-->
<script src="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/plugins/bootstrap-datatable/js/jquery.dataTables.min.js"></script>
<script src="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/plugins/bootstrap-datatable/js/dataTables.bootstrap4.min.js"></script>
<script src="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/plugins/bootstrap-datatable/js/dataTables.buttons.min.js"></script>
<script src="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/plugins/bootstrap-datatable/js/buttons.bootstrap4.min.js"></script>
<script src="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/plugins/bootstrap-datatable/js/jszip.min.js"></script>
<script src="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/plugins/bootstrap-datatable/js/pdfmake.min.js"></script>
<script src="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/plugins/bootstrap-datatable/js/vfs_fonts.js"></script>
<script src="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/plugins/bootstrap-datatable/js/buttons.html5.min.js"></script>
<script src="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/plugins/bootstrap-datatable/js/buttons.print.min.js"></script>
<script src="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/plugins/bootstrap-datatable/js/buttons.colVis.min.js"></script>

<script>
    $(document).ready(function() {
        //Default data table
        $('#default-datatable').DataTable();


        var table = $('#example').DataTable( {
            lengthChange: false,
            buttons: [ 'copy', 'excel', 'pdf', 'print', 'colvis' ]
        } );

        table.buttons().container()
            .appendTo( '#example_wrapper .col-md-6:eq(0)' );

    } );

</script>

</body>
</html>

