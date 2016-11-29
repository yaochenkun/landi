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
<title>客房物品总览</title>
</head>
<body>

	<jsp:include page="../_header.jsp" />
	<jsp:include page="../_leftMenu.jsp" />
	
	<% String itemName = request.getParameter("itemName"); %>
	<% String itemID = request.getParameter("itemID"); %>

	<!-- 页面内容 strat -->
	<div class="main">
		<div class="fac-title">
			<span id="facID" style="display:none;"><%= itemID %></span>
			<span class="span">物品名称：<span class="name"><%= itemName %></span></span>
			<a href="itemOverview.jsp" class="btn btngoback">返&nbsp;回</a>
		</div>
		<div class="fac-sta">
			<span class="text">总量：<span class="count"></span></span>
			<span class="text">可用：<span class="count"></span></span>
			<span class="text">已分配：<span class="count"></span></span>
			<span class="text">报废：<span class="count"></span></span>
		</div>
		<div class="main-page">
			<div class="bill-area">
				<div class="bill-table">
					<!-- 费用 table start -->
					<table>
						<thead>
							<tr>
								<th><span>序号</span></th>
								<th><span>所在房间</span></th>
								<th><span>备注</span></th>
								<th><span>操作</span></th>
							</tr>
						</thead>
						<tbody id="facDetailTbody">
							<tr><td>1</td><td>1</td><td>1</td>
							<td><span class='blue' onclick="transferFac(this);">转移</span>
							<span class='blue' onclick="gobackToWarehouse(this);">回仓库</span>
							<span class='gray'>报废</span></td></tr>
						</tbody>
					</table>
					<!-- 费用 table end -->
				</div>
			</div>
		</div>
	</div>
	<!-- 页面内容 end -->



	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomItem/roomItem.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomItem/itemDetail.js"></script>
	<script>(function(){
		    requestFacSta();  // 请求物品库存信息
			requestFacDetail();  // 请求物品在客房的分配信息
		})();
	</script>
</body>
</html>