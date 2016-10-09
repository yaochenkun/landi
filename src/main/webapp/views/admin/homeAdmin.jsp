<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.ld.app.CurEnv, org.ld.model.User"%>
<%@ page import="java.util.Date, java.text.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/admin/public.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/admin/home.js"></script>
	<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/ld/admin/public.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/ld/admin/home.css" rel="stylesheet" type="text/css"/>
	<title>管理员首页</title>
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
                <li class="liactive"><span class="glyphicon glyphicon-home"></span><a href="${pageContext.request.contextPath}/views/admin/homeAdmin.jsp">&nbsp;&nbsp;首页</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-user"></span><a href="${pageContext.request.contextPath}/views/admin/userList.jsp">&nbsp;&nbsp;用户管理</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-lock"></span><a href="${pageContext.request.contextPath}/views/admin/roleEdit.jsp">&nbsp;&nbsp;角色权限查看</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-list-alt"></span><a href="${pageContext.request.contextPath}/views/admin/rateList.jsp">&nbsp;&nbsp;收费标准管理</a></li>
            </ul>
        </div>
    </div>
    <!-- 二级导航栏 end-->
    
    <!-- 页面内容 start-->
    <div class="content">
        <div class="title">
            <img src="${pageContext.request.contextPath}/img/admin.svg" alt="">
            <h5>当前用户角色：<span id="roleTypeContent"></span><span id="roleTypeNum" style="display:none;">${CUR_ENV.cur_user.ROLE}</span></h5>
            <div class="btn btn-change btnchange"><a onclick="showEditPasswordModal();">修改密码</a></div>
        </div>
        <div class="detail">
            <div class="detail-head">
                <span>个人信息</span>
            </div>
            <div class="detail-body">
                <dl>
                    <dt>用户名</dt><dd>${CUR_ENV.cur_user.USERNAME}</dd>
                    <dt>姓名</dt><dd>${CUR_ENV.cur_user.NAME}</dd>
                    <dt>工号</dt><dd>${CUR_ENV.cur_user.NUM}</dd>
                    <dt>部门</dt><dd>${CUR_ENV.cur_user.DEPART}</dd>
                    <% 
                       CurEnv curenv = (CurEnv)session.getAttribute("CUR_ENV");
                       Date ctime = curenv.getCur_user().getCTIME();
                       Date ltime = curenv.getCur_user().getLTIME();
                       
                       SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                       String createLocalDate = sdf.format(ctime);
                       String loginLocalDate = sdf.format(ltime);
                       
                       String stateString = "";
                       int state = curenv.getCur_user().getSTATE();
                       if(state==1)  stateString = "正常";
                       else if(state == 10) stateString = "禁用";
                       %>
                    <dt>创建用户时间</dt><dd><%= createLocalDate %></dd>
                    <dt>最近登录时间</dt><dd><%= loginLocalDate %></dd>
                    <dt>状态</dt><dd><%= stateString %></dd>
                </dl>
            </div>
        </div>
    </div>
    
    <!-- 修改密码模态框  start -->
	<div id="editPassword" class="modal fade" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">修改密码</h4>
	      </div>
	      
	      <div class="modal-body">
	          <p>输入新密码：<input type="password" name ='password' class="form-control"/></p>
	          <p>确认新密码：<input type="password" class="form-control"/></p>
	          <p style="visibility:hidden; color:red">输入错误提示！</p>
	      </div>
	      
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="submit" class="btn btn-primary" onclick="changePassword();">确认修改</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
    <!-- 修改密码模态框 end -->
    
    <!-- jsp页面初始化操作 -->
    <script type="text/javascript">
       // 请求 角色 ID-名称 对应关系（拉取第一页用户编号）
       $(function(){
    	  requestAjaxRoleArraySave();
       });
    </script>

</body>
</html>