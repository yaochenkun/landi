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
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/LdUser.js"></script>
	<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/ld/home.css" rel="stylesheet" type="text/css"/>
	<title>首页</title>
</head>
<body>
<!-- 业务主页 导航栏 start-->
  <nav class="navbar navbar-default navbar-fixed-top home_navbar" role="navigation">
    <div class="container">
      <div class="navbar-header nav_head">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#collapse-1" aria-expanded="false">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#"><strong>Landing</strong></a>
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
  </nav> 
  <!-- 业务主页 导航栏 end-->



    <!-- 底栏 start-->
    <div class="foot_box">
        Copyright © BUPT. All rights reserved.
    </div>
    <!-- 底栏 end-->

</body>
</html>
