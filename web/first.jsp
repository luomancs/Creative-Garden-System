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
    <style>
        p{
            width: 400px;
        }
    </style>

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
                    <h1 class="page-head-line">景点浏览</h1>
                    <h1 class="page-subhead-line">下面是所有景点信息 </h1>

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
                                        <td>id</td>
                                        <td>名称</td>
                                        <td>介绍</td>
                                        <td>景区内植物</td>
                                        <td>景区间距离</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        Configuration cfg = new  Configuration().configure();
                                        SessionFactory sf = cfg.buildSessionFactory();
                                        Session hsession = sf.openSession();
                                        Transaction ts = hsession.beginTransaction();
                                        Query q=hsession.createQuery("from SceneryEntity ");

                                        List<SceneryEntity> s=q.list();

                                        for(int i=0;i<s.size();i++){
                                    %>


                                    <tr id="tr_<%=i+1 %>">
                                        <td><input type="checkbox" name="check" id="check" value="<%=s.get(i).getId()%>"></input></td>
                                        <td><%=s.get(i).getId()%></td>
                                        <td><%=s.get(i).getName()%></td>
                                        <td> <p>
             <span name="sss">
             <%=s.get(i).getContext()%>

         </span>
                                            <a name="aaa" href="javascript:;">展开</a>
                                        </p></td>


                                        <%
                                            Configuration cfg2 = new  Configuration().configure();
                                            SessionFactory sf2 = cfg2.buildSessionFactory();
                                            Session hsession2 = sf2.openSession();
                                            Transaction ts2 = hsession.beginTransaction();
                                            Query hquery = hsession2.createQuery("from BotanyEntity u where u.sid=?");
                                            hquery.setInteger(0, s.get(i).getId());
                                            List b = hquery.list();
                                            int num = b.size();
                                            ts2.commit();
                                            hsession2.close();
                                        %>
                                        <td> <a href="botany2.jsp?sid=<%=s.get(i).getId()%>"><%=num%></a></td>
                                        <td><button type="button" class="btn btn-link" onclick= "location.href='distance.jsp?sid=<%=s.get(i).getId()%>'">查看</button></td>
                                        <td><button onclick="location.href='scechange.jsp?id=<%=s.get(i).getId()%>'" type="button" class="btn btn-warning">修改</button></td>
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

                    <input type="submit" class="btn btn-danger" value="批量删除" ></input>
                </form>
                <button onclick="location.href='sceneryadd.jsp'" class="btn btn-success"><i class="glyphicon glyphicon-plus"></i>新建</button>
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
