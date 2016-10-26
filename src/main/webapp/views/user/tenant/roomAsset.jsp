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
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/admin/roomAsset.js"></script>
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
					<li id="tenant-header"><a href="${pageContext.request.contextPath}/views/user/tenant/roomGuest.jsp">租客信息</a></li>
					<li id="asset-header" class="active-tab"><a href="${pageContext.request.contextPath}/views/user/tenant/roomAsset.jsp">物品信息</a></li>
					<li id="check-header"><a href="${pageContext.request.contextPath}/views/user/tenant/roomCheck.jsp?rid=<%=request.getParameter("rid") %>">查房状态</a></li>
					<li id="maintain-header"><a href="${pageContext.request.contextPath}/views/user/tenant/roomMaintain.jsp">维修状态</a></li>
					<li id="others-header"><a href="#others">其他</a></li>
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
						<table class="table table-striped">
							<thead><tr><th>编号</th><th>分类</th><th>状态</th><th>品牌</th><tr></thead>
							<tbody>
								<tr><th>1</th><th>床</th><th>良好</th><th>Teddy Bear</th><tr>
								<tr><th>2</th><th>衣柜</th><th>良好</th><th></th><tr>
							</tbody>
						</table>
					</div>
					<div class="inner-table">
						<h3>家电信息</h3>
						<table class="table table-striped">
							<thead><tr><th>编号</th><th>分类</th><th>状态</th><th>品牌</th><tr></thead>
							<tbody>
								<tr><th>1</th><th>床</th><th>良好</th><th></th><tr>
								<tr><th>2</th><th>衣柜</th><th>良好</th><th></th><tr>
							</tbody>
						</table>
					</div>
					<div class="inner-table">
						<h3>灯具信息</h3>
						<table class="table table-striped">
							<thead><tr><th>编号</th><th>分类</th><th>状态</th><th>品牌</th><tr></thead>
							<tbody>
								<tr><th>1</th><th>床</th><th>良好</th><th></th><tr>
								<tr><th>2</th><th>衣柜</th><th>良好</th><th></th><tr>
							</tbody>
						</table>
					</div>
					<div class="inner-table">
						<h3>窗帘及浴屏</h3>
						<table class="table table-striped">
							<thead><tr><th>编号</th><th>分类</th><th>状态</th><th>品牌</th><tr></thead>
							<tbody>
								<tr><th>1</th><th>床</th><th>良好</th><th></th><tr>
								<tr><th>2</th><th>衣柜</th><th>良好</th><th></th><tr>
							</tbody>
						</table>
					</div>
					<div class="inner-table">
						<h3>备品信息</h3>
						<table class="table table-striped">
							<thead><tr><th>编号</th><th>分类</th><th>状态</th><th>品牌</th><tr></thead>
							<tbody>
								<tr><th>1</th><th>床</th><th>良好</th><th></th><tr>
								<tr><th>2</th><th>衣柜</th><th>良好</th><th></th><tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	<script>
		
		
		$("#asset-header").click(function(){
			$(this).attr("class", "active-tab");
			$("#tenant-header").attr("class", "normal-tab");
			$("#check-header").attr("class", "normal-tab");
			$("#maintain-header").attr("class", "normal-tab");
			$("#others-header").attr("class", "normal-tab");
			$("#asset").show();
			$("#room-check").hide();
			$("#maintain").hide();
			$("#others").hide();
			$("#tenant").hide();
		});
		$("#tenant-header").click(function(){
			$(this).attr("class", "active-tab");
			$("#check-header").attr("class", "normal-tab");
			$("#asset-header").attr("class", "normal-tab");
			$("#maintain-header").attr("class", "normal-tab");
			$("#others-header").attr("class", "normal-tab");
			$("#asset").hide();
			$("#room-check").hide();
			$("#maintain").hide();
			$("#others").hide();
			$("#tenant").show();
		});
		$("#check-header").click(function(){
			$(this).attr("class", "active-tab");
			$("#tenant-header").attr("class", "normal-tab");
			$("#asset-header").attr("class", "normal-tab");
			$("#maintain-header").attr("class", "normal-tab");
			$("#others-header").attr("class", "normal-tab");
			$("#asset").hide();
			$("#room-check").hide();
			$("#maintain").hide();
			$("#others").hide();
			$("#tenant").show();
		});
		$("#maintain-header").click(function(){
			$(this).attr("class", "active-tab");
			$("#tenant-header").attr("class", "normal-tab");
			$("#asset-header").attr("class", "normal-tab");
			$("#check-header").attr("class", "normal-tab");
			$("#others-header").attr("class", "normal-tab");
			$("#asset").hide();
			$("#room-check").hide();
			$("#maintain").hide();
			$("#others").hide();
			$("#tenant").show();
		});
		$("#others-header").click(function(){
			$(this).attr("class", "active-tab");
			$("#tenant-header").attr("class", "normal-tab");
			$("#asset-header").attr("class", "normal-tab");
			$("#maintain-header").attr("class", "normal-tab");
			$("#check-header").attr("class", "normal-tab");
			$("#asset").hide();
			$("#room-check").hide();
			$("#maintain").hide();
			$("#others").hide();
			$("#tenant").show();
		});
		
		//getMeters();
		// getItem();
		
	</script>
</body>
</html>