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
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/admin/rate.js"></script>
	<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/ld/admin/public.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/ld/admin/rate.css" rel="stylesheet" type="text/css"/>
	<title>收费标准</title>
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
                <li class="linormal"><span class="glyphicon glyphicon-user"></span><a href="${pageContext.request.contextPath}/views/admin/userList.jsp">&nbsp;&nbsp;用户管理</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-lock"></span><a href="${pageContext.request.contextPath}/views/admin/roleEdit.jsp">&nbsp;&nbsp;角色权限查看</a></li>
                <li class="liactive"><span class="glyphicon glyphicon-list-alt"></span><a href="${pageContext.request.contextPath}/views/admin/rateList.jsp">&nbsp;&nbsp;收费标准管理</a></li>
            </ul>
        </div>
    </div>
    <div class="nav-second">
        <div class="toolbar">
            <div class="nav-secondul">
                <ul>
                    <li class="liactive">收费标准</li>
                </ul>
            </div>    
        </div>
       </div>
    <!-- 二级导航栏 end-->
        <!-- 页面内容 start -->

    <!-- 水费 start -->
    <div class="content">
        <div class="content-body">
        <div class="water">
            <div class="head">
                <img src="${pageContext.request.contextPath}/img/water.svg"/>
                <h3>水费</h3>
            </div>
            <div class="body">
                <dl>
                    <dt>一&nbsp;阶</dt><dd></dd>
                    <dt>数&nbsp;额</dt><dd></dd>
                </dl>
                <dl>
                    <dt>二&nbsp;阶</dt><dd></dd>
                    <dt>数&nbsp;额</dt><dd></dd>
                </dl>
                <dl>
                    <dt>三&nbsp;阶</dt><dd></dd>
                    <dt>数&nbsp;额</dt><dd></dd>
                </dl>
            </div>
        </div>
        <!-- 水费 end -->

        <!-- 电费 start -->
        <div class="power">
            <div class="head">
                <img src="${pageContext.request.contextPath}/img/power.svg"/>
                <h3>电费</h3>
            </div>
            <div class="body">
                <dl>
                    <dt>一&nbsp;阶</dt><dd></dd>
                    <dt>数&nbsp;额</dt><dd></dd>
                </dl>
                <dl>
                    <dt>二&nbsp;阶</dt><dd></dd>
                    <dt>数&nbsp;额</dt><dd></dd>
                </dl>
                <dl>
                    <dt>三&nbsp;阶</dt><dd></dd>
                    <dt>数&nbsp;额</dt><dd></dd>
                </dl>
            </div>
        </div>
        <!-- 电费 end -->

        <!-- 燃气费 start -->
        <div class="gas">
            <div class="head">
                <img src="${pageContext.request.contextPath}/img/gas.svg"/>
                <h3>燃气费</h3>
            </div>
            <div class="body">
                <dl>
                    <dt>一&nbsp;阶</dt><dd></dd>
                    <dt>数&nbsp;额</dt><dd></dd>
                </dl>
                <dl>
                    <dt>二&nbsp;阶</dt><dd></dd>
                    <dt>数&nbsp;额</dt><dd></dd>
                </dl>
                <dl>
                    <dt>三&nbsp;阶</dt><dd></dd>
                    <dt>数&nbsp;额</dt><dd></dd>
                </dl>
            </div>
        </div>
        <!-- 燃气费 end-->
        </div>
    </div>
    <div id='editButton'><a class="btn btn-change btnchange" onclick="EditRatePage();">编&nbsp;&nbsp;辑</a></div>
    <!-- 页面内容 end-->
    
    <!-- jsp页面初始化操作 -->
    <script type="text/javascript">
       // 请求 收费标准
       $(function(){
    	   requestAjaxRate();
       });
    </script>
    
</body>
</html>