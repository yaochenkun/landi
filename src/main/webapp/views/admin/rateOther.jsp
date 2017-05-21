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
<title>其他费用管理</title>
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
					<li class="linormal"><a
						href="${pageContext.request.contextPath }/views/admin/rateLaundry.jsp">洗衣费管理</a></li>
					<li class="liactive"><a
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
				<thead>
					<tr>
						<th>项目</th>
						<th>W-2</th>
						<th>W-3</th>
						<th>W-4</th>
						<th>W-5</th>
						<th>W-6</th>
						<th>W-7</th>
						<th>W-8</th>
						<th>W-9</th>
						<th>W-10</th>
						<th>W-11</th>
						<th>W-12</th>
						<th>W-13</th>
						<th>W-14</th>
						<th>W-15</th>
						<th>W-16</th>
						<th>W-17</th>
						<th>W-18</th>
					</tr>
				</thead>
				<tbody>
					<tr class="LE-W">
						<td>LE管理费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="wash-W">
						<td>布草洗涤费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="waste-W">
						<td>布草消耗费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="car-W">
						<td>车费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="light-W">
						<td>灯泡费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="tax-W">
						<td>税金</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="int-W">
						<td>网费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="resource-W">
						<td>能源费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="barrelwater-W">
						<td>桶装水费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
				</tbody>
			</table>
			<!-- 其他费用 W2-18 end -->

			<!-- 其他费用 W19-35 start -->
			<table>
				<thead>
					<tr>
						<th>项目</th>
						<th>W-19</th>
						<th>W-20</th>
						<th>W-21</th>
						<th>W-22</th>
						<th>W-23</th>
						<th>W-24</th>
						<th>W-25</th>
						<th>W-26</th>
						<th>W-27</th>
						<th>W-28</th>
						<th>W-29</th>
						<th>W-30</th>
						<th>W-31</th>
						<th>W-32</th>
						<th>W-33</th>
						<th>W-34</th>
						<th>W-35</th>
					</tr>
				</thead>
				<tbody>
					<tr class="LE-W">
						<td>LE管理费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="wash-W">
						<td>布草洗涤费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="waste-W">
						<td>布草消耗费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="car-W">
						<td>车费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="light-W">
						<td>灯泡费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="tax-W">
						<td>税金</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="int-W">
						<td>网费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="resource-W">
						<td>能源费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="barrelwater-W">
						<td>桶装水费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
				</tbody>
			</table>
			<!-- 其他费用 W19-25 end -->

			<!-- 其他费用 E2-18 start -->
			<table>
				<thead>
					<tr>
						<th>项目</th>
						<th>E-2</th>
						<th>E-3</th>
						<th>E-4</th>
						<th>E-5</th>
						<th>E-6</th>
						<th>E-7</th>
						<th>E-8</th>
						<th>E-9</th>
						<th>E-10</th>
						<th>E-11</th>
						<th>E-12</th>
						<th>E-13</th>
						<th>E-14</th>
						<th>E-15</th>
						<th>E-16</th>
						<th>E-17</th>
						<th>E-18</th>
					</tr>
				</thead>
				<tbody>
					<tr class="LE-E">
						<td>LE管理费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="wash-E">
						<td>布草洗涤费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="waste-E">
						<td>布草消耗费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="car-E">
						<td>车费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="light-E">
						<td>灯泡费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="tax-E">
						<td>税金</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="int-E">
						<td>网费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="resource-E">
						<td>能源费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="barrelwater-E">
						<td>桶装水费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
				</tbody>
			</table>
			<!-- 其他费用 E2-18 end -->

			<!-- 其他费用 E19-35 start -->
			<table>
				<thead>
					<tr>
						<th>项目</th>
						<th>E-19</th>
						<th>E-20</th>
						<th>E-21</th>
						<th>E-22</th>
						<th>E-23</th>
						<th>E-24</th>
						<th>E-25</th>
						<th>E-26</th>
						<th>E-27</th>
						<th>E-28</th>
						<th>E-29</th>
						<th>E-30</th>
						<th>E-31</th>
						<th>E-32</th>
						<th>E-33</th>
						<th>E-34</th>
						<th>E-35</th>
					</tr>
				</thead>
				<tbody>
					<tr class="LE-E">
						<td>LE管理费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="wash-E">
						<td>布草洗涤费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="waste-E">
						<td>布草消耗费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="car-E">
						<td>车费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="light-E">
						<td>灯泡费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="tax-E">
						<td>税金</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="int-E">
						<td>网费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="resource-E">
						<td>能源费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
					<tr class="barrelwater-E">
						<td>桶装水费</td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
						<td><input type="text" value="1" /></td>
					</tr>
				</tbody>
			</table>
			<!-- 其他费用 E19-25 end -->

			<div class="btn btn-submit" onclick="setCharge();">提&nbsp;交&nbsp;修&nbsp;改</div>
		</div>
	</div>
	<!-- 页面内容 end -->

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/admin/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/admin/rate.js"></script>

	<!-- jsp页面初始化操作 -->
	<script type="text/javascript">
       // 请求 收费标准
       $(function(){
    	   requestAjaxCharge();
    	   changeLeftMenu(3);
       });
    </script>
</body>
</html>
