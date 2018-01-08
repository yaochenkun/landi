<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="org.ld.model.User"%>
<%@ page import="java.util.Date, java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/home/public.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/plugin/simpleCalendar/date_pack.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/affairReminder/public.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/affairReminder/diaryOverview.css" rel="stylesheet" type="text/css" />
<title>备忘录</title>
</head>
<body>

	<jsp:include page="../../_header.jsp" />
	<jsp:include page="../../_modal.jsp" />

	<!-- 页面内容 strat -->
	<div class="main">
		<div class="main-page">
			<span id="uid" uid="${curUser.ID}"/>
			<div class="nav-path nav-path0">
				<a href="../../home/homeUser.jsp" title="回到首页"><i class="icon-home"></i></a>
				<i class="icon-path"></i>
				<a href="javascript:void(0);">备忘录</a>
			</div>
			<a class="btn btn-new btnnew" href="writeDiary.jsp">写日志</a>


			<div class="nav-path">
				<span>关键字：</span><input id="keyword" type="text" value="">
				<span style="margin-left:30px;">提醒时间：</span><input type="text" class="pack_maintain">
				<a class="btn btn-edit btnEdit" style="margin-left:30px;" onclick="searchDiaryReminderByPage(1);">搜索</a>
			</div>

			<div class="bill-area">
				<div class="bill-table">
					<!-- 费用 table start -->
					<table>
						<thead>
							<tr>
								<th><span>序号</span></th>
								<th><span>主题</span></th>
								<th><span>提醒时间</span></th>
								<th><span>发表时间</span></th>
								<th><span>完成情况</span></th>
								<th><span>操作</span></th>
							</tr>
						</thead>
						<tbody id="reminderOverviewTbody">
							<tr>
								<td>1</td>
								<td>W33-6客房的客人周末要预订一桶水W33-6客房的客人周末要预订一桶水</td>
								<td>2017-06-08</td>
								<td>2017-06-08</td>
								<td>完成</td>
								<td><a href="#" class="detail">详情</a><a href="#" class="delete">删除</a></td>
							</tr>
						</tbody>
					</table>
					<!-- 费用 table end -->

					<!-- 底部页面 start -->
					<div id="reminderOverviewBottom" class="bottom"></div>
					<!-- 底部页码 end -->
				</div>
			</div>
		</div>
	</div>
	<!-- 页面内容 end -->
	<div class="shadow"></div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomItem/roomItem.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomItem/itemRoomOverview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/affairReminder/diaryReminder.js"></script>

	<!--日期筛选器-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/simpleCalendar/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/simpleCalendar/date_pack.js"></script>

	<!-- 导出插件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/exportCsv/Blob.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/exportCsv/FileSaver.js"></script>

	<!-- 打印插件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/printer/print.min.js"></script>
	<script>

        var nowDate = new Date();
        $(".pack_maintain").val(formatDateForm(nowDate));
        $('.pack_maintain').date_input();


        //查询第一页信息
        searchDiaryReminderByPage(1);

	</script>
</body>
</html>
