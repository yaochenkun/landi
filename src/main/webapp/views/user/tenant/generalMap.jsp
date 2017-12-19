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
<link href="${pageContext.request.contextPath}/css/ld/user/tenant/tenantPublic.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/ld/user/tenant/generalMap.css" rel="stylesheet" type="text/css" />

	<title>租客一览图</title>
</head>
<body>
	<jsp:include page="../_header.jsp"></jsp:include>

	<!-- 三级导航栏 start-->
	<%--<div class="nav-second">--%>
		<%--<div class="toolbar">--%>
			<%--<div class="nav-secondul">--%>
				<%--<ul>--%>
					<%--<li class="liactive"><a href="javascript:void(0);">租客一览图</a></li>--%>
					<%--<li class="linormal"><a href="guestList.jsp">租客一览表</a></li>--%>
					<%--<li class="linormal"><a href="newGuest.jsp">新增租客</a></li>--%>
					<%--<li class="linormal"><a href="roomManage.jsp">房源管理</a></li>--%>
				<%--</ul>--%>
			<%--</div>--%>
		<%--</div>--%>
	<%--</div>--%>
	<!-- 三级导航栏 end-->

	<div class="main">
		<div class="main-page">

			<div class="nav-path">
				<a href="../home/homeUser.jsp" title="回到首页"><i class="icon-home"></i></a>
				<i class="icon-path"></i> <a href="generalMap.jsp">租客管理</a>
			</div>


	<!-- 租客一览图 -->
	<div class="body-content">
		<div class="general-map">
			<table id="building"></table>
		</div>
	</div>

	<div class="hint">
		<div class="hint-content">
			<ul>
				<li><div class="hint-circle"></div><span class="span">SPC</span></li>
				<li><div class="hint-circle"></div><span class="span">小业主</span></li>
				<li><div class="hint-circle"></div><span class="span">待租</span></li>
				<li><div class="hint-circle"></div><span class="span">已租</span></li>
				<li><div class="hint-circle"></div><span class="span">其他使用</span></li>
				<li><div class="hint-circle"></div><span class="span">非管理</span></li>

			</ul>
		</div>
	</div>
		</div>
	</div>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/tenant/generalMap.js"></script>
	<script>
		getRoomState();
	</script>
</body>
</html>