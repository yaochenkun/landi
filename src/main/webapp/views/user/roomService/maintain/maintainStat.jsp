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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/plugin/calendar/dateRange.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/plugin/calendar/monthPicker.css"/>
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/maintain/maintainStat.css" rel="stylesheet" type="text/css" />
<title>维修统计</title>
</head>
<body>

	<jsp:include page="../../_header.jsp" />
	<jsp:include page="../../_leftMenu.jsp" />

	<!-- 页面内容 strat -->
	<div class="main">
		<div class="main-page">
			<div class="nav-path">
				<a href="../roomServiceIndex.jsp" title="回到首页"><i class="icon-home"></i></a>
				<i class="icon-path"></i>
				<a href="maintainIndex.jsp" style="font-size: 14px;">客房维修</a>
				<i class="icon-path"></i>
				<a href="javascript:void(0);" style="font-size: 14px;">维修统计</a>
			</div>
			<div class="bill-area">
				<div class="table-title">
					<div class="maintainItemType">
						<div class="search">
							<span>房间号：</span><input id="searchRoomNum" type="text" value="W33-3">
						</div>
						<!-- 双日历 start -->
						<div class="calendarPart">
							<span class="date">日期：</span>
							<div class="ta_date" id="div_date_demo3">
					            <span class="date_title" id="date_demo3"></span>
					        </div>
					        <div id="datePicker"></div>
						</div>
						<!-- 双日历 end -->
						<a class="btn btn-edit btnEdit" onclick="requestMaintainByDate(1);">搜索</a>
					</div>
					<a href="" class="btn btn-edit btnExcel">导出列表</a>
				</div>

				<div class="bill-table">
					<!-- 费用 table start -->
					<table>
						<thead>
							<tr id='theadFirst'>
								<th rowspan="2"><span>房间号</span></th>
								<th rowspan="2" colspan="2"><span>房间信息</span></th>
								<th rowspan="2" colspan="2"><span>入住情况</span></th>
								<th colspan="4"><span>问题等级合计</span></th>
								<th colspan="2"><span>未解决</span></th>
								<th rowspan="2"><span>合计</span></th>
								<th rowspan="2"><span>操作</span></th>
							</tr>
							<tr id='theadSecond'>
								<th><span>一级</span></th><th><span>二级</span></th>
								<th><span>三级</span></th><th><span>四级</span></th>
								<th><span>未解决第四等级问题</span></th><th><span>其余未解决</span></th>
							</tr>
						</thead>
						<tbody id="maintainStatTbody"></tbody>
					</table>
					<!-- 费用 table end -->

					<!-- 底部页面 start -->
					<div id="maintainManageBottom" class="bottom"></div>
					<!-- 底部页码 end -->
				</div>
			</div>
		</div>
	</div>
	<!-- 页面内容 end -->

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/calendar/dateRange.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/calendar/monthPicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/maintain/maintainStat.js"></script>
	<script>
	var dateRange = new pickerDateRange('date_demo3', {
			isTodayValid : true,
			startDate : '2017-01-01',
			endDate : '2017-01-31',
			defaultText : ' 至 ',
			theme : 'ta',
			success : function(obj) {
				// console.log(obj);
			}
		});
	    // 请求第一页维修统计信息
	    requestMaintainStat(1);
	</script>
</body>
</html>