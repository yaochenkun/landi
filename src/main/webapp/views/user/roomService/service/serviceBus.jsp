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
<title>车费</title>
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
				<a href="">车费</a>
			</div>
			<a class="btn btn-new btnnew" href="">新增车费记录</a>
			<div class="bill-area">
				<div class="search">
					<span>房间号：</span><input type="text" value="W34-1">
				</div>
				<div class="bill-table">
					<!-- 费用 table start -->
					<table>
						<tbody>
						    <tr class="date"><td>日期</td></tr>
							<tr class="roomNo"><td>房间号</td></tr>
							<tr class="name"><td>姓名</td></tr>
							
							<tr class="price"><td></td></tr>
							<tr class="one"><td>1日</td></tr>
							<tr class="two"><td>2日</td></tr>
							<tr class="three"><td>3日</td></tr>
							<tr class="four"><td>4日</td></tr>
							<tr class="five"><td>5日</td></tr>
							<tr class="six"><td>6日</td></tr>
							<tr class="seven"><td>7日</td></tr>
							<tr class="eight"><td>8日</td></tr>
							<tr class="nine"><td>9日</td></tr>
							<tr class="ten"><td>10日</td></tr>
							<tr class="eleven"><td>11日</td></tr>
							<tr class="twelve"><td>12日</td></tr>
							<tr class="thirteen"><td>13日</td></tr>
							<tr class="fourteen"><td>14日</td></tr>
							<tr class="fifteen"><td>15日</td></tr>
							<tr class="sixteen"><td>16日</td></tr>
							<tr class="seventeen"><td>17日</td></tr>
							<tr class="eighteen"><td>18日</td></tr>
							<tr class="ninteen"><td>19日</td></tr>
							<tr class="twenty"><td>20日</td></tr>
							<tr class="twentyOne"><td>21日</td></tr>
							<tr class="twentyTwo"><td>22日</td></tr>
							<tr class="twentyThree"><td>23日</td></tr>
							<tr class="twentyFour"><td>24日</td></tr>
							<tr class="twentyFive"><td>25日</td></tr>
							<tr class="twentySix"><td>26日</td></tr>
							<tr class="twentySeven"><td>27日</td></tr>
							<tr class="twentyEight"><td>28日</td></tr>
							<tr class="twentyNine"><td>29日</td></tr>
							<tr class="thirty"><td>30日</td></tr>
							<tr class="thirtyOne"><td>31日</td></tr>
							<tr class="total"><td>合计</td></tr>
						</tbody>
					</table>
					<!-- 费用 table end -->

					<!-- 底部页面 start -->
					<div id="serviceBusBottom" class="bottom"></div>
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
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/service/serviceBus.js"></script>
	<script type="text/javascript">
	    // 拉取第一页 车费信息
		requestBus();
	</script>
</body>
</html>