<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
<link href="${pageContext.request.contextPath}/css/ld/user/roomItem/itemOverview.css" rel="stylesheet" type="text/css" />
<title>客房物品总览</title>
</head>
<body>

	<jsp:include page="../_header.jsp" />
	<jsp:include page="../_leftMenu.jsp" />

	<div class="nav-second">
		<div class="toolbar">
			<div class="nav-secondul">
				<ul>
					<li class="liactive"><a	href="${pageContext.request.contextPath}/views/user/roomItem/itemOverview.jsp">物品统计</a></li>
					<li class="linormal"><a	href="${pageContext.request.contextPath}/views/user/roomItem/planList.jsp">采购管理</a></li>
				</ul>
			</div>
		</div>
	</div>

	<!-- 页面内容 strat -->
	<div class="main">
		<div class="main-page">
			<div class="nav-path">
				<span class="span">物品种类：</span>
				<div class="itemType">
					<span class="span"></span>
					<div id="itemTypeName" style="display:none;"></div>
					<div class="itemTypeMenu">
						<ul>
							<li>全&nbsp;&nbsp;部</li>
							<li>家&nbsp;&nbsp;电</li>
							<li>家&nbsp;&nbsp;具</li>
							<li>灯&nbsp;&nbsp;具</li>
							<li>窗&nbsp;&nbsp;帘</li>
							<li>浴&nbsp;&nbsp;屏</li>
							<li>备&nbsp;&nbsp;品</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- <a class="btn btn-new btnnew" href="sourceNew.jsp?type=2">新增电费记录</a> -->
			<div class="bill-area">
				<div class="bill-table">
					<!-- 费用 table start -->
					<table>
						<thead>
							<tr>
								<th><span>种类ID</span></th>
								<th><span>物品种类</span></th>
								<th><span>物品子类</span></th>
								<th><span>品牌</span></th>
								<th><span>名称</span></th>
								<th><span>总量</span></th>
								<th><span>可用</span></th>
								<th><span>已分配</span></th>
								<th><span>报废</span></th>
								<th><span>备注</span></th>
								<th><span>操作</span></th>
							</tr>
						</thead>
						<tbody id="itemOverviewTbody"></tbody>
					</table>
					<!-- 费用 table end -->

					<!-- 底部页面 start -->
					<div id="itemOverviewBottom" class="bottom"></div>
					<!-- 底部页码 end -->
				</div>
			</div>
		</div>
	</div>
	<!-- 页面内容 end -->

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomItem/roomItem.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomItem/itemOverview.js"></script>
	<script>
	    // 请求第一页客房物品信息
		requestItemOverview(1);
	</script>
</body>
</html>