<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                <li><a href="javascript:void(0);"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;首页</a></li>
                <li><a href="javascript:void(0);"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;租客管理</a></li>
                <li><a href="${pageContext.request.contextPath}/views/admin/roomAsset.jsp"><span class="glyphicon glyphicon-usd"></span>&nbsp;&nbsp;固定资产</a></li>
                <li><a href=""><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;采购</a></li>
                <li><a href=""><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;&nbsp;小卖部</a></li>
                <li><a href=""><span class="glyphicon glyphicon-heart-empty"></span>&nbsp;&nbsp;爱心驿站</a></li>
                <li><a href=""><span class="glyphicon glyphicon-indent-left"></span>&nbsp;&nbsp;统计信息</a></li>
                <li><a href=""><span class="glyphicon glyphicon-plus"></span>&nbsp;&nbsp;其他</a></li>
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
    
    <!-- 页面内容 start-->
    <div class="body-content">
	    <div class="content" style="margin: 50px; float: right;">    	    
		    <%--文件上传的话需要enctype="multipart/form-data"--%>
		    <form modelAttribute="user" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath }/userRoom/uploadFiles.action">
		        <%--这里设置文件上传--%>
		        房间号：<input type="text" name="room_id" value="1"/>
			    <input type="file" name="file" multiple="multiple"/>
			    <input type="submit" value="提交"/>
			</form>			
	    </div>
	    <div id="userRoomPic">
	    	<div class="ban">
                <!-- 大图 start -->
                <div class="big_pic">
                    <ul></ul>
                </div>  
                <!-- 大图 end -->

                <!-- 小图 start -->               
                <div class="min_pic">
                    <div class="prev_btn"><</div> 
                    <div class="num">
                        <ul></ul>
                    </div>
                    <div class="next_btn">></div>
                </div>
                <!-- 小图 end -->
            </div>
            <div id="bigimg"></div>
            <div id="smalldiv"></div>
	    </div>
    </div>
    
    <!-- 页面内容 end-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/admin/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/admin/roomAsset.js"></script>
    <script>
    	$(function(){
    		// 查询房间号为1的房间图片
    		requestRoomPic(1);
    	})
    </script>
    
</body>
</html>