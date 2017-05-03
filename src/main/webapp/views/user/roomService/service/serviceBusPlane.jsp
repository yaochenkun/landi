<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/home/public.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/plugin/simpleCalendar/date_pack.css"	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/service/serviceBusPlane.css" rel="stylesheet" type="text/css" />
<title>接送机</title>
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
				<a href="serviceBus.jsp">车费</a>
				<i class="icon-path"></i> 
				<a href="serviceBusPlane.jsp">接送机</a>
			</div>
			<a class="btn btn-new btnnew" href="serviceNewBusPlane.jsp">新增接送机车费记录</a>
			<div class="bill-area">
				<div class="search">
					<span>房间号：</span><input id="searchRoomNum" type="text" value="">
					<span class="span">日期：</span>
					<input type="text" class="pack_maintain">		
					<a class="btn btn-edit btnEdit" onclick="searchBusPlane(1);">搜索</a>
				</div>				

				<div class="bill-table">
					<!-- 费用 table start -->
					<table>
						<thead>
					    	<tr>
					    		<th>时间</th><th>房间号</th><th>客人姓名</th><th>接送机</th>
					    		<th>航班</th><th>车牌</th><th>接送人</th>
					    		<th>接送人电话</th><th>联络人</th><th>联络人电话</th>
					    	</tr>
						</thead>
						<tbody id="busPlaneTbody"></tbody>
					</table>
					<!-- 费用 table end -->

					<!-- 底部页面 start -->
					<div id="busPlaneBottom" class="bottom"></div>
					<!-- 底部页码 end -->
				</div>
			</div>
		</div>
	</div>
	<!-- 页面内容 end -->

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/plugin/simpleCalendar/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/simpleCalendar/date_pack.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/roomService.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/service/serviceBusPlane.js"></script>
	<script type="text/javascript">
		// 按时间查询接送机记录
		var nowDate = new Date();
		$(".pack_maintain").val(formatDateForm(nowDate));
		$('.pack_maintain').date_input();
		// 查询第一页信息
		searchBusPlane(1);
	</script>
</body>
</html>