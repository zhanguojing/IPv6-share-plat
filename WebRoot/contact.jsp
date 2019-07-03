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
<link rel="stylesheet" type="text/css" href="css/contact.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/highcharts.js"></script>
<script type="text/javascript" src="js/exporting.js"></script>
<script type="text/javascript" src="js/highcharts-zh_CN.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<!--map-->
<link rel="stylesheet" href="css/font-awesome.css">
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=j058EA2Ht5Lhs16UFdgRGi8YnwgxLdEP"></script>
<!--map-->
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
				<a href="contact.jsp" target="_blank">联系我们</a> <a
					href="javascript:download(${sessionScope.user.level});"
					target="_blank">下载数据</a>
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
					<span>联系我们</span> <span>CONTACT US</span>
				</div>
				<ul id="show_left_ul_1">
					<li><a href="contact.jsp">联系我们</a></li>
				</ul>

				<div id="show_left_new">
					<span>新闻咨询</span> <span><a href="">MORE+</a></span>
				</div>
				<ul id="show_left_ul_2">
					<li><a href="news1.jsp">青海光伏全产业链基本形成</a></li>
					<li><a href="news2.jsp">青海格尔木市5个光伏项目集中开工</a></li>
					<li><a href="news3.jsp">光伏扶贫的高原变奏</a></li>
				</ul>
			</div>
			<div id="show_right">
				<div id="show_right_head">
					<div>联系我们</div>
					<div>
						<a href="index.jsp">首页</a>&nbsp;&gt;&nbsp; <a>联系我们</a>
					</div>
				</div>
				<div id="show_right_box">
					<div class=" col-md-8 col-sm-8 col-xs-7 contact-map">
						<div class="map-grid">
							<!--<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3023.948805392833!2d-73.99619098458929!3d40.71914347933105!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c25a27e2f24131%3A0x64ffc98d24069f02!2sCANADA!5e0!3m2!1sen!2sin!4v1479793484055"></iframe>-->
							<!--<iframe id="map"></iframe>-->
							<div style=" width: 100%;
    height: 384px;
    border: 0;"
								id="map"></div>


						</div>
					</div>
					<dl>
						<dt class="big_font">光伏电站监控数据共享平台</dt>
						<dt class="big_font">青海大学计算机技术与应用系</dt>

						<dt>邮箱:459492933@qq.com</dt>

						<dt>
							网站:<a href="http://49.209.80.36:11115/Power/">http://49.209.80.36:11115/Power/</a><br />
						</dt>
						<dt>地址:西宁市城北区宁大路251号</dt>
					</dl>
					<!-- <div>
								<img src="images/dxs.png" alt="">
							</div> -->


				</div>
			</div>
		</div>
		<div class="split"></div>
	</div>

</body>


<!--map-->
<script type="text/javascript">
	//创建和初始化地图函数：
	function initMap() {
		createMap(); //创建地图
		setMapEvent(); //设置地图事件
		addMapControl(); //向地图添加控件
		addMapOverlay(); //向地图添加覆盖物
	}
	function createMap() {
		map = new BMap.Map("map");
		map.centerAndZoom(new BMap.Point(101.767676, 36.728098), 13);
	}
	function setMapEvent() {
		map.enableScrollWheelZoom();
		map.enableKeyboard();
		map.enableDragging();
		map.enableDoubleClickZoom()
	}
	function addClickHandler(target, window) {
		target.addEventListener("click", function() {
			target.openInfoWindow(window);
		});
	}
	function addMapOverlay() {
		var markers = [
			{
				content : "",
				title : "青海大学",
				imageOffset : {
					width : 0,
					height : 3
				},
				position : {
					lat : 36.734403,
					lng : 101.756105
				}
			}
		];
		for (var index = 0; index < markers.length; index++) {
			var point = new BMap.Point(markers[index].position.lng, markers[index].position.lat);
			var marker = new BMap.Marker(point, {
				icon : new BMap.Icon("http://api.map.baidu.com/lbsapi/createmap/images/icon.png", new BMap.Size(20, 25), {
					imageOffset : new BMap.Size(markers[index].imageOffset.width, markers[index].imageOffset.height)
				})
			});
			var label = new BMap.Label(markers[index].title, {
				offset : new BMap.Size(25, 5)
			});
			var opts = {
				width : 200,
				title : markers[index].title,
				enableMessage : false
			};
			var infoWindow = new BMap.InfoWindow(markers[index].content, opts);
			marker.setLabel(label);
			addClickHandler(marker, infoWindow);
			map.addOverlay(marker);
		}
		;
	}
	//向地图添加控件
	function addMapControl() {
		var scaleControl = new BMap.ScaleControl({
			anchor : BMAP_ANCHOR_BOTTOM_LEFT
		});
		scaleControl.setUnit(BMAP_UNIT_IMPERIAL);
		map.addControl(scaleControl);
		var navControl = new BMap.NavigationControl({
			anchor : BMAP_ANCHOR_TOP_LEFT,
			type : BMAP_NAVIGATION_CONTROL_LARGE
		});
		map.addControl(navControl);
		var overviewControl = new BMap.OverviewMapControl({
			anchor : BMAP_ANCHOR_BOTTOM_RIGHT,
			isOpen : true
		});
		map.addControl(overviewControl);
	}
	var map;
	initMap();
</script>

<!--map-->

</html>