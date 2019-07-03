<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>青海大学计算机技术与应用系光伏电站监控数据共享平台</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/highcharts.js"></script>
<script type="text/javascript" src="js/exporting.js"></script>
<script type="text/javascript" src="js/highcharts-zh_CN.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript">
	function login() {
		if (!/^[0-9]*$/.test($('#no').val())||$('#no').val()=='') {
			$('#login_window h2').text('账号只能为数字!');
			$('#no').val("").focus();
			return false;
		}
		if ($('#password').val()=='') {
			$('#login_window h2').text('密码不允许为空');
			$('#password').val("").focus();
			return false;
		}
		$.post("userServlet?type=loginValidate", $('#login_form').serialize(), function(data) {
			if (data.indexOf("200") != -1) {
				if (data.split("_")[1] == "admin") {
					location.href = "userServlet?type=query&curPage=1";
				} else {
					location.href = "index.jsp";
				}
				
			} else if (data== 500) {
				$('#login_window h2').text('密码错误');
				$('#password').val("").focus();
			} else if (data== 400) {
				$('#login_window h2').text('账号不存在');
				$('#no').val("").focus();
			}
		});
	}
	//跳转到注册界面
	function register() {
		location.href = "register.jsp";
	}
	$(function(){
		$(window).resize(function(){ 
				$('#login_window').css({ 
					position:'absolute', 
					left: ($(window).width() - $('#login_window').outerWidth())/2, 
					top: ($(window).height() - $('#login_window').outerHeight())/2 + $(document).scrollTop() 
				}); 
			}); 
			//初始化函数 
			$(window).resize(); 
	});
</script>
  </head>
  <body>
  	<div id="login_window">
  		<h1>用户登录</h1>
			<form id="login_form" method="post">
			<p>
				<input type="text" class="text" id="no" name="no" placeholder="账号">
			</p>
			<p>
				<input type="password" class="text" id="password" name="password" placeholder="密码">
			</p>
			<p>
				<button type="button" id="login_button" onclick="login()">登录</button>
			</p>
			
	
		</form>
		<h2></h2>
	</div>
  </body>
</html>
