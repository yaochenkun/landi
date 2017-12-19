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
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/source/sourceElec.css" rel="stylesheet" type="text/css" />
<title>电费</title>
</head>
<body>
	<jsp:include page="../../_header.jsp"></jsp:include>

	<!-- 页面内容 start -->
	<div class="main">
		<div class="main-page">
			<div class="nav-path">
				<a href="../../home/homeUser.jsp" title="回到首页"><i
					class="icon-home"></i></a> <i class="icon-path"></i> <a
					href="sourceIndex.jsp">能源费结算</a> <i class="icon-path"></i> <a
					href="sourceElec.jsp">电费</a>
			</div>
			<%--<a class="btn btn-new btnnew" href="sourceNew.jsp?type=elec">新增电费记录</a>--%>
			<div class="bill-area">
				<input type="text" class="search-input" id="roomNumber" placeholder="房间号..." />
				<a class="btn btn-edit btnSearch" onclick="requestElec($('#roomNumber').val(),parseInt(1))">搜索</a>
				<div class="bill-table">
					<!-- 费用 table start -->
					<table>
						<thead>
							<tr>
								<th><span>房间号</span></th>
								<th><span>租客姓名</span></th>
								<th><span>表号</span></th>
								<th><span>初始表数</span></th>
								<th><span>上次表数</span></th>
								<th><span>月份</span></th>
								<th><span>费用</span></th>
								<th><span>当前阶数</span></th>
								<th><span>抄表</span></th>
								<th><span>费用查看</span></th>
								<th><span>历史查看</span></th>
							</tr>
						</thead>
						<tbody id="elecTbody"></tbody>
					</table>
					<!-- 费用 table end -->

					<!-- 底部页面 start -->
					<div id="serviceElecBottom" class="bottom"></div>
					<!-- 底部页码 end -->
				</div>
			</div>
		</div>
	</div>
	<!-- 页面内容 end -->

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<%--<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/roomService.js"></script>--%>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/source/sourceElec.js"></script>
	<script type="text/javascript">
	    // 拉取第一页电费信息
        requestElec($("#roomNumber").val(),parseInt(1));
	</script>
</body>
</html>