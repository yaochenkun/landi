<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/home/public.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/roomService.css"	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/roomServiceIndex.css" rel="stylesheet" type="text/css" />
<title>客房服务管理</title>
</head>
<body>
	<jsp:include page="../_header.jsp"></jsp:include>
	<jsp:include page="../_leftMenu.jsp" />

	<!-- 页面内容 strat -->
	<div class="main">
		<div class="main-page">
			<div class="title">
				<div class="right">
					<a class="span" href="service/serviceIndex.jsp">客房服务</a>&nbsp;|&nbsp;
					<a class="span" href="maintain/maintainIndex.jsp">客房维修</a>&nbsp;|&nbsp; 
					<a class="span" href="source/sourceIndex.jsp">能源费结算</a>&nbsp;|&nbsp;
					<a class="span" href="javascript:void(0);">客房费用结算</a>&nbsp;|&nbsp;
					<a class="span" href="affairReminder/affairReminderIndex.jsp">事务提醒</a>
				</div>
			</div>
			<div class="body">
				<!-- 客房服务 start -->
				<div class="index-list">
					<div class="left-index">
						<ul>
							<li><img src="${pageContext.request.contextPath}/img/roomService/telephone.svg">
								<span>客房服务</span>
							</li>
						</ul>
					</div>
				</div>
				<div class="content-title content-title-index active content-wash">
					<ul>
						<li><a href="service/serviceWash.jsp">洗衣单收费</a></li>
						<li><a href="service/serviceTakeaway.jsp">餐费</a></li>
						<li><a href="service/serviceWaterBill.jsp">饮用水费</a></li>
						<li><a href="service/serviceShoeCleaning.jsp">擦鞋费</a></li>
						<li><a href="service/serviceShopping.jsp">代购费</a></li>
						<li><a href="service/serviceBus.jsp">车费</a></li>
					</ul>
				</div>
				<!-- 客房服务 end -->

				<!-- 客房维修 start -->
				<div class="index-list">
					<div class="left-index">
						<ul>
							<li><img src="${pageContext.request.contextPath}/img/roomService/tools.svg">
								<span>客房维修</span>
							</li>
						</ul>
					</div>
				</div>
				<div class="content-title content-title-index">
					<ul>
						<li><a href="maintain/maintainNew.jsp">维修报修</a></li>
						<li><a href="maintain/maintainManage.jsp">维修管理</a></li>
						<li><a href="maintain/maintainStat.jsp">维修统计</a></li>
					</ul>
				</div>
				<!-- 客房维修 end -->

				<!-- 能源费结算 start -->
				<div class="index-list">
					<div class="left-index">
						<ul>
							<li><img src="${pageContext.request.contextPath}/img/roomService/drops.svg">
								<span>能源费结算</span>
							</li>
						</ul>
					</div>
				</div>
				<div class="content-title content-title-index">
					<ul>
						<li><a href="source/sourceWater.jsp">水&nbsp;费</a></li>
						<li><a href="source/sourceElec.jsp">电&nbsp;费</a></li>
						<li><a href="source/sourceGas.jsp">燃&nbsp;气&nbsp;费</a></li>
					</ul>
				</div>
				<!-- 能源费结算 end -->

				<!-- 客房费用结算 start -->
				<div class="index-list">
					<div class="left-index">
						<ul>
							<li><img src="${pageContext.request.contextPath}/img/roomService/calculate.svg">
								<span>客房费用结算</span>
							</li>
						</ul>
					</div>
				</div>
				<div class="content-title content-title-index">
					<ul>
						<li><a href="">统计费用</a></li>
						<li><a href="">其他费用</a></li>
					</ul>
				</div>
				<!-- 客房费用结算 end -->

				<!-- 事务提醒 start -->
				<div class="index-list">
					<div class="left-index">
						<ul>
							<li><img src="${pageContext.request.contextPath}/img/roomService/calendar.svg">
								<span>事务提醒</span>
							</li>
						</ul>
					</div>
				</div>
				<div class="content-title content-title-index">
					<ul>
						<li><a href="${pageContext.request.contextPath}/views/user/roomService/affairReminder/mailboxIndex.jsp">站内信</a></li>
						<li><a href="${pageContext.request.contextPath}/views/user/roomService/affairReminder/diaryOverview.jsp">个人日志</a></li>
						<li><a href="${pageContext.request.contextPath}/views/user/roomService/affairReminder/systemOverview.jsp">系统提醒</a></li>
					</ul>
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