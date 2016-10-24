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
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/admin/public.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/admin/roomAsset.js"></script>
	<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/ld/admin/public.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/ld/admin/roomAsset.css" rel="stylesheet" type="text/css"/>
	<title>房间管理</title>
</head>
<body>
	<!-- 一级导航栏 start-->
    <header class="navbar navbar-fixed-top navbar-ld">
        <div class="container-fluid">
            <div class="header-content">
                <div class="header-logo">
                    <img src="${pageContext.request.contextPath}/img/logo.png">
                </div>
                <div class="navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <div class="dropdown-toggle" data-toggle="dropdown" id="user_dropdown">
                             	 欢迎您，${CUR_ENV.cur_user.USERNAME}
                              <span class="caret"></span>
                            </div>
                            <ul class="dropdown-menu" aria-labelledby="user_dropdown" aria-expanded="false">
                              <li class="li"><a href="#">修改密码</a></li>
                              <li role="separator" class="divider"></li>
                              <li class="li"><a href="${pageContext.request.contextPath}/logout.action">退出</a></li>
                            </ul>
                        </li>
                   </ul>
                </div>
            </div>
        </div>
    </header>
    <!-- 一级导航栏 end-->

    <!-- 二级导航栏 start -->
    <div class="main-nav"> 
        <div class="aside-box">
            <ul>
                <li class="linormal"><span class="glyphicon glyphicon-home"></span><a href="javascript:void(0);">&nbsp;&nbsp;首页</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-user"></span><a href="javascript:void(0);">&nbsp;&nbsp;租客管理</a></li>
                <li class="liactive"><span class="glyphicon glyphicon-usd"></span><a href="${pageContext.request.contextPath}/views/admin/roomAsset.jsp">&nbsp;&nbsp;固定资产</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-list-alt"></span><a href="">&nbsp;&nbsp;采购</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-shopping-cart"></span><a href="">&nbsp;&nbsp;小卖部</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-heart-empty"></span><a href="">&nbsp;&nbsp;爱心驿站</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-indent-left"></span><a href="">&nbsp;&nbsp;统计信息</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-plus"></span><a href="">&nbsp;&nbsp;其他</a></li>
            </ul>
        </div>
    </div>
    <div class="nav-second">
        <div class="toolbar">
            <div class="nav-secondul">
                <ul>               
                <li class="liactive"><a href="javascript:void(0);">房间管理</a></li>
                <li class="linormal"><a href="">设备管理</a></li> 
                </ul>
            </div>    
        </div>
    </div>
    <!-- 二级导航栏 end-->
    
    
    

</body>
</html>