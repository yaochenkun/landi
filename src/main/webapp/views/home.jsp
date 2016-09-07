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

     <div class="collapse navbar-collapse" id="collapse-1">
       <ul class="nav navbar-nav navbar-right">
         <li class="dropdown">
            <div class="dropdown-toggle" data-toggle="dropdown" id="user_dropdown">
                                      欢迎您，${name} 
              <span class="caret"></span>
            </div>
            <ul class="dropdown-menu" aria-labelledby="user_dropdown" aria-expanded="false">
              <li><a href="#">个人主页</a></li>
              <li><a href="#">修改密码</a></li>
              <li role="separator" class="divider"></li>
              <li><a href="${pageContext.request.contextPath}/logout.action">退出</a></li>
            </ul>
          </li>
       </ul>
     </div>
    </div>
  </nav> 
  <!-- 业务主页 导航栏 end-->

  <!--业务菜单 start-->
  <div id="business_box" class="container">
      <ul>
        <li class="business_li li0">
          <h5>租客管理</h5>
          <ul class="menu menu0">
            <li>新增租客</li>
            <li>维修/代购/赔偿/服务记录</li>
            <li>服务变更及计算</li>
            <li>杂费记录</li>
          </ul>
        </li>

        <li class="business_li li1">
          <h5>固定资产</h5>
          <ul class="menu menu1">
            <li>房间管理</li>
            <li>设备管理</li>
           </ul>
        </li>

        <li class="business_li li2">
          <h5>采购</h5>
          <ul class="menu menu2">
            <li>新增采购计划</li>
            <li>管理已有计划</li>
          </ul>
        </li>

        <li class="business_li li3">
          <h5>小卖部和爱心驿站</h5>
          <ul class="menu menu3">
            <li>小卖部运营</li>
            <li>爱心驿站</li>
          </ul>
        </li>

        <li class="business_li li4">
          <h5>统计信息</h5>
          <ul class="menu menu4">
            <li>日志记录</li>
          </ul>
        </li>

        <li class="business_li li5">
          <h5>其他</h5>
          <ul class="menu menu5">
            <li>办公室管理</li>
            <li>收支统计</li>
          </ul>
        </li>

      </ul>
    </div>
    <!--业务菜单 end-->

    <!-- 底栏 start-->
    <div class="foot_box">
        Copyright © BUPT. All rights reserved.
    </div>
    <!-- 底栏 end-->

</body>
</html>
