<%@ page import="java.util.List" %>
<%@ page import="po.SceneryEntity" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="org.hibernate.Query" %>
<%@ page import="po.BotanyEntity" %><%--
  Created by IntelliJ IDEA.
  User: Rose
  Date: 2017/4/19
  Time: 下午6:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <title>园林系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!--CUSTOM BASIC STYLES-->
    <link href="assets/css/basic.css" rel="stylesheet" />
    <!--CUSTOM MAIN STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts-all-3.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
    <script type="text/javascript"></script>

</head>
<body>

<div id="wrapper">
    <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" >园林系统-用户界面</a>
        </div>

        <div class="header-right">

            <a href="index.jsp" class="btn btn-danger" title="Logout"><i class="fa fa-exclamation-circle fa-2x"></i></a>


        </div>
    </nav>
    <!-- /. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li>
                    <div class="user-img-div">
                        <img src="assets/img/timg.jpeg" class="img-thumbnail" />
                        <br>用户
                        <br>id:
                        <%=request.getAttribute("userid")%>
                    </div>

                </li>
                <li>
                    <a href="#"><i class="fa fa-desktop "></i>景点浏览<span class="fa arrow"></span></a>

                </li>
                <li>
                    <a href="route.jsp"><i class="fa fa-edit "></i>游览路线 <span class="fa arrow"></span></a>

                </li>
                <li>
                    <a href="uecos.jsp"><i class="fa fa-bug "></i>生态环境<span class="fa arrow"></span></a>

                </li>
                <li>
                    <a href="index.jsp"><i class="fa fa-sign-in "></i>退出登录</a>
                </li>

            </ul>
        </div>

    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-head-line">游览路线</h1>

                </div>
            </div>
            <!-- /. ROW  -->

            <div >
                <!--    Hover Rows  -->

                <div class="panel panel-default">

                    <div class="panel panel-success">
                        <div class="panel-heading">
                            最短路线
                        </div>
                        <div class="panel-body">

                            <%
                                String tip = (String) request.getAttribute("tip");
                                String p = (String) request.getAttribute("p");
                                String sp = (String) request.getAttribute("sp");
                            %>
                            <%=tip%> <br>
                            <%=p%> <br>
                            <%=sp%> <br>

                        </div>

                    </div>

                    <!-- End  Hover Rows  -->
                </div>


                <!-- /. ROW  -->

            </div>
            <!-- /. PAGE INNER  -->

            <div id="container" style="width:70%;height:70%"></div>
            <script type="text/javascript">
                //对container进行初始化
                var dom = document.getElementById("container");
                var myChart = echarts.init(dom);
                var app = {};
                option = null;
                var geoCoordMap = {
                    '谷底森林': [116, 40],
                    '岳桦林': [108, 23],
                    '天豁峰': [116, 28],
                    '聚龙泉': [119, 39],
                    '黑风口': [100, 30],
                };

                var plantMap = {
                    '谷底森林': '大齿三叉蕨, 多型三叉蕨, 金鱼藻, 杜仲, 山玉兰, 野八角',
                    '岳桦林': '矮黄栌, 小漆树, 大花漆,漆树, 小果大叶漆, ',
                    '天豁峰': '八角枫, 瓜木, 粟米草, 高山冬青, 川冬青, ',
                    '聚龙泉': '刚毛藤山柳, 藤山柳, 尖叶藤山柳',
                    '黑风口': '阔叶槭, 太白深灰槭, 楠叶槭, 光叶槭, ',
                };

                var BJData = [
                    [{name: '谷底森林'}, {name: '谷底森林', value: 'lan lan'}],
                    [{name: '谷底森林'}, {name: '聚龙泉', value: 80}],
                    [{name: '谷底森林'}, {name: '岳桦林', value: 70}],
                    [{name: '谷底森林'}, {name: '天豁峰', value: 60}],
                    [{name: '谷底森林'}, {name: '黑风口', value: 50}],
                ];

                var DJData = [
                    [{name: '聚龙泉', value: 'lishi'}],
                    [{name: '天豁峰', value: 'qinzi'}],
                    [{name: '黑风口', value: 'renwen'}],
                    [{name: '岳桦林', value: 'qinzi'}],
                ];

                var planePath = 'path://M432.45,595.444c0,2.177-4.661,6.82-11.305,6.82c-6.475,0-11.306-4.567-11.306-6.82s4.852-6.812,11.306-6.812C427.841,588.632,432.452,593.191,432.45,595.444L432.45,595.444z M421.155,589.876c-3.009,0-5.448,2.495-5.448,5.572s2.439,5.572,5.448,5.572c3.01,0,5.449-2.495,5.449-5.572C426.604,592.371,424.165,589.876,421.155,589.876L421.155,589.876z M421.146,591.891c-1.916,0-3.47,1.589-3.47,3.549c0,1.959,1.554,3.548,3.47,3.548s3.469-1.589,3.469-3.548C424.614,593.479,423.062,591.891,421.146,591.891L421.146,591.891zM421.146,591.891';

                var convertDat = function (data) {
                    var res = [];
                    for (var i = 0; i < data.length - 1; i++) {
                        var fromCoord = geoCoordMap[data[i]];
                        var toCoord = geoCoordMap[data[i + 1]];
                        if (fromCoord && toCoord) {
                            res.push({
                                fromName: data[i],
                                toName: data[i + 1],
                                coords: [fromCoord, toCoord]
                            });
                        }
                    }
                    return res;
                };

                var RenwenData = function (data) {
                    var res = ['谷底森林'];
                    for (var i = 0; i < data.length; i++) {
                        var dataItem = data[i];
                        if (dataItem[0].value == 'renwen')
                            res.push(dataItem[0].name);
                    }
                    return res;
                };

                var LishiData = function (data) {
                    var res = ['谷底森林'];
                    for (var i = 0; i < data.length; i++) {
                        var dataItem = data[i];
                        if (dataItem[0].value == 'lishi')
                            res.push(dataItem[0].name);
                    }
                    return res;
                };

                var QinziData = function (data) {
                    var res = ['谷底森林'];
                    for (var i = 0; i < data.length; i++) {
                        var dataItem = data[i];
                        if (dataItem[0].value == 'qinzi')
                            res.push(dataItem[0].name);
                    }
                    return res;
                };

                var cultural = new Array();
                <%
                List list = (List)request.getSession().getAttribute("placeList");
                if(list!=null){
                for(int j=0;j<list.size();j++)
                {%>
                //alert("111");
                cultural[<%=j%>] = '<%=list.get(j)%>';
                <%}
                }%>

                var planePath = 'path://M1705.06,1318.313v-89.254l-319.9-221.799l0.073-208.063c0.521-84.662-26.629-121.796-63.961-121.491c-37.332-0.305-64.482,36.829-63.961,121.491l0.073,208.063l-319.9,221.799v89.254l330.343-157.288l12.238,241.308l-134.449,92.931l0.531,42.034l175.125-42.917l175.125,42.917l0.531-42.034l-134.449-92.931l12.238-241.308L1705.06,1318.313z';

                var convertData = function (data) {
                    var res = [];
                    for (var i = 0; i < data.length; i++) {
                        var dataItem = data[i];
                        var fromCoord = geoCoordMap[dataItem[0].name];
                        var toCoord = geoCoordMap[dataItem[1].name];
                        if (fromCoord && toCoord) {
                            res.push({
                                fromName: dataItem[0].name,
                                toName: dataItem[1].name,
                                coords: [fromCoord, toCoord]
                            });
                        }
                    }
                    return res;
                };

                var color = ['#a6c84c'];
                var series = ['谷底森林'];
                [['谷底森林', BJData]].forEach(function (item, i) {
                    series.push({

                            type: 'lines',
                            zlevel: 1,
                            effect: {
                                show: true,
                                period: 6,
                                trailLength: 0.7,
                                color: '#fff',
                                symbolSize: 3
                            },
                            lineStyle: {
                                normal: {
                                    color: color[i],
                                    width: 0,
                                    curveness: 0.2
                                }
                            },
                            data: convertDat(cultural)
                        },
                        {

                            type: 'lines',
                            zlevel: 2,
                            symbol: ['none', 'arrow'],
                            symbolSize: 10,
                            effect: {
                                show: true,
                                period: 6,
                                trailLength: 0,
                                symbol: ['none', 'star'],
                                symbolSize: 10
                            },
                            lineStyle: {
                                normal: {
                                    color: color[i],
                                    width: 1,
                                    opacity: 0.6,
                                    curveness: 0.2
                                }
                            },
                            data: convertDat(cultural)
                        },
                        {

                            type: 'effectScatter',
                            coordinateSystem: 'geo',
                            zlevel: 2,
                            rippleEffect: {
                                brushType: 'stroke'
                            },
                            label: {
                                normal: {
                                    show: true,
                                    position: 'right',
                                    formatter: '{b}'
                                }
                            },
                            symbolSize: function (val) {
                                return 90 / 8;
                            },
                            itemStyle: {
                                normal: {
                                    color: color[i]
                                }
                            },
                            data:
                                item[1].map(function (dataItem) {
                                    return {
                                        name: dataItem[1].name,
                                        value: geoCoordMap[dataItem[1].name].concat([plantMap[dataItem[1].name]])
                                    };
                                })
                        });
                });

                option = {
                    backgroundColor: '#FFFFF0',
                    title: {
                        text: '景区地图',
                        left: 'center',
                        textStyle: {
                            color: '#a6c84c'
                        }
                    },
                    tooltip: {
                        trigger: 'item'
                    },
                    legend: {
                        orient: 'vertical',
                        top: 'bottom',
                        left: 'right',
                        data: ['谷底森林 Top10', '上海 Top10', '广州 Top10'],
                        textStyle: {
                            color: '#fff'
                        },
                        selectedMode: 'single'
                    },
                    geo: {
                        map: 'china',
                        label: {
                            emphasis: {
                                show: false
                            }
                        },
                        roam: true,
                        itemStyle: {
                            normal: {
                                areaColor: '#FFFFF0',
                                borderColor: '#FFFFF0'
                            },
                            emphasis: {
                                areaColor: '#FFFFF0'
                            }
                        }
                    },
                    series: series
                };
                ;
                if (option && typeof option === "object") {
                    myChart.setOption(option, true);
                }
            </script>

        </div>

    </div>
    <!-- /. PAGE WRAPPER  -->
</div>
<!-- /. WRAPPER  -->
<div id="footer-sec">
    &copy; 2014 YourCompany | More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
</div>
<!-- /. FOOTER  -->
<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="assets/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="assets/js/bootstrap.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="assets/js/jquery.metisMenu.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="assets/js/custom.js"></script>
<script src="assets/js/fenye.js"></script>
</body>
</html>
