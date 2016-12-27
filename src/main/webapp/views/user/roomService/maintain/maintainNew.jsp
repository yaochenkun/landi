<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath}/css/ld/user/home/public.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/service/serviceNew.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/plugin/simpleCalendar/date_pack.css"	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/maintain/maintainNew.css" rel="stylesheet" type="text/css" />

<title>维修报修</title>
</head>
<body>
	<jsp:include page="../../_header.jsp"></jsp:include>
	<jsp:include page="../../_leftMenu.jsp" />
	
	<!-- 页面内容 start -->
	<div class="main">
		<div class="main-page">
			<div class="nav-path">
				<a href="../roomServiceIndex.jsp" title="回到首页"><i class="icon-home"></i></a>
				<i class="icon-path"></i>
				<a href="maintainIndex.jsp">客房维修</a>
				<i class="icon-path"></i>
				<a href="javascript:void(0);">维修报修</a>
			</div>
			<div class="body">
				<div class="body-content">
					<ul>
						<li><span class="span">房间号：</span>
							<input id="roomNumber" type="text" value="W35-1" />
							<span class="red red-right">*&nbsp;必填</span></li>
						<li id="roomIdWarning"><span class="span"></span><span class="red">不能为空！</span></li>

						<li><span class="span">户型：</span><span id="houseType">大户型</span></li>
						<li><span class="span">入住状态：</span><span id="checkStatus">已入住</span></li>
						<li><span class="span">报修时间：</span><input type="text" class="pack_maintain"></li>

						<li><span class="span">要求解决时间：</span><input type="text" class="pack_maintainT"></li>
						<li><span class="span" id="pLevel">问题等级：</span>
							<span class="problemLevel levelOne">一级</span>
							<span class="problemLevel levelTwo">二级</span>
							<span class="problemLevel levelThree">三级</span>
							<span class="problemLevel levelFour">四级</span>
						</li>

						<li><span class="span">存在问题：</span>
							<input id='problemExist' type="text" value="" />
						</li>
						<li id="problemSort"><span class="span">问题分类：</span>
							<input type="text" id="problemSortInput" value="" />
							<div class="problemSortMenu">
								<ul>
									<li>报警器</li><li>橱柜及水槽相关</li>
									<li>窗户</li><li>筒灯/开关/插座</li>
									<li>地面/踢脚线</li><li>地面排水</li>
									<li>地热及温控器</li><li>对讲器及紧急呼叫器</li>
									<li>房间壁柜</li><li>房间管线</li>
									<li>非能源换气扇</li><li>净水器及软水器</li>
									<li>空调</li><li>排风扇</li>
									<li>墙面</li><li>热水器/循环泵/吸油烟机</li>
									<li>入户门及门锁</li><li>室内门</li>
									<li>网络</li><li>维护结构损坏</li>
									<li>卫生间洁具及物品</li><li>有线电视</li>
									<li>家具</li><li>家电</li>
									<li>灯具</li><li>其他</li>
								</ul>
							</div>
						</li>

						<li id="problemReason"><span class="span">问题原因：</span>
							<input type="text" id="problemReasonInput" value="" />
							<div class="problemReasonMenu">
								<ul>
									<li>品质问题</li><li>安装/维修损坏</li>
									<li>客人损坏</li><li>其他</li>
								</ul>
							</div>
						</li>

						<li><span class="span">问题明细：</span><input type="text" value="" /></li>
						<li><span class="span">房间位置：</span><input type="text" value="" /></li>
						<li><span class="span">图片：</span><input type="text" value="" /></li>
						<li><span class="span">费用：</span><input type="text" value="" /></li>
						<li><span class="span"></span><a onclick="addMaintain();" class="btn btn-goback goback">确认添加</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 页面内容 end -->

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/plugin/simpleCalendar/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/simpleCalendar/date_pack.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/maintain/maintainNew.js"></script>
	<script>
		// 报修时间：默认为当天
		var nowDate = new Date();
		$(".pack_maintain").val(formatDateForm(nowDate));
		$('.pack_maintain').date_input();

		// 要求解决时间：默认为明天
		var tDate = new Date();
		tDate.setDate(tDate.getDate() + 1);
		$(".pack_maintainT").val(formatDateForm(tDate));
		$('.pack_maintainT').date_input({
			nowDate: new Date($('.pack_maintainT').val())
		});
	</script>
</body>
</html>