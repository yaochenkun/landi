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
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/home/public.css"	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomItem/roomItem.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomItem/planDetail.css" rel="stylesheet" type="text/css" />
<title>采购计划详情</title>
</head>
<body>

	<jsp:include page="../_header.jsp" />
	<jsp:include page="../_leftMenu.jsp" />
	<jsp:include page="../_modal.jsp" />

	<% String planID = request.getParameter("planID"); %>
	<% String planName = request.getParameter("planName"); %>

	<div class="main">
		<div class="planHead">
			<div class="planName">
				<span class="title">计划名称：<%=planName%></span>
				<span id="planID" style="display:none;"><%=planID%></span>
			</div>
			<a class="btn goback" href="planList.jsp">返&nbsp;回</a>
		</div>
		<div class="content">
			<div class="head">1.&nbsp;&nbsp;计划采购物品明细</div>
			<div class="body">
				<!-- 费用 table start -->
				<table>
					<thead>
						<tr>
							<th>序号</th>
							<th>种类</th>
							<th>子类</th>
							<th>品牌</th>
							<th>名称</th>
							<th>归属权</th>
							<th>库房号</th>
							<th>供应商</th>
							<th>已采购</th>
							<th>总量</th>
							<th>单价</th>
							<th>总价</th>
							<th>开票信息</th>
							<th>是否收到</th>
							<th>下单日期</th>
							<th>到货日期</th>
							<th>备注</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="facTbody"></tbody>
				</table>
				<!-- 费用 table end -->
			</div>
		</div>
		<div class="content">
			<div class="head">2.&nbsp;&nbsp;计划执行情况</div>
			<div class="body" id="planProgressBody"></div>
		</div>
	</div>
	
	<div class="shadow"></div>
	<!-- 执行采购计划 弹出框 start-->
	<div class="addItemDiv">
		<div class="facContent">
			<div class="fac-title">
				执行采购计划
				<span onclick="closeCaigouDiv();">×</span>
			</div>
			<div class="fac-body">
				<div id="pd-id" style="display:none;"></div>
				<div id="fac-id" style="display:none;"></div>
				<div id="plan-name" class="item">
					<span class="span">计划名称：</span>
					<div class="item-content"><%=planName%></div>
				</div>
				<div id="fac-term" class="item">
						<span class="span">阶段名称：</span>
					<div class="item-content"><input type="text" value="采购" /></div>
				</div>
				<div id="fac-name" class="item">
   					<span class="span">物品名称：</span>
					<div class="item-content"></div>
   				</div>
   				<div id="fac-staff" class="item">
					<span class="span">采购人员：</span>
					<div class="item-content"><input type="text" value="Alice" /></div>
				</div>
				<div id="fac-total" class="item">
					<span class="span">采购物品数量：</span>
					<div class="item-content"><input type="text" value="1" oninput="calCaigouTotalPrice(this.value);"/></div>
				</div>
				<div id="fac-unitprice" class="item">
					<span class="span">单价：</span>
					<div class="item-content"></div>
				</div>
				<div id="fac-money" class="item">
					<span class="span">总价：</span>
					<div class="item-content"></div>
				</div>
				<div id="fac-comment" class="item">
					<span class="span">备注：</span>
					<div class="item-content"><input type="text" value="无" /></div>
				</div>

			</div>
			<div class="fac-foot">
				<a class="btn btn-submit" onclick="addPlanProgress();">确认采购</a>
			</div>
		</div>
	</div>
	<!-- 执行采购计划 弹出框 start-->

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomItem/roomItem.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomItem/planDetail.js"></script>
	<script>(function(){
			requestPlanDetail();
			requestPlanProgress(1);
		})();
	</script>
</body>
</html>
