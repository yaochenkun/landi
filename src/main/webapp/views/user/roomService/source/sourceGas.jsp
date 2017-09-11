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
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/roomService.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/source/sourceGas.css" rel="stylesheet" type="text/css" />
<title>燃气费</title>
</head>
<body>
	<jsp:include page="../../_header.jsp"></jsp:include>
	<jsp:include page="../../_leftMenu.jsp" />

	<!-- 页面内容 start -->
	<div class="main">
		<div class="main-page">
			<div class="nav-path">
				<a href="../../home/homeUser.jsp" title="回到首页"><i
					class="icon-home"></i></a> <i class="icon-path"></i> <a
					href="sourceIndex.jsp">能源费结算</a> <i class="icon-path"></i> <a
					href="sourceGas.jsp">燃气费</a>
			</div>
			<a class="btn btn-new btnnew" href="sourceGasNew.jsp">新增燃气费记录</a>
			<div class="bill-area">
				<input id="roomNumber" type="text" class="search-input" placeholder="请输入房间号..." />
				<a class="btn btn-edit btnSearch" onclick="requestGas($('#roomNumber').val(),parseInt(1))">搜索燃气费</a>
				<div class="bill-table">
					<!-- 费用 table start -->
					<table>
						<thead>
							<tr id="trOne">
								<th rowspan="2"><span>房间号</span></th>
								<th rowspan="2"><span>客户姓名</span></th>
								<th colspan="4"><span>燃&nbsp;气&nbsp;表&nbsp;一</span></th>
								<th colspan="4"><span>燃&nbsp;气&nbsp;表&nbsp;二</span></th>
								<th rowspan="2">抄表日期</th>
							</tr>
							<tr id="trTwo">
								<th class="gasOne">表 号</th>
								<th class="gasOne">上月表数</th>
								<th class="gasOne">费用</th>
								<th class="gasOne">抄表</th>

								<th class="gasTwo">表 号</th>
								<th class="gasTwo">上月表数</th>
								<th class="gasTwo">费用</th>
								<th class="gasTwo">抄表</th>
							</tr>
						</thead>
						<tbody id="gasTbody"></tbody>
					</table>
					<!-- 费用 table end -->

					<!-- 底部页面 start -->
					<div id="serviceGasBottom" class="bottom"></div>
					<!-- 底部页码 end -->
				</div>
			</div>
		</div>
	</div>
	<!-- 页面内容 end -->

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/ld/user/roomService/roomService.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/ld/user/roomService/source/sourceGas.js"></script>
	<script type="text/javascript">
	    // 拉取第一页餐费信息
		requestGas($('#roomNumber').val(),parseInt(1));
	</script>
</body>
</html>