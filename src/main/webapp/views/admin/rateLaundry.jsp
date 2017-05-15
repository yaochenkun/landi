<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/admin/public.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/admin/rateOther.css" rel="stylesheet" type="text/css" />
<title>洗衣费管理</title>
</head>
<body>
	<jsp:include page="_header.jsp" />
	<jsp:include page="_leftMenu.jsp" />

	<!-- 右侧菜单 start  -->
	<div class="nav-second">
		<div class="toolbar">
			<div class="nav-secondul">
				<ul>
					<li class="linormal"><a
						href="${pageContext.request.contextPath }/views/admin/rateList.jsp">能源费管理</a></li>
					<li class="liactive"><a
						href="${pageContext.request.contextPath }/views/admin/rateLaundry.jsp">洗衣费管理</a></li>
					<li class="linormal"><a
						href="${pageContext.request.contextPath }/views/admin/rateOther.jsp">其他费用管理</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 右侧菜单 start  -->

	<!-- 页面内容 start -->
	<div class="content">
		<div class="bill-table">
			<!-- 其他费用 W2-18 start -->
			<table>
					<thead><tr><th colspan="2">衣服种类</th><th>水洗</th><th>干洗</th><th>单熨</th></tr>
					</thead>
					<tbody>
						<tr><td class="trTitle" rowspan="4">西装</td><td class="name">西服上衣</td>
							<td class="laundry"></td>
							<td class="dry"><input type="text"/></td>
							<td class="pressing"><input type="text"/></td>
						<tr><td class="name">西服裤子</td>
							<td class="laundry"></td>
							<td class="dry"><input type="text"/></td>
							<td class="pressing"><input type="text"/></td>

						<tr><td class="name">西服马甲</td>
							<td class="laundry"></td>
							<td class="dry"><input type="text"/></td>
							<td class="pressing"><input type="text"/></td>

						<tr><td class="name">领带</td>
							<td class="laundry"></td>
							<td class="dry"><input type="text"/></td>
							<td class="pressing"><input type="text"/></td>



						<tr><td class="trTitle" rowspan="10">上衣</td><td class="name">休闲上衣</td>
							<td class="laundry"><input type="text"/></td>
							<td class="dry"><input type="text"/></td>
							<td class="pressing"><input type="text"/></td>

						<tr><td class="name">毛衣/毛衣外套</td>
							<td class="laundry"></td>
							<td  class="dry"><input type="text"/></td>
							<td class="pressing"><input type="text"/></td>

						<tr><td class="name">风衣</td>
							<td class="laundry"></td>
							<td class="dry"><input type="text"/></td>
							<td class="pressing"><input type="text"/></td>

						<tr><td class="name">羊绒外套（短）</td>
							<td class="laundry"></td>
							<td class="dry"><input type="text"/></td>
							<td class="pressing"><input type="text"/></td>

						<tr><td class="name">羊绒外套（中）</td>
							<td class="laundry"></td>
							<td class="dry"><input type="text"/></td>
							<td class="pressing"><input type="text"/></td>

						<tr><td class="name">羊绒外套（长）</td>
							<td class="laundry"></td>
							<td class="dry"><input type="text"/></td>
							<td class="pressing"><input type="text"/></td>

						<tr><td class="name">羽绒外套（短）</td>
							<td class="laundry"><input type="text"/></td>
							<td class="dry"><input type="text"/></td>
							<td></td>

						<tr><td class="name">羽绒外套（中）</td>
							<td class="laundry"><input type="text"/></td>
							<td class="dry"><input type="text"/></td>
							<td></td>

						<tr><td class="name">羽绒外套（长）</td>
							<td class="laundry"><input type="text"/></td>
							<td class="dry"><input type="text"/></td>
							<td></td>

						<tr><td class="name">棉马甲</td>
							<td class="laundry"><input type="text"/></td>
							<td class="dry"><input type="text"/></td>
							<td></td>



						<tr><td class="trTitle" rowspan="3">裤子</td><td class="name">休闲裤</td>
							<td class="laundry"><input type="text"/></td>
							<td class="dry"><input type="text"/></td>
							<td class="pressing"><input type="text"/></td>

						<tr><td class="name">羊绒裤</td>
							<td class="laundry"></td>
							<td class="dry"><input type="text"/></td>
							<td class="pressing"><input type="text"/></td>

						<tr><td class="name">短裤</td>
							<td class="laundry"><input type="text"/></td>
							<td class="dry"><input type="text"/></td>
							<td class="pressing"><input type="text"/></td>



						<tr><td class="trTitle" rowspan="5">裙子</td><td class="name">裙子</td>
							<td class="laundry"><input type="text"/></td>
							<td class="dry"><input type="text"/></td>
							<td class="pressing"><input type="text"/></td>

						<tr><td class="name">长裙</td>
							<td class="laundry"><input type="text"/></td>
							<td class="dry"><input type="text"/></td>
							<td class="pressing"><input type="text"/></td>

						<tr><td class="name">真丝裙</td>
							<td class="laundry"><input type="text"/></td>
							<td class="dry"><input type="text"/></td>
							<td class="pressing"><input type="text"/></td>

						<tr><td class="name">短裙</td>
							<td class="laundry"><input type="text"/></td>
							<td class="dry"><input type="text"/></td>
							<td class="pressing"><input type="text"/></td>

						<tr><td class="name">百褶裙</td>
							<td class="laundry"></td>
							<td class="dry"><input type="text"/></td>
							<td class="pressing"><input type="text"/></td>


						<tr><td class="trTitle" rowspan="4">衬衫</td><td class="name">T恤</td>
							<td class="laundry"><input type="text"/></td>
							<td class="dry"><input type="text"/></td>
							<td class="pressing"><input type="text"/></td>

						<tr><td class="name">衬衫</td>
							<td class="laundry"><input type="text"/></td>
							<td class="dry"><input type="text"/></td>
							<td class="pressing"><input type="text"/></td>

						<tr><td class="name">丝质衬衫</td>
							<td class="laundry"></td>
							<td class="dry"><input type="text"/></td>
							<td class="pressing"><input type="text"/></td>

						<tr><td class="name">女装衬衫</td>
							<td class="laundry"><input type="text"/></td>
							<td class="dry"><input type="text"/></td>
							<td class="pressing"><input type="text"/></td>



						<tr><td class="trTitle" rowspan="8">其他</td><td class="name">睡衣</td>
							<td class="laundry"><input type="text"/></td>
							<td class="dry"><input type="text"/></td>
							<td class="pressing"><input type="text"/></td>

						<tr><td class="name">围巾</td>
							<td class="laundry"></td>
							<td class="dry"><input type="text"/></td>
							<td class="pressing"><input type="text"/></td>

						<tr><td class="name">丝质围巾</td>
							<td class="laundry"></td>
							<td class="dry"><input type="text"/></td>
							<td class="pressing"><input type="text"/></td>

						<tr><td class="name">背心</td>
							<td class="laundry"><input type="text"/></td>
							<td class="dry"></td>
							<td class="pressing"></td>

						<tr><td class="name">手帕</td>
							<td class="laundry"><input type="text"/></td>
							<td class="dry"></td>
							<td class="pressing"></td>

						<tr><td class="name">手套</td>
							<td class="laundry"><input type="text"/></td>
							<td class="dry"></td>
							<td class="pressing"></td>

						<tr><td class="name">帽子</td>
							<td class="laundry"><input type="text"/></td>
							<td class="dry"></td>
							<td class="pressing"></td>

					</tbody>
				</table>
			<!-- 其他费用 E19-25 end -->

			<div class="btn btn-submit" onclick="setLaundray();">提&nbsp;交&nbsp;修&nbsp;改</div>
		</div>
	</div>
	<!-- 页面内容 end -->

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/admin/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/admin/rate.js"></script>

	<!-- jsp页面初始化操作 -->
	<script type="text/javascript">

       $(function(){

       		// 请求 收费标准
    		requestClothesUnitPrice();
       });
    </script>
</body>
</html>