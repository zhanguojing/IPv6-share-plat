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
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/base.css">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/nivo_slider/default.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
<script type="text/javascript" type="text/javascript" src="js/common.js"></script>
	</head>

	<script src='js/swiper.js'></script>
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
				<li><a href="analyse.jsp">统计分析</a></li>
				<li><a href="contact.jsp">联系我们</a></li>
			</ul>
		</div>
    <div id="wrapper">
			<div class="slider-wrapper theme-default">
				<div id="indexSlider" class="nivoSlider">
					
					<a href="about.jsp"><img src="images/slider.png" /></a>
					<a href="about.jsp"><img src="images/2.jpg" /></a>
					<a href="about.jsp"><img src="images/2.jpg" /></a>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
		<script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>
		<script type="text/javascript">
			$(window).load(function() {
				$('#indexSlider').nivoSlider({
					controlNav : false
				});
			});
		</script>
    <!-- jieshao -->
    <div class="sun w">
        <h2>太阳能</h2>
        <p>太阳能(solar energy)，是指太阳的热辐射能(参见热能传播的三种方式:辐射)，主要表现就是常说的太阳光线。在现代一般用作发电或者为热水器提供能源。自地球上生命诞生以来，就主要以太阳提供的热辐射能生存，而自古人类也懂得以阳光晒干物件，并作为制作食物的方法，如制盐和晒咸鱼等。在化石燃料日趋减少的情况下，太阳能已成为人类使用能源的重要组成部分，并不断得到发展。太阳能的利用有光热转换和光电转换两种方式，太阳能发电是一种新兴的可再生能源。广义上的太阳能也包括地球上的风能、化学能、水能等。</p>
    </div>
    <div class="copy w">
        <span class='l'>Copyright &copy;青海大学</span>
        &nbsp; &nbsp;
        <span class="r">版权所有，翻版必究</span>
    </div>
    </div>
</body>

</html>


