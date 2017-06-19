<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.ld.model.User"%>
<%@ page import="java.util.Date, java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- 二级导航栏 start -->
<div class="main-nav">
	<div class="aside-box">
		<ul>
			<li><a onclick="handleClickMenuItem('${curUser.RESET_PASSWD}', '${pageContext.request.contextPath}' + '/views/admin/homeAdmin.jsp')" href="javascript:void(0)"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;首页</a></li>
			<li><a onclick="handleClickMenuItem('${curUser.RESET_PASSWD}', '${pageContext.request.contextPath}' + '/views/admin/userList.jsp')" href="javascript:void(0)"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;用户管理</a></li>
			<li><a onclick="handleClickMenuItem('${curUser.RESET_PASSWD}', '${pageContext.request.contextPath}' + '/views/admin/roleEdit.jsp')" href="javascript:void(0)"><span class="glyphicon glyphicon-lock"></span>&nbsp;&nbsp;角色权限管理</a></li>
			<li><a onclick="handleClickMenuItem('${curUser.RESET_PASSWD}', '${pageContext.request.contextPath}' + '/views/admin/rateList.jsp')" href="javascript:void(0)"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;收费标准管理</a></li>
			<li><a onclick="handleClickMenuItem('${curUser.RESET_PASSWD}', '${pageContext.request.contextPath}' + '/views/admin/checkLog.jsp')" href="javascript:void(0)"><span class="glyphicon glyphicon-calendar"></span>&nbsp;&nbsp;日志查看</a></li>
		</ul>
	</div>
</div>

<script>

    var handleClickMenuItem = function(hasResetPasswd, targetUrl) {

        //检查是否修改过密码
        if(hasResetPasswd == 0) {

            alert("请先在首页修改初始密码！");
        } else {

            //跳转到目标url
            window.location.href = targetUrl;
        }
    }

</script>