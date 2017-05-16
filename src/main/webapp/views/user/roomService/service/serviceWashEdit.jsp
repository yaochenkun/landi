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
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/service/serviceNewWash.css" rel="stylesheet" type="text/css" />
<title>编辑洗衣单收费</title>
</head>
<body>
	<jsp:include page="../../_header.jsp"></jsp:include>
	<jsp:include page="../../_leftMenu.jsp" />
	<jsp:include page="../../_modal.jsp" />
	
	<!-- 页面内容 start -->
	<div class="main">
		<div class="main-page">
			<div class="nav-path">
				<a href="../roomServiceIndex.jsp" title="回到首页"><i class="icon-home"></i></a>
				<i class="icon-path"></i>
				<a href="serviceIndex.jsp">客房服务</a>
				<i class="icon-path"></i>
				<a id="serviceType" href="serviceWash.jsp">洗衣单收费</a>
				<i class="icon-path"></i>
				<a href="javascript:void(0);">编辑洗衣单收费记录</a>
			</div>
			<div class="body">
				<div class="body-content">
					<ul>
						<li><span>房间号：</span>
							<input id="serviceRoomNumber" type="text" value="" disabled="disabled"/>
							<span class="red red-right">*&nbsp;必填</span></li>
						<li id="roomIdWarning"><span ></span><span class="red">不能为空！</span></li>
						<li><span>客户姓名：</span><input id="guestName" type="text" value="" disabled="disabled" /><li>
						<li><span>发生时间：</span><input type="text" class="pack_maintain" disabled="disabled" /><li>
						<li><span>总件数：</span><span id='totalCount'>0</span>&nbsp;件</li>
						<li><span >总价：</span><span id="totalPrice">0</span>&nbsp;元</li>
						<a onclick="updateServiceWashEdit(${param.id});" class="btn btn-goback goback">确认更新</a>
					</ul>
				</div>
				<table class="bill-table">
					<thead><tr><th colspan="2">衣服种类</th><th>水洗</th><th>干洗</th><th>单熨</th>
						<th>件数</th><th>金额</th><th>操作</th></tr>
					</thead>
					<tbody>
						<tr><td class="trTitle" rowspan="4">西装</td><td class="name">西服上衣</td>
							<td class="laundry"></td>
							<td class="dry"><input type="radio" name="suitJacket"><span ></span></td>
							<td class="pressing"><input type="radio" name="suitJacket"><span ></span></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>
						<tr><td class="name">西服裤子</td>
							<td class="laundry"></td>
							<td class="dry"><input type="radio" name="suitTrousers"><span ></span></td>
							<td class="pressing"><input type="radio" name="suitTrousers"><span ></span></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>
						<tr><td class="name">西服马甲</td>
							<td class="laundry"></td>
							<td class="dry"><input type="radio" name="suitWaistcoat"><span ></span></td>
							<td class="pressing"><input type="radio" name="suitWaistcoat"><span ></span></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>
						<tr><td class="name">领带</td>
							<td class="laundry"></td>
							<td class="dry"><input type="radio" name="tie"><span ></span></td>
							<td class="pressing"><input type="radio" name="tie"><span ></span></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>


						<tr><td class="trTitle" rowspan="10">上衣</td><td class="name">休闲上衣</td>
							<td class="laundry"><input type="radio" name="casualCoat"><span ></span></td>
							<td class="dry"><input type="radio" name="casualCoat"><span ></span></td>
							<td class="pressing"><input type="radio" name="casualCoat"><span ></span></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>
						<tr><td class="name">毛衣/毛衣外套</td>
							<td class="laundry"></td>
							<td  class="dry"><input type="radio" name="sweater"><span ></span></td>
							<td class="pressing"><input type="radio" name="sweater"><span ></span></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>
						<tr><td class="name">风衣</td>
							<td class="laundry"></td>
							<td class="dry"><input type="radio" name="windCoat"><span ></span></td>
							<td class="pressing"><input type="radio" name="windCoat"><span ></span></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>
						<tr><td class="name">羊绒外套（短）</td>
							<td class="laundry"></td>
							<td class="dry"><input type="radio" name="shortCashmere"><span ></span></td>
							<td class="pressing"><input type="radio" name="shortCashmere"><span ></span></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>
						<tr><td class="name">羊绒外套（中）</td>
							<td class="laundry"></td>
							<td class="dry"><input type="radio" name="mediumCashmere"><span ></span></td>
							<td class="pressing"><input type="radio" name="mediumCashmere"><span ></span></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>
						<tr><td class="name">羊绒外套（长）</td>
							<td class="laundry"></td>
							<td class="dry"><input type="radio" name="longCashmere"><span ></span></td>
							<td class="pressing"><input type="radio" name="longCashmere"><span ></span></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>
						<tr><td class="name">羽绒外套（短）</td>
							<td class="laundry"><input type="radio" name="shortCotton"><span ></span></td>
							<td class="dry"><input type="radio" name="shortCotton"><span ></span></td>
							<td></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>
						<tr><td class="name">羽绒外套（中）</td>
							<td class="laundry"><input type="radio" name="mediumCotton"><span ></span></td>
							<td class="dry"><input type="radio" name="mediumCotton"><span ></span></td>
							<td></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>
						<tr><td class="name">羽绒外套（长）</td>
							<td class="laundry"><input type="radio" name="longCotton"><span ></span></td>
							<td class="dry"><input type="radio" name="longCotton"><span ></span></td>
							<td></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>
						<tr><td class="name">棉马甲</td>
							<td class="laundry"><input type="radio" name="cottonWaistcoat"><span ></span></td>
							<td class="dry"><input type="radio" name=cottonWaistcoat""><span ></span></td>
							<td></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>


						<tr><td class="trTitle" rowspan="3">裤子</td><td class="name">休闲裤</td>
							<td class="laundry"><input type="radio" name="jeans"><span ></span></td>
							<td class="dry"><input type="radio" name="jeans"><span ></span></td>
							<td class="pressing"><input type="radio" name="jeans"><span ></span></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>
						<tr><td class="name">羊绒裤</td>
							<td class="laundry"></td>
							<td class="dry"><input type="radio" name="woollen"><span ></span></td>
							<td class="pressing"><input type="radio" name="woollen"><span ></span></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>
						<tr><td class="name">短裤</td>
							<td class="laundry"><input type="radio" name="shorts"><span ></span></td>
							<td class="dry"><input type="radio" name="shorts"><span ></span></td>
							<td class="pressing"><input type="radio" name="shorts"><span ></span></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>


						<tr><td class="trTitle" rowspan="5">裙子</td><td class="name">裙子</td>
							<td class="laundry"><input type="radio" name="dress"><span ></span></td>
							<td class="dry"><input type="radio" name="dress"><span ></span></td>
							<td class="pressing"><input type="radio" name="dress"><span ></span></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>
						<tr><td class="name">长裙</td>
							<td class="laundry"><input type="radio" name="longDress"><span ></span></td>
							<td class="dry"><input type="radio" name="longDress"><span ></span></td>
							<td class="pressing"><input type="radio" name="longDress"><span ></span></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>
						<tr><td class="name">真丝裙</td>
							<td class="laundry"><input type="radio" name="silkDress"><span ></span></td>
							<td class="dry"><input type="radio" name="silkDress"><span ></span></td>
							<td class="pressing"><input type="radio" name="silkDress"><span ></span></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>
						<tr><td class="name">短裙</td>
							<td class="laundry"><input type="radio" name="skirt"><span ></span></td>
							<td class="dry"><input type="radio" name="skirt"><span ></span></td>
							<td class="pressing"><input type="radio" name="skirt"><span ></span></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>
						<tr><td class="name">百褶裙</td>
							<td class="laundry"></td>
							<td class="dry"><input type="radio" name="pleated"><span ></span></td>
							<td class="pressing"><input type="radio" name="pleated"><span ></span></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>

						<tr><td class="trTitle" rowspan="4">衬衫</td><td class="name">T恤</td>
							<td class="laundry"><input type="radio" name="tshirt"><span ></span></td>
							<td class="dry"><input type="radio" name="tshirt"><span ></span></td>
							<td class="pressing"><input type="radio" name="tshirt"><span ></span></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>
						<tr><td class="name">衬衫</td>
							<td class="laundry"><input type="radio" name="shirt"><span ></span></td>
							<td class="dry"><input type="radio" name="shirt"><span ></span></td>
							<td class="pressing"><input type="radio" name="shirt"><span ></span></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>
						<tr><td class="name">丝质衬衫</td>
							<td class="laundry"></td>
							<td class="dry"><input type="radio" name="silkShirt"><span ></span></td>
							<td class="pressing"><input type="radio" name="silkShirt"><span ></span></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>
						<tr><td class="name">女装衬衫</td>
							<td class="laundry"><input type="radio" name="blouse"><span ></span></td>
							<td class="dry"><input type="radio" name="blouse"><span ></span></td>
							<td class="pressing"><input type="radio" name="blouse"><span ></span></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>


						<tr><td class="trTitle" rowspan="8">其他</td><td class="name">睡衣</td>
							<td class="laundry"><input type="radio" name="pyjamas"><span ></span></td>
							<td class="dry"><input type="radio" name="pyjamas"><span ></span></td>
							<td class="pressing"><input type="radio" name="pyjamas"><span ></span></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>
						<tr><td class="name">围巾</td>
							<td class="laundry"></td>
							<td class="dry"><input type="radio" name="scarf"><span ></span></td>
							<td class="pressing"><input type="radio" name="scarf"><span ></span></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>
						<tr><td class="name">丝质围巾</td>
							<td class="laundry"></td>
							<td class="dry"><input type="radio" name="silkScarf"><span ></span></td>
							<td class="pressing"><input type="radio" name="silkScarf"><span ></span></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>
						<tr><td class="name">背心</td>
							<td class="laundry"><input type="radio" name="vest"><span ></span></td>
							<td class="dry"></td>
							<td class="pressing"></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>
						<tr><td class="name">手帕</td>
							<td class="laundry"><input type="radio" name="hand"><span ></span></td>
							<td class="dry"></td>
							<td class="pressing"></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>
						<tr><td class="name">手套</td>
							<td class="laundry"><input type="radio" name="gloves"><span ></span></td>
							<td class="dry"></td>
							<td class="pressing"></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>
						<tr><td class="name">帽子</td>
							<td class="laundry"><input type="radio" name="hat"><span ></span></td>
							<td class="dry"></td>
							<td class="pressing"></td>
							<td><input type="text" value="0"></td><td class="price"></td>
							<td><span class="delete">清空</span>
								<span style="display:none" class="unitPrice"></span></td></tr>

						<tr><td class="name" onclick="appendOther(this);" index="0"><input type="text" value="+&nbsp其他" class="addOther" readonly></td><td colspan="6"></td></tr>
					</tbody>
				</table>
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
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/roomService.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/service/serviceWash.js"></script>
	<script type="text/javascript">

		requestUnitPrice();
		searchWashById('${param.id}');
	</script>
</body>
</html>