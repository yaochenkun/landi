<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/plugin/calendar/dateRange.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/plugin/calendar/monthPicker.css"/>
<link href="${pageContext.request.contextPath}/css/ld/user/home/public.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/office/shopDetail.css" rel="stylesheet" type="text/css" />
<title>商品销售详情</title>
</head>
<body>
	<jsp:include page="../_header.jsp"></jsp:include>
	<jsp:include page="../_leftMenu.jsp" />
	<jsp:include page="../_modal.jsp" />

	<% String goodId = request.getParameter("goodId");%>
	<div style='display:none;' id='goodId'><%=goodId%></div>

	<!-- 页面内容 strat -->
	<div class="main">
		<div class="main-page">
			<div class="bill-area">
				<!-- 双日历 start -->
				<div class="calendarPart">
					<span class="date">选择日期范围：</span>
					<div class="ta_date" id="div_date_demo3">
			            <span class="date_title" id="date_demo3"></span>
			        </div>
			        <div id="datePicker"></div>
				</div>
				<!-- 双日历 end -->
				<a href="shopManage.jsp" class="btn btn-goback">返&nbsp;回</a>
				<div class="bill-table">
					<!-- 费用 table start -->
					<table id='shopDetailTable'>
						<thead>
							<tr>
								<th><span>日期</span></th>
								<th><span>事件</span></th>
								<th><span>单价</span></th>
								<th><span>数量</span></th>
								<th><span>总价</span></th>
							</tr>
						</thead>
						<tbody id="shopDetailTbody"></tbody>
					</table>
					<!-- 费用 table end -->

					<!-- 底部页面 start -->
					<div id="shopDetailBottom" class="bottom"></div>
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
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/office/shopDetail.js"></script>
	<script type="text/javascript">
	    var dateRange = new pickerDateRange('date_demo3', {
			isTodayValid : true,
			startDate : '2017-01-01',
			endDate : '2017-01-31',
			defaultText : ' 至 ',
			theme : 'ta',
			success : function(obj) {
				console.log(obj);
				requestGoodDetail(1);
			}
		});

		// 拉取第一页 商品销售记录
		requestGoodDetail(1);
	</script>
</body>
</html>