<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/plugin/calendar/dateRange.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/plugin/calendar/monthPicker.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/plugin/calendar/dateCustom.css"/>
<link href="${pageContext.request.contextPath}/css/ld/user/home/public.css"	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomItem/roomItem.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/office/shopManage.css" rel="stylesheet" type="text/css" />
<title>小卖部管理</title>
</head>
<body>

    <jsp:include page="../_header.jsp" />
	<jsp:include page="../_leftMenu.jsp" />
	<jsp:include page="../_modal.jsp" />

	<div class="nav-second">
		<div class="toolbar">
			<div class="nav-secondul">
				<ul>
					<li class="liactive"><a href="${pageContext.request.contextPath}/views/user/office/shopManage.jsp">小卖部管理</a></li>
					<li class="linormal"><a	href="${pageContext.request.contextPath}/views/user/office/officeManage.jsp">办公室收支管理</a></li>
				</ul>
			</div>
		</div>
	</div>

	<!-- 页面内容 strat -->
	<div class="main">
		<div class="main-page">
			<div class="nav-path">
				<div class="chooseGoodsName">
					<span class="span">商品名：</span>
					<input type="text" value="" id="shop_id" />
				</div>
<!-- 				<div class="calendarPart">
					<span class="span">日期：</span>
					<div class="tool_date cf">
						<div class="ta_date" id="div_month_picker">
							<span class="date_title" id="month_picker"></span>
						</div>
					</div>
				</div> -->
			</div>
			<a class="btn btn-new btnnew" href="shopNew.jsp">新增商品</a>
			<div class="bill-area">
				<div class="bill-table">
					<!-- 费用 table start -->
					<table>
						<thead>
							<tr>
								<th><span>商品名</span></th>
								<th><span>进价</span></th>
								<th><span>售价</span></th>
								<th><span>总量</span></th>
								<th><span>剩余</span></th>
								<th><span>总售出</span></th>
								<th><span>总废弃</span></th>
								<th><span>总利润</span></th>
								<th><span>操作</span></th>
								<th><span>详细</span></th>
							</tr>
						</thead>
						<tbody id="shopListTbody"></tbody>
					</table>
					<!-- 费用 table end -->

					<!-- 底部页面 start -->
					<div id="shopListBottom" class="bottom"></div>
					<!-- 底部页码 end -->
				</div>
			</div>
		</div>
	</div>
	<!-- 页面内容 end -->

	<div class="shadow"></div>

	<!-- 买入商品弹出框 start -->
	<div id="buyGoodsMenu" class="menuDiv">
		<div class="menuContent">
			<div class="menuTitle">
				买入商品
				<span onclick="closeBuyGoodsDiv();">×</span>
			</div>
			<div class="menuBody">
				<div class="menuContent">请输入买入商品&nbsp;<span class="goodsName"></span>&nbsp;数量：&nbsp;
					<input type="text" value="2"/>
				</div>
				<a class="btn btn-submit" onclick="requestBuyGoods();">确认买入</a>
			</div>
			<span style='display:none;' id='buyGoodsId'></span>
			<span style='display:none;' id='buyMoney'></span>
		</div>
	</div>
	<!-- 买入商品弹出框 end -->

	<!-- 卖出商品弹出框 start -->
	<div id="saleGoodsMenu" class="menuDiv">
		<div class="menuContent">
			<div class="menuTitle">
				卖出商品
				<span onclick="closeSaleGoodsDiv();">×</span>
			</div>
			<div class="menuBody">
				<div class="menuContent">请输入卖出商品&nbsp;<span class="goodsName"></span>&nbsp;数量：&nbsp;
					<input type="text" value="2"/>
				</div>
				<a class="btn btn-submit" onclick="requestSaleGoods();">确认卖出</a>
			</div>
			<span style='display:none;' id='saleGoodsId'></span>
			<span style='display:none;' id='saleMoney'></span>
		</div>
	</div>
	<!-- 卖出商品弹出框 end -->

	<!-- 废弃商品弹出框 start -->
	<div id="useGoodsMenu" class="menuDiv">
		<div class="menuContent">
			<div class="menuTitle">
				废弃商品
				<span onclick="closeUseGoodsDiv();">×</span>
			</div>
			<div class="menuBody">
				<div class="menuContent">请输入废弃商品&nbsp;<span class="goodsName"></span>&nbsp;数量：&nbsp;
					<input type="text" value="2"/>
				</div>
				<a class="btn btn-submit" onclick="requestUseGoods();">确认废弃</a>
			</div>
			<span style='display:none;' id='useGoodsId'></span>
			<span style='display:none;' id='useMoney'></span>
		</div>
	</div>
	<!-- 废弃商品弹出框 end -->

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/calendar/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/calendar/dateRange.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/calendar/monthPicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/office/shopManage.js"></script>
	<script>
		// 创建时间插件 并 请求本月所有商品信息
		// monthPicker.create('month_picker', {
		// 	autoCommit : true,
		// 	callback : function(obj){
		// 		requestShopListByDate(obj);
		// 	}
	 //  	});
	 	// 查询第一页小卖部商品信息
		requestShopList(1);
	</script>
</body>
