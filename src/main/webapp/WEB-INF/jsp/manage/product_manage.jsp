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
    <title>Axie游戏交易平台 - 后台管理系统</title>
    <!--favicon-->
    <link rel="icon" href="http://www.17sucai.com/preview/1474877/2018-12-06/Rukada/assets/images/favicon.ico" type="image/x-icon">
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
    <jsp:include page="../caidan.jsp"></jsp:include>

    <!--End topbar header-->

    <div class="clearfix"></div>
be
    <div class="content-wrapper">
        <div class="container-fluid">
            <!-- End Breadcrumb-->
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header"><i class="fa fa-table"></i>商品管理</div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="default-datatable" class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>商品类型</th>
                                        <th>官方地址</th>
                                        <th>Axie_id</th>
                                        <th>价格</th>
                                        <th>可交易数量</th>
                                        <th>交易中数量</th>
                                        <th>买/卖</th>
                                        <th>状态</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                            <c:forEach var="product" items="${productList}" varStatus="index">
                                    <tr>
                                        <td>${product.type}</td>
                                        <td>
                                            <c:if test="${product.type == 'AXIE' ||product.type == 'LAND'}">
                                                <a href="https://marketplace.axieinfinity.com/axie/${product.outerId}?referrer=axie.zone" target="_blank">详细数据</a>
                                            </c:if>
                                        </td>
                                        <td>${product.outerId!=null?product.outerId:""}</td>
                                        <td>${product.singlePrice}WETH</td>
                                        <td>${product.totalCount - product.lockCount}</td>
                                        <td>${product.lockCount}</td>
                                        <td>
                                            <%--//  //1,买；2，卖--%>
                                            <c:if test="${product.productMode ==1}">
                                                买
                                            </c:if>
                                            <c:if test="${product.productMode ==2}">
                                                卖
                                            </c:if>
                                        </td>
                                        <td style="color: red">
                                            <c:if test="${product.status ==0}">
                                                待上架
                                            </c:if>
                                            <c:if test="${product.status ==1}">
                                                上架
                                            </c:if>
                                            <c:if test="${product.status ==2}">
                                                已下架
                                            </c:if>
                                        </td>
                                        <td>
                                            <button type="button" onclick="void(0);" class="upButton" myAttr="${product.id}">上架</button>
                                            <button type="button" onclick="void(0);" class="downButton" myAttr="${product.id}">下架</button>
                                            <a href="/product/${product.id}/toUpdate.htm" target="_self">修改</a>
                                        </td>
                                    </tr>

                            </c:forEach>
                                    </tbody>
                                    </tfoot>
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

    //上架
    $(".upButton").click(function(){
        //校验参数
        var productId = $(this).attr("myAttr");

        //发起post

        $.ajax({
            type: "POST",
            url: "/product/online.htm",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(GetJsonData()),
            dataType: "json",
            success: function (message) {

                if(message.code == 200){
                    location.reload();
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
                id:parseInt(productId)
            };
            return json;
        }
    });

    //下架
    $(".downButton").click(function(){
        //校验参数
        var productId = $(this).attr("myAttr");

        //发起post

        $.ajax({
            type: "POST",
            url: "/product/offline.htm",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(GetJsonData()),
            dataType: "json",
            success: function (message) {

                if(message.code == 200){
                    location.reload();
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
                id:parseInt(productId)
            };
            return json;
        }
    });

</script>

</body>
</html>

