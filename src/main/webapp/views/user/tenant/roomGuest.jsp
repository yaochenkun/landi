<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/tenant/roomGuest.js"></script>
	<link href="${pageContext.request.contextPath}/css/ld/user/tenant/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	 <link href="${pageContext.request.contextPath }/css/ld/user/tenant/roomGuest.css" rel="stylesheet" type="text/css" />
	<title>房间信息</title>
</head>
<body>
    <jsp:include page="../_header.jsp"></jsp:include>
	<jsp:include page="../_leftMenu.jsp"></jsp:include>

	<div class="body-content">
		<div class="mod-wrap">
			<div class="panel-tab">
				<ul class="clear">
					<li id="tenant-header" class="active-tab"><a href="${pageContext.request.contextPath}/views/user/tenant/roomGuest.jsp?rid=<%=request.getParameter("rid") != null ? request.getParameter("rid") : "" %>&rNum=<%=request.getParameter("rNum") %>">租客信息</a></li>
					<li id="asset-header"><a href="${pageContext.request.contextPath}/views/user/tenant/roomAsset.jsp?rid=<%=request.getParameter("rid") != null ? request.getParameter("rid") : "" %>&rNum=<%=request.getParameter("rNum") %>">物品信息</a></li>
					<li id="check-header"><a href="${pageContext.request.contextPath}/views/user/tenant/roomCheck.jsp?rid=<%=request.getParameter("rid") != null ? request.getParameter("rid") : "" %>&rNum=<%=request.getParameter("rNum") %>">查房状态</a></li>
					<li id="maintain-header"><a href="javascript:void(0);">维修状态</a></li>
					<li id="others-header"><a href="javascript:void(0);">其他</a></li>
				</ul>
			</div>
		</div>
		<div class="tab-wrap">
			<div id="tenant" class="tab-content">
				<div class="tab-header">
					<div><h2>租客信息</h2></div>
				</div>
				<div id="room-guest" style="display:flex;text-align:left;margin:10px 60px;">
					<div style="flex:1;">
						<ul>
							<li>租客姓名：<span id="guestName"></span></li>
							<li>房间号：<span id="roomNum"></span></li>
							<li>户型：<span id="roomType"></span></li>
							<li>联系电话：<span id="telNum"></span></li>
							<li>所在公司：<span id="company"></span></li>
							<li>职务：<span id="position"></span></li>
							<li>入住人数：<span id="totalNum"></span></li>
						</ul>
					</div>
					<div style="flex:1;">
						<ul>
							<li>入住日期：<span id="inDate"></span></li>
							<!-- <li>到期时间：<span id="dueDate">2018-01-01</span></li> -->
							<li>租金：<span id="charge"></span></li>
							<li>车位：<span id="park"></span></li>
							<li>备注：<span id="comment"></span></li>	
						</ul>
					</div>
				</div>
			</div>	
		</div>	
	</div>
	<script>
		$(function(){
			let params = window.location.search;
			var rId;
			var rNum;
			var op;
			if (params.indexOf('rid')>=0) {
				let roomId = params.replace('?','').split('&')[0].split('=')[1];
				let roomNum = params.replace('?','').split('&')[1].split('=')[1];
				// [TODO]获取租客信息
				getGuestInfo(parseInt(roomId), roomNum);
				$("#asset-link").attr("href", "./roomAsset.jsp?rid="+roomId + "rNum=" + roomNum);
			}
		});
		//getMeters();
	</script>
</body>
</html>