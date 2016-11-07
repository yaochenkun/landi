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
	<link href="${pageContext.request.contextPath}/css/ld/user/roomService/roomServiceIndex.css" rel="stylesheet" type="text/css"/>
	<title>客房服务管理</title>
</head>
<body>
	<jsp:include page="../_header.jsp"></jsp:include>
    <jsp:include page="_head.jsp"></jsp:include>

	<!-- 页面内容 strat -->
 	<div class="main">
		<div class="main-page">
			<div class="body">
				<!-- 客房服务 start -->
				<div class="index-list">
					<div class="left-index">
						<ul>
							<li><div class="logo"></div>客房服务</li>
						</ul>
					</div>
					<div class="content-title content-title-index">
						<ul>
							<li><div class="icon"></div><a href="">洗衣单收费</a></li>
							<li><div class="icon"></div><a href="service/serviceTakeaway.jsp">餐费</a></li>
							<li><div class="icon"></div><a href="service/serviceWaterBill.jsp">桶装水费</a></li>
							<li><div class="icon"></div><a href="service/serviceShoeCleaning.jsp">擦鞋费</a></li>
							<li><div class="icon"></div><a href="service/serviceShopping.jsp">代购费</a></li>
							<li><div class="icon"></div><a href="">车费</a></li>
						</ul>
					</div>
				</div>
				<!-- 客房服务 end -->

				<!-- 客房维修 start -->
				<div class="index-list">
					<div class="left-index">
						<ul>
							<li><div class="logo"></div>客房维修</li>
						</ul>
					</div>
					<div class="content-title content-title-index">
						<ul>
							<li><div class="icon"></div><a href="">维修报修</a></li>
							<li><div class="icon"></div><a href="">维修管理</a></li>
							<li><div class="icon"></div><a href="">维修统计</a></li>
						</ul>
					</div>
				</div>
				<!-- 客房维修 end -->

				<!-- 能源费结算 start -->
				<div class="index-list">
					<div class="left-index">
						<ul>
							<li><div class="logo"></div>能源费结算</li>
						</ul>
					</div>
					<div class="content-title content-title-index">
						<ul>
							<li><div class="icon"></div><a href="source/sourceWater.jsp">水&nbsp;费</a></li>
							<li><div class="icon"></div><a href="source/sourceElec.jsp">电&nbsp;费</a></li>
							<li><div class="icon"></div><a href="source/sourceGas.jsp">燃&nbsp;气&nbsp;费</a></li>
						</ul>
					</div>
				</div>
				<!-- 能源费结算 end -->
				
				<!-- 客房费用结算 start -->
				<div class="index-list">
					<div class="left-index">
						<ul>
							<li><div class="logo"></div>客房费用结算</li>
						</ul>
					</div>
					<div class="content-title content-title-index">
						<ul>
							<li><div class="icon"></div><a href="">统计费用</a></li>
							<li><div class="icon"></div><a href="">其他费用</a></li>
						</ul>
					</div>
				</div>
				<!-- 客房费用结算 end -->
			</div>
		</div>
	</div>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/roomService.js"></script>
</body>
</html>