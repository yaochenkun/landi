<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/css/ld/user/home/public.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/css/ld/user/roomService/roomService.css"
	rel="stylesheet" type="text/css" />
<title>代购费</title>
</head>
<body>
	<jsp:include page="../../_header.jsp"></jsp:include>
	<jsp:include page="../../_leftMenu.jsp" />

	<!-- 页面内容 strat -->
	<div class="main">
		<div class="main-page">
			<div class="nav-path">
				<a href="../roomServiceIndex.jsp" title="回到首页"><i
					class="icon-home"></i></a> <i class="icon-path"></i> <a
					href="serviceIndex.jsp">客房服务</a> <i class="icon-path"></i> <a
					href="serviceShopping.jsp">代购费</a>
			</div>
			<a class="btn btn-new btnnew" href="serviceNew.jsp?type=4">新增代购费记录</a>
			<div class="bill-area">
				<div class="bill-table">
					<!-- 费用 table start -->
					<table>
						<thead>
							<tr>
								<th><span>房间号</span>
								<p>Room No.</p>
									<div class="search-roomNo">
										<div class="search-wrap">
											<input type="text" class="search-input"
												placeholder="请输入房间号..." /> <a class="search-btn" href=""
												style="right: 110px;"></a> <a class="btn btn-edit btnedit"
												onclick="requestFirstShoppingByRoomNum(this)">搜索代购费</a>
										</div>
									</div></th>
								<th><span>客人姓名</span>
								<p>Customer Name</p> <!--<div class="search-customerName">
									<div class="search-wrap">
										<input type="text" class="search-input" placeholder="请输入客户姓名..." />
										<a class="search-btn" href=""></a>
										<a class="btn btn-edit btnedit">搜索</a>
									</div>
								</div>--></th>
								<th><span>物品</span>
								<p>Items</p> <!--<div class="search-items"></div>--></th>
								<th><span>数量</span>
								<p>Quantity</p></th>
								<th><span>送交时间</span>
								<p>Time for delivery</p></th>
								<th><span>金额</span>
								<p>Sum</p></th>
								<th><span>备注</span>
								<p>Note</p></th>
							</tr>
						</thead>
						<tbody id="shoppingTbody"></tbody>
					</table>
					<!-- 费用 table end -->

					<!-- 底部页面 start -->
					<div id="serviceShoppingBottom" class="bottom"></div>
					<!-- 底部页码 end -->

					<!--<div class="page-bottom">
						<div class="page-wrap">
							<a data-target="1" href="">1</a>
							<a data-target="2" href="">2</a>
							<span>...</span>
							<a data-target="3" href="">3</a>
							<a data-target="2" href="" class="down-page"><em>下一页</em><i class="next-i">></i></a>
							<span>共15条记录</span>
						</div>
					</div>-->
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
		src="${pageContext.request.contextPath }/js/ld/user/roomService/service/serviceShopping.js"></script>
	<script type="text/javascript">
	    // 拉取第一页 代购费信息
		requestFirstShopping();
	</script>
</body>
</html>