<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.ld.model.User"%>
<%@ page import="java.util.Date, java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css"	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/home/public.css"	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/home/home.css" rel="stylesheet" type="text/css" />
<script>
	//将英文月份转换成数字月份
	function formateMonth(month) {

		var res = 1;
		switch(month){
			case 'January':res = 1;break;
			case 'February':res = 2;break;
			case 'March':res = 3;break;
			case 'April':res = 4;break;
			case 'May':res = 5;break;
			case 'June':res = 6;break;
			case 'July':res = 7;break;
			case 'August':res = 8;break;
			case 'September':res = 9;break;
			case 'October':res = 10;break;
			case 'November':res = 11;break;
			case 'December':res = 12;break;
		}

		return res;
	}
</script>
<title>用户首页</title>
</head>
<body>

	<jsp:include page="../_header.jsp" />
	<jsp:include page="../_leftMenu.jsp" />
	<jsp:include page="../_modal.jsp" />

	<!-- 页面内容 start-->
	<div class="title">
		<div class="title-content">
			<img src="${pageContext.request.contextPath}/img/user.svg" alt="用户头像">
			<h5>
				当前用户角色：<span id="roleTypeContent"></span>
				<span id="roleTypeNum" style="display: none;">${curUser.ROLE}</span>
			</h5>
			<div class="btn btn-change btnchange">
				<a onclick="showEditPasswordModal();">修改密码</a>
			</div>
		</div>
	</div>
	<div class="content">
		<div class="detail">
			<div class="detail-head">
				<span>个人信息</span>
			</div>
			<div class="detail-body">
				<dl>
					<dt>用户名</dt>
					<dd>${curUser.USERNAME}</dd>
					<dt>姓名</dt>
					<dd>${curUser.NAME}</dd>
					<dt>工号</dt>
					<dd>${curUser.NUM}</dd>
					<dt>部门</dt>
					<dd>${curUser.DEPART}</dd>
					<% 
						User curUser = (User)session.getAttribute("curUser");
                    	Date ctime = curUser.getCTIME();
                    	Date ltime = curUser.getLTIME();
                       
                       SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                       String createLocalDate = sdf.format(ctime);
                       String loginLocalDate = sdf.format(ltime);
                       
                       String stateString = "";
                       int state = curUser.getSTATE();
                       if(state==1)  stateString = "正常";
                       else if(state == 10) stateString = "禁用";
                       %>
					<dt>创建用户时间</dt>
					<dd><%= createLocalDate %></dd>
					<dt>最近登录时间</dt>
					<dd><%= loginLocalDate %></dd>
					<dt>状态</dt>
					<dd><%= stateString %></dd>
				</dl>
			</div>

			<div class="detail-head">
				<span>事务提醒</span>
			</div>

			<div style="margin:auto 50px;">
				<div id="full-clndr" style="display:inline;">
					<script type="text/template" id="id_clndr_template">
						<div class="clndr-controls">
							<div class="clndr-previous-button"><<</div>
							<div class="clndr-next-button">>></div>
							<div class="month"><\%= year + ' 年 ' %><\%= formateMonth(month) + ' 月'%></div>
						</div>
						<div class="clndr-grid">
							<div class="days-of-the-week">
								<\% _.each(daysOfTheWeek, function(day) { %><div class="header-day"><\%= day %></div><\% }); %>
							</div>
							<div class="days">
								<\% _.each(days, function(day) { %><div class="<\%= day.classes %>" id="<\%= day.id %>"><span class="day-number"><\%= day.day %></span></div><\% }); %>
							</div>
						</div>
					</script>
				</div>
				<div id="event">
					<div class="event-header1"></div>
					<div class="event-header2">本&nbsp;&nbsp;日&nbsp;&nbsp;事&nbsp;&nbsp;务</div>
					<ul class="event-content">
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 页面内容 end-->

	<!-- 修改密码模态框  start -->
	<div id="editPassword" class="modal fade" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">修改密码</h4>
				</div>

				<div class="modal-body">
					<p>
						输入新密码：<input type="password" name='password' class="form-control" />
					</p>
					<p>
						确认新密码：<input type="password" class="form-control" />
					</p>
					<p style="visibility: hidden; color: red">输入错误提示！</p>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="submit" class="btn btn-primary" onclick="changePassword();">确认修改</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<!-- 修改密码模态框 end -->


	<!-- 事件详情对话框 -->
	<div id="reminderDetailMenu" class="addItemDiv">
		<div class="facContent">
			<div class="fac-title">
				事务详情
				<span onclick="closeReminderDetailDiv();">×</span>
			</div>
			<div class="fac-body">
				<div id="room-number" class="item">
					<span class="span">主题：</span>
					<div class="item-content"><input id="reminderTitle" type="text" value="" readonly/></div>
				</div>
				<div id="tag-name" class="item">
					<span class="span">内容：</span>
					<div class="item-content"><textarea id="reminderContent" cols="155" rows="10" readonly></textarea></div>
				</div>
			</div>
			<div class="fac-foot">
				<span id="currentDate" style="display:none"></span>
				<a class="btn btn-submit" id="finishBtn" onclick="requestFinishReminder(this, '${curUser.ID}');">确认完成</a>
			</div>
		</div>
	</div>



	<div class="shadow"></div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/clndr/underscore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/clndr/moment.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/clndr/clndr.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/home.js"></script>
	<script type="text/javascript">


       // 请求 角色 ID-名称 对应关系（拉取第一页用户编号）
       $(function(){
    	    requestAjaxRoleArraySave();
	    	  changeLeftMenu(0);
       });


       $("#full-clndr").clndr({
           template: $('#id_clndr_template').html(),
           clickEvents: {
               onMonthChange: function(month) {
                   // TODO: 这边写月份改变事件，控制底部线条图的变化

                   requestRemindDays(${curUser.ID}, formatDateForm(new Date(month)));
                   setFutureDaysClickable();
               },
               click: function(target){
                   var dateDom = $(target.element);
                   if((!dateDom.hasClass("focusIn")) && (dateDom.hasClass("past") || dateDom.hasClass("today"))){
                       $(".focusIn").removeClass("focusIn");
                       dateDom.addClass("focusIn");
                       // TODO: 这边写日期改变的事件，控制右边环形图的变化

                       requestReminder(${curUser.ID}, target.date._i);
                       $("#currentDate").text(target.date._i);
                   }
               },
           },
           daysOfTheWeek : [ '日', '一', '二', '三', '四', '五', '六' ],
           forceSixRows : true,
           adjacentDaysChangeMonth : true
       });

       //拉取今天的的站内信、个人日志、系统提醒 事务数据，显示到右侧事件下拉表中
	   	currentDate = formatDateForm(new Date());
		requestReminder(${curUser.ID}, currentDate);
		$("#currentDate").text(currentDate);

		//拉取这个月的所有有事件的天，标记为红色字体
		requestRemindDays(${curUser.ID}, currentDate);
       	setFutureDaysClickable();
    </script>

</body>
</html>