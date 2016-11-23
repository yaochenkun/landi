<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap/bootstrap.min.js"></script>
<link
	href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/login.css"
	rel="stylesheet" type="text/css" />
<title>系统登录</title>
</head>
<body>
	<!-- 登录页 导航栏 start-->
	<nav class="navbar navbar-default navbar-fixed-top login_navbar"
		role="navigation">
	<div class="container">
		<div class="navbar-header login_nav_head">
			<a class="navbar-brand" href="#"><strong>Landing</strong></a>
		</div>
	</div>
	</nav>
	<!-- 登录页 导航栏 end -->

	<!-- 页面部分 start-->
	<div class="container login_body_container">
		<div class="row">
			<!-- 大图轮播 start -->
			<div id="carousel-example-generic"
				class="carousel slide col-md-7 login_carousel" data-ride="carousel">
				<!--大图轮播指标 start -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				</ol>
				<!--大图轮播指标 end -->

				<!--大图轮播项目 start -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="${pageContext.request.contextPath}/img/carousel_1.png"
							alt="First slide">
					</div>
					<div class="item">
						<img src="${pageContext.request.contextPath}/img/carousel_2.png"
							alt="Second slide">
					</div>
					<div class="item">
						<img src="${pageContext.request.contextPath}/img/carousel_3.png"
							alt="Second slide">
					</div>
				</div>
				<!-- 大图轮播项目 end -->

				<!--轮播导航 start -->
				<a class="left carousel-control" href="#carousel-example-generic"
					role="button" data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#carousel-example-generic"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
				<!-- 轮播导航 end -->
			</div>
			<!-- 大图轮播 end-->

			<!--右侧 用户登录表单 start-->
			<form class="form-horizontal col-md-5 login_form"
				action="${pageContext.request.contextPath}/login.action"
				method="post">
				<div class="form-group">
					<label class="col-sm-2 control-label">用户名</label>
					<div class="col-sm-8">
						<input type="text" name="name" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">密码</label>
					<div class="col-sm-8">
						<input type="password" name="passwd" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-8 col-sm-8">
						<button type="submit" class="btn btn-default">登录</button>
					</div>
				</div>
			</form>
			<!--右侧 用户登录表单 end-->
		</div>
	</div>
	<!-- 页面部分 end-->
	<!-- 底栏 start-->
	<div class="foot_box">Copyright © BUPT. All rights reserved.</div>
	<!-- 底栏 end-->
</body>
</html>