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
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/service/serviceBusOther.css" rel="stylesheet" type="text/css" />
<title>其它</title>
</head>
<body>
	<jsp:include page="../../_header.jsp"></jsp:include>
	<jsp:include page="../../_leftMenu.jsp" />
	<jsp:include page="../../_modal.jsp" />

	<!-- 页面内容 strat -->
	<div class="main">
		<div class="main-page">
			<div class="nav-path">
				<a href="../roomServiceIndex.jsp" title="回到首页"><i class="icon-home"></i></a>
				<i class="icon-path"></i>
				<a href="serviceIndex.jsp">客房服务</a>
				<i class="icon-path"></i>
				<a href="serviceBus.jsp">车费</a>
				<i class="icon-path"></i>
				<a href="serviceBusOther.jsp">其它</a>
			</div>
			<a class="btn btn-new btnnew" href="serviceNewBusOther.jsp">新增其它车费记录</a>
			<div class="bill-area">
				<div class="search">
					<span>房间号：</span><input id="searchRoomNum" type="text" value="">
					<span class="span">日期：</span>
					<input type="text" class="pack_maintain">
					<a class="btn btn-edit btnEdit" onclick="searchBusOther(1);">搜索</a>
					<a class="btn btn-edit btnEdit btnRight" onclick="exportList();">导出</a>
					<a class="btn btn-edit btnEdit" onclick="printList();">打印</a>

				</div>

				<div class="bill-table">
					<!-- 费用 table start -->
					<table>
						<thead>
					    	<tr>
					    		<th>房间号</th>
					    		<th>客户姓名</th>
					    		<th>用车种类</th>
					    		<th>支付方式</th>
					    		<th>金额</th>
					    		<th>备注</th>
					    		<th>操作人</th>
					    		<th>发生时间</th>
					    		<th>上传时间</th>
					    		<th>最后编辑时间</th>
					    		<th>操作</th>
					    	</tr>
						</thead>
						<tbody id="busPlaneTbody"></tbody>
					</table>
					<!-- 费用 table end -->

					<!-- 底部页面 start -->
					<div id="busPlaneBottom" class="bottom"></div>
					<!-- 底部页码 end -->
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

	<!-- 导出插件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/exportCsv/Blob.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/exportCsv/FileSaver.js"></script>

	<!-- 打印插件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/printer/print.min.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/roomService.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/service/serviceBusOther.js"></script>
	<script type="text/javascript">
		// 按时间查询接送机记录
		var nowDate = new Date();
		$(".pack_maintain").val(formatDateForm(nowDate));
		$('.pack_maintain').date_input();
		// 查询第一页信息
		searchBusOther(1);
	</script>
</body>
</html>
