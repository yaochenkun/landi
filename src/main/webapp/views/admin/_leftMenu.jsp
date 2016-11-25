<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.ld.app.CurEnv, org.ld.model.User"%>
<%@ page import="java.util.Date, java.text.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<!-- 二级导航栏 start -->
<div class="main-nav"> 
    <div class="aside-box">
        <ul>
            <li><a href="${pageContext.request.contextPath}/views/admin/homeAdmin.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;首页</a></li>
            <li><a href="${pageContext.request.contextPath}/views/admin/userList.jsp"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;用户管理</a></li>
            <li><a href="${pageContext.request.contextPath}/views/admin/roleEdit.jsp"><span class="glyphicon glyphicon-lock"></span>&nbsp;&nbsp;角色权限查看</a></li>
            <li><a href="${pageContext.request.contextPath}/views/admin/rateList.jsp"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;收费标准管理</a></li>
            <li><a href="${pageContext.request.contextPath}/views/admin/checkLog.jsp"><span class="glyphicon glyphicon-calendar"></span>&nbsp;&nbsp;日志查看</a></li>
        </ul>
    </div>
</div>