<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Expires" content="0">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-control" content="no-cache">
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/home/public.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/plugin/simpleCalendar/date_pack.css"	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/tenant/tenantPublic.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/ld/user/tenant/roomGuest.css" rel="stylesheet" type="text/css" />
<title>房间信息</title>
</head>
<body>
	<jsp:include page="../_header.jsp"></jsp:include>
	<jsp:include page="../_leftMenu.jsp"></jsp:include>
	<jsp:include page="../_modal.jsp"></jsp:include>

	<% String rid = request.getParameter("rid"); %>
	<% String rNum = request.getParameter("rNum"); %>
	<div style="display:none;" id="rid"><%=rid%></div>
	<div style="display:none;" id="rNum"><%=rNum%></div>
	
	<!-- 三级导航栏 start -->
	<div class="nav-second">
		<div class="toolbar">
			<div class="nav-secondul">
				<ul>
					<li class="liactive"><a href="javascript:void(0);">房间信息</a></li>
					<li><a href="roomCheck.jsp?rid=<%=rid%>&rNum=<%=rNum%>">查房状态</a></li>
					<li><a href="roomMaintain.jsp?rid=<%=rid%>&rNum=<%=rNum%>">维修状态</a></li>
					<!-- <li class="linormal"><a href="javascript:void(0);">其他</a></li> -->
				</ul>
			</div>
		</div>
	</div>
	<!-- 三级导航栏 end-->

	<div class="body-content">
		<div class="tenant-title">
			<span><span class="roomNumber"><%=rNum%></span>&nbsp;&nbsp;房间</span>
		</div>
		<a class="btn btn-man"  onclick="roomManage('<%=rNum%>');">房源管理</a>
		<a class="btn btngoback" href="generalMap.jsp">返回租客一览图</a>

		<!-- 房间信息 start -->
		<div class="tab-content">
			<div class="room-guest room">
				<div class="noData">没有房间信息！</div>
				<div class="roomInfo">
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
		</div>
		<!-- 房间信息 end -->

		<!-- 租客信息 start -->
		<div class="tab-content">
			<div class="room-guest user">
				<div class="noData">没有租客信息！</div>
				<div class="userInfo">
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
		</div>
		<!-- 租客信息 start -->

		<!-- 物品信息 start -->
		<div class="tab-content">
			<!-- 家具信息 start -->
			<div class="room-item">
				<div class="inner-table">
					<h4>家具</h4>
					<table>
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
						<tbody id="item_furniture"></tbody>
					</table>
					<div id="furnitureBottom" class="bottom"></div>
				</div>
				<!-- 家具信息 end -->

				<!-- 家电信息 start -->
				<div class="inner-table">
					<h4>家电</h4>
					<table>
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
						<tbody id="item_electric"></tbody>
					</table>
					<div id="electricBottom" class="bottom"></div>
				</div>
				<!-- 家电信息 start -->

				<!-- 灯具信息 start -->
				<div class="inner-table">
					<h4>灯具</h4>
					<table>
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
						<tbody id="item_light"></tbody>
					</table>
					<div id="lightBottom" class="bottom"></div>
				</div>
				<!-- 灯具信息 start -->

				<!-- 窗帘及浴屏 start -->
				<div class="inner-table">
					<h4>窗帘及浴屏</h4>
					<table>
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
						<tbody id="item_curtain"></tbody>
					</table>
					<div id="curtainBottom" class="bottom"></div>
				</div>
				<!-- 窗帘及浴屏 end -->
				
				<!-- 备品信息 start -->
				<div class="inner-table">
					<h4>备品</h4>
					<table>
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
						<tbody id="item_little"></tbody>
					</table>
					<div id="littleBottom" class="bottom"></div>
				</div>
				<!-- 备品信息 start -->
			</div>
		</div>
		<!-- 物品信息 start -->
	</div>

	<!-- 房源管理 start-->
	<div class="shadow"></div>
	<div class="manage">
		<div class="man-content">
			<div class="man-title">
				<span class="span">添加房源信息</span>
				<span class="cross" onclick="crossQuit();">x</span>
			</div>
			<div class="man-body">
				<div id="man-type" class="item">
					<span class="span">房源管理:</span>
					<div class="item-content">
						<a class="btn btn-item" id="addroom" onclick="addChange(this);">添加房源</a>
						<a class="btn btn-item" id="replaceroom" onclick="replaceChange(this);">替换房源</a>
						<a class="btn btn-item" id="deleteroom" onclick="delChange(this);">退还房源</a>
					</div>
				</div>
				<div id="room-type" class="item" >
					<span class="span">房源类型:</span>
					<div class="item-content">
						<a class="btn btn-item" onclick="addForLE(this);">LE</a>
						<a class="btn btn-item" onclick="addForSPC(this);">SPC</a>
						<a class="btn btn-item" onclick="addForOwner(this);">小业主</a>
					</div>
				</div>
				<div id="room-name" class="item" >
					<span class="span">业主姓名:</span>
					<div class="item-content"><input type="text" id="owner"/></div>
				</div>
				<div id="room-replace" class="item" >
					<span class="span">替换为：</span>
					<div class="item-content"><input type="text" id="replace_room"/></div>
				</div>
				<div id="man-date" class="item" >
					<span id="change-date" class="span">接收日期</span>
					<div class="item-content"><input type="text" class="pack_maintain"/></div>
				</div>
				<div id="com" class="item" >
					<span class="span">备注：</span>
					<div class="item-content"><input type="text" value="无" id="commend"/></div>
				</div>
			</div>
			<div class="man-foot">
				<div id="man-foot-content" >
					<a class="btn btn-submit" onclick="addManage('<%=rNum%>');">确定</a>
				</div>
			</div>

		</div>

	</div>
	<!-- 房源管理 end-->

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/simpleCalendar/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/simpleCalendar/date_pack.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/tenant/roomGuest.js"></script>
	<script>
		$(function(){
			if (<%=rid%>!=null) {
				// 获取房屋信息
				getRoomInfo(parseInt(<%=rid%>), "<%=rNum%>");
				// 获取租客信息
				getGuestInfo(parseInt(<%=rid%>), "<%=rNum%>");
				// 获取物品信息
				getFurniture(1);
				getElectric(1);
				getLight(1);
				getCurtain(1);
				getLittle(1);
			}else{  // 数据库中没有录入该房间信息
				$(".room .noData").css("display","block");
				$(".user .noData").css("display","block");
				$("#item_furniture").append("<tr><td class='no-data' colspan='6' style='color: #f95c00'>"+
					"没有相关数据！</td></tr>");
				$("#item_electric").append("<tr><td class='no-data' colspan='6' style='color: #f95c00'>"+
					"没有相关数据！</td></tr>");
				$("#item_light").append("<tr><td class='no-data' colspan='6' style='color: #f95c00'>"+
					"没有相关数据！</td></tr>");
				$("#item_curtain").append("<tr><td class='no-data' colspan='6' style='color: #f95c00'>"+
					"没有相关数据！</td></tr>");
				$("#item_little").append("<tr><td class='no-data' colspan='6' style='color: #f95c00'>"+
					"没有相关数据！</td></tr>");
			}

            var nowDate = new Date();
            $(".pack_maintain").val(formatDateForm(nowDate));
            $('.pack_maintain').date_input();
		});
	</script>
</body>
</html>