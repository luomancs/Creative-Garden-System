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
    < <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
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
                    <h1 class="page-head-line">景区浏览</h1>
                    <h1 class="page-subhead-line">下面是该景区的详细信息 </h1>

                </div>
            </div>
            <!-- /. ROW  -->

            <div >
                <!--    Hover Rows  -->

                <div class="panel panel-default">
                    <div class="panel-heading">
                        景区信息
                    </div>
                    <div class="panel-body">
                            <div class="panel-footer">
                                <%
                                    int id = Integer.parseInt(request.getParameter("id"));
                                    Configuration cfg = new  Configuration().configure();
                                    SessionFactory sf = cfg.buildSessionFactory();
                                    Session hsession = sf.openSession();
                                    Transaction ts = hsession.beginTransaction();
                                    Query q=hsession.createQuery("from SceneryEntity s where s.id=?");
                                    q.setInteger(0, id);
                                    List<SceneryEntity> s =q.list();

                                %>


                                景区名称:
                                <font ><%=s.get(0).getName()%></font>
                            </div>
                            <br>
                            <%if(id==1){%>
                            <img src="assets/img/i1.jpg" width="700" height="300" />
                            <%}
                            else if(id==2){%>
                            <img src="assets/img/i2.jpg" width="700" height="300" />
                            <%}
                            else if(id==3){%>
                            <img src="assets/img/i3.jpg" width="700" height="300" />
                            <%}
                            else if(id==4){%>
                            <img src="assets/img/i4.jpg" width="700" height="300" />
                            <%}
                            else if(id==5){%>
                            <img src="assets/img/i5.jpg" width="700" height="300" />
                            <%}%>
                            <br>
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    景区介绍
                                </div>
                                <div class="panel-body">
                                    <p>
             <span name="sss">
             <%=s.get(0).getContext()%>

         </span>
                                        <a name="aaa" href="javascript:;">展开</a>
                                    </p>
                                </div>

                            </div>


                            <div class="panel panel-success">
                                <div class="panel-heading">
                                    其他信息
                                </div>
                                <div class="panel-body">
                                    <%
                                        Configuration cfg2 = new  Configuration().configure();
                                        SessionFactory sf2 = cfg2.buildSessionFactory();
                                        Session hsession2 = sf2.openSession();
                                        Transaction ts2 = hsession.beginTransaction();
                                        Query hquery = hsession2.createQuery("from BotanyEntity u where u.sid=?");
                                        hquery.setInteger(0, id);
                                        List b = hquery.list();
                                        int num = b.size();
                                        ts2.commit();
                                        hsession2.close();
                                    %>
                                    景区内植物数量：
                                    <button name="num" onclick= "location.href='ubotany.jsp?sid=<%=id%>'"type="button" class="btn btn-link"><%=num%></button>

                                </div>

                            </div>


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
<script>
    window.onload = function () {
        var span = document.getElementsByName("sss")[0];
        console.log(span);
        var btn = document.getElementsByName("aaa")[0];
        //拿到所有文字
        var str = span.innerHTML;
        span.innerHTML = str.substring(0, 30)+"...";
        //设置一个开关，记录展开和收缩
        var isOn = true;
        //btn添加事件，在事件里修改span文字
        btn.onclick = function () {
            //点击按钮的时候改变开关的值
            isOn  = !isOn;
            if(isOn == true){
                span.innerHTML = str.substring(0, 30)+"...";
                btn.innerHTML = "展开";

            }else{
                //收缩
                span.innerHTML = str;
                btn.innerHTML = "收缩";
            }
        }
    }
</script>
</body>
</html>
