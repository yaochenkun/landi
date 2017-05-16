<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/home/public.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/roomService.css"	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/service/serviceNew.css" rel="stylesheet" type="text/css" />
<title>添加客房服务</title>
</head>
<body>
	<jsp:include page="../../_header.jsp"></jsp:include>
	<jsp:include page="../../_leftMenu.jsp" />
	
	<!-- 页面内容 start -->
	<div class="main">
		<div class="main-page">
			<div class="nav-path">
				<a href="../roomServiceIndex.jsp" title="回到首页"><i class="icon-home"></i></a>
				<i class="icon-path"></i>
				<a href="serviceIndex.jsp">客房服务</a>
				<% String type = request.getParameter("type"); 
				   String contentOne = "", contentTwo = "", contentThree = "";
				   if(type.matches("1")){
				   		contentOne = "餐费"; contentTwo = "新增餐费记录"; 
				   		contentThree = "serviceTakeaway.jsp";}
				   else if(type.matches("2")){
				   		contentOne = "桶装水费"; contentTwo = "新增桶装水费记录"; 
				   		contentThree = "serviceWaterBill.jsp";} 
				   else if(type.matches("3")){
				   		contentOne = "擦鞋费"; contentTwo = "新增擦鞋费记录"; 
				   		contentThree = "serviceShoeCleaning.jsp";}
				   else if(type.matches("4")){
				   		contentOne = "代购费"; contentTwo = "新增代购费记录"; 
				   		contentThree = "serviceShopping.jsp";}
				%>
				<i class="icon-path"></i>
				<a id="serviceType" href="<%=contentThree %>"><%=contentOne %></a>
				<i class="icon-path"></i>
				<a href="javascript:void(0);"><%=contentTwo %></a>
			</div>
			<div class="body">
				<div class="body-content">
					<ul>
						<li><span class="span">房间号：</span>
							<input id="serviceRoomNumber" type="text" value="W35-1" />
							<span class="red red-right">*&nbsp;必填</span></li>
						<li id="roomIdWarning"><span class="span"></span><span class="red">不能为空！</span></li>
						<li><span class="span">客户姓名：</span><input type="text" value="Alice" /></li>
						<li><span class="span">物品：</span><input type="text" value="衣服" /></li>
						<li><span class="span">数量：</span><input type="text" value="1" /></li>
						<li><span class="span">金额：</span><input type="text" value="12.5" /></li>
						<li><span class="span">备注：</span><input type="text" value="无" /></li>
						<li><span class="span"></span><a onclick="addservice();" class="btn btn-goback goback">确认添加</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 页面内容 end -->

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/roomService.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/service/serviceNew.js"></script>
</body>
</html>