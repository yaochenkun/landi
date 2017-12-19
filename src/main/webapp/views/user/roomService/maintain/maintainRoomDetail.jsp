<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.ld.model.User"%>
<%@ page import="java.util.Date, java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/home/public.css"	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomItem/roomItem.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/maintain/maintainRoomDetail.css" rel="stylesheet" type="text/css" />
<title>维修管理</title>
</head>
<body>

	<jsp:include page="../../_header.jsp" />

	<% String roomNum = request.getParameter("roomNum"); %>

	<!-- 页面内容 strat -->
	<div class="main">
		<div class="main-page">
			<div class="roomInfo">
				房间号：<span class="span"><%= roomNum %></span>
			</div>
			<a href="maintainStat.jsp" class="btn btn-goback goback">返&nbsp;回</a>
			<div class="maintainReason">
				<table id='detailOne'>
					<tr class='itemName'><td></td><td>报警器</td><td>橱柜及水槽相关</td><td>窗户</td>
						<td>筒灯/开关/插座</td><td>地面/踢脚线</td><td>地面排水</td>
						<td>地热及温控器</td><td>对讲器及紧急呼叫器</td><td>房间壁柜</td></tr>
				</table>
				<table id='detailTwo'>
					<tr class='itemName'><td></td><td>房间管线</td><td>非能源换气扇</td>
						<td>净水器及软水器</td><td>空调</td><td>排风扇</td><td>墙面</td>
						<td>热水器/循环泵/吸油烟机</td><td>入户门及门锁</td><td>室内门</td></tr>
				</table>
				<table id='detailThree'>
					<tr class='itemName'><td></td>
						<td>网络</td><td>维护机构损坏</td><td>卫生间洁具及物品</td>
						<td>有线电视</td><td>家具</td><td>家电</td><td>灯具</td><td>其他</td>
						<td>合计</td></tr>
				</table>
			</div>
		</div>
	</div>
	<!-- 页面内容 end -->


	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/maintain/maintainRoomDetail.js"></script>
	<script>
	    // 请求第一页房间报修记录
	    requestMaintainDetail(1);
	</script>
</body>
</html>