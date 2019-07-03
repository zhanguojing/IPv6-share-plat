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
<link rel="stylesheet" type="text/css" href="css/display.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="js/highcharts.js"></script>
<script type="text/javascript" src="js/exporting.js"></script>
<script type="text/javascript" src="js/highcharts-zh_CN.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript">
	$(function() {
		//加载数据并设置定时器 每隔13分钟刷新一次数据
		refreshData(1,1);
		window.clearInterval("refreshData(1,1)");
		//window.setInterval("refreshData(1,1)",780000);
		
		$('.parentSelect').mouseenter(function(){
        $(this).children('.childSelect').show();
		}).mouseleave(function(event){
		        $(this).children('.childSelect').hide();
		});
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
				<a href="contact.jsp" target="_blank">联系我们</a> <a href="javascript:download(${sessionScope.user.level});" target="_blank">下载数据</a>
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
				<li><a href="index.jsp">首页</a></li>
				<li><a href="about.jsp">项目简介</a></li>
				<li><a href="display.jsp">在线展示</a></li>
				<li><a href="power.jsp">发电概况</a></li>
				<li><a href="analyse.jsp">统计数据</a></li>
				<li><a href="contact.jsp">联系我们</a></li>
			</ul>
		</div>
		<img id="slider" src="images/slider.png">
		<div id="show_div">
			<div id="show_left">
					<div id="show_left_head">
						<span>在线展示</span> <span>online display</span>
					</div>
					<ul class="parentSelect">
						<li>
							<a class="fa fa-caret-right" >负载消耗</a>
						</li>
							<ul id="childSelect_1" class="childSelect" >
								<li><a href="javascript:refreshData(1,1)">输出电压</a></li>
								<li><a href="javascript:refreshData(1,2)">输出电流</a></li>
								<li><a href="javascript:refreshData(1,3)">输出功率</a></li>
								<li><a href="javascript:refreshData(1,4)">日耗电量</a></li>
								<li><a href="javascript:refreshData(1,5)">月耗电量</a></li>
								<li><a href="javascript:refreshData(1,6)">总耗电量</a></li>
							</ul>
					</ul>
					<ul class="parentSelect">
						<li>
							<a  class="fa fa-caret-right">环境参数</a>
						</li>
						<ul id="childSelect_2" class="childSelect" >
							<li><a href="javascript:refreshData(2,1)">光照度</a></li>
							<li><a href="javascript:refreshData(2,2)">风速</a></li>
							<li><a href="javascript:refreshData(2,3)">温度</a></li>
						</ul>
					</ul>
					<ul class="parentSelect">
						<li>
							<a  class="fa fa-caret-right">市电参数</a>
						</li>
						<ul id="childSelect_3" class="childSelect" >
							<li><a href="javascript:refreshData(3,1)">输出电压</a></li>
							<li><a href="javascript:refreshData(3,2)">输出电流</a></li>
							<li><a href="javascript:refreshData(3,3)">输出功率</a></li>
							<li><a href="javascript:refreshData(3,4)">日供电量</a></li>
							<li><a href="javascript:refreshData(3,5)">月供电量</a></li>
							<li><a href="javascript:refreshData(3,6)">总供电量</a></li>
						</ul>
					</ul>
					<ul class="parentSelect">
						<li>
							<a  class="fa fa-caret-right">逆变器参数</a>
						</li>
						<ul id="childSelect_4" class="childSelect" >
							<li><a href="javascript:refreshData(4,1)">输出电压</a></li>
							<li><a href="javascript:refreshData(4,2)">输出电流</a></li>
							<li><a href="javascript:refreshData(4,3)">输出功率</a></li>
							<li><a href="javascript:refreshData(4,4)">日供电量</a></li>
							<li><a href="javascript:refreshData(4,5)">月供电量</a></li>
							<li><a href="javascript:refreshData(4,6)">总供电量</a></li>
						</ul>
					</ul>
					<ul class="parentSelect">
						<li>
							<a  class="fa fa-caret-right" >太阳能控制器</a>
						</li>
						<ul id="childSelect_5" class="childSelect" >
							<li><a href="javascript:refreshData(5,1)">电池电压</a></li>
							<li><a href="javascript:refreshData(5,2)">光伏输入电流</a></li>
							<li><a href="javascript:refreshData(5,3)">负载输出电流</a></li>
							<li><a href="javascript:refreshData(5,4)">充放电电流</a></li>
							<li><a href="javascript:refreshData(5,5)">日发电量</a></li>
							<li><a href="javascript:refreshData(5,6)">月发电量</a></li>
							<li><a href="javascript:refreshData(5,7)">总发电量</a></li>
							<li><a href="javascript:refreshData(5,8)">总运行时间</a></li>
						</ul>
					</ul>
				</div>
			<div id="show_right">
				<div id="show_right_head">
					<div>在线展示</div>
					<div>
						<a href="index.jsp">首页</a>&nbsp;&gt;&nbsp;<a href="display.jsp">在线展示</a>
					</div>
				</div>
				<div id="date_div">
					<span>起始时间&nbsp;<input id="startDate" type="date" name="startDate"></span> <span>结束时间&nbsp;<input
						id="endDate" type="date" name="endDate"></span> <span><button id="date_button">查询</button></span>
				</div>
				<div id="container" style="min-width:400px;height:400px"></div>
			</div>
		</div>
		<div class="split"></div>
	</div>
</body>
</html>
