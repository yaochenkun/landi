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
<link href="${pageContext.request.contextPath}/css/ld/user/tenant/tenantPublic.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/ld/user/tenant/roomGuest.css" rel="stylesheet" type="text/css" />
<title>房间信息</title>
</head>
<body>
	<jsp:include page="../_header.jsp"></jsp:include>
	<jsp:include page="../_leftMenu.jsp"></jsp:include>

	<% String rid = request.getParameter("rid"); %>
	<% String rNum = request.getParameter("rNum"); %>
	
	<!-- 三级导航栏 start -->
	<div class="nav-second">
		<div class="toolbar">
			<div class="nav-secondul">
				<ul>
					<li class="liactive"><a href="javascript:void(0);">房间信息</a></li>
					<li><a href="roomCheck.jsp?rid=<%=rid%>&rNum=<%=rNum%>">查房状态</a></li>
					<li><a href="javascript:void(0);">维修状态</a></li>
					<li class="linormal"><a href="javascript:void(0);">其他</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 三级导航栏 end-->

	<div class="body-content">
		<!-- 房间信息 start -->
		<div class="tab-content">
			<div class="tab-header">
				<div>
					<span class="flag">1</span>
					<h3>房间信息</h3>
				</div>
			</div>
			<div id="room-guest" class="roomInfo">
				<div class="ul">
					<ul>
						<li><span class="span">房间号：</span><span class="roomNo"></span></li>
						<li><span class="span">面积：</span><span class="area"></span></li>
					</ul>
				</div>
				<div class="ul">
					<ul>
						<li><span class="span">房间状态：</span><span class="state"></span></li>
						<li><span class="span">备注：</span><span class="comm"></span></li>
					</ul>
				</div>
				<div class="ul">
					<ul>
						<li><span class="span">租金：</span><span class="rent"></span></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- 房间信息 end -->

		<!-- 租客信息 start -->
		<div class="tab-content">
			<div class="tab-header">
				<div>
					<span class="flag">2</span>
					<h3>租客信息</h3>
				</div>
			</div>
			<div id="room-guest">
				<div class="ul">
					<ul>
						<li><span class="span">租客姓名：</span><span id="guestName"></span></li>
						<li><span class="span">职务：</span><span id="position"></span></li>
						<li><span class="span">租金：</span><span id="charge"></span></li>
					</ul>
				</div>
				<div class="ul">
					<ul>
						<li><span class="span">联系电话：</span><span id="telNum"></span></li>
						<li><span class="span">入住日期：</span><span id="inDate"></span></li>
						<li><span class="span">车位：</span><span id="park"></span></li>
					</ul>
				</div>
				<div class="ul">
					<ul>
						<li><span class="span">所在公司：</span><span id="company"></span></li>
						<li><span class="span">入住人数：</span><span id="totalNum"></span></li>
						<li><span class="span">备注：</span><span id="comment"></span></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- 租客信息 start -->

		<!-- 物品信息 start -->
		<div class="tab-content">
			<div class="tab-header">
				<div>
					<span class="flag">3</span>
					<h3>物品信息</h3>
				</div>
			</div>
			<div id="room-item">
				<div class="inner-table">
					<h3>家具信息</h3>
					<table id="item_furniture" class="table table-striped">
						<thead>
							<tr>
								<th>编号</th>
								<th>名称</th>
								<th>品牌</th>
								<th>类别</th>
								<th>标签</th>
								<th>备注</th>
							<tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<div class="inner-table">
					<h3>家电信息</h3>
					<table id="item_electric" class="table table-striped">
						<thead>
							<tr>
								<th>编号</th>
								<th>名称</th>
								<th>品牌</th>
								<th>类别</th>
								<th>标签</th>
								<th>备注</th>
							<tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<div class="inner-table">
					<h3>灯具信息</h3>
					<table id="item_light" class="table table-striped">
						<thead>
							<tr>
								<th>编号</th>
								<th>名称</th>
								<th>品牌</th>
								<th>类别</th>
								<th>标签</th>
								<th>备注</th>
							<tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<div class="inner-table">
					<h3>窗帘及浴屏</h3>
					<table id="item_curtain" class="table table-striped">
						<thead>
							<tr>
								<th>编号</th>
								<th>名称</th>
								<th>品牌</th>
								<th>类别</th>
								<th>标签</th>
								<th>备注</th>
							<tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<div class="inner-table">
					<h3>备品信息</h3>
					<table id="item_little" class="table table-striped">
						<thead>
							<tr>
								<th>编号</th>
								<th>名称</th>
								<th>品牌</th>
								<th>类别</th>
								<th>标签</th>
								<th>备注</th>
							<tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- 物品信息 start -->
	</div>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/tenant/roomGuest.js"></script>
	<script>
		$(function(){
			if (<%=rid%>!=null) {
				// 获取房屋信息
				getRoomInfo(parseInt(<%=rid%>), "<%=rNum%>");
				// 获取租客信息
				getGuestInfo(parseInt(<%=rid%>), "<%=rNum%>");
				// $("#asset-link").attr("href", "./roomAsset.jsp?rid="+roomId + "rNum=" + roomNum);

				getFurniture(parseInt(<%=rid%>), "<%=rNum%>");
				getElectric(parseInt(<%=rid%>), "<%=rNum%>");
				getLight(parseInt(<%=rid%>), "<%=rNum%>");
				getCurtain(parseInt(<%=rid%>), "<%=rNum%>");
				getLittle(parseInt(<%=rid%>), "<%=rNum%>");
			}
		});
		//getMeters();
	</script>
</body>
</html>