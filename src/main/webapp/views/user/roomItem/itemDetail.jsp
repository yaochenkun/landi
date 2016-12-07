<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.ld.app.CurEnv, org.ld.model.User"%>
<%@ page import="java.util.Date, java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/home/public.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomItem/roomItem.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomItem/itemDetail.css" rel="stylesheet" type="text/css" />
<title>物品分配页</title>
</head>
<body>

	<jsp:include page="../_header.jsp" />
	<jsp:include page="../_leftMenu.jsp" />
	
	<% String itemID = request.getParameter("itemID"); %>

	<!-- 页面内容 strat -->
	<!-- 标题 start -->
	<div class="fac-title">
		<div class="item">
			<span id="facID" style="display:none;"><%= itemID %></span>
			<span class="span">物品种类：<span class="type"></span></span>
			<span class="span">物品子类：<span class="cat"></span></span>
			<span class="span">物品品牌：<span class="com"></span></span>
			<span class="span">物品名称：<span class="name"></span></span>
			<a href="itemOverview.jsp" class="btn btngoback">返&nbsp;回</a>
		</div>
	</div>
	<!-- 标题 end -->
	<div class="main">
		<div class="fac-sta">
			<span class="text">总量：<span class="count"></span></span>
			<span class="text">可用：<span class="count"></span></span>
			<span class="text">已分配：<span class="count"></span></span>
			<span class="text">报废：<span class="count"></span></span>
			<a href="javascript:void(0);" onclick="newDistribute();" class="btn btn-new">新分配</a>
			<a href="javascript:void(0);" onclick="newfacBad();" class="btn btn-bad">新报废</a>
		</div>
		<div class="main-page">
			<div class="bill-area">
				<div class="bill-table">
					<!-- 费用 table start -->
					<table>
						<thead>
							<tr>
								<th><span>所在房间</span></th>
								<th><span>标签</span></th>
								<th><span>备注</span></th>
								<th><span>操作</span></th>
							</tr>
						</thead>
						<tbody id="facDetailTbody"></tbody>
					</table>
					<!-- 费用 table end -->

					<div id="roomItemBottom" class="bottom"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- 页面内容 end -->
	<div class="shadow"></div>

	<!-- 转移物品弹出框 start -->
	<div id="transferMenu" class="menuDiv">
		<div class="menuContent">
			<div class="menuTitle">
				转移物品
				<span onclick="closeTransferDiv();">×</span>
			</div>
			<div class="menuBody">
				<span class="rec-id" style="display:none;"></span>
				<div class="menuContent">将物品从房间&nbsp;
					<span class="roomNumber"></span>&nbsp;&nbsp;转移至房间：&nbsp;
					<input type="text" value="W34-1"/>
				</div>
				<a class="btn btn-submit" onclick="requestTransferFac();">确认转移</a>
			</div>
		</div>
	</div>
	<!-- 转移物品弹出框 end -->


	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomItem/roomItem.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomItem/itemDetail.js"></script>
	<script>(function(){
		    requestFacSta();  // 请求物品库存信息
			requestRoomItem(1);  // 请求物品在客房的分配信息
		})();
	</script>
</body>
</html>