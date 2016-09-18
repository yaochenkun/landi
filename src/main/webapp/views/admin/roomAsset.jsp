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
                             	 欢迎您，${name}
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
    
     <!-- 页面内容 start-->
    <div class="body-content">
    <div class="content">
        <section class="activities">
        <!-- 筛选标签 start -->
            <div class="search">
                <div id="search-form" class="navbar-form-normal">
                    <div class="search-input-container">
                        <div class="search-input-wrap">
                            <div class="dropdown">
                                <input type="search" class="search-input" placeholder="房间号">
                            </div>
                        </div>
                    </div>
                </div>
                <div id="search-form" class="navbar-form-normal">
                    <div class="search-input-container">
                        <div class="search-input-wrap">
                            <div class="dropdown">
                                <input type="search" class="search-input" placeholder="房型">
                            </div>
                        </div>
                    </div>
                </div>
                <div id="search-form" class="navbar-form-normal">
                    <div class="search-input-container">
                        <div class="search-input-wrap">
                            <div class="dropdown">
                                <input type="search" class="search-input" placeholder="楼层">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 筛选标签 end -->

            <div class="btn btn-search">筛选</div>

            <!-- 新增房间 start-->
            <div class="new">
                <a href="/views/members/newMember.jsp" class="btn btn-new">新增房间</a>
            </div>
            <!-- 新增房间 end-->

            <!-- 房间table start-->
            <div class="nav-block">
                <table class="table">
                    <tr>
                        <td>房间号</td>
                        <td>房型</td>
                        <td>楼层</td>
                        <td>面积</td>
                        <td>出租状态</td>
                        <td>通水</td>
                        <td>通电</td>
                        <td>通气</td>
                        <td>通网</td>
                        <td>家具</td>
                        <td>家电</td>
                        <td>灯具</td>
                        <td>窗具</td>
                        <td>浴屏</td>
                        <td>操作</td>
                        <td>备品</td>
                        <td>图片</td>
                    </tr> 
                    <tr><td>1</td>
                        <td>哈哈</td>
                        <td>3</td>
                        <td>70平</td>
                        <td>租出</td>
                        <td>是</td>
                        <td>是</td>
                        <td>是</td>
                        <td>是</td>
                        <td>是</td>
                        <td>是</td>
                        <td>是</td>
                        <td>是</td>
                        <td>是</td>
                        <td><span>修改</span></td>
                        <td><span>查看</span></td>
                        <td><span>预览</span></td>
                    </tr>
                </table>

            </div>
            <!-- 房间table end-->

            <!-- 页码 start-->
            <div class="bottom">
                <div class="bottom-page"> 
                    <span class="page-before" onclick="">上一页&nbsp;&nbsp;</span>
                    <span><input type="text" class="input_num" value="1"></span>
                    <span>/</span>
                    <span id="total_page">12</span>
                    <span class="page-next" onclick="">&nbsp;&nbsp;下一页</span>
                </div>
            </div>
            <!-- 页码 end -->
            </section></div>
    </div>
    <!-- 页面内容 end-->
    
</body>
</html>