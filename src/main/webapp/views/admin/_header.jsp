<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.ld.app.CurEnv, org.ld.model.User"%>
<%@ page import="java.util.Date, java.text.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

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
    
