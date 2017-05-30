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
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/roomService.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/service/serviceNew.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/service/serviceNewBusPlane.css" rel="stylesheet" type="text/css" />
<title>编辑接送机记录</title>
</head>
<body>
	<jsp:include page="../../_header.jsp"></jsp:include>
	<jsp:include page="../../_leftMenu.jsp" />
	<jsp:include page="../../_modal.jsp" />

	<!-- 页面内容 start -->
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
				<i class="icon-path"></i>
				<a href="javascript:void(0);">编辑接送机车费记录</a>
			</div>
			<div class="body">
				<div class="body-content">
					<ul>
						<li>
							<div class="eventType">
								<input type="radio" name="eventType" id="eventType"><span class="span">接机</span>
								<input type="radio" name="eventType" id="eventType2"><span class="span">送机</span>
							</div>					
						</li>
						<li><span class="span">房间号：</span>
							<input id="serviceRoomNumber" type="text" value="" disabled="disabled"/>
							<span class="red red-right">*&nbsp;必填</span></li>
						<li id="roomIdWarning"><span class="span"></span><span class="red">不能为空！</span></li>
						<li><span class="span">客户姓名：</span><input type="text" value="" disabled="disabled"/></li>
						<li><span class="span">发生时间：</span><input type="text" class="pack_maintain"></li>
						<li><span class="span">航班：</span><input type="text" value="" /></li>
						<li><span class="span">车牌：</span><input type="text" value="" /></li>
						<li><span class="span">接送人：</span><input type="text" value="" /></li>
						<li><span class="span">接送人电话：</span><input type="text" value="" /></li>
						<li><span class="span">联络人：</span><input type="text" value="" /></li>
						<li><span class="span">联络人电话：</span><input type="text" value="" /></li>
						<li><span class="span"></span><a onclick="updateBusPlane(${param.id});" class="btn btn-goback goback">确认更新</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 页面内容 end -->
	<div class="shadow"></div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/plugin/simpleCalendar/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/simpleCalendar/date_pack.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/roomService.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/service/serviceBusPlane.js"></script>
	<script type="text/javascript">
	
		searchBusPlaneEdit('${param.id}');
		// 设置为当前时间
		var nowDate = new Date();
		$(".pack_maintain").val(formatDateForm(nowDate));
		$('.pack_maintain').date_input();
	</script>
</body>
</html>