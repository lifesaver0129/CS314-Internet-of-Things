<%--
  Created by IntelliJ IDEA.
  User: xiaoy_000
  Date: 2017/7/6
  Time: 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from condorthemes.com/cleanzone/tables-datatables.html by HTTrack Website Copier/3.x [XR&CO'2013], Mon, 31 Mar 2014 14:37:21 GMT -->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../images/favicon.png">
    <title>NBIOT - 智能环境管理</title>
    <!-- Bootstrap core CSS -->
    <link href="../js/bootstrap/dist/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../js/jquery.gritter/css/jquery.gritter.css"/>
    <link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="../js/html5shiv.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="../js/jquery.nanoscroller/nanoscroller.css"/>
    <link rel="stylesheet" type="text/css" href="../js/jquery.easypiechart/jquery.easy-pie-chart.css"/>
    <link rel="stylesheet" type="text/css" href="../js/bootstrap.switch/bootstrap-switch.css"/>
    <link rel="stylesheet" type="text/css" href="../js/bootstrap.datetimepicker/css/bootstrap-datetimepicker.min.css"/>
    <link rel="stylesheet" type="text/css" href="../js/jquery.select2/select2.css"/>
    <link rel="stylesheet" type="text/css" href="../js/bootstrap.slider/css/slider.css"/>
    <link rel="stylesheet" type="text/css" href="../js/jquery.datatables/bootstrap-adapter/css/datatables.css"/>
    <link href="../css/style.css" rel="stylesheet"/>
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript">
        function getVal() {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/public/freshDevice.do",
                dataType: "json",
                success: function (data) {
                    for (i = 0; i < data.length; i++) {
                        var s = data[i];
                    }
                }
            })
        }

        window.setInterval(getVal, 10000);
    </script>
</head>

<body>
<jsp:include page="/WEB-INF/include/info.jsp" flush="true"/>

