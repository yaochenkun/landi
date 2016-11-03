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
					<li id="tenant-header"><a href="${pageContext.request.contextPath}/views/user/tenant/roomGuest.jsp?rid=<%=request.getParameter("rid") != null ? request.getParameter("rid") : "" %>&rNum=<%=request.getParameter("rNum") %>">租客信息</a></li>
					<li id="asset-header" class="active-tab"><a href="${pageContext.request.contextPath}/views/user/tenant/roomAsset.jsp?rid=<%=request.getParameter("rid") != null ? request.getParameter("rid") : "" %>&rNum=<%=request.getParameter("rNum") %>">物品信息</a></li>
					<li id="check-header"><a href="${pageContext.request.contextPath}/views/user/tenant/roomCheck.jsp?rid=<%=request.getParameter("rid") != null ? request.getParameter("rid") : "" %>&rNum=<%=request.getParameter("rNum") %>">查房状态</a></li>
					<li id="maintain-header"><a href="javascript:void(0);">维修状态</a></li>
					<li id="others-header"><a href="javascript:void(0);">其他</a></li>
				</ul>
			</div>
		</div>
		<div class="tab-wrap">
			<div class="tab-content" id="asset">
				<div class="tab-header">
					<div><h2>物品信息</h2></div>
				</div>
				<div class="active-content" style="display:none;"></div>
				<div id="room-item">
					<div class="inner-table">
						<h3>家具信息</h3>
						<table id="item_furniture" class="table table-striped">
							<thead><tr><th>编号</th><th>名称</th><th>品牌</th><th>类别</th><th>标签</th><th>备注</th><tr></thead>
							<tbody>
							</tbody>
						</table>
					</div>
					<div class="inner-table">
						<h3>家电信息</h3>
						<table id="item_electric" class="table table-striped">
							<thead><tr><th>编号</th><th>名称</th><th>品牌</th><th>类别</th><th>标签</th><th>备注</th><tr></thead>
							<tbody>
								<tr><th>1</th><th></th><th></th><th></th><th></th><th></th><tr>
								<tr><th>2</th><th></th><th></th><th></th><th></th><th></th><tr>
							</tbody>
						</table>
					</div>
					<div class="inner-table">
						<h3>灯具信息</h3>
						<table id="item_light" class="table table-striped">
							<thead><tr><th>编号</th><th>名称</th><th>品牌</th><th>类别</th><th>标签</th><th>备注</th><tr></thead>
							<tbody>
								<tr><th>1</th><th></th><th></th><th></th><th></th><th></th><tr>
								<tr><th>2</th><th></th><th></th><th></th><th></th><th></th><tr>
							</tbody>
						</table>
					</div>
					<div class="inner-table">
						<h3>窗帘及浴屏</h3>
						<table id="item_curtain" class="table table-striped">
							<thead><tr><th>编号</th><th>名称</th><th>品牌</th><th>类别</th><th>标签</th><th>备注</th><tr></thead>
							<tbody>
								<tr><th>1</th><th></th><th></th><th></th><th></th><th></th><tr>
								<tr><th>2</th><th></th><th></th><th></th><th></th><th></th><tr>
							</tbody>
						</table>
					</div>
					<div class="inner-table">
						<h3>备品信息</h3>
						<table id="item_little" class="table table-striped">
							<thead><tr><th>编号</th><th>名称</th><th>品牌</th><th>类别</th><th>标签</th><th>备注</th><tr></thead>
							<tbody>
								<tr><th>1</th><th></th><th></th><th></th><th></th><th></th><tr>
								<tr><th>2</th><th></th><th></th><th></th><th></th><th></th><tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	<script>
		
		$(function(){
			let params = window.location.search;
			if (params.indexOf('rid')>=0) {
				let roomId = params.replace('?','').split('&')[0].split('=')[1];
				getFurniture(parseInt(roomId));
				getElectric(parseInt(roomId));
				getLight(parseInt(roomId));
				getCurtain(parseInt(roomId));
				getLittle(parseInt(roomId));
			}
			
			
		});
	</script>
</body>
</html>