
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
    <title>Rukada - Responsive Bootstrap4  Admin Dashboard Template</title>
    <!--favicon-->
    <link rel="icon" href="/css/Rukada/assets/images/favicon.ico" type="image/x-icon">
    <!-- Vector CSS -->
    <link href="/css/Rukada/assets/plugins/vectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet"/>
    <!-- simplebar CSS-->
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

    <jsp:include page="caidan.jsp"></jsp:include>
    <!--End topbar header-->

    <div class="clearfix"></div>

    <div class="content-wrapper">
        <div class="container-fluid">

            <div class="row mt-3">
                <div class="col-12 col-lg-6 col-xl-4">
                    <div class="card gradient-ibiza">
                        <div class="card-body">
                            <div class="media align-items-center">
                                <div class="media-body">
                                    <p class="text-white">总交易额</p>
                                    <h4 class="text-white line-height-5">¥${countMoney}</h4>
                                </div>
                                <div class=""><span id="dashboard2-chart-1"></span></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-lg-6 col-xl-4">
                    <div class="card gradient-branding">
                        <div class="card-body">
                            <div class="media align-items-center">
                                <div class="media-body">
                                    <p class="text-white">总人数</p>
                                    <h4 class="text-white line-height-5">${countUser}</h4>
                                </div>
                                <div class=""><span id="dashboard2-chart-2"></span></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-lg-12 col-xl-4">
                    <div class="card gradient-deepblue">
                        <div class="card-body">
                            <div class="media align-items-center">
                                <div class="media-body">
                                    <p class="text-white">新用户</p>
                                    <h4 class="text-white line-height-5">${recentCountUser}</h4>
                                </div>
                                <div class=""><span id="dashboard2-chart-3"></span></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-12 col-lg-12 col-xl-12">
                    <div class="card">
                        <div class="card-header">
                            收益报表(数据延迟10分钟)
                            <div class="card-action">

                                <div class="form-group mb-0">
                                    <select class="form-control form-control-sm">
                                        <option>Jan 18</option>
                                        <option>Feb 18</option>
                                        <option>Mar 18</option>
                                        <option>Apr 18</option>
                                        <option>May 18</option>
                                        <option>Jun 18</option>
                                        <option>Jul 18</option>
                                        <option>Aug 18</option>
                                        <option selected>Sept 18</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <canvas id="dashboard2-chart-4" height="100"></canvas>
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
<!-- Vector map JavaScript -->
<script src="/css/Rukada/assets/plugins/vectormap/jquery-jvectormap-2.0.2.min.js"></script>
<script src="/css/Rukada/assets/plugins/vectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- Chart js -->
<script src="/css/Rukada/assets/plugins/Chart/Chart.min.js"></script>
<!-- Sparkline JS -->
<script src="/css/Rukada/assets/plugins/sparkline-charts/jquery.sparkline.min.js"></script>
<!-- Index js -->

<script>
    $(function() {
        "use strict";


// chart 1

        $('#dashboard2-chart-1').sparkline([5,8,7,10,5,8,7,10,5,8,7,10,5,8,7,10,5,8,7,10], {
            type: 'bar',
            height: '40',
            barWidth: '2',
            resize: true,
            barSpacing: '5',
            barColor: '#fff'
        });


        // chart 2

        $('#dashboard2-chart-2').sparkline([5,8,7,10,5,8,7,10,5,8,7,10,5,8,7,10,5,8,7,10], {
            type: 'bar',
            height: '40',
            barWidth: '2',
            resize: true,
            barSpacing: '5',
            barColor: '#fff'
        });


        // chart 3

        $('#dashboard2-chart-3').sparkline([5,8,7,10,5,8,7,10,5,8,7,10,5,8,7,10,5,8,7,10], {
            type: 'bar',
            height: '40',
            barWidth: '2',
            resize: true,
            barSpacing: '5',
            barColor: '#fff'
        });


// chart 4

        var ctx = document.getElementById('dashboard2-chart-4').getContext('2d');

//        var items = [15, 8, 12, 5, 12, 8, 16, 25, 15, 100];
        var items = ${recentCountMoney};
        var myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['01', '02', '03', '04', '05', '06', '07'],
                datasets: [{
                    label: 'Sales Report',
                    data: items,
                    backgroundColor: 'rgba(45, 206, 137, 0.2)',
                    borderColor: '#2dce89',
                    pointBackgroundColor:'#fff',
                    pointHoverBackgroundColor:'#fff',
                    pointBorderColor :'#2dce89',
                    pointHoverBorderColor :'#2dce89',
                    pointBorderWidth :2,
                    pointRadius :4,
                    pointHoverRadius :4,
                    borderWidth: 3
                }]
            }
            ,
            options: {
                legend: {
                    position: false,
                    display: true,
                },
                tooltips: {
                    displayColors:false,
                }
            }
        });


    });


</script>
</body>
</html>
