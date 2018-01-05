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
                    <h1 class="page-subhead-line">请选择游览景区 </h1>

                </div>
            </div>
            <!-- /. ROW  -->

            <div >
                <!--    Hover Rows  -->

                <div class="panel panel-default">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            自由路线
                        </div>
                        <div class="panel-body">
                            <form  action="Routediy" method="post" enctype="multipart/form-data">
                                起点
                                <select id="begin" name="begin">
                                    <option value="">请选择...</option>
                                    <option value="谷底森林">谷底森林</option>
                                </select>
                                终点
                                <select id="end" name="end">
                                    <option value="">请选择...</option>
                                    <option value="谷底森林"name="end">谷底森林</option>
                                    <option value="聚龙泉"name="end">聚龙泉</option>
                                    <option value="黑风口"name="end">黑风口</option>
                                    <option value="天豁峰"name="end">天豁峰</option>
                                    <option value="岳桦林"name="end">岳桦林</option>
                                </select>
                                <input type="submit" class="btn btn-info" value ="确定" id='upFile-btn'/>
                            </form>
                        </div>

                    </div>
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            推荐路线
                        </div>
                        <div class="panel-body">
                            <form  action="Route" method="post" enctype="multipart/form-data">

                                <input  type="radio" name="r_style" value="人文路线">人文路线
                                <input  type="radio" name="r_style" value="历史路线">历史路线
                                <input type="submit" class="btn btn-warning" value ="查询" />
                            </form>
                        </div>

                    </div>
                </div>


                <!-- End  Hover Rows  -->
            </div>


            <!-- /. ROW  -->

        </div>
        <!-- /. PAGE INNER  -->
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
