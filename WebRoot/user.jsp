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
<link rel="stylesheet" type="text/css" href="css/power.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/highcharts.js"></script>
<script type="text/javascript" src="js/exporting.js"></script>
<script type="text/javascript" src="js/highcharts-zh_CN.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<style type="text/css">
table td{border:1px #ccc solid;}
</style>
<script type="text/javascript">
	$(function() {
		$accountDeleteDialog = $('#modal-4');
		
	});
	
	function _add() {
		$accountDeleteDialog[0].showModal();
	}
	
	function _addHandler() {
	if (!validateNo($("#nof").val())) {return;}
	var sex = $("input[name='sexf']:checked").val();
	$.ajax({
		type:"post",
		url:"userServlet?type=add",
		data:{name:$("#namef").val(),
		password:$("#password").val(),
		noh:$("#noh").val(),
		no:$("#nof").val(),
		async:false,
		sex:encodeURIComponent(encodeURIComponent(sex)),
		level:$("input[name='levelf']:checked").val()
		},
		dataType:"text",
		success:function(data) {
			if (data =="1") {$("#noh").val("");$("#nof").attr("readonly",false);
				alert("添加成功");
				$accountDeleteDialog[0].close();
				window.location.href="userServlet?type=query&curPage=1";
			} else if (data =="2") {
				alert("用户已经存在");
			}  else if (data =="3") {$("#noh").val("");$("#nof").attr("readonly",false);
				alert("修改成功");
				$accountDeleteDialog[0].close();
				window.location.href="userServlet?type=query&curPage=1";
			}  else if (data =="4") {
				alert("修改失败");
			} else {
			alert("添加失败");
			}
		}
		})
	}
	
	function validateNo(no) {
		if (!/^[0-9]*$/.test(no)) {
			alert("账号必须是数字");	
			return false;
		}
		return true;
	}
	
	function _updates(no) {
	$accountDeleteDialog[0].showModal();
	if (!validateNo(no)) {return;}
		$.ajax({
		type:"post",
		url:"userServlet?type=updates",
		data:{no:no},
		async:false,
		dataType:"json",
		success:function(data) {
			$("#namef").val(data.name);$("#nof").attr("readonly",true);
			$("#nof").val(data.no);$("#noh").val(data.no);
			if (data.sex =="男") {
				$("#sexn").attr("checked",true);
			} else {
				$("#sexnv").attr("checked",true);
			}
			if (data.level =="1") {
				$("#levelvip").attr("checked",true);
			} else {
				$("#levelp").attr("checked",true);
			}
		}
		})
	}
	
	function _del(no) {
		$.ajax({
		type:"post",
		url:"userServlet?type=del",
		data:{no:no},
		dataType:"text",
		success:function(data) {
			if (data =="1") {
				alert("删除成功");
				window.location.href="userServlet?type=query&curPage=1";
			} else {
			alert("删除失败");
			}
		}
		})
		
	}
	
	function _query() {
		window.location.href="userServlet?type=query&name="+$("#name").val();
	}
</script>
	</head>

	<body>
		<div id="content">
			<div id="top">
				<div id="top_left">
				<c:if test="${sessionScope.user==null}">
					<a href="login.jsp">登录</a>
				</c:if>
				<c:if test="${sessionScope.user!=null}">
					<a>${sessionScope.user.name}</a>
					<a href="userServlet?type=exitUser">注销</a>
				</c:if>
			</div>
				<div id="top_right">
					<a href="contact.jsp" target="_blank">联系我们</a>
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
			<div class="split"></div>
			<div id="show_div">
				<div id="show_left">
					<div id="show_left_head">
						<span>用户管理</span> <span>user manage</span>
					</div>
					<ul id="parentSelect">
							<li><a href="userServlet?type=query&curPage=1">用户管理</a></li>
					</ul>
				</div>
				<div id="show_right">
					<div id="show_right_head">
						<div>用户管理</div>
						<div>
						</div>
					</div>
					<div id="date_div">
					<span>用户姓名&nbsp;<input id="name" type="text" value="${name }"></span>  <span><button id="date_button" onclick="_query()">查询</button>
						<button id="date_button" onclick="_add()">添加</button>
						</span>
				</div>
					<div>
						<table style="width:100%;height:auto;border:1px #ccc solid;border-collapse: collapse;margin-bottom:5px;">
							<tr>
								<td>账号</td>
								<td>姓名</td>
								<td>性别</td>
								<td>角色</td>
								<td>操作</td>
							</tr>
							<c:forEach items="${userList }" var="user">
							<tr>
								<td>${user.no }</td>
								<td>${user.name }</td>
								<td>${user.sex }</td>
								<td>${user.level==1?"vip":"普通用户" }</td>
								<td>
									<a href="javascript:void(0)" onclick="_updates(${user.no })">修改</a>
									<a href="javascript:void(0)" onclick="_del(${user.no })">删除</a>
								</td>
							</tr>
							</c:forEach>
							<tr>
								<td colspan="5">
									<c:choose>
										<c:when test="${curPage eq 1}">
											<span>上一页</span>
											<span><a href="userServlet?type=query&curPage=${curPage+1 }">下一页</a></span>
										</c:when>
										<c:otherwise>
											<span><a href="userServlet?type=query&curPage=${curPage-1 }">上一页</a></span>
											<c:choose>
												<c:when test="${curPage eq total}"><span>下一页</span></c:when>
												<c:otherwise>
												<span><a href="userServlet?type=query&curPage=${curPage+1 }">下一页</a></span>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			
			
			<div  id="modal-3">
			<dialog id="modal-4">
				<h3>添加用户</h3>
				<div>
					<table style="width:100%;height:auto;border:1px #ccc solid;border-collapse: collapse;margin-bottom:5px;">
							<tr>
								<td>账号</td>
								<td><input id="nof" type="text"><input id="noh" type="hidden"></td>
							</tr>
							<tr>
								<td>姓名</td>
								<td><input id="namef" type="text"></td>
							</tr>
							<tr>
								<td>密码</td>
								<td><input id="password" type="password"></td>
							</tr>
							<tr>
								<td>性别</td>
								<td><input type="radio" name="sexf" id="sexn" value="男" checked="checked"/>男
								<input type="radio" name="sexf" id="sexnv" value="女"/>女</td>
							</tr>
							<tr>
								<td>角色</td>
								<td><input type="radio" name="levelf" id="levelvip" value="1"/>VIP
								<input type="radio" name="levelf" id="levelp" value="2" checked="checked"/>普通用户</td>
							</tr>
						</table>
					 <span><button id="handler" onclick="_addHandler()">保存</button>
						</span>
				</div>
			</dialog>
		</div>
		
			<div class="split"></div>
		</div>
	</body>

</html>