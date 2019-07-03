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
<link rel="stylesheet" type="text/css" href="css/card.css">
<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="js/highcharts.js"></script>
<script type="text/javascript" src="js/highcharts-more.js"></script>
<script type="text/javascript" src="js/solid-gauge.js"></script>
<script type="text/javascript" src="js/exporting.js"></script>
<script type="text/javascript" src="js/highcharts-zh_CN.js"></script>
<script type="text/javascript" src="js/common2.js"></script>

       

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

<style>
.card {
    float:left;
    margin:20px 20px 20px 20px;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    transition: 0.3s;
    width: 100px;
    border-radius: 5px;
}

.card:hover {
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

.he {
display: table-cell;
     width: 100px;
     height:100px;
     background-color:#5CACEE;
     color: white;
     font-size:20px;
     vertical-align: middle;
     text-align:center;
     

}

.conten {
    padding: 2px 16px;
    height:30px;
    text-align:center;
    font-size:10px;
    
}
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
		<img id="slider" src="images/slider.png">
		<div id="show_div">
			<div id="show_left">
					<div id="show_left_head">
						<span>统计分析</span> <span>analyse</span>
					</div>
				
					<ul class="parentSelect">
						<li>
							<a  class="fa fa-caret-right">市电参数</a>
						</li>
						<ul id="childSelect_3" class="childSelect" >
							<li><a href="javascript:newData(3,4,2,1)">供电功率与光照</a></li>
							<li><a href="javascript:newData(3,4,2,2)">供电功率与风速</a></li>
							<li><a href="javascript:newData(3,4,2,3)">供电功率与温度</a></li>
						</ul>
					</ul>
					<ul class="parentSelect">
						<li>
							<a  class="fa fa-caret-right">逆变器参数</a>
						</li>
						<ul id="childSelect_4" class="childSelect" >
							<li><a href="javascript:newData(4,4,2,1)">供电功率与光照</a></li>
							<li><a href="javascript:newData(4,4,2,2)">供电功率与风速</a></li>
							<li><a href="javascript:newData(4,4,2,3)">供电功率与温度</a></li>
						</ul>
					</ul>
					<!-- 
					<ul class="parentSelect">
						<li>
							<a  class="fa fa-caret-right" >太阳能控制器</a>
						</li>
						<ul id="childSelect_5" class="childSelect" >
							<li><a href="javascript:newData(5,1,2,1)">电池电压与光照</a></li>
							<li><a href="javascript:newData(5,1,2,2)">电池电压与风速</a></li>
							<li><a href="javascript:newData(5,1,2,3)">电池电压与温度</a></li>
							<li><a href="javascript:newData(5,4,2,1)">充放电电流与光照</a></li>
							<li><a href="javascript:newData(5,4,2,2)">充放电电流与风速</a></li>
							<li><a href="javascript:newData(5,4,2,3)">充放电电流与温度</a></li>
							<li><a href="javascript:newData(5,5,2,1)">发电量与光照</a></li>
							<li><a href="javascript:newData(5,5,2,2)">发电量与风速</a></li>
							<li><a href="javascript:newData(5,5,2,3)">发电量与温度</a></li>
						</ul>
					</ul> -->
				</div>
			<div id="show_right">
				<div id="show_right_head">
					<div>统计分析</div>
					<div>
						<a href="index.jsp">首页</a>&nbsp;&gt;&nbsp;<a href="analyse.jsp">统计分析</a>
					</div>
				</div>
				<div id="date_div">
					<span>起始时间&nbsp;<input id="startDate" type="date" name="startDate"></span> <span>结束时间&nbsp;<input
						id="endDate" type="date" name="endDate"></span> <span><button id="date_button">查询</button></span>
				</div>
				
				<div class ="card"  style="margin-left:120px">
                 <div  id="v1" class = "he">选择参数</div>
                 <div class = "conten" id="v11">最大值</div>
                 </div>
                 
                 <div class ="card">
                 <div  id="v2" class = "he">选择参数</div>
                 <div class = "conten" id="v22">最小值</div>
                 </div>
                 
                 <div class ="card">
                 <div id="v3" class = "he">选择参数</div>
                 <div class = "conten" id="v33">平均值</div>
                 </div>
                 
                 <div class ="card">
                 <div  id="v4" class = "he">选择参数</div>
                 <div class = "conten" id="v44">标准差</div>
                 </div>
                 
                 <div id="co" style="min-width:400px;height:400px"></div>
                 
              
                 
                
                  
			 </div>
		   </div>
		
	</div>
</body>
</html>
