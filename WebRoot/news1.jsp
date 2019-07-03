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
                   <dt>青海光伏全产业链基本形成</dt>
                   <dd class="show_show_dd1">
                       <span>时间：2017/4/1 14:18:12 </span>
                       <span>来源：中国电力报</span>
                       <span>浏览量：180</span>
                   </dd>   
                 	<p>北极星太阳能光伏网讯:由于受到补贴下调和光伏组件生产成本下降的影响，2016年我国光伏产业实现了迅猛发展，其中光伏新增和累计装机容量均为全球第一。从本期开始，本版将连续推出“光伏发展较快地区亮点管窥”系列报道，重点关注青海、内蒙古、河北、宁夏这四个光伏产业发展较快省（区）发展亮点</p>
              		<p>数据显示，2011~2016年，青海光伏累计发电量267.23亿千瓦时，其中2016年全省光伏累计发电量达到59.48亿千瓦时；截至去年底，全省光伏累计装机容量达到682万千瓦，位居全国第二。</p>
               		<p>资料显示，青海全省年总辐射量达5800~7400兆焦/平方米，省内可用于光伏发电的荒漠化土地达10万平方千米。凭借得天独厚的光照资源和荒漠化土地资源，自2009年开始，青海按照“大集团引领、大项目支撑、集群化发展、园区化承载”的光伏产业发展思路，大力培育和发展光伏产业。</p>
               		<p>值得一提的是，2011年获益于光伏组件价格的下跌以及国家光伏发电项目上网标杆电价的确定，青海在当年就有42个争取优惠电价的光伏发电项目获准建设，其中柴达木盆地光伏装机容量首次突破百万千瓦。随后，连续3年启动实施了三个百万千瓦级光伏电站群建设工程。其中，2014年8月，全球最大水光互补并网光伏项目———中电投黄河上游水电开发有限责任公司龙羊峡水光互补二期530兆瓦并网光伏项目，在海南州生态光伏产业园开工，成为世界上最大的水光互补光伏电站群。使得青海光伏发电势头持续“领跑”全国。</p>
               		<p>基于以上原因，2014年，全球领先的光伏逆变器制造商阳光电源落户西宁国家级经济技术开发区，并投入2亿元用于光伏产业逆变系统产品的研发、生产、销售等，目前阳光电源(青海)公司逆变器产能为1吉瓦，可以满足青海及周边地区光伏逆变器的供应。</p>
               		<p>青海省经信委相关部门负责人告诉记者，目前，青海吸引了包括阳光电源、中电投西安太阳能电力有限公司、中电投黄河上游水电开发有限责任公司以及亚洲硅业等在内的众多有影响力的企业，发展铸锭、切片补链项目，培育逆变器、支架、光伏玻璃等配套产业。现已初步形成从“硅材料—切片—太阳能电池—组件—系统集成—光伏电站”完整的产业链及配套产业群。如今，在青海，所有光伏电站配套产品都能“一站搞定”。</p>
               </dl>
				</div>
			</div>
			<div class="split"></div>
		</div>
	</body>
</html>
