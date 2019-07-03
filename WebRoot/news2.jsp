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
                   <dt>青海格尔木市5个光伏项目集中开工</dt>
                   <dd class="show_show_dd1">
                       <span>时间：2017/3/29 9:52:48 </span>
                       <span>来源：青海日报</span>
                       <span>浏览量：164</span>
                   </dd>   
                 	<p>黄河上游100兆瓦并网光伏项目</p>
              		<p>本工程位于青海省格尔木市东出口光伏园区内，总装机容量100兆瓦，共计81个子方阵。本项目建成投运后，将缓解青海电网电量短缺情况，提高光伏发电在能源结构中的比重，这不仅是当地经济可持续发展、人民物质文化生活水平提高的需要，也是青海电力工业发展的需要。对促进地区经济发展、提高能源利用效率、改善环境都将具有深远意义。</p>
               		<p>大唐国际格尔木光伏并网发电工程</p>
               		<p>项目位于格尔木市东出口光伏园区内四、五期光伏并网发电工程装机容量共20兆瓦，工程的主要任务是发电。本工程总投资为18949.6万元，计划于6月30日建成投运。工程充分利用当地丰富的太阳能资源，大力开发光伏电站，保护生态环境，促进当地旅游业的发展，同时也将带动地区相关产业发展，对扩大就业和发展第三产业将有一定的促进作用，从而提高地区国民经济的发展和社会进步。</p>
               		<p>青海绿色发电20兆瓦并网光伏项目</p>
               		<p>格尔木市光伏园区20兆瓦光伏电站项目是由青海省绿色发电集团股份有限公司、青海省发展投资有限公司、青海托日新能源科技有限公司组成联合体，通过竞标取得的，电站装机规模20兆瓦，由生产区和管理区组成。其中，生产区主要包括电池阵列、逆变器室、箱变等，管理区主要包括升压站、中控室等建筑物。电站以35kv电缆接入附近园区新建的110kv升压站后，接入新建的330kv汇集站送出。工程总投资15485.33万元</p>
               </dl>
				</div>
			</div>
			<div class="split"></div>
		</div>
	</body>
</html>
