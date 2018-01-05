<%@ page import="java.util.List" %>
<%@ page import="po.SceneryEntity" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="org.hibernate.Query" %>
<%@ page import="po.BotanyEntity" %>
<%@ page import="po.DistanceEntity" %><%--
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
    < <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
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
                    <h1 class="page-head-line">景区间距离</h1>
                    <h1 class="page-subhead-line">下面是该景点的景区间距离 </h1>

                </div>
            </div>
            <!-- /. ROW  -->

            <div >
                <!--    Hover Rows  -->
                <form action="Scedele" method="post" name="del"  >
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            景点信息
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <td>#</td>
                                        <td>景点id</td>
                                        <td>景点id</td>
                                        <td>距离（公里）</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        int sid = Integer.parseInt(request.getParameter("sid"));
                                        Configuration cfg = new  Configuration().configure();
                                        SessionFactory sf = cfg.buildSessionFactory();
                                        Session hsession = sf.openSession();
                                        Transaction ts = hsession.beginTransaction();
                                        Query q=hsession.createQuery("from DistanceEntity b where b.sid1=?");
                                        q.setInteger(0, sid);
                                        List<DistanceEntity> s =q.list();

                                        for(int i=0;i<s.size();i++){
                                    %>


                                    <tr id="tr_<%=i+1 %>">
                                        <td><input type="checkbox" name="check" id="check" value="<%=s.get(i).getSid1()%>"></input></td>

                                        <td><%=s.get(i).getSid1()%></td>
                                        <td><%=s.get(i).getSid2()%></td>
                                        <td><%=s.get(i).getDis()%></td>


                                        <%--<td><button onclick="location.href='dischange.jsp?sid1=<%=s.get(i).getSid1()%>&&sid2=<%=s.get(i).getSid2()%>'" type="button" class="btn btn-warning">修改</button></td>--%>

                                    </tr>

                                    <%}%>
                                    </tbody>
                                </table>



                                <tr>
                                    <td>
                                        <input type="button" value="首页" onclick="first()"/>
                                        <input type="button" value="上一页" onclick="back()"/>
                                        <input type="button" value="下一页" onclick="next()"/>
                                        <input type="button" value="末页" onclick="last()"/>
                                        <input type="hidden" value="O" id= "pageId"/>
                                        第<span id="pageSpan">1</span>页 | 共<span id="sumSpan"></span>页&nbsp;&nbsp; 共<%=s.size()%>条纪录
                                        <input type="hidden" value="<%=s.size()%>" id= "totalnum">
                                    </td>
                                    <%
                                    %>
                                </tr>
                            </div>
                        </div>
                    </div>

                    <%--<input type="submit" class="btn btn-danger" value="批量删除" ></input>--%>

                </form>
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
