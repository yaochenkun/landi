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
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/roomService.css"	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/service/serviceNew.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/service/serviceBusNew.css" rel="stylesheet" type="text/css" />
<title>添加通勤车车费记录</title>
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
				<a id="serviceType" href="serviceBus.jsp">车费</a>
				<i class="icon-path"></i>
				<a href="serviceBusCom.jsp">通勤车</a>
				<i class="icon-path"></i>
				<a href="javascript:void(0);">新增通勤车车费记录</a>
			</div>
			<div class="body">
				<div class="body-content">
					<ul>
						<li id="dateLi"><span>通勤日期：</span><input id="newBusDate" type="text" class="pack_maintain"/></li>
						<li id="roomNumLi"><span>房间号：</span>
							<input id="serviceRoomNumber" type="text" value="W33-3" />
							<span class="red red-right">*&nbsp;必填</span></li>
						<li id="roomIdWarning"><span class="red">不能为空！</span></li>
						<li id="nameLi"><span>客人姓名：</span><input id="guestName" type="text" value="Alice" /></li>
						<li id="othersLi"><span>其他人员：</span><input id="othersName" type="text" value="" /></li>
						<a href="javascript:void(0);" class="btn btn-goback" id="btn-search" onclick="searchBusCom();">搜索本月通勤车记录</a>
						<table id="newBusComTable">
							<tbody>
								<tr><td>日期</td><td>1日</td><td>2日</td><td>3日</td><td>4日</td>
									<td>5日</td><td>6日</td><td>7日</td><td>8日</td><td>9日</td>
									<td>10日</td><td>11日</td><td>12日</td><td>13日</td><td>14日</td>
									<td>15日</td>
								</tr>
								<tr><td>记录</td><td><input type="checkbox" value=""/></td>
									<td><input type="checkbox" value=""/></td><td><input type="checkbox" value=""/></td>
									<td><input type="checkbox" value=""/></td><td><input type="checkbox" value=""/></td>
									<td><input type="checkbox" value=""/></td><td><input type="checkbox" value=""/></td>
									<td><input type="checkbox" value=""/></td><td><input type="checkbox" value=""/></td>
									<td><input type="checkbox" value=""/></td><td><input type="checkbox" value=""/></td>
									<td><input type="checkbox" value=""/></td><td><input type="checkbox" value=""/></td>
									<td><input type="checkbox" value=""/></td><td><input type="checkbox" value=""/></td>
								</tr>
								<tr><td>16日</td><td>17日</td><td>18日</td><td>19日</td><td>20日</td>
									<td>21日</td><td>22日</td><td>23日</td><td>24日</td><td>25日</td>
									<td>26日</td><td>27日</td><td>28日</td><td>29日</td><td>30日</td>
									<td>31日</td>
								</tr>
								<tr>
									<td><input type="checkbox" value=""/></td><td><input type="checkbox" value=""/></td>
									<td><input type="checkbox" value=""/></td><td><input type="checkbox" value=""/></td>
									<td><input type="checkbox" value=""/></td><td><input type="checkbox" value=""/></td>
									<td><input type="checkbox" value=""/></td><td><input type="checkbox" value=""/></td>
									<td><input type="checkbox" value=""/></td><td><input type="checkbox" value=""/></td>
									<td><input type="checkbox" value=""/></td><td><input type="checkbox" value=""/></td>
								    <td><input type="checkbox" value=""/></td><td><input type="checkbox" value=""/></td>
									<td><input type="checkbox" value=""/></td><td><input type="checkbox" value=""/></td>
								</tr>
							</tbody>
						</table></br>
						<li class="monthTotalLi"><span>本月合计：</span><input id="monthTotal" type="text" value="0" disabled="disabled"/> <a onclick="addserviceBus();" class="btn btn-goback goback">确认添加</a></li>
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
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/service/serviceBusCom.js"></script>
	<script>
		// 设置为当前日期
		var date = new Date();
		$("#newBusDate").val(formatDateForm(date));
		$('#newBusDate').date_input();
	</script>
</body>
</html>