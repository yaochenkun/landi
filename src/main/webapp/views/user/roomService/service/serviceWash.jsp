<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/home/public.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/roomService.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/service/serviceWash.css" rel="stylesheet" type="text/css" />
<title>洗衣单收费</title>
</head>
<body>
	<jsp:include page="../../_header.jsp"></jsp:include>
	<jsp:include page="../../_leftMenu.jsp" />

	<!-- 页面内容 strat -->
	<div class="main">
		<div class="main-page">
			<div class="nav-path">
				<a href="../roomServiceIndex.jsp" title="回到首页"><i class="icon-home"></i></a> 
				<i class="icon-path"></i> 
				<a href="serviceIndex.jsp">客房服务</a>
				<i class="icon-path"></i> 
				<a href="">洗衣单收费</a>
			</div>
			<a class="btn btn-new btnnew" href="serviceNewWash.jsp">新增洗衣单收费记录</a>
			<div class="bill-area">
				<div class="search">
					<span>房间号：</span><input id="searchWashButton" type="text" value="">
				</div>
				<div class="bill-table">
					<!-- 费用 table start -->
					<table>
						<tbody>
							<tr class="date"></tr>
							<tr class="roomNo"></tr>
							<tr class="name"></tr>
							<tr class="shirt"></tr>
							<tr class="topSuit"></tr>
							<tr class="trousers"></tr>
							<tr class="jacket"></tr>
							<tr class="middleCoat"></tr>
							<tr class="longCoat"></tr>
							<tr class="shortCotton"></tr>
							<tr class="middleCotton"></tr>
							<tr class="longCotton"></tr>
							<tr class="cashmere"></tr>
							<tr class="shortPants"></tr>
							<tr class="waistcoat"></tr>
							<tr class="tshirt"></tr>
							<tr class="knitted"></tr>
							<tr class="tie"></tr>
							<tr class="longSkirt"></tr>
							<tr class="shortSkirt"></tr>
							<tr class="other"></tr>
							<tr class="total"></tr>
							<tr class="price"></tr>
						</tbody>
					</table>
					<!-- 费用 table end -->

					<!-- 底部页面 start -->
					<div id="serviceWashBottom" class="bottom"></div>
					<!-- 底部页码 end -->
				</div>
			</div>
		</div>
	</div>
	<!-- 页面内容 end -->

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/roomService.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/service/serviceWash.js"></script>
	<script type="text/javascript">
	    // 拉取第一页 洗衣单收费信息
		requestWash(1);
	</script>
</body>
</html>