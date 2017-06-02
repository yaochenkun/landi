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
<link href="${pageContext.request.contextPath}/css/ld/user/roomItem/roomItem.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomItem/itemRepoOverview.css" rel="stylesheet" type="text/css" />
<title>库房物品总览</title>
</head>
<body>

	<jsp:include page="../_header.jsp" />
	<jsp:include page="../_leftMenu.jsp" />

	<div class="nav-second">
		<div class="toolbar">
			<div class="nav-secondul">
				<ul>
					<li class="linormal"><a	href="${pageContext.request.contextPath}/views/user/roomItem/itemRoomOverview.jsp">客房物品统计</a></li>
					<li class="liactive"><a	href="javascript:void(0);">库房物品统计</a></li>
					<li class="linormal"><a	href="${pageContext.request.contextPath}/views/user/roomItem/planList.jsp">采购管理</a></li>
				</ul>
			</div>
		</div>
	</div>

	<!-- 页面内容 strat -->
	<div class="main">
		<div class="main-page">
			<div class="nav-path">
				<span>物品种类：</span>
				<div class="itemType" style="display:inline-block;">

					<span class="span">家&nbsp;&nbsp;电</span>
					<div id="itemTypeName" style="display:none;">家电</div>
					<div class="itemTypeMenu">
						<ul>
							<li>家&nbsp;&nbsp;电</li>
							<li>家&nbsp;&nbsp;具</li>
							<li>软&nbsp;&nbsp;装</li>
							<li>备&nbsp;&nbsp;品</li>
							<li>其&nbsp;&nbsp;它</li>
						</ul>
					</div>
				</div>
				<span style="margin-left:30px;">库房号：</span><input id="repoNum" type="text" value="">
				<a class="btn btn-edit btnEdit" style="margin-left:30px;" onclick="requestItemByItemType(1);">搜索</a>
				<a class="btn btn-edit btnEdit btnRight" onclick="exportList();">导出</a>
				<a class="btn btn-edit btnEdit" onclick="printList();">打印</a>
			</div>

			<%-- <div style="display:inline-block">
				<span>房间号：</span><input id="searchRoomNum" type="text" value="">
				<a class="btn btn-edit btnEdit" onclick="searchBusOther(1);">搜索</a>
				<a class="btn btn-edit btnEdit btnRight" onclick="exportList();">导出</a>
				<a class="btn btn-edit btnEdit" onclick="printList();">打印</a>
			</div> --%>

			<!-- <a class="btn btn-new btnnew" href="sourceNew.jsp?type=2">新增电费记录</a> -->
			<div class="bill-area">
				<div class="bill-table">
					<!-- 费用 table start -->
					<table>
						<thead>
							<tr>
								<th><span>库房号</span></th>
								<th><span>种类</span></th>
								<th><span>子类</span></th>
								<th><span>品牌</span></th>
								<th><span>名称</span></th>
								<th><span>归属权</span></th>
								<th><span>总量</span></th>
								<th><span>待分配</span></th>
								<th><span>已分配</span></th>
								<th><span>可用</span></th>
								<th><span>维修</span></th>
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
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomItem/itemRepoOverview.js"></script>

	<!-- 导出插件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/exportCsv/Blob.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/exportCsv/FileSaver.js"></script>

	<!-- 打印插件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/printer/print.min.js"></script>
	<script>
	    // 请求第一页客房物品信息
		requestItemOverview(1);
	</script>
</body>
</html>
