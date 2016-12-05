<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/css/ld/user/home/public.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/css/ld/user/roomService/roomService.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/css/ld/user/roomService/source/sourceNew.css"
	rel="stylesheet" type="text/css" />
<title>添加能源费结算</title>
</head>
<body>
	<jsp:include page="../../_header.jsp"></jsp:include>
	<jsp:include page="../../_leftMenu.jsp" />

	<!-- 页面内容 start -->
	<div class="main">
		<div class="main-page">

			<!-- 面包屑导航 start -->
			<div class="nav-path">
				<a href="../roomServiceIndex.jsp" title="回到首页">
				<i class="icon-home"></i></a> <i class="icon-path"></i> 
				<a href="sourceIndex.jsp">能源费结算</a>
				
				<% String type = request.getParameter("type"); 
				   String contentOne = "", contentTwo = "", contentThree = "";
				   if(type.matches("1")){
				   		contentOne = "水费"; contentTwo = "新增水费记录"; 
				   		contentThree = "sourceWater.jsp";}
				   else if(type.matches("2")){
				        contentOne = "电费"; contentTwo = "新增电费记录"; 
				        contentThree = "sourceElec.jsp";} 
				%>
				<i class="icon-path"></i> 
				<a id="sourceType" href="<%=contentThree %>"><%=contentOne %></a> 
				<i class="icon-path"></i>
				<a href="javascript:void(0);"><%=contentTwo %></a>
			</div>
			<!-- 面包屑导航 end -->

			<!-- 添加燃气费页面 start -->
			<div class="body">
				<div class="body-content">
					<ul>
						<li><span class="span">房间号：</span>
							<input id="sourceRoomNumber" type="text" value="W34" />
							<span class="red red-right">*&nbsp;必填</span>
						</li>
						<li id="roomIdWarning">
							<span class="span"></span>
							<span class="red">不能为空！</span>
						</li>
						<li><span class="span">租客：</span><input type="text" value="Alice" /></li>
						<li><span class="span">表号：</span><span id="meter">不存在该房间！</span></li>
						<li><span class="span">抄表：</span><input type="text" value="12.4" /></li>
						<li><span class="span">费用：</span><input type="text" value="12.5" /></li>
						<li><span class="span"></span>
							<a onclick="addsource();" class="btn btn-goback goback">确认添加</a>
						</li>
					</ul>
				</div>
			</div>
			<!-- 添加燃气费内容 end -->

		</div>
	</div>
	<!-- 页面内容 end -->

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/roomService.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/source/sourceNew.js"></script>
</body>
</html>