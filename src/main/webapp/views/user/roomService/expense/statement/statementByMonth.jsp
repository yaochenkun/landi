<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<link href="${pageContext.request.contextPath}/css/ld/user/roomService/roomService.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		select{
			padding: 1px;
			border-radius: 5px;
			outline: none;
		}
	</style>
<title>月结算</title>
</head>
<body>
	<jsp:include page="../../../_header.jsp"></jsp:include>
	<jsp:include page="../../../_modal.jsp" />

	<!-- 页面内容 strat -->
	<div class="main">
		<div class="main-page">
			<div class="nav-path">
				<a href="../../../home/homeUser.jsp" title="回到首页"><i class="icon-home"></i></a>
				<i class="icon-path"></i>
				<a href="javascript:void(0);">月结算</a>
			</div>
			<div class="bill-area">
			    <div class="search">
					<div class="roomNumFloat">
			            <span>房间号: </span><input id="search-input" type="text" value="">
					</div>
					<div class="roomNumFloat">
						<span>姓名: </span><input id="guestName" type="text" value="" disabled="disabled">
					</div>

					<div id="date" >
						<select name="year" id="year">
							<option value="">选择年份</option>
						</select>
						<select name="month" id="month" style="padding-left: 5px;">
							<option value="">选择月份</option>
						</select>

					</div>

					<div style="float: right;margin-top:20px;margin-bottom: 5px;">
						<a class="btn btn-edit btnEdit" onclick="requestFirstStatement(this);" >搜索</a>
						<a class="btn btn-edit btnEdit" onclick="exportList();" >导出</a>
						<a class="btn btn-edit btnEdit" onclick="printList('hahaha');">打印</a>
					</div>
					<div style="float:right;margin-right: 55px;margin-top: 20px;">
						<span style="color: red;padding-left: 10px;">总计：</span><span id="total">0</span><span style="color: red;padding-left: 10px;">元</span>
					</div>
				</div>
				<div class="bill-table">
					<!-- 费用 table start -->
					<table style="table-layout:fixed;word-break:break-all;">
						<thead>
							<tr>
								<th>收费类型</th>
								<th>日期</th>
								<th>物品</th>
								<th>费用</th>
								<th>备注</th>
							</tr>
						</thead>
						<tbody id="shoeCleaningTbody"></tbody>
					</table>
					<!-- 费用 table end -->

					<!-- 底部页面 start -->
					<div id="serviceShoeCleaningBottom" class="bottom"></div>
					<!-- 底部页码 end -->

				</div>
			</div>
		</div>
	</div>
	<div class="shadow"></div>
	<!-- 页面内容 end -->

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<!-- 日历-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/calendar/dateRange.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/calendar/monthPicker.js"></script>
		
	<!-- 导出插件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/exportCsv/Blob.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/exportCsv/FileSaver.js"></script>

	<!-- 打印插件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/printer/print.min.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<%--<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/roomService.js"></script>--%>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/expense/statement/statement.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/calendar/select.js"></script>

	<script type="text/javascript">

        // 拉取第一页 擦鞋费信息
		requestFirstPage();
			$(function(){
				$("#date").selectDate()

				$("#month").focusout(function(){
					var year = $("#year option:selected").html()
					var month = $("#month option:selected").html()
					console.log(year+month)
				})

			})
	</script>
</body>
</html>