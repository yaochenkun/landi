<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css"	rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/plugin/calendar/dateRange.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/plugin/calendar/monthPicker.css"/>

<link href="${pageContext.request.contextPath}/css/ld/user/home/public.css"	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/tenant/tenantPublic.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/ld/user/tenant/checkRoom.css" rel="stylesheet" type="text/css" />
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
					<li><a href="roomGuest.jsp?rid=<%=rid%>&rNum=<%=rNum%>">房间信息</a></li>
					<li class="liactive"><a href="javascript:void(0);">查房状态</a></li>
					<li><a href="javascript:void(0);">维修状态</a></li>
					<!-- <li class="linormal"><a href="javascript:void(0);">其他</a></li> -->
				</ul>
			</div>
		</div>
	</div>
	<!-- 三级导航栏 end-->

	<!-- 页面内容 start-->
	<div class="body-content">
		<!-- 双日历 start -->
		<div class="calendarPart">
			<span class="date">选择查房时间：</span>
			<div class="ta_date" id="div_date_demo3">
	            <span class="date_title" id="date_demo3"></span>
	        </div>
	        <div id="datePicker"></div>
		</div>
		<!-- 双日历 end -->

		<div class="content">
			<!-- 图片样式 start -->
			<div class="roomPic">
				<div class="ban">
					<div class="big_pic">
						<ul></ul>
					</div>
					<div class="min_pic">
						<div class="prev_btn"><</div>
						<div class="num">
							<ul></ul>
						</div>
						<div class="next_btn">></div>
					</div>
				</div>
				<div id="bigimg"></div>
				<div id="smalldiv"></div>
			</div>
			<!-- 图片样式 end -->

			<!-- 上传图片 start -->
			<div class="uploadPic">
				<div class="head">
					<span class="spanbig"><%=request.getParameter("rNum") %></span><span
						class="spansmall">&nbsp;&nbsp;房间</span>
					<form modelAttribute="user" method="post"
						enctype="multipart/form-data"
						action="${pageContext.request.contextPath }/userRoom/uploadFiles.action">
						<div class="btn btn-upload">+ 上传图片</div>
						<input id="uploadRoomPic" type="file" name="file"
							multiple="multiple" /> <input type="submit"
							class="btn btn-submit" value="提交" />
					</form>
				</div>
				<div class="fileContent">
					<ul></ul>
				</div>
			</div>
			<!-- 上传图片 end -->
		</div>
	</div>
	<!-- 页面内容 end-->

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/calendar/dateRange.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/calendar/monthPicker.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/tenant/checkRoom.js"></script>
	<script>
    	$(function(){
    		// ！！目前同意采用 rNum查询查房图片
			getRoomIDByNumber("<%=request.getParameter("rNum") %>");
    	})
    	var dateRange = new pickerDateRange('date_demo3', {
					isTodayValid : true,
					startDate : '2016-11-01',
					endDate : '2016-11-30',
					defaultText : ' 至 ',
					theme : 'ta',
					success : function(obj) {
						// console.log(obj);
						requestRoomPicByDate(obj.startDate, obj.endDate);
					}
				});
    </script>
</body>
</html>