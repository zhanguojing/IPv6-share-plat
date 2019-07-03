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
<link rel="stylesheet" type="text/css" href="css/news.css">
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
							<a href="contact.jsp">关于我们</a>
						</li>
						<li>
							<a href="">发展历程</a>
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
						<div>新闻资讯</div>
						<div>
							<a href="index.jsp">首页</a>&nbsp;&gt;&nbsp;
							<a href="about.jsp">项目简介</a>&nbsp;&gt;&nbsp;
							<a>新闻资讯</a>
						</div>
					</div>
					<div class="show_right_box">
               <dl class="show_show">
                   <dt>光伏扶贫的高原变奏</dt>
                   <dd class="show_show_dd1">
                       <span>时间：2017/2/10 14:26:15 </span>
                       <span>来源：中外对话</span>
                       <span>浏览量：140</span>
                   </dd>   
                 	<p>平均海拔超过3000米的青海是中国西北部的一个高原省份，面积有近三个英国大，人口还不到英国的十分之一。随着总投资300亿规模的光伏扶贫工程在中国各地展开，一望无际的高原草甸上，除了牧民的帐篷，也开始出现大片闪亮的光伏板。</p>
              		<p>在贵南县木格滩10兆瓦光伏扶贫电站项目的建设现场，工程已经接近尾声。正在工作的朱师傅说：“政府上午才来人检查防雷系统、确认安全性，应该不多日子就能上网发电了。”</p>
               		<p>早在国家的政策出台之前的两个月，青海就决定在全省8个县的30个贫困村开展光伏扶贫试点。青海的确具备发展光伏的有利条件。一方面，高原上大气层相对稀薄，日光透过率高，加之气候干旱，降雨量少，太阳能资源十分丰富。另一方面，青海有将近三个英国大，有大量适于铺设光伏板的荒漠化土地。重新利用被废弃的草场发展清洁能源，听上去一举多得。</p>
               		<p>按照纸面上的计划，贵南县——一个被《孤独行星》旅游指南称为“交通不便”，“很少迎来游客”，绝大多数人口为藏族的县，被选为木格滩10兆瓦光伏扶贫电站项目的合作方。按照计划，项目建成后，556户贫困户可以享受光伏扶贫电站的收益权，户均创收每年4000元。</p>
               		<p>但中外对话发现，这个政策被电厂做了另一种“解读”。电厂员工朱师傅告诉记者，电厂直接将政策设定的每户每年售电收益4000元发给了各家各户，余下所有的发电收益则归属电厂。</p>
               		<p>然而，记者走访的当地牧户表示，并没有听说过这笔来自企业的补贴。事实上，不止一位牧民告诉记者，他们以为这个电站是为了“西电东送”建的。以扶助贫困为政策目标的项目却被当地牧民理解为缓解东部经济发达地区的用电压力。</p>
               </dl>
				</div>
			</div>
			<div class="split"></div>
		</div>
	</body>
</html>