<div id="cl-wrapper">
    <div class="cl-sidebar">
        <div class="cl-toggle"><i class="fa fa-bars"></i></div>
        <div class="cl-navblock">
            <div class="menu-space">
                <div class="content">
                    <div class="side-user">
                        <div class="avatar"><img src="../images/avatar1_50.jpg" alt="Avatar"/></div>
                        <div class="info">
                            <a href="#">
                                <%
                                    String u = session.getAttribute("name").toString();
                                %>
                                <%--<%out.print(u); %>--%>
                            </a>
                            <img src="../images/state_online.png" alt="Status"/> <span>Online</span>
                        </div>
                    </div>
                    <jsp:include page="/WEB-INF/include/menu.jsp" flush="true"/>
                </div>
            </div>
            <div class="text-right collapse-button" style="padding:7px 9px;">
                <button id="sidebar-collapse" class="btn btn-default" style=""><i style="color:#fff;"
                                                                                  class="fa fa-angle-left"></i></button>
            </div>
        </div>
    </div>

    <div class="container-fluid" id="pcont">
        <div class="page-head">
            <h2>环境设备历史数据</h2>
            <ol class="breadcrumb">
                <li><a href="#">主页</a></li>
                <li><a href="#">智能环境管理</a></li>
                <li class="active">环境设备历史数据</li>
            </ol>
        </div>
        <div class="cl-mcont">
            <div class="row">
                <div class="col-md-12">
                    <div class="block-flat">
                        <div class="header">
                            <h3>环境设备历史数据(ID: 0F000007)</h3>
                        </div>
                        <div class="content">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="datatable-icons">
                                    <thead>
                                    <tr>
                                        <th>记录编号</th>
                                        <th>时间</th>
                                        <th>温度</th>
                                        <th>湿度</th>
                                        <th>气压</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${deviceinfos}" var="s">
                                        <tr>
                                            <td>${s.se_hr_id}</td>
                                            <td>${s.se_hr_time}</td>
                                            <td>${s.se_hr_tem}</td>
                                            <td>${s.se_hr_hum}</td>
                                            <td>${s.se_hr_pressure}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="block-flat">
                        <div class="header">
                            <h3>数据折线图展示</h3>
                        </div>
                        <div class="content">
                            <div id="container" style="height: 500px"></div>
                            <script type="text/javascript"
                                    src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
                            <script type="text/javascript"
                                    src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js"></script>
                            <script type="text/javascript"
                                    src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>
                            <script type="text/javascript"
                                    src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
                            <script type="text/javascript"
                                    src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
                            <script type="text/javascript"
                                    src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
                            <script type="text/javascript"
                                    src="http://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>
                            <script type="text/javascript"
                                    src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
                            <script type="text/javascript"
                                    src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>
                            <script type="text/javascript">
                                var dom = document.getElementById("container");
                                var myChart = echarts.init(dom);
                                var app = {};
                                option = null;
                                var target;
                                var total;
                                $.ajax({
                                    type: "get",
                                    url: "${pageContext.request.contextPath}/public/freshDevice.do",
                                    dataType: "json",
                                    success: function (data) {
                                        target = data;
                                        total = data.length;
                                        option = {
                                            title: {
                                                text: '最近30次观测数据制图'
                                            },
                                            tooltip: {
                                                trigger: 'axis'
                                            },
                                            legend: {
                                                data: ['温度', '湿度', '大气压']
                                            },
                                            grid: {
                                                left: '3%',
                                                right: '4%',
                                                bottom: '3%',
                                                containLabel: true
                                            },
                                            toolbox: {
                                                feature: {
                                                    saveAsImage: {}
                                                }
                                            },
                                            xAxis: {
                                                type: 'category',
                                                boundaryGap: false,
                                                data: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
                                                    '11', '12', '13', '14', '15', '16', '17', '18', '19', '20',
                                                    '21', '22', '23', '24', '25', '26', '27', '28', '29', '30',]
                                            },
                                            yAxis: {
                                                type: 'value'
                                            },
                                            series: [
                                                {
                                                    name: '温度',
                                                    type: 'line',
                                                    data: [target[total - 30].se_hr_tem,
                                                        target[total - 29].se_hr_tem,
                                                        target[total - 28].se_hr_tem,
                                                        target[total - 27].se_hr_tem,
                                                        target[total - 26].se_hr_tem,
                                                        target[total - 25].se_hr_tem,
                                                        target[total - 24].se_hr_tem,
                                                        target[total - 23].se_hr_tem,
                                                        target[total - 22].se_hr_tem,
                                                        target[total - 21].se_hr_tem,
                                                        target[total - 20].se_hr_tem,
                                                        target[total - 19].se_hr_tem,
                                                        target[total - 18].se_hr_tem,
                                                        target[total - 17].se_hr_tem,
                                                        target[total - 16].se_hr_tem,
                                                        target[total - 15].se_hr_tem,
                                                        target[total - 14].se_hr_tem,
                                                        target[total - 13].se_hr_tem,
                                                        target[total - 12].se_hr_tem,
                                                        target[total - 11].se_hr_tem,
                                                        target[total - 10].se_hr_tem,
                                                        target[total - 9].se_hr_tem,
                                                        target[total - 8].se_hr_tem,
                                                        target[total - 7].se_hr_tem,
                                                        target[total - 6].se_hr_tem,
                                                        target[total - 5].se_hr_tem,
                                                        target[total - 4].se_hr_tem,
                                                        target[total - 3].se_hr_tem,
                                                        target[total - 2].se_hr_tem,
                                                        target[total - 1].se_hr_tem]
                                                },
                                                {
                                                    name: '湿度',
                                                    type: 'line',
                                                    data: [target[total - 30].se_hr_hum,
                                                        target[total - 29].se_hr_hum,
                                                        target[total - 28].se_hr_hum,
                                                        target[total - 27].se_hr_hum,
                                                        target[total - 26].se_hr_hum,
                                                        target[total - 25].se_hr_hum,
                                                        target[total - 24].se_hr_hum,
                                                        target[total - 23].se_hr_hum,
                                                        target[total - 22].se_hr_hum,
                                                        target[total - 21].se_hr_hum,
                                                        target[total - 20].se_hr_hum,
                                                        target[total - 19].se_hr_hum,
                                                        target[total - 18].se_hr_hum,
                                                        target[total - 17].se_hr_hum,
                                                        target[total - 16].se_hr_hum,
                                                        target[total - 15].se_hr_hum,
                                                        target[total - 14].se_hr_hum,
                                                        target[total - 13].se_hr_hum,
                                                        target[total - 12].se_hr_hum,
                                                        target[total - 11].se_hr_hum,
                                                        target[total - 10].se_hr_hum,
                                                        target[total - 9].se_hr_hum,
                                                        target[total - 8].se_hr_hum,
                                                        target[total - 7].se_hr_hum,
                                                        target[total - 6].se_hr_hum,
                                                        target[total - 5].se_hr_hum,
                                                        target[total - 4].se_hr_hum,
                                                        target[total - 3].se_hr_hum,
                                                        target[total - 2].se_hr_hum,
                                                        target[total - 1].se_hr_hum]
                                                },
                                                {
                                                    name: '大气压',
                                                    type: 'line',
                                                    data: [target[total - 30].se_hr_pressure,
                                                        target[total - 29].se_hr_pressure,
                                                        target[total - 28].se_hr_pressure,
                                                        target[total - 27].se_hr_pressure,
                                                        target[total - 26].se_hr_pressure,
                                                        target[total - 25].se_hr_pressure,
                                                        target[total - 24].se_hr_pressure,
                                                        target[total - 23].se_hr_pressure,
                                                        target[total - 22].se_hr_pressure,
                                                        target[total - 21].se_hr_pressure,
                                                        target[total - 20].se_hr_pressure,
                                                        target[total - 19].se_hr_pressure,
                                                        target[total - 18].se_hr_pressure,
                                                        target[total - 17].se_hr_pressure,
                                                        target[total - 16].se_hr_pressure,
                                                        target[total - 15].se_hr_pressure,
                                                        target[total - 14].se_hr_pressure,
                                                        target[total - 13].se_hr_pressure,
                                                        target[total - 12].se_hr_pressure,
                                                        target[total - 11].se_hr_pressure,
                                                        target[total - 10].se_hr_pressure,
                                                        target[total - 9].se_hr_pressure,
                                                        target[total - 8].se_hr_pressure,
                                                        target[total - 7].se_hr_pressure,
                                                        target[total - 6].se_hr_pressure,
                                                        target[total - 5].se_hr_pressure,
                                                        target[total - 4].se_hr_pressure,
                                                        target[total - 3].se_hr_pressure,
                                                        target[total - 2].se_hr_pressure,
                                                        target[total - 1].se_hr_pressure]
                                                }
                                            ]
                                        };
                                        if (option && typeof option === "object") {
                                            myChart.setOption(option, true);
                                        }
                                    }
                                });

                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/jquery.nanoscroller/jquery.nanoscroller.js"></script>
    <script type="text/javascript" src="../js/jquery.sparkline/jquery.sparkline.min.js"></script>
    <script type="text/javascript" src="../js/jquery.easypiechart/jquery.easy-pie-chart.js"></script>
    <script type="text/javascript" src="../js/behaviour/general.js"></script>
    <script src="../js/jquery.ui/jquery-ui.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/jquery.nestable/jquery.nestable.js"></script>
    <script type="text/javascript" src="../js/bootstrap.switch/bootstrap-switch.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap.datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
    <script src="../js/jquery.select2/select2.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.slider/js/bootstrap-slider.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/jquery.gritter/js/jquery.gritter.js"></script>
    <script type="text/javascript" src="../js/jquery.datatables/jquery.datatables.min.js"></script>
    <script type="text/javascript" src="../js/jquery.datatables/bootstrap-adapter/js/datatables.js"></script>

    <script type="text/javascript">

        $(document).ready(function () {
            //initialize the javascript
            App.init();
            App.dataTables();

            /* Formating function for row details */
            function fnFormatDetails(oTable, nTr) {
                var aData = oTable.fnGetData(nTr);
                var sOut = '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">';
                sOut += '<tr><td>Rendering engine:</td><td>' + aData[1] + ' ' + aData[4] + '</td></tr>';
                sOut += '<tr><td>Link to source:</td><td>Could provide a link here</td></tr>';
                sOut += '<tr><td>Extra info:</td><td>And any further details here (images etc)</td></tr>';
                sOut += '</table>';

                return sOut;
            }

            /*
             * Insert a 'details' column to the table
             */
            var nCloneTh = document.createElement('th');
            var nCloneTd = document.createElement('td');
            nCloneTd.innerHTML = '<img class="toggle-details" src="images/plus.png" />';
            nCloneTd.className = "center";

            $('.dataTables_filter input').addClass('form-control').attr('placeholder', 'Search');
            $('.dataTables_length select').addClass('form-control');

            //Horizontal Icons dataTable
            $('#datatable-icons').dataTable();
        });
    </script>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="../js/behaviour/voice-commands.js"></script>
    <script src="../js/bootstrap/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/jquery.flot/jquery.flot.js"></script>
    <script type="text/javascript" src="../js/jquery.flot/jquery.flot.pie.js"></script>
    <script type="text/javascript" src="../js/jquery.flot/jquery.flot.resize.js"></script>
    <script type="text/javascript" src="../js/jquery.flot/jquery.flot.labels.js"></script>
</body>

<!-- Mirrored from condorthemes.com/cleanzone/tables-datatables.html by HTTrack Website Copier/3.x [XR&CO'2013], Mon, 31 Mar 2014 14:37:27 GMT -->
</html>
