<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/home/public.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/roomService.css"	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/service/serviceNew.css" rel="stylesheet" type="text/css" />
<title>添加洗衣单收费</title>
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
				<a href="serviceIndex.jsp">客房服务</a>
				<i class="icon-path"></i>
				<a id="serviceType" href="serviceWash.jsp">洗衣单收费</a>
				<i class="icon-path"></i>
				<a href="javascript:void(0);">新增洗衣单收费记录</a>
			</div>
			<div class="body">
				<div class="body-content">
					<ul>
						<li><span class="span">房间号：</span>
							<input id="serviceRoomNumber" type="text" value="W35-1" />
							<span class="red red-right">*&nbsp;必填</span></li>
						<li id="roomIdWarning"><span class="span"></span><span class="red">不能为空！</span></li>
						<li><span class="span">客人姓名：</span><input type="text" value="Alice" /></li>
						<li><span class="span">衣服种类：</span><div class="btn btn-choose" onclick="chooseClothes();">选择</div>
						<li id="clothList"></li>
						<li><span class="span">总件数：</span><span class='clothText' id="clothTotal">0</span>&nbsp;件</li>
						<li><span class="span">总价：</span><input type="text" value="120" /></li>
						<li><span class="span"></span><a onclick="addserviceWash();" class="btn btn-goback goback">确认添加</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 页面内容 end -->
	
	<!-- 选择衣服种类 弹出框 start -->
	<div class="shadow"></div>
	<div class="addItemDiv">
		<div class="facContent">
			<div class="fac-title">
				选择衣服种类
				<span onclick="closeClothesDiv();">×</span>
			</div>
			<div class="fac-body">
				<div id="item-type" class="item">
					<span class="span">衣服种类：</span>
					<div class="item-content">
						<a href="javascript:void(0);">衬衫</a>
						<a href="javascript:void(0);">西装上衣</a>
						<a href="javascript:void(0);">裤子</a>
						<a href="javascript:void(0);">夹克</a>
						<a href="javascript:void(0);">外套（中）</a>
						<a href="javascript:void(0);">外套（长）</a>
						<a href="javascript:void(0);">棉质外套（短）</a>
						<a href="javascript:void(0);">棉质外套（中）</a>
						<a href="javascript:void(0);">棉质外套（长）</a>
						<a href="javascript:void(0);">羊绒外套</a>
						<a href="javascript:void(0);">短裤</a>
						<a href="javascript:void(0);">马甲</a>
						<a href="javascript:void(0);">T恤</a>
						<a href="javascript:void(0);">羊毛衫</a>
						<a href="javascript:void(0);">领带</a>
						<a href="javascript:void(0);">长裙</a>
						<a href="javascript:void(0);">短裙</a>
						<a href="javascript:void(0);">其他</a>
					</div>
				</div>

				<div id="item-count" class="item">
					<span class="span">数量：</span>
					<div class="item-content"><input type="text" value="1" /></div>
				</div>

			</div>
			<div class="fac-foot">
				<a class="btn btn-submit" onclick="addOneWashCloth();">确定</a>
			</div>
		</div>
	</div>
	<!-- 选择衣服种类 弹出框 start -->

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/roomService.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/service/serviceWash.js"></script>
</body>
</html>