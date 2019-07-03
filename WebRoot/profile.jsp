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
<style>
body{ text-align:center} 
#divcss5{margin:0 auto;border:1px solid #000;width:300px;height:100px}
</style>
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
					<ul id="show_left_ul_2" style="text-align: left;">
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
						<div>详细介绍</div>
						<div>
							<a href="index.jsp">首页</a>&nbsp;&gt;&nbsp;
							<a href="about.jsp">项目简介</a>
						</div>
					</div>
					<c:if test="${param.curPage eq 1 || empty param.curPage }">
					<div id="show_right_box">
						<div>
							<p> 青海大学计算机技术与应用系小型光伏发电站系统青海大学计算机技术与应用系小型光伏发电站系统构建于青海大学融馨楼楼顶，其架构如图1所示，主要由太阳能电池组、太阳能控制器、逆变器、蓄电池(组)和服务器以及其他相关负载组成。
								<p style="text-align:center"><img src="images/solar.png"></p>
							<div>
						</div>
						<ul style="text-align: left;">
							<li>
								<p>图1 小型光伏发电系统示意图如图1所示，在小型光伏发电站系统的线路布局中，光伏组件连接太阳能控制器，太阳能控制器接逆变器、蓄电池以及其他负载。</p>
							</li>
							<li>
								<p style="text-align:center"><img src="images/solar2.png"></p>
							</li>
							<li>
								<p style="text-align:center"><img src="images/solar3.png"></p>
							</li>
							<li>
								<p style="text-align:center"><img src="images/solar5.png"></p>
							</li>
							<li>
								<div>1）光伏组件</div>
								<p>太阳能电池板(Solar panel)通过吸收太阳光，将太阳辐射能通过光电效应或者光化学效应直接或间接转换成电能，太阳能电池板的主要材料为硅。实验采用的太阳能组件置于青海大学校内融馨楼楼顶。</p>
							</li>
							<li>
								<div>2）太阳能控制器</div>
								<p>太阳能控制器又为太阳能充放电控制器，是用在太阳能发电系统中的自动控制设备，用于控制多路太阳能电池方阵对蓄电池充电以及蓄电池给太阳能逆变器负载供电，对发电控制到关键作用。</p>
							</li>
							<li>
								<div>3）逆变器</div>
								<p>太阳能组件中的逆变器主要功能是将蓄电池的直流电逆变成交流电等。通过全桥电路，一般采用SPWM处理器经过调制、滤波、升压等程序，得到与照明负载频率、额定电压等相匹配的正弦交流电供系统终端供用户使用。所以逆变器就可以使直流蓄电池为电器提供交流电。</p>
							</li>
							<li>
								<div>4）蓄电池</div>
								<p>本系统采用的蓄电池组是由12块铅酸电池组成，四块一组，共三组并联。由于电池持续使用超过一年，导致目前电压不够稳定，经常出现报警问题，但总体暂时不影响数据采集功能。</p>
							</li>
							<li>
								<div>5）负载</div>
								<p>实验中运行的负载主要为Dell R720服务器，操作系统为CentOS。我们采用XShell终端远程控制软件来登陆负载服务器进行测试。</p>
							</li>
							<li>
								<div>6）监测软件参数</div>
								<p>监测软件与太阳能系统和负载相关联，负责实时监测负载能耗参数和光照度温度等参数，每十分钟左右记录一次，并把检测到的数据保存到相应文件中。这些数据以时间和数据形式展示，通过监测能够获取到的数据类目如表1所示。 </p>
							</li>	
						</ul>
							<p align="justify">&nbsp;</p>
					  </div>
					 						
					</c:if>
					<c:if test="${param.curPage eq 2 }">
					<div id="show_right_box">
						<div>
							<p> 青海大学计算机技术与应用系小型光伏发电站系统青海大学计算机技术与应用系小型光伏发电站系统构建于青海大学融馨楼楼顶，其架构如图1所示，主要由太阳能电池组、太阳能控制器、逆变器、蓄电池(组)和服务器以及其他相关负载组成。
								<p style="text-align:center"><img src="images/solar.png"></p>
							<div>
						</div>
						<ul style="text-align: left;">
							<li>
								<p>图1 小型光伏发电系统示意图如图1所示，在小型光伏发电站系统的线路布局中，光伏组件连接太阳能控制器，太阳能控制器接逆变器、蓄电池以及其他负载。</p>
							</li>
							<li>
								<p style="text-align:center"><img src="images/solar2.png"></p>
							</li>
							<li>
								<p style="text-align:center"><img src="images/solar3.png"></p>
							</li>
							<li>
								<p style="text-align:center"><img src="images/solar4.png"></p>
							</li>
							<li>
								<div>1）光伏组件</div>
								<p>太阳能电池板(Solar panel)通过吸收太阳光，将太阳辐射能通过光电效应或者光化学效应直接或间接转换成电能，太阳能电池板的主要材料为硅。实验采用的太阳能组件置于青海大学校内融馨楼楼顶。</p>
							</li>
							<li>
								<div>2）太阳能控制器</div>
								<p>太阳能控制器又为太阳能充放电控制器，是用在太阳能发电系统中的自动控制设备，用于控制多路太阳能电池方阵对蓄电池充电以及蓄电池给太阳能逆变器负载供电，对发电控制到关键作用。</p>
							</li>
							<li>
								<div>3）逆变器</div>
								<p>太阳能组件中的逆变器主要功能是将蓄电池的直流电逆变成交流电等。通过全桥电路，一般采用SPWM处理器经过调制、滤波、升压等程序，得到与照明负载频率、额定电压等相匹配的正弦交流电供系统终端供用户使用。所以逆变器就可以使直流蓄电池为电器提供交流电。</p>
							</li>
							<li>
								<div>4）蓄电池</div>
								<p>本系统采用的蓄电池组是由12块铅酸电池组成，四块一组，共三组并联。由于电池持续使用超过一年，导致目前电压不够稳定，经常出现报警问题，但总体暂时不影响数据采集功能。</p>
							</li>
							<li>
								<div>5）负载</div>
								<p>实验中运行的负载主要为Dell R720服务器，操作系统为CentOS。我们采用XShell终端远程控制软件来登陆负载服务器进行测试。</p>
							</li>
							<li>
								<div>6）监测软件参数</div>
								<p>监测软件与太阳能系统和负载相关联，负责实时监测负载能耗参数和光照度温度等参数，每十分钟左右记录一次，并把检测到的数据保存到相应文件中。这些数据以时间和数据形式展示，通过监测能够获取到的数据类目如表1所示。 </p>
							</li>	
						</ul>
							<p align="justify">&nbsp;</p>
					  </div>
					 						
					</c:if>
			<div style="float:right;margin-right:30px;">
			<c:choose>
				<c:when test="${param.curPage eq 1 || empty param.curPage}">
				<span><a href="profile.jsp?curPage=2">下一页</a></span>
				</c:when>
				<c:otherwise>
				<span><a href="profile.jsp?curPage=1">上一页</a></span>
				</c:otherwise>
			</c:choose>
			
			</div>
			<div class="split"></div>
		</div>
	</body>

</html>