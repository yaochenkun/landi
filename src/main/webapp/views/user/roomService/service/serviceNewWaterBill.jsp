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
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/roomService.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/service/serviceNew.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/service/serviceNewWaterBill.css" rel="stylesheet" type="text/css" />
<title>新增饮用水费记录</title>
</head>
<body>
	<jsp:include page="../../_header.jsp"></jsp:include>
	<jsp:include page="../../_leftMenu.jsp" />
	<jsp:include page="../../_modal.jsp" />

	<!-- 页面内容 start -->
	<div class="main">
		<div class="main-page">
			<div class="nav-path">
				<a href="../../home/homeUser.jsp" title="回到首页"><i class="icon-home"></i></a>
				<%--<i class="icon-path"></i>--%>
				<%--<a href="serviceIndex.jsp">客房服务</a>--%>
				<i class="icon-path"></i>
				<a href="serviceWaterBill.jsp">饮用水费</a>
				<i class="icon-path"></i>
				<a href="javascript:void(0);">新增饮用水费记录</a>
			</div>
			<div class="body">
				<div class="body-content">
					<ul>

						<li><span class="span">房间号：</span>
							<input id="serviceRoomNumber" type="text" value="" onblur="associateGuestName(this)"/>
							<span class="red red-right">*&nbsp;必填</span></li>
						<li id="roomIdWarning"><span class="span"></span><span class="red">不能为空！</span></li>
						<li><span class="span">客户姓名：</span><input type="text" value="" disabled="disabled" /></li>

						<li id="dropDownList">
							<span class="span">水分类：</span>
							<input type="text" id="dropDownInput" value="桶装水" readonly/>
							<div class="dropDownMenu">
								<ul>
									<li>桶装水</li>
									<li>矿泉水</li>
								</ul>
							</div>
						</li>


						<li><span class="span">发生时间：</span><input type="text" class="pack_maintain"></li>

						<li><span class="span">数量：</span><input type="text" value=""/></li>
						<li id="unitPrice"><span class="span">单价：</span><input type="text" value="0" /></li>
						<li><span class="span">备注：</span><input type="text" value="" /></li>
						<li>
							<div class="eventType">
								<input type="radio" name="eventType" id="eventType" checked="checked"><span class="span">现金</span>
								<input type="radio" name="eventType"><span class="span">月结</span>
								
							</div>					
						</li>


						<li><span class="span"></span><a onclick="addWaterBill();" class="btn btn-goback goback">确认添加</a></li>
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
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/roomService.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/service/serviceWaterBill.js"></script>
	<script type="text/javascript">
		// 设置为当前时间
		var nowDate = new Date();
		$(".pack_maintain").val(formatDateForm(nowDate));
		$('.pack_maintain').date_input();
	</script>
</body>
</html>