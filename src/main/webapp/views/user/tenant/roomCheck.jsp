<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/css/ld/user/home/public.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath }/css/ld/user/tenant/checkRoom.css" rel="stylesheet" type="text/css" />
	<title>房间信息</title>
</head>
<body>
    <jsp:include page="../_header.jsp"></jsp:include>
    <jsp:include page="../_leftMenu.jsp"></jsp:include>
	
    <!-- 三级导航栏 start -->
	<div class="nav-second">
        <div class="toolbar">
            <div class="nav-secondul">
                <ul>               
	                <li id="tenant-header" class="active-tab"><a href="${pageContext.request.contextPath}/views/user/tenant/roomGuest.jsp?rid=<%=request.getParameter("rid") != null ? request.getParameter("rid") : "" %>&rNum=<%=request.getParameter("rNum") %>">租客信息</a></li>
					<li id="asset-header"><a href="${pageContext.request.contextPath}/views/user/tenant/roomAsset.jsp?rid=<%=request.getParameter("rid") != null ? request.getParameter("rid") : "" %>&rNum=<%=request.getParameter("rNum") %>">物品信息</a></li>
					<li id="check-header"><a href="${pageContext.request.contextPath}/views/user/tenant/roomCheck.jsp?rid=<%=request.getParameter("rid") != null ? request.getParameter("rid") : "" %>&rNum=<%=request.getParameter("rNum") %>">查房状态</a></li>
					<li id="maintain-header"><a href="javascript:void(0);">维修状态</a></li>
					<li id="others-header"><a href="#others">其他</a></li>
                </ul>
            </div>    
        </div>
    </div>
    <!-- 三级导航栏 end-->
    
    <!-- 页面内容 start-->
    <div class="body-content">
	    <div class="content">    	    
            <!-- 图片样式 start -->
    	    <div class="roomPic">
    	    	<div class="ban">
                    <div class="big_pic"><ul></ul></div>           
                    <div class="min_pic">
                        <div class="prev_btn"><</div> 
                        <div class="num"><ul></ul></div>
                        <div class="next_btn">></div>
                    </div>
                </div>
                <div id="bigimg"></div>
                <div id="smalldiv"></div>
    	    </div>
            <!-- 图片样式 end -->

            <!-- 上传图片 start -->
            <div class="uploadPic">
                <div class="head">
                    <span class="spanbig"><%=request.getParameter("rid") %></span><span class="spansmall">&nbsp;&nbsp;房间</span>
                    <form modelAttribute="user" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath }/userRoom/uploadFiles.action">
                        <div class="btn btn-upload">+ 上传图片</div>
                        <input id="uploadRoomPic" type="file" name="file" multiple="multiple"/>
                        <input type="submit" class="btn btn-submit" value="提交"/>
                    </form>         
                </div>
                <div class="fileContent">
                    <ul></ul>
                </div>
            </div>
            <!-- 上传图片 end -->
        </div>
    </div>
    <!-- 页面内容 end-->

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/tenant/checkRoom.js"></script>
	<script>
    	$(function(){
            // ?? 先根据 房间Number查询房间ID
    		getRoomIDByNumber("<%=request.getParameter("rid") %>");
    	})
    </script>
</body>
</html>