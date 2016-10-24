<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/ld/user/home/public.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/ld/user/tenant/roomPic.css" rel="stylesheet" type="text/css"/>
	<title>房间管理</title>
</head>
<body>
	<jsp:include page="../_header.jsp"></jsp:include>
    <jsp:include page="../_leftMenu.jsp"></jsp:include>
    
    <div class="nav-second">
        <div class="toolbar">
            <div class="nav-secondul">
                <ul>               
                <li class="liactive"><a href="javascript:void(0);">上传查房图片</a></li>
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
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/tenant/roomPic.js"></script>
    <script>
    	$(function(){
    		// 查询房间号为1的房间图片
    		requestRoomPic(1);
    	})
    </script>
    
</body>
</html>