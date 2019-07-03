<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String divath = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ divath + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>青海大学计算机技术与应用系光伏电站监控数据共享平台</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="exdivires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/download.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/highcharts.js"></script>
<script type="text/javascript" src="js/exporting.js"></script>
<script type="text/javascript" src="js/highcharts-zh_CN.js"></script>
<script type="text/javascript" src="js/common.js"></script>
	</head>

	<body>
		<div><h1>请选择需要下载的数据类别</h1></div>
		<div><select id="select">
			<option value="1">负载消耗</option>
			<option value="2">环境参数</option>
			<option value="3">逆变器参数</option>
			<option value="4">市电参数</option>
			<option value="5">太阳能控制器</option>
		</select></div>
		<div><h1>
			<c:if test="${sessionScope.user.level==0}">
				请选择时间段(您是普通用户可以下载一周的数据)
			</c:if>
			<c:if test="${sessionScope.user.level==1}">
				请选择时间段(您是VIP用户可以下载一年的数据)
			</c:if>
		</h1></div>
		<div><label for="startDate">开始时间:</label><input type="date" id="startDate"></div>
		<div><label for="endDate">结束时间:</label><input type="date" id="endDate"></div>
		<div><button id="download_button" onclick="startDownload(${sessionScope.user.level});">下载</button></div>
	</body>

</html>