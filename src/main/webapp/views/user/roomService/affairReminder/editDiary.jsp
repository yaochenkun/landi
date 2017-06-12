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
	<link href="${pageContext.request.contextPath}/css/ld/user/roomService/affairReminder/public.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/css/ld/user/roomService/affairReminder/writeMail.css" rel="stylesheet" type="text/css" />
	<title>个人日志详情</title>
</head>
<body>
<jsp:include page="../../_header.jsp"></jsp:include>
<jsp:include page="../../_leftMenu.jsp" />
<jsp:include page="../../_modal.jsp" />

<!-- 页面内容 start -->
<div class="main">
	<div class="main-page">
		<div class="nav-path nav-path0">
			<a href="../roomServiceIndex.jsp" title="回到首页"><i class="icon-home"></i></a>
			<i class="icon-path"></i>
			<a href="affairReminderIndex.jsp">事务提醒</a>
			<i class="icon-path"></i>
			<a href="diaryOverview.jsp;">个人日志</a>
			<i class="icon-path"></i>
			<a href="javascript:void(0);">详情</a>
		</div>
		<div class="body">
			<div class="body-content">
				<ul>
					<li><span>提醒时间：</span><input type="text" class="pack_maintain"></li>
					<li><span>主题：</span><input type="text" id="reminderTitle"/></li>
					<li style="margin-bottom: -15px;"><span>内容：</span></li>
					<textarea id="reminderContent" cols="155" rows="10"></textarea>
					<li><a onclick="updateDiaryReminder(${param.id});" class="btn btn-goback goback">更新</a></li>
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
<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/affairReminder/diaryReminder.js"></script>
<script type="text/javascript">

    // 设置为当前时间
    var nowDate = new Date();
    $(".pack_maintain").val(formatDateForm(nowDate));
    $('.pack_maintain').date_input();

	searchDiaryReminderDetail('${param.id}');
</script>
</body>
</html>