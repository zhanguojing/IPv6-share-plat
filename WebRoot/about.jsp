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
<link rel="stylesheet" type="text/css" href="css/about.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/highcharts.js"></script>
<script type="text/javascript" src="js/exporting.js"></script>
<script type="text/javascript" src="js/highcharts-zh_CN.js"></script>
<script type="text/javascript" src="js/common.js"></script>
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
						<span>项目简介</span>
						<span>project profile</span>
					</div>
					<ul id="show_left_ul_1">
						<li>
							<a href="about.jsp">项目简介</a>
						</li>
						<li>
							<a href="profile.jsp">详细介绍</a>
						</li>
					</ul>

					<div id="show_left_new">
						<span>新闻咨询</span>
						<span><a href="">MORE+</a></span>
					</div>
					<ul id="show_left_ul_2">
						<li>
							<a href="news1.jsp">青海光伏全产业链基本形成</a>
						</li>
						<li>
							<a href="news2.jsp">青海格尔木市5个光伏项目集中开工</a>
						</li>
						<li>
							<a href="news3.jsp">光伏扶贫的高原变奏</a>
						</li>
					</ul>
				</div>
				<div id="show_right">
					<div id="show_right_head">
						<div>项目简介</div>
						<div>
							<a href="index.jsp">首页</a>&nbsp;&gt;&nbsp;
							<a href="about.jsp">项目简介</a>
						</div>
					</div>
					<div id="show_right_box">
						<div>
							<p align="justify">能源问题已成为世界性的问题,随着经济发展和人民生活水平的提高,能源需求将持续增长,新能源的利用不仅是我国经济可持续发展的瓶颈产业,也是世界经济新一轮发展的主导产业之一。太阳能发电产业的发展在新能源中异常迅猛，为了保证太阳能发电设备能稳定高效地工作，必须将太阳能板发电过程中的各项实时监测数据，有效传递给太阳能发电的监测人员，以便能及时有效的了解所监测的太阳能发电阵列的工作运行环境及工作情况，并分析管理监测到的各项数据。</p>
							<p align="justify">青海大学计算机技术与应用系目前架设的小型太阳能光伏电站，能够定期采集到太阳能发电设备相关的一系列数据以及环境监测数据。但这些数据存储在监控PC机上，很难方便和及时的获取，也不利于直观查看。此项目针对以上情况拟构建基于web的光伏电站监控数据共享平台。Web 服务器将得到的结果进行转化处理，将含有 Java Applet的 HTML 页面发给客户端浏览器以 Web 页面形式显示出来。从而为研究者共享光伏电站的历史数据，实现数据资源的共享。 </p>
						</div>
						<div>
							<img src="images/jk1.png">
						</div>
					</div>
				</div>
			</div>
			<div class="split"></div>
		</div>
	</body>

</html>