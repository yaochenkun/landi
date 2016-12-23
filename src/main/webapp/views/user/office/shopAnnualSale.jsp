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
<link href="${pageContext.request.contextPath}/css/ld/user/office/shopAnnualSale.css" rel="stylesheet" type="text/css" />
<title>商品年销售量</title>
</head>
<body>
	<jsp:include page="../_header.jsp"></jsp:include>
	<jsp:include page="../_leftMenu.jsp" />

	<% String goodId = request.getParameter("goodId");%>
	<div style='display:none;' id='goodId'><%=goodId%></div>
	<!-- 页面内容 strat -->
	<div class="main">
		<div class="main-page">
			<div class="bill-area">
				<div class="search">
					<span>年份：</span><input id='searchYear' type="text" value="2016">
				</div>
				<a href="shopManage.jsp" class="btn btn-goback">返&nbsp;回</a>
				<div class="bill-table">
					<!-- 费用 table start -->
					<table>
						<thead>
							<tr>
								<th></th>
								<th><span>1月</span></th>
								<th><span>2月</span></th>
								<th><span>3月</span></th>
								<th><span>4月</span></th>
								<th><span>5月</span></th>
								<th><span>6月</span></th>
								<th><span>7月</span></th>
								<th><span>8月</span></th>
								<th><span>9月</span></th>
								<th><span>10月</span></th>
								<th><span>11月</span></th>
								<th><span>12月</span></th>
							</tr>
						</thead>
						<tbody id="annualSaleTbody"></tbody>
					</table>
					<!-- 费用 table end -->

					<!-- 底部页面 start -->
					<div id="annualSaleBottom" class="bottom"></div>
					<!-- 底部页码 end -->
				</div>
			</div>
		</div>
	</div>
	<!-- 页面内容 end -->

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/office/shopAnnualSale.js"></script>
	<script type="text/javascript">
		// 设置获取当前年
		var d = new Date;
		var nowYear = d.getFullYear();
		$("#searchYear").val(nowYear);
	    // 拉取第一页 商品年销售额信息
		requestAnnualSale(nowYear,1);
	</script>
</body>
</html>