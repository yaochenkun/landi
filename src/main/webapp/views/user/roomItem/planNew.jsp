<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.ld.model.User"%>
<%@ page import="java.util.Date, java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css"	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/home/public.css"	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/plugin/simpleCalendar/date_pack.css"	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomItem/roomItem.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomItem/planNew.css" rel="stylesheet" type="text/css" />
<title>新增采购计划</title>
</head>
<body>

	<jsp:include page="../_header.jsp" />
	<jsp:include page="../_leftMenu.jsp" />
	<jsp:include page="../_modal.jsp" />

	<div class="nav-second">
		<div class="toolbar">
			<div class="nav-secondul">
				<ul>
					<li class="linormal"><a	href="${pageContext.request.contextPath}/views/user/roomItem/itemOverview.jsp">物品统计</a></li>
					<li class="liactive"><a	href="${pageContext.request.contextPath}/views/user/roomItem/planList.jsp">采购管理</a></li>
				</ul>
			</div>
		</div>
	</div>

	<!-- 页面内容 strat -->
	<div class="main">
		<div class="main-page">
			<div class="planTitle">
				<h4>新增采购计划</h4>
				<a class="btn btn-goback goback" href="planList.jsp">返&nbsp;&nbsp;&nbsp;回</a>
				<ul class="ul">
					<li class="li"><span class="span">计划名称：</span>
					    <input type="text" value="采购冰箱" /></li>
					<li class="li"><span class="span">计划负责人：</span>
						<input type="text" value="Alice" /></li>
					<li class="li"><span class="span">备注：</span>
					    <input class="note" type="text" value="无" /></li>
				</ul>
			</div>
			<div class="planContent">
				<div class="itemList">
					<h3>计划采购物品：</h3>
					<table>
						<thead>
							<tr>
								<th>序号</th>
								<th>物品种类</th>
								<th>物品子类</th>
								<th>物品品牌</th>
								<th>物品名称</th>
								<th>数量</th>
								<th>总价</th>
								<th>备注</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<tr class="addItem">
								<td colspan="10">+ 添加物品</td>
							</tr>
						</tbody>
					</table>
				</div>
				<a class="btn btn-goback submit" onclick="addPlan();">确认添加采购计划</a>
			</div>
		</div>
	</div>

	<!-- 添加采购计划物品弹出框 start -->
	<div class="shadow"></div>
	<div class="addItemDiv">
		<div class="facContent">
			<div class="fac-title">
				添加采购计划中物品
				<span>×</span>
			</div>
			<div class="fac-body">
				<div id="item-type" class="item">
					<span class="span">物品种类：</span>
					<div class="item-content"></div>
				</div>
				<div id="item-cat" class="item">
						<span class="span">物品子类：</span>
					<div class="item-content"></div>
				</div>
   			<div id="item-com" class="item">
   				<span class="span">物品品牌：</span>
					<div class="item-content"></div>
   			</div>
   			<div id="item-name" class="item">
   				<span class="span">物品名称：</span>
					<div class="item-content"><input type="text" value="GT双开门冰箱" /></div>
   			</div>

				<div id="item-count" class="item">
					<span class="span">数量：</span>
					<div class="item-content"><input type="text" value="10" /></div>
				</div>

				<div id="item-unitPrice" class="item">
					<span class="span">单价：</span>
					<div class="item-content"><input type="text" value="2.1" /></div>
				</div>

				<div id="item-totalPrice" class="item">
					<span class="span">总价：</span>
					<div class="item-content"><input type="text" value="1.52" disabled="disabled"/></div>
				</div>

				<div id="item-provider" class="item">
					<span class="span">供应商：</span>
					<div class="item-content"><input type="text" value="国美电器" /></div>
				</div>

				<div id="item-ownertype" class="item">
					<span class="span">归属权：</span>
					<div class="item-content">
							<a class="btn btn-item" onclick="changeOwner(this);">LE固定资产</a>
							<a class="btn btn-item" onclick="changeOwner(this);">LE管理资产</a>
					</div>
				</div>

				<div id="item-ownermanage" class="item">
					<span class="span"></span>
					<div class="item-content">
							<a class="btn btn-item" onclick="changeSelection(this);">SPC</a>
							<a class="btn btn-item" onclick="changeSelection(this);">小业主</a>
					</div>
				</div>

				<div id="item-invoiceInfo" class="item">
					<span class="span">开票信息：</span>
					<div class="item-content">
							<a class="btn btn-item" onclick="changeInvoiceInfo(this);">含普票</a>
							<a class="btn btn-item" onclick="changeInvoiceInfo(this);">含增票</a>
							<a class="btn btn-item" onclick="changeInvoiceInfo(this);">不含票</a>
					</div>
				</div>

				<div id="item-ifReceived" class="item">
					<span class="span">是否收到：</span>
					<div class="item-content">
							<a class="btn btn-item" onclick="changeSelection(this);">是</a>
							<a class="btn btn-item" onclick="changeSelection(this);">否</a>
					</div>
				</div>

				<div id="item-orderDate" class="item">
					<span class="span">下单日期：</span>
					<div class="item-content"><input type="text" class="pack_maintain" value="" /></div>
				</div>

				<div id="item-arrivalDate" class="item">
					<span class="span">到货日期：</span>
					<div class="item-content"><input type="text" class="pack_maintain" value="" /></div>
				</div>

				<div id="item-comment" class="item">
					<span class="span">备注：</span>
					<div class="item-content"><input type="text" value="无" /></div>
				</div>

			</div>
			<div class="fac-foot">
				<a class="btn btn-submit" onclick="addOneItem();">确定</a>
			</div>
		</div>
	</div>
	<!-- 添加采购计划物品弹出框 end -->

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/simpleCalendar/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/simpleCalendar/date_pack.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/ld/user/roomItem/roomItem.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/ld/user/roomItem/planNew.js"></script>

		<script type="text/javascript">
			// 初始化时间
			var nowDate = new Date();
			$(".pack_maintain").val(formatDateForm(nowDate));
			$('.pack_maintain').date_input();

		</script>
</body>
</html>
