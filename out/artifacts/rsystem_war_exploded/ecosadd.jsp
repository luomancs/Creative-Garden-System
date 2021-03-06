<%@ page import="java.util.List" %>
<%@ page import="po.SceneryEntity" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="org.hibernate.Query" %>
<%@ page import="po.BotanyEntity" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="po.EcosEntity" %><%--
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
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li>
                    <div class="user-img-div">
                        <img src="assets/img/user.png" class="img-thumbnail" />
                        <br>管理员
                        <br>id:
                        <%=request.getAttribute("userid")%>
                        <%--<s:property value="#request.userid" />--%>
                    </div>

                </li>
                <li>
                    <a href="#"><i class="fa fa-desktop "></i>景点管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="first.jsp"><i class="fa fa-circle-o "></i>所有景点</a>
                        </li>
                        <li>
                            <a href="sceneryadd.jsp"><i class="fa fa-flash "></i>新建景点</a>
                        </li>

                    </ul>
                </li>
                <li>
                    <a href="botany.jsp"><i class="fa fa-edit "></i>植物管理 <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="botany.jsp"><i class="fa fa-toggle-on"></i>浏览</a>
                        </li>
                        <li>
                            <a href="boadd.jsp"><i class="fa fa-flash "></i>新建植物</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="ecos.jsp"><i class="fa fa-bug "></i>生态环境<span class="fa arrow"></span></a>

                </li>
                <li>
                    <a href="index.jsp"><i class="fa fa-sign-in "></i>退出登录</a>
                </li>

            </ul>
        </div>

    </nav>
    <!-- /. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li>
                    <div class="user-img-div">
                        <img src="assets/img/user.png" class="img-thumbnail" />
                        <br>管理员
                        <br>id:
                        <%=request.getAttribute("userid")%>
                        <%--<s:property value="#request.userid" />--%>
                    </div>

                </li>
                <li>
                    <a href="#"><i class="fa fa-desktop "></i>景点管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="first.jsp"><i class="fa fa-circle-o "></i>所有景点</a>
                        </li>
                        <li>
                            <a href="sceneryadd.jsp"><i class="fa fa-flash "></i>新建景点</a>
                        </li>

                    </ul>
                </li>
                <li>
                    <a href="botany.jsp"><i class="fa fa-edit "></i>植物管理 <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="botany.jsp"><i class="fa fa-toggle-on"></i>浏览</a>
                        </li>
                        <li>
                            <a href="boadd.jsp"><i class="fa fa-flash "></i>新建植物</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="ecos.jsp"><i class="fa fa-bug "></i>生态环境<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="ecos.jsp"><i class="fa fa-toggle-on"></i>生态环境</a>
                        </li>
                        <li>
                            <a href="ecosadd.jsp"><i class="fa fa-flash "></i>增加</a>
                        </li>
                    </ul>
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
                    <h1 class="page-head-line">景点修改</h1>
                    <h1 class="page-subhead-line"> </h1>

                </div>
            </div>
            <!-- /. ROW  -->

            <div >
                <!--    Hover Rows  -->

                <div class="panel panel-default">
                    <div class="panel-heading">
                        景点信息
                    </div>
                    <form action="Ecosadd" method="post" name="sub" onsubmit="return error(this)">
                        <div id="collapseTwo" class="panel-collapse in" style="height: auto;">
                            <div class="panel-body">
                                <div class="col-md-6 col-sm-6 col-xs-12" style="left:100px;width:500px">
                                    <div class="panel panel-info">
                                        <div class="panel-heading">
                                            景点信息
                                        </div>


                                        <div class="panel-body" >
                                            <div class="form-group" >
                                                <label> 日期</label>
                                                <input name="day" id="d244" type="text" name="day" class="Wdate" style="height:30px;"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',vel:'d244_2'})"/>

                                            </div>
                                            <div class="form-group" >
                                                <label>温度</label>
                                                <input name="tem" class="form-control" type="text" >
                                            </div>
                                            <div class="form-group">
                                                <label>湿度</label>
                                                <input name="hum" class="form-control" type="text" >
                                            </div>
                                            <div class="form-group">
                                                <label>PM2.5</label>
                                                <input name="pm" class="form-control" type="text" >
                                            </div>
                                            <div class="form-group">
                                                <label>风度</label>
                                                <input name="wind" class="form-control" type="text" >
                                            </div>
                                            <div class="form-group">
                                                <label>穿衣推荐</label>
                                                <input name="clo" class="form-control" type="text" >
                                            </div>


                                            <button type="submit"  class="btn btn-info" style="margin-left:160px;width:100px">提交</button>


                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>

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
<script language="javascript" type="text/javascript" src="assets/js/My97DatePicker/WdatePicker.js"></script>
</body>
</html>
