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
					<li id="tenant-header" class="active-tab"><a href="${pageContext.request.contextPath}/views/user/tenant/roomGuest.jsp">租客信息</a></li>
					<li id="asset-header"><a href="${pageContext.request.contextPath}/views/user/tenant/roomAsset.jsp?rid=<%=request.getParameter("rid") != null ? request.getParameter("rid") : "" %>&rNum=<%=request.getParameter("rNum") %>">物品信息</a></li>
					<li id="check-header"><a href="${pageContext.request.contextPath}/views/user/tenant/roomCheck.jsp?rid=<%=request.getParameter("rid") != null ? request.getParameter("rid") : "" %>&rNum=<%=request.getParameter("rNum") %>">查房状态</a></li>
					<li id="maintain-header"><a href="${pageContext.request.contextPath}/views/user/tenant/roomMaintain.jsp">维修状态</a></li>
					<li id="others-header"><a href="#others">其他</a></li>
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
							<li>租客姓名：<span>彭于晏</span></li>
							<li>房间号：<span>707</span></li>
							<li>户型：<span>总统套房</span></li>
							<li>联系电话：<span>18811384115</span></li>
							<li>所在公司：<span>光线传媒</span></li>
							<li>职务：<span>CEO</span></li>
							<li>入住人数：<span>2</span></li>
						</ul>
					</div>
					<div style="flex:1;">
						<ul>
							<li>入住日期：<span>2016-09-01</span></li>
							<li>到期时间：<span>2018-01-01</span></li>
							<li>租金：<span>80000</span></li>
							<li>车位：<span>京P6864B</span></li>
							<li>备注：<span>无</span></li>	
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
			if (params.indexOf('rid')>=0 && params.indexOf('cusId')>=0) {
				let roomId = params.replace('?','').split('&')[0].split('=')[1];
				// [TODO]获取租客信息
				$("#asset-link").attr("href", "./roomAsset.jsp?rid="+roomId);
			}
		});
		//getMeters();
	</script>
</body>
</html>