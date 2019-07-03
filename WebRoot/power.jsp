<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" type="text/css" href="css/power.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/highcharts.js"></script>
<script type="text/javascript" src="js/exporting.js"></script>
<script type="text/javascript" src="js/highcharts-zh_CN.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript">
	$(function() {
		//初始化数据，并每隔1分钟刷新一次数据
		refreshData(5,5);
		window.clearInterval("refreshData(5,5)");
		//window.setInterval("refreshData(5,5)",60000);
	});
</script>
	</head>

	<body>
		<div id="content">
			<div id="top">
				<div id="top_left">
				<c:if test="${sessionScope.user==null}">
					<a href="login.jsp">登录</a>
					<a href="register.jsp">注册</a>
				</c:if>
				<c:if test="${sessionScope.user!=null}">
					<a>${sessionScope.user.name}</a>
					<a href="userServlet?type=exitUser">注销</a>
				</c:if>
			</div>
				<div id="top_right">
					<a href="contact.jsp" target="_blank">联系我们</a>
					<a href="javascript:download(${sessionScope.user.level});" target="_blank">下载数据</a>
				</div>
			</div>
			<div id="logo_div">
				<img src="images/logo.png">
				<ul>
					<li>·</li>
					<li>绿色环保</li>
					<li>·</li>
					<li>共享开发</li>
				</ul>
			</div>
			<div id="navigation">
				<ul>
					<li>
						<a href="index.jsp">首页</a>
					</li>
					<li>
						<a href="about.jsp">项目简介</a>
					</li>
					<li>
						<a href="display.jsp">在线展示</a>
					</li>
					<li>
						<a href="power.jsp">发电概况</a>
					</li>
		<li><a href="analyse.jsp">统计数据</a></li>
					<li>
						<a href="contact.jsp">联系我们</a>
					</li>
				</ul>
			</div>
			<img id="slider" src="images/slider.png">
			<div id="show_div">
				<div id="show_left">
					<div id="show_left_head">
						<span>发电概况</span> <span>power profile</span>
					</div>
					<ul id="parentSelect">
							<li><a href="javascript:refreshData(5,5)">周发电量</a></li>
							<li><a href="javascript:refreshData(5,6)">月发电量</a></li>
							<li><a href="javascript:refreshData(5,7)">总发电量</a></li>
					</ul>
				</div>
				<div id="show_right">
					<div id="show_right_head">
						<div>发电概况</div>
						<div>
							<a href="index.jsp">首页</a>&nbsp;&gt;&nbsp;
							<a>发电概况</a>
						</div>
					</div>
					<div id="date_div">
					<span>起始时间&nbsp;<input id="startDate" type="date" name="startDate"></span> <span>结束时间&nbsp;<input
						id="endDate" type="date" name="endDate"></span> <span><button id="date_button">查询</button></span>
				</div>
					<div id="container"></div>
				</div>
			</div>
			<div class="split"></div>
		</div>
	</body>

</html>