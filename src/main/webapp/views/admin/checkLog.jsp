<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.ld.app.CurEnv, org.ld.model.User"%>
<%@ page import="java.util.Date, java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/ld/admin/public.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/ld/admin/checkLog.js"></script>
<link
	href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/admin/public.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/css/ld/admin/checkLog.css"
	rel="stylesheet" type="text/css" />
<title>管理员首页</title>
</head>
<body>

	<jsp:include page="_header.jsp" />
	<jsp:include page="_leftMenu.jsp" />

	<!-- 页面内容 start -->
	<div class="log-content">
		<div class="log-head">系统日志列表</div>
		<div class="log-detail"></div>
		<div id="log-bottom"></div>
	</div>
	<!-- 页面内容 end -->

	<script type="text/javascript">
       // 请求 角色 ID-名称 对应关系（拉取第一页用户编号）
       $(function(){
    	    getLogs();
	    	changeLeftMenu(4);
       });
    </script>
</body>
</html>