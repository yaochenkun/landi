<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<!-- 导航栏 start-->
	<div class="roomNav">
		<ul class="roomNavInner">
			<!-- 客房服务管理 start -->
			<div class="dropMenu">
				<div class="nav_title">客房服务管理</div>			 
	 			<div class="index">
	 				<!-- 客房服务 start -->
	 				<div class="plate plate-roomService">
	 					<div class="plate-title">
	 						<div class="title-head">
	 							<img src="${pageContext.request.contextPath}/img/roomService/shirt.svg"/><span>&nbsp;&nbsp;&nbsp;客房服务</span>
	 						</div>
	 					</div>
	 					<div class="plate-content">
	 						<div class="content-title">
	 							<ul>
	 								<li><div class="icon"></div><a>洗衣单收费</a></li>
	 								<li><div class="icon"></div><a href="serviceTakeaway.jsp">餐费</a></li>
	 								<li><div class="icon"></div><a href="serviceWaterBill.jsp">桶装水费</a></li>
	 								<li><div class="icon"></div><a href="serviceShoeCleaning.jsp">擦鞋费</a></li>
	 								<li><div class="icon"></div><a href="serviceShopping.jsp">代购费</a></li>
	 								<li><div class="icon"></div><a>车费</a></li>
	 								<li><div class="icon"></div><a>其他</a></li>
	 							</ul>						
	 							<div class="xb-icon"></div>	
	 						</div>
	 					</div>
	 				</div>
	 				<!-- 客房服务 end -->
	 				<!-- 客房维修 start -->
	 				<div class="plate plate-repair">
	 					<div class="plate-title">
	 					    <div class="title-head">
	 							<img src="${pageContext.request.contextPath}/img/roomService/tools.svg"/><span>&nbsp;&nbsp;&nbsp;客房维修</span>
	 						</div>
	 					</div>
	 					<div class="plate-content">
	 					    <div class="content-title">
	 							<ul>
	 								<li><div class="icon"></div><a>维修报费</a></li>
	 								<li><div class="icon"></div><a>维修管理</a></li>
	 								<li><div class="icon"></div><a>维修统计</a></li>
	 							</ul>
	 					    </div>
	 					</div>
	 				</div>
	 				<!-- 客房维修 end -->				
					<!-- 能源费结算 start -->
	 				<div class="plate plate-resource">
	 					<div class="plate-title">
	 					    <div class="title-head">
	 							<img src="${pageContext.request.contextPath}/img/roomService/drops.svg"/><span>&nbsp;&nbsp;&nbsp;能源费结算</span>
	 						</div>
	 					</div>
	 					<div class="plate-content">
	 					    <div class="content-title">
	 							<ul>
	 								<li><div class="icon"></div><a href="${pageContext.request.contextPath}/views/user/roomService/">水费</a></li>
	 								<li><div class="icon"></div><a>电费</a></li>
	 								<li><div class="icon"></div><a>燃气费</a></li>
	 							</ul>
	 					    </div>
	 					</div>
	 				</div>
	 				<!-- 能源费结算 end -->
	 				<!-- 客房费用结算 start -->
	 				<div class="plate plate-other">
	 					<div class="plate-title">
	 					    <div class="title-head">
	 							<img src="${pageContext.request.contextPath}/img/roomService/calculate.svg"/><span>&nbsp;&nbsp;&nbsp;客房费用结算</span>
	 						</div>
	 					</div>
	 					<div class="plate-content">
	 					    <div class="content-title">
	 							<ul>
	 								<li><div class="icon"></div><a>统计费用</a></li>
	 								<li><div class="icon"></div><a>其他费用</a></li>
	 							</ul>
	 					    </div>
	 					</div>
	 				</div>
	 			</div>
	 			<!-- 客房费用结算 end -->
 			</div>
 		    <!-- 客房服务管理 end -->

			<li class="nav-li"><a href="${pageContext.request.contextPath}/views/user/home/homeUser.jsp">首页</a></li>
			<li class="nav-li"><a href="${pageContext.request.contextPath}/views/user/tenant/generalMap.jsp">租客管理</a></li>
			<li class="nav-li"><a href="javascript:voic(0);">客房物品管理</a></li>
			<li class="nav-li"><a href="javascript:voic(0);">办公室管理</a></li>
			<li class="nav-li"><a href="javascript:voic(0);">其他</a></li>
		</ul>
	</div>
	<!-- 导航栏 end -->
</body>
</html>