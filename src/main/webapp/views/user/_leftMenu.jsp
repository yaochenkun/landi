<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- 二级导航栏 start -->
<div class="main-nav">
	<div class="aside-box">
		<ul>
			<li class="menuOne">
				<span class="span">
					<i class="i1">&lt;</i>&nbsp;<i class="i2">&lt;</i>&nbsp;<i class="i3">&lt;</i>&nbsp;收起
				</span>
			</li>

			<li><a class="linormal" href="${pageContext.request.contextPath}/views/user/home/homeUser.jsp">
				<span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;首页</a>
			</li>

			<li><a class="linormal" href="${pageContext.request.contextPath}/views/user/tenant/generalMap.jsp">
				<span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;租客管理</a>
			</li>

			<li><a class="linormal" href="${pageContext.request.contextPath}/views/user/roomService/roomServiceIndex.jsp">
				<span class="glyphicon glyphicon-usd"></span>&nbsp;&nbsp;客房服务管理</a>
			</li>

			<li><a class="linormal" href="${pageContext.request.contextPath}/views/user/roomItem/itemOverview.jsp">
				<span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;客房物品管理</a>
			</li>

			<li><a class="linormal" href="${pageContext.request.contextPath}/views/user/office/shopManage.jsp">
				<span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;&nbsp;办公室管理</a>
			</li>

<!-- 			<li><a class="linormal" href="javascript:void(0);">
				<span class="glyphicon glyphicon-plus"></span>&nbsp;&nbsp;其他</a>
			</li> -->
		</ul>
	</div>
</div>
<!-- 二级导航栏 end-->