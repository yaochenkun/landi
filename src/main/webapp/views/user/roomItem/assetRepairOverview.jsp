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
	<link href="${pageContext.request.contextPath}/css/plugin/simpleCalendar/date_pack.css"	rel="stylesheet" type="text/css" />

	<link href="${pageContext.request.contextPath}/css/ld/user/roomItem/roomItem.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomItem/itemRoomOverview.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/css/ld/user/roomService/roomService.css" rel="stylesheet" type="text/css" />

	<title>客房物品总览</title>
</head>
<body>

	<jsp:include page="../_header.jsp" />
	<jsp:include page="../_leftMenu.jsp" />

	<%--<div class="nav-second">--%>
		<%--<div class="toolbar">--%>
			<%--<div class="nav-secondul">--%>
				<%--<ul>--%>
					<%--<li class="liactive"><a	href="javascript:void(0);">客房物品统计</a></li>--%>
					<%--<li class="linormal"><a	href="${pageContext.request.contextPath}/views/user/roomItem/itemRepoOverview.jsp">库房物品统计</a></li>--%>
					<%--<li class="linormal"><a	href="${pageContext.request.contextPath}/views/user/roomItem/planList.jsp">采购管理</a></li>--%>
				<%--</ul>--%>
			<%--</div>--%>
		<%--</div>--%>
	<%--</div>--%>

	<!-- 页面内容 start -->
	<div class="main">
		<div class="main-page">

			<div class="nav-path">
				<a href="../home/homeUser.jsp" title="回到首页"><i class="icon-home"></i></a>
				<i class="icon-path"></i> <a href="itemIndex.jsp">客房物品管理</a>
				<i class="icon-path"></i> <a href="assetRepairOverview.jsp">LE资产报修</a>
			</div>

			<a class="btn btn-new btnnew" href="assetRepairNew.jsp">新增报修</a>

			<div class="nav-path" style="margin-top: -20px;">
				<span>房间号：</span><input id="roomNum" type="text" value="">
				<span style="margin-left: 30px;">申报时间：</span><input type="text" class="pack_maintain" id="reflectDate" />
				<a class="btn btn-edit btnEdit" style="margin-left:30px;" onclick="searchProblemsByPage(1);">搜索</a>
				<a class="btn btn-edit btnEdit btnRight" onclick="exportList();" style="margin-left:285px;">导出</a>
				<a class="btn btn-edit btnEdit" onclick="printList();">打印</a>
			</div>


			<!-- <a class="btn btn-new btnnew" href="sourceNew.jsp?type=2">新增电费记录</a> -->
			<div class="bill-area">
				<div class="bill-table">
					<!-- 费用 table start -->
					<table>
						<thead>
							<tr>
								<th style="width: 5%;"><span>申报时间</span></th>
								<th style="width: 5%;"><span>房间号</span></th>
								<th style="width: 5%;"><span>租客姓名</span></th>
								<th style="width: 5%;"><span>需要解决时间</span></th>
								<th style="width: 5%;"><span>申报人</span></th>
								<th style="width: 30%;"><span>报修位置及问题描述</span></th>
								<th style="width: 5%;"><span>操作</span></th>
							</tr>
						</thead>
						<tbody id="reminderOverviewTbody">

						</tbody>
					</table>
					<!-- 费用 table end -->

					<!-- 底部页面 start -->
					<div id="reminderOverviewBottom" class="bottom"></div>
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
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomItem/itemRoomOverview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/simpleCalendar/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/simpleCalendar/date_pack.js"></script>
	<!-- 导出插件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/exportCsv/Blob.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/exportCsv/FileSaver.js"></script>

	<!-- 打印插件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/printer/print.min.js"></script>

	<script type="text/javascript"
			src="${pageContext.request.contextPath }/js/ld/user/roomItem/assetRepair.js"></script>

	<script>

        // 初始化时间
        var nowDate = new Date();
        $(".pack_maintain").val(formatDateForm(nowDate));
        $('.pack_maintain').date_input();


	    // 请求第一页客房物品信息
        searchProblemsByPage(1);
	</script>
</body>
</html>
