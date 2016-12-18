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
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/service/serviceWash.css" rel="stylesheet" type="text/css" />
<title>洗衣单收费</title>
</head>
<body>
	<jsp:include page="../../_header.jsp"></jsp:include>
	<jsp:include page="../../_leftMenu.jsp" />

	<!-- 页面内容 strat -->
	<div class="main">
		<div class="main-page">
			<div class="nav-path">
				<a href="../roomServiceIndex.jsp" title="回到首页"><i class="icon-home"></i></a> 
				<i class="icon-path"></i> 
				<a href="serviceIndex.jsp">客房服务</a>
				<i class="icon-path"></i> 
				<a href="">洗衣单收费</a>
			</div>
			<a class="btn btn-new btnnew" href="serviceNewWash.jsp">新增洗衣单收费记录</a>
			<div class="bill-area">
				<div class="search">
					<span>房间号：</span><input type="text" value="W34-1">
				</div>
				<div class="bill-table">
					<!-- 费用 table start -->
					<table>
						<tbody>
							<tr class="date"><td>日期<span>Date.</span></td></tr>
							<tr class="roomNo"><td>房间号<span>Room No.</span></td></tr>
							<tr class="name"><td>姓名<span>Name.</span></td></tr>
							<tr class="shirt"><td>衬衫<span>Shirt.</span></td></tr>
							<tr class="topSuit"><td>西装上衣<span>Top of suit.</span></td></tr>
							<tr class="trousers"><td>裤子<span>Trousers.</span></td></tr>
							<tr class="jacket"><td>夹克<span>Jacket.</span></td></tr>
							<tr class="middleCoat"><td>外套（中）<span>Coat（middle）.</span></td></tr>
							<tr class="longCoat"><td>外套（长）<span>Coat(long).</span></td></tr>
							<tr class="shortCotton"><td>棉质外套（短）<span>Cotton coat(short).</span></td></tr>
							<tr class="middleCotton"><td>棉质外套（中）<span>Cotton coat(middle).</span></td></tr>
							<tr class="longCotton"><td>棉质外套（长）<span>Cotton coat(long).</span></td></tr>
							<tr class="cashmere"><td>羊绒外套<span>Cashmere Coat.</span></td></tr>
							<tr class="shortPants"><td>短裤<span>Short Pants.</span></td></tr>
							<tr class="waistcoat"><td>马甲<span>Waistcoat.</span></td></tr>
							<tr class="tshirt"><td>T恤<span>T-shirt.</span></td></tr>
							<tr class="knitted"><td>羊毛衫<span>Knitted sweater.</span></td></tr>
							<tr class="tie"><td>领带<span>Tie.</span></td></tr>
							<tr class="longSkirt"><td>长裙<span>Long Skirt.</span></td></tr>
							<tr class="shortSkirt"><td>短裙<span>Short Skirt.</span></td></tr>
							<tr class="other"><td>其他<span>Other.</span></td></tr>
							<tr class="total"><td>总件数<span>Total Items.</span></td></tr>
							<tr class="price"><td>价格<span>Price.</span></td></tr>
						</tbody>
					</table>
					<!-- 费用 table end -->

					<!-- 底部页面 start -->
					<div id="serviceWashBottom" class="bottom"></div>
					<!-- 底部页码 end -->
				</div>
			</div>
		</div>
	</div>
	<!-- 页面内容 end -->

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/roomService.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/service/serviceWash.js"></script>
	<script type="text/javascript">
	    // 拉取第一页 洗衣单收费信息
		requestWash();
	</script>
</body>
</html>