<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/plugin/calendar/dateRange.css"/>
<link href="${pageContext.request.contextPath}/css/ld/user/home/public.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/plugin/calendar/monthPicker.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/plugin/calendar/dateCustom.css"/>
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/service/serviceBusCom.css" rel="stylesheet" type="text/css" />
<title>通勤车</title>
</head>
<body>
	<jsp:include page="../../_header.jsp"></jsp:include>
	<jsp:include page="../../_leftMenu.jsp" />

	<!-- 页面内容 strat -->
	<div class="main">
		<div class="main-page">
			<div class="nav-path">
				<a href="../roomServiceIndex.jsp" title="回到首页"><i class="icon-home"></i></a> 
				<i class="icon-path"></i> 
				<a href="serviceIndex.jsp">客房服务</a>
				<i class="icon-path"></i> 
				<a href="serviceBus.jsp">车费</a>
				<i class="icon-path"></i> 
				<a href="serviceBusCom.jsp">通勤车</a>
			</div>
			<a class="btn btn-new btnnew" href="serviceNewBusCom.jsp">新增通勤车车费记录</a>
			<div class="bill-area">
				<div class="search">
					<span>房间号：</span><input id="searchRoomNum" type="text" value="">
				</div>
				<div class="calendarPart">
					<span class="span">日期：</span>
					<div class="tool_date cf">
						<div class="ta_date" id="div_month_picker">
							<span class="date_title" id="month_picker"></span>
						</div>
					</div>
					<a class="btn btn-edit btnEdit" onclick="serachFareByDate(1);">搜索</a>
				</div>
				<div class="bill-table">
					<!-- 费用 table start -->
					<table id="busTable">
						<tbody>
						    <tr class="date"></tr>
							<tr class="roomNo"></tr>
							<tr class="name"></tr>						
							<tr class="price"></tr>

							<tr class="one"></tr>
							<tr class="two"></tr>
							<tr class="three"></tr>
							<tr class="four"></tr>
							<tr class="five"></tr>
							<tr class="six"></tr>
							<tr class="seven"></tr>
							<tr class="eight"></tr>
							<tr class="nine"></tr>
							<tr class="ten"></tr>
							<tr class="eleven"></tr>
							<tr class="twelve"></tr>
							<tr class="thirteen"></tr>
							<tr class="fourteen"></tr>
							<tr class="fifteen"></tr>
							<tr class="sixteen"></tr>
							<tr class="seventeen"></tr>
							<tr class="eighteen"></tr>
							<tr class="nineteen"></tr>
							<tr class="twenty"></tr>
							<tr class="twentyOne"></tr>
							<tr class="twentyTwo"></tr>
							<tr class="twentyThree"></tr>
							<tr class="twentyFour"></tr>
							<tr class="twentyFive"></tr>
							<tr class="twentySix"></tr>
							<tr class="twentySeven"></tr>
							<tr class="twentyEight"></tr>
							<tr class="twentyNine"></tr>
							<tr class="thirty"></tr>
							<tr class="thirtyOne"></tr>

							<tr class="days"></tr>
							<tr class="total"></tr>
						</tbody>
					</table>
					<!-- 费用 table end -->

					<!-- 底部页面 start -->
					<div id="serviceBusBottom" class="bottom"></div>
					<!-- 底部页码 end -->
				</div>
			</div>
		</div>
	</div>
	<!-- 页面内容 end -->

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/calendar/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/calendar/dateRange.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/calendar/monthPicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/roomService.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/service/serviceBusCom.js"></script>
	<script type="text/javascript">
	    // 拉取第一页 本月车费信息
	    monthPicker.create('month_picker', {
			autoCommit : true,
			callback : function(obj){
				//console.log(obj);
			}
	  	});
	  	var nowDate = new Date();
	  	var date = nowDate.getFullYear() + "-" + Number(nowDate.getMonth() + 1);
	  	console.log(date);
	  	requestFare(1,date);
	</script>
</body>
</html>