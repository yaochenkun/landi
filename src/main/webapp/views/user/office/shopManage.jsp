<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.ld.app.CurEnv, org.ld.model.User"%>
<%@ page import="java.util.Date, java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/home/public.css"	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomItem/roomItem.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/office/shopManage.css" rel="stylesheet" type="text/css" />
<title>小卖部管理</title>
</head>
<body>

	<jsp:include page="../_header.jsp" />
	<jsp:include page="../_leftMenu.jsp" />

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
				<span class="span">商品名：</span>
				<input type="text" value="" id="plan_id" />
			</div>
			<a class="btn btn-new btnnew" href="planNew.jsp">新增商品</a>
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
								<th><span>废弃</span></th>
								<th><span>收入</span></th>
								<th><span>操作</span></th>
								<th><span>详细</span></th>
							</tr>
						</thead>
						<tbody id="shopListTbody"></tbody>
					</table>
					<!-- 费用 table end -->

					<!-- 底部页面 start -->
					<div id="planListBottom" class="bottom"></div>
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
		</div>
	</div>
	<!-- 卖出商品弹出框 end -->

	<!-- 自用商品弹出框 start -->
	<div id="useGoodsMenu" class="menuDiv">
		<div class="menuContent">
			<div class="menuTitle">
				自用商品
				<span onclick="closeUseGoodsDiv();">×</span>
			</div>
			<div class="menuBody">
				<div class="menuContent">请输入自用商品&nbsp;<span class="goodsName"></span>&nbsp;数量：&nbsp;
					<input type="text" value="2"/>
				</div>
				<a class="btn btn-submit" onclick="requestUseGoods();">确认自用</a>
			</div>
		</div>
	</div>
	<!-- 自用商品弹出框 end -->

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/office/shopManage.js"></script>
	<script>
	    // 请求本月第一页小卖部商品信息
		requestshopList(1);
	</script>
</body>
</html>