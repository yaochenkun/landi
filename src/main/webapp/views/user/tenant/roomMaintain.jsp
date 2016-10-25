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
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/admin/roomAsset.js"></script>
	<link href="${pageContext.request.contextPath}/css/ld/user/tenant/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	 <link href="${pageContext.request.contextPath }/css/ld/user/tenant/roomGuest.css" rel="stylesheet" type="text/css" />
	<title>房间信息</title>
</head>
<body>
<jsp:include page="../_header.jsp"></jsp:include>
	
    <!-- 二级导航栏 start -->
    <div class="main-nav"> 
        <div class="aside-box">
            <ul>
                <li class="linormal"><span class="glyphicon glyphicon-home"></span><a href="javascript:void(0);">&nbsp;&nbsp;首页</a></li>
                <li class="liactive"><span class="glyphicon glyphicon-user"></span><a href="${pageContext.request.contextPath}/views/user/tenant/generalMap.jsp">&nbsp;&nbsp;租客管理</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-usd"></span><a href="${pageContext.request.contextPath}/views/user/roomAsset.jsp">&nbsp;&nbsp;固定资产</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-list-alt"></span><a href="">&nbsp;&nbsp;采购</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-shopping-cart"></span><a href="">&nbsp;&nbsp;小卖部</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-heart-empty"></span><a href="">&nbsp;&nbsp;爱心驿站</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-indent-left"></span><a href="">&nbsp;&nbsp;统计信息</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-plus"></span><a href="">&nbsp;&nbsp;其他</a></li>
            </ul>
        </div>
    </div>
    <!-- 二级导航栏 end-->
	<div class="body-content">
		<div class="mod-wrap">
			<div class="panel-tab">
				<ul class="clear">
					<li id="tenant-header"><a href="${pageContext.request.contextPath}/views/user/tenant/roomGuest.jsp">租客信息</a></li>
					<li id="asset-header"><a href="${pageContext.request.contextPath}/views/user/tenant/roomAsset.jsp">物品信息</a></li>
					<li id="check-header"><a href="${pageContext.request.contextPath}/views/user/tenant/checkRoom.jsp">查房状态</a></li>
					<li id="maintain-header" class="active-tab"><a href="${pageContext.request.contextPath}/views/user/tenant/roomMaintain.jsp">维修状态</a></li>
					<li id="others-header"><a href="#">其他</a></li>
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