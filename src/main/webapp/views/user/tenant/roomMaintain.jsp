<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/tenant/roomGuest.js"></script>
	<link href="${pageContext.request.contextPath}/css/ld/user/tenant/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	 <link href="${pageContext.request.contextPath }/css/ld/user/tenant/roomGuest.css" rel="stylesheet" type="text/css" />
	<title>房间信息</title>
</head>
<body>
	<jsp:include page="../_header.jsp"></jsp:include>
	<jsp:include page="../_leftMenu.jsp"></jsp:include>
	
	<div class="body-content">
		<div class="mod-wrap">
			<div class="panel-tab">
				<ul class="clear">
					<li id="tenant-header"><a href="${pageContext.request.contextPath}/views/user/tenant/roomGuest.jsp?rid=<%=request.getParameter("rid") != null ? request.getParameter("rid") : "" %>&rNum=<%=request.getParameter("rNum") %>">租客信息</a></li>
					<li id="asset-header"><a href="${pageContext.request.contextPath}/views/user/tenant/roomAsset.jsp?rid=<%=request.getParameter("rid") != null ? request.getParameter("rid") : "" %>&rNum=<%=request.getParameter("rNum") %>">物品信息</a></li>
					<li id="check-header"><a href="${pageContext.request.contextPath}/views/user/tenant/roomCheck.jsp?rid=<%=request.getParameter("rid") != null ? request.getParameter("rid") : "" %>&rNum=<%=request.getParameter("rNum") %>">查房状态</a></li>
					<li id="maintain-header"><a href="javascript:void(0);">维修状态</a></li>
					<li id="others-header" class="active-tab"><a href="javascript:void(0);">其他</a></li>
				</ul>
			</div>
		</div>
		<div class="tab-wrap">
			<div id="maintain" class="tab-content">
				<div class="tab-header">
					<div><h2>维修状态</h2></div>
				</div>
				<span><img src="${pageContext.request.contextPath }/img/carousel_2.png"/></span>
			</div>
			
		</div>
		
	</div>
	<script>
		//getMeters();
		// getItem();
		
	</script>
</body>
</html>