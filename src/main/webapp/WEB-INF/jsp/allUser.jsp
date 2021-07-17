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


            <!-- End Breadcrumb-->
            <div class="row">
                <div class="col-sm-12 col-md-6">
                    <div id="default-datatable_filter" class="dataTables_filter">
                        <label>用户名：<input id="searchkey" type="search" class="form-control form-control-sm" placeholder="" aria-controls="default-datatable"></label>
                        <input id="searchButton" onclick="searchClick();" type="button" value="搜索"/>
                    </div>
                    <div></div>
                </div>
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">代理情况</div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="default-datatable" class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>用户名</th>
                                        <th>手机</th>
                                        <th>余额</th>
                                        <th>反水状态</th>
                                        <th>反水比例</th>
                                        <th>登录</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <c:forEach var="user" items="${list}" varStatus="index">
                                    <tr>
                                        <td>${user.loginId}</td>
                                        <td>${user.mobile}</td>
                                        <td>${user.paidPoint}</td>
                                        <td>有效</td>
                                        <td>千分之${user.percentage}</td>
                                        <td><fmt:formatDate value="${user.updated}" pattern="yyyy年MM月dd日HH点mm分ss秒" /></td>
                                        <td>查看</td>
                                    </tr>
                                    </c:forEach>


                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- End Row-->


            <div class="row">
                <div class="col-sm-12 col-md-5">
                    <div class="dataTables_info" id="default-datatable_info" role="status" aria-live="polite">总数：${totalCount}</div>
                </div>
                <div class="col-sm-12 col-md-7">
                    <div class="dataTables_paginate paging_simple_numbers" id="default-datatable_paginate">
                        <ul class="pagination">
                            <li class="paginate_button page-item previous" id="default-datatable_previous">
                                <a href="/admin/allUser.htm?currentPage=${prepage}" aria-controls="default-datatable" data-dt-idx="0" tabindex="0" class="page-link">上一页</a></li>
                            <li class="paginate_button page-item next " id="default-datatable_next">
                                <a href="/admin/allUser.htm?currentPage=${nextpage}" aria-controls="default-datatable" data-dt-idx="1" tabindex="0" class="page-link">下一页</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
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
                Copyright © Axie 游戏市场
            </div>
        </div>
    </footer>
    <!--End footer-->

</div><!--End wrapper-->

<!-- Bootstrap core JavaScript-->
<script src="/css/Rukada/assets/js/jquery.min.js"></script>
<script src="/css/Rukada/assets/js/popper.min.js"></script>
<script src="/css/Rukada/assets/js/bootstrap.min.js"></script>

<!-- simplebar js -->
<script src="/css/Rukada/assets/plugins/simplebar/js/simplebar.js"></script>
<!-- waves effect js -->
<script src="/css/Rukada/assets/js/waves.js"></script>
<!-- sidebar-menu js -->
<script src="/css/Rukada/assets/js/sidebar-menu.js"></script>
<!-- Custom scripts -->
<script src="/css/Rukada/assets/js/app-script.js"></script>

<!--Data Tables js-->
<script src="/css/Rukada/assets/plugins/bootstrap-datatable/js/jquery.dataTables.min.js"></script>
<script src="/css/Rukada/assets/plugins/bootstrap-datatable/js/dataTables.bootstrap4.min.js"></script>
<script src="/css/Rukada/assets/plugins/bootstrap-datatable/js/dataTables.buttons.min.js"></script>
<script src="/css/Rukada/assets/plugins/bootstrap-datatable/js/buttons.bootstrap4.min.js"></script>
<script src="/css/Rukada/assets/plugins/bootstrap-datatable/js/jszip.min.js"></script>
<script src="/css/Rukada/assets/plugins/bootstrap-datatable/js/pdfmake.min.js"></script>
<script src="/css/Rukada/assets/plugins/bootstrap-datatable/js/vfs_fonts.js"></script>
<script src="/css/Rukada/assets/plugins/bootstrap-datatable/js/buttons.html5.min.js"></script>
<script src="/css/Rukada/assets/plugins/bootstrap-datatable/js/buttons.print.min.js"></script>
<script src="/css/Rukada/assets/plugins/bootstrap-datatable/js/buttons.colVis.min.js"></script>

<script>



    function searchClick() {
        var key = $("#searchkey").val();
        location.href="/admin/allUser.htm?currentPage=1&loginId="+key;
    }



</script>

</body>
</html>

