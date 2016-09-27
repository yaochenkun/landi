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
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/admin/user.js"></script>
	<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/ld/admin/public.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/ld/admin/user.css" rel="stylesheet" type="text/css"/>
	<title>用户列表</title>
</head>
<body>
	<!-- 一级导航栏 start-->
    <header class="navbar navbar-fixed-top navbar-ld">
        <div class="container-fluid">
            <div class="header-content">
                <div class="header-logo">
                    <img src="${pageContext.request.contextPath}/img/logo.png">
                </div>
                <!-- <div class="navbar-collapse">
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
                </div>-->
                <div class="navbar-collapse">
                                                               欢迎您，${CUR_ENV.cur_user.USERNAME}
                     <div class="logoutDiv"><a title="退出" class="logoutImg" href="${pageContext.request.contextPath}/logout.action"></a></div>
                </div>
            </div>
        </div>
    </header>
    <!-- 一级导航栏 end-->

    <!-- 二级导航栏 start -->
    <div class="main-nav"> 
        <div class="aside-box">
            <ul>
                <li class="linormal"><span class="glyphicon glyphicon-home"></span><a href="${pageContext.request.contextPath}/views/admin/homeAdmin.jsp">&nbsp;&nbsp;首页</a></li>
                <li class="liactive"><span class="glyphicon glyphicon-user"></span><a href="${pageContext.request.contextPath}/views/admin/userList.jsp">&nbsp;&nbsp;用户管理</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-lock"></span><a href="${pageContext.request.contextPath}/views/admin/roleEdit.jsp">&nbsp;&nbsp;角色权限查看</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-list-alt"></span><a href="">&nbsp;&nbsp;收费标准管理</a></li>
            </ul>
        </div>
    </div>
    <div class="nav-second">
        <div class="toolbar">
            <div class="nav-secondul">
                <ul>               
                <li class="liactive"><a href="javascript:void(0);">用户列表</a></li>
                </ul>
            </div>    
        </div>
    </div>
    <!-- 二级导航栏 end-->
    
    <!-- 页面内容 start-->
    <div class="body-content">
	    <div class="content">
	        <section class="activities">
	            <!-- 新建用户 start-->
	            <div class="new">
	                <a href="${pageContext.request.contextPath}/views/admin/newUser.jsp" class="btn btn-new">新建用户</a>
	            </div>
	            <!-- 新建用户  end-->
	
	            <!-- 用户table start-->
	            <div class="nav-block">
	                <table id="users_table" class="table"></table>
	            </div>
	            <!-- 用户table end-->
	
	            <!-- 用户页码 start-->
	            <div id="userBottom" class="bottom"></div>
	            <!-- 用户页码 end -->
	       </section>
	    </div>
    </div>
    <!-- 页面内容 end-->
    
    <!-- 重置密码弹出框 start -->
    <div class="dialog-resetPasswd-success"> 
        <div class="dialog-main">
            <div class="dialog-title">
                <a onclick="hideDialogPasswdSuccess();" class="close"><i>×</i></a>
            </div>
            <div class="dialog-body">
                <!-- <h4><span>&radic;</span>&nbsp;&nbsp;重置密码成功！</h4> -->
                <div class="logo-success"></div>
                <h4></h4>
            </div>
        </div>   
    </div>
    <!-- 重置密码弹出框 end -->
    
    <!-- 删除用户弹出框 start -->
    <div class="dialog-deleteUser-success"> 
        <div class="dialog-main">
            <div class="dialog-title">
                <a onclick="hideDialogDeleteSuccess();" class="close"><i>×</i></a>
            </div>
            <div class="dialog-body">
                <!-- <h4><span>&radic;</span>&nbsp;&nbsp;重置密码成功！</h4> -->
                <div class="logo-success"></div>
                <h4></h4>
            </div>
        </div>   
    </div>
    <!-- 删除用户弹出框 end -->
    
    <!-- jsp页面初始化操作 -->
    <script type="text/javascript">
       // 请求 角色 ID-名称 对应关系（拉取第一页用户编号）
       $(function(){
    	  requestAjaxRoleArraySave();
       });
    </script>
</body>
</html>
