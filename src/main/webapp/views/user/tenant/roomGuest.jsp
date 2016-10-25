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
	
    <!-- 二级导航栏 start -->
    <div class="main-nav"> 
        <div class="aside-box">
            <ul>
                <li class="linormal"><span class="glyphicon glyphicon-home"></span><a href="${pageContext.request.contextPath}/views/user/home/homeUser.jsp">&nbsp;&nbsp;首页</a></li>
                <li class="liactive"><span class="glyphicon glyphicon-user"></span><a href="${pageContext.request.contextPath}/views/user/tenant/generalMap.jsp">&nbsp;&nbsp;租客管理</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-usd"></span><a href="${pageContext.request.contextPath}/views/user/roomAsset.jsp">&nbsp;&nbsp;固定资产</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-list-alt"></span><a href="">&nbsp;&nbsp;采购</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-shopping-cart"></span><a href="">&nbsp;&nbsp;小卖部</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-heart-empty"></span><a href="">&nbsp;&nbsp;爱心驿站</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-indent-left"></span><a href="">&nbsp;&nbsp;统计信息</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-plus"></span><a href="">&nbsp;&nbsp;其他</a></li>
            </ul>
        </div>
    </div>
    <!-- 二级导航栏 end-->
	<div class="body-content">
		<div class="mod-wrap">
			<div class="panel-tab">
				<ul class="clear">
					<li id="tenant-header" class="active-tab"><a href="${pageContext.request.contextPath}/views/user/tenant/roomGuest.jsp">租客信息</a></li>
					<li id="asset-header"><a href="${pageContext.request.contextPath}/views/user/tenant/roomAsset.jsp">物品信息</a></li>
					<li id="check-header"><a href="${pageContext.request.contextPath}/views/user/tenant/checkRoom.jsp">查房状态</a></li>
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
			<div id="room-check" class="tab-content">
				<div class="tab-header">
					<div><h2>查房状态</h2></div>
				</div>
				<span><img src="${pageContext.request.contextPath }/img/carousel_1.png"/></span>
			</div>
			<div id="maintain" class="tab-content">
				<div class="tab-header">
					<div><h2>维修状态</h2></div>
				</div>
				<span><img src="${pageContext.request.contextPath }/img/carousel_2.png"/></span>
			</div>
			<div id="others" class="tab-content">
				<div class="tab-header">
					<div><h2>其他</h2></div>
				</div>
				<span><img src="${pageContext.request.contextPath }/img/carousel_3.png"/></span>
			</div>
		</div>
		
	</div>
	<script>
		$(function(){
				$("#asset").hide();
				$("#room-check").hide();
				$("#maintain").hide();
				$("#others").hide();
				$("#tenant").show();
		});
		
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