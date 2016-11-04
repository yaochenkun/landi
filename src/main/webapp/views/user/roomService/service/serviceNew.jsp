<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/ld/user/home/public.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/ld/user/roomService/roomService.css" rel="stylesheet" type="text/css"/>
	<title>餐费</title>
</head>
<body>
	<jsp:include page="../../_header.jsp"></jsp:include>
    <jsp:include page="../_head.jsp"></jsp:include>
    <!-- 页面内容 strat -->
 	<div class="main">
		<div class="main-page">
			<div class="nav-path">
				<a href="" title="回到首页"><i class="icon-home"></i></a>
				<i class="icon-path"></i>
				<a href="">客房服务</a>
				<i class="icon-path"></i>
				<a href="serviceTakeaway.jsp">餐费</a>
				<i class="icon-path"></i>
				<% String type = request.getParameter("type"); 
				   String content = "";
				   if(type.matches("1")) content = "新增餐费记录";
				   else if(type.matches("2")) content = "新增桶装水费记录"; 
				   else if(type.matches("3")) content = "新增擦鞋费记录";
				   else if(type.matches("4")) content = "新增代购费记录"; 
				%>
				<a href="serviceTakeaway.jsp"><%=content %></a>
							
			</div>
		</div>
	</div>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/roomService.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/service/serviceNew.js"></script>
	<script type="text/javascript">
	    // 拉取第一页餐费信息
		//requestFirstTakeaway();
	</script>
</body>
</html>