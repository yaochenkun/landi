<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/plugin/simpleCalendar/date_pack.css"	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/home/public.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/roomService.css"	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/service/serviceNew.css" rel="stylesheet" type="text/css" />


<title>添加客房服务</title>
</head>
<body>
	<jsp:include page="../../_header.jsp"></jsp:include>
	<jsp:include page="../../_modal.jsp" />
	
	<!-- 页面内容 start -->
	<div class="main">
		<div class="main-page">
			<div class="nav-path">
				<a href="../../home/opeMenu.jsp" title="回到首页"><i class="icon-home"></i></a>
				<%--<i class="icon-path"></i>--%>
				<%--<a href="serviceIndex.jsp">客房服务</a>--%>
				<i class="icon-path"></i>
				<a id="serviceType" href="serviceTakeaway.jsp">餐费</a>
				<i class="icon-path"></i>
				<a href="javascript:void(0);">新增餐费记录</a>
			</div>
			<div class="body">
				<div class="body-content">
					<ul>
						<li><span class="span">房间号：</span>
							<input id="serviceRoomNumber" type="text" value="" onblur="associateGuestName(this);"/>
							<span class="red red-right">*&nbsp;必填</span></li>
						<li id="roomIdWarning"><span class="span"></span><span class="red">不能为空！</span></li>
						<li><span class="span">客户姓名：</span><input type="text" id="guestName" disabled="disabled" /></li>
						<li id="resSort"><span class="span">餐厅：</span><input type="text" id="resInput" value="其他"/>
								<div class="resMenu">
										<ul>
										</ul>
									</div>
						</li>
						<li><span class="span">金额：</span><input type="text" id="count" value="0" />元</li>
						<li><span class="span"></span>
						    <input type="radio" value="0" name="pay" checked="checked"/>现金
						    <input type="radio" value="1" name="pay"/>月结
						</li>
						<li><span class="span">备注：</span><input type="text" id="comment" value="无" /></li>
						<li><span class="span">点餐日期：</span><input type="text"  id="time" class="pack_maintain" /></li>
						<li id="staffSort"><span class="span">点餐人：</span><input value="0 请选择" type="text" id="staffInput" />
						    <div class="staffMenu">
								<ul id="staff">
								</ul>
							</div>
						 </li>
						<li><span class="span"></span><a onclick="addservice_Takeaway();" class="btn btn-goback goback">确认添加</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 页面内容 end -->
    <div class="shadow"></div>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/simpleCalendar/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/simpleCalendar/date_pack.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/roomService.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/service/serviceNew.js"></script>
	<script type="text/javascript">
	    //填入时间
	    // 按时间查询接送机记录
		var nowDate = new Date();
		$(".pack_maintain").val(formatDateForm(nowDate));
	    $('.pack_maintain').date_input();

        //获取饭店
        requestRestaurant();

	    //获取点餐人
	    requestStaff("点餐");
	</script>
</body>
</html>