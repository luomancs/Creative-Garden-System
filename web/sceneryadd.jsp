<%@ page import="java.util.List" %>
<%@ page import="po.SceneryEntity" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="org.hibernate.Query" %><%--
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
            <a class="navbar-brand" >管理员</a>
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
                    <h1 class="page-head-line">景点新建</h1>
                    <h1 class="page-subhead-line"> </h1>

                </div>
            </div>
            <!-- /. ROW  -->

            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" class="collapsed" name="aim">批量增加</a>
                        </h4>
                    </div>

                    <form id="file_form" action="Sceaddpi" method="post" enctype="multipart/form-data">
                        <div id="collapseOne" class="panel-collapse collapse" style="height: 0px;">
                            <div class="panel-body">
                                <div class="col-md-6 col-sm-6 col-xs-12" style="left:100px;width:500px">
                                    <div class="panel panel-info">
                                        <div class="panel-heading">
                                            选择一个文件：
                                        </div>
                                        <font color="#008b8b">
                                            &nbsp;&nbsp;格式如下：<br>
                                            &nbsp;&nbsp;景点id | 名称 | 内容
                                        </font>
                                        <div class="panel-body" >
                                            <input type="file" name="file" id="file_input" />
                                            <BR/> <BR/>
                                            <input type ="submit" class="btn btn-info" value ="上传" id='upFile-btn'/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" name="content">单个增加</a>
                        </h4>
                    </div>
                    <form action="Sceadd" method="post" name="sub" onsubmit="return error(this)">
                        <div id="collapseTwo" class="panel-collapse in" style="height: auto;">
                            <div class="panel-body">
                                <div class="col-md-6 col-sm-6 col-xs-12" style="left:100px;width:500px">
                                    <div class="panel panel-info">
                                        <div class="panel-heading">
                                            景点信息
                                        </div>
                                        <div class="panel-body" >
                                            <div class="form-group" >
                                                <label>景点id</label>
                                                <input name="sceid" class="form-control" type="text">
                                            </div>
                                            <div class="form-group" >
                                                <label>景点名称</label>
                                                <input name="scename" class="form-control" type="text">
                                            </div>
                                            <div class="form-group">
                                                <label>景点内容</label>
                                                <textarea name="scecontext" class="form-control" rows="3"></textarea>
                                            </div>


                                            <button type="submit"  class="btn btn-info" style="margin-left:160px;width:100px">提交</button>


                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

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
