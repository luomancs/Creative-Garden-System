
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <meta name="keywords" content="Flat Dark Web Login Form Responsive Templates, Iphone Widget Template, Smartphone login forms,Login form, Widget Template, Responsive Templates, a Ipad 404 Templates, Flat Responsive Templates" />
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <!--webfonts-->
    <link href='http://fonts.useso.com/css?family=PT+Sans:400,700,400italic,700italic|Oswald:400,300,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.useso.com/css?family=Exo+2' rel='stylesheet' type='text/css'>
    <!--//webfonts-->
    <script src="http://ajax.useso.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script type="text/javascript">
        function error(message)
        {

            if(message.userid.value ==""||message.password.value ==""){
                alert("账号密码不能为空");
                return false;
            }
            if(!isInteger(message.userid.value)){
                alert("账号必须是纯数字");
                return false;
            }
            else{
                return true;
            }
        }
        function isInteger(str) {
            var pattern = /^[0-9]+$/;
            return pattern.test(str);
        }
    </script>
</head>
<body>

<FORM  ACTION="Login" method="post" name="message" onsubmit="return error(this)">
    <script>$(document).ready(function(c) {
        $('.close').on('click', function(c){
            $('.login-form').fadeOut('slow', function(c){
                $('.login-form').remove();
            });
        });
    });
    </script>
    <!--SIGN UP-->
    <h1>用户登录</h1>
    <div class="login-form">
        <div class="close"> </div>
        <div class="head-info">
            <label class="lbl-1"> </label>
            <label class="lbl-2"> </label>
            <label class="lbl-3"> </label>
        </div>
        <div class="clear"> </div>
        <div class="avtar">
            <img src="images/avtar.png" />
        </div>
        <input type="text" class="text" name="id"  >
        <div class="key">
            <input type="password" name="pw" >
        </div>
        <div class="signin">
            <input type="submit"  value="登录" style="font-size: 30px;
  color: #fff;
  outline: none;
  border: none;
  background: #3ea751;
  width: 100%;
  padding: 18px 0;
  border-bottom-left-radius: 15px;
	-webkit-border-bottom-left-radius: 15px;
	-moz-border-bottom-left-radius: 15px;
	-o-border-bottom-left-radius: 15px;
	border-bottom-right-radius: 15px;
	-webkit-border-bottom-right-radius: 15px;
	-moz-border-bottom-right-radius: 15px;
	-o-border-bottom-right-radius: 15px;
	cursor: pointer;">
        </div>

    </div>

    <br>
    <div  style="text-align:center;">
        新用户，点击注册
        <a href="register.jsp">click here </a>
    </div>
</FORM>
</body>
</html>