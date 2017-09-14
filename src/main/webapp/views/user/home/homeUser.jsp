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
	<link href="${pageContext.request.contextPath}/css/ld/user/roomService/roomService.css"	rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/css/ld/user/roomService/roomServiceIndex.css" rel="stylesheet" type="text/css" />
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
			<div class="btn btn-change btnchange" style="margin-right: 120px;">
				<a onclick="showEditPasswordModal();">客房报修</a>
			</div>
			<div class="btn btn-change btnchange">
				<a onclick="showEditPasswordModal();">紧急事件申报</a>
			</div>
		</div>
	</div>
	<div class="content">
		<div class="detail">




			<%--<div class="title">--%>
				<%--<div class="right">--%>
					<%--<a class="span" href="service/serviceIndex.jsp">客房服务</a>&nbsp;|&nbsp;--%>
					<%--<a class="span" href="maintain/maintainIndex.jsp">客房维修</a>&nbsp;|&nbsp;--%>
					<%--<a class="span" href="source/sourceIndex.jsp">能源费结算</a>&nbsp;|&nbsp;--%>
					<%--<a class="span" href="javascript:void(0);">客房费用结算</a>&nbsp;|&nbsp;--%>
					<%--<a class="span" href="affairReminder/affairReminderIndex.jsp">事务提醒</a>--%>
				<%--</div>--%>
			<%--</div>--%>

			<div class="detail-head">
				<span>功能菜单</span>
			</div>

			<div class="body">
				<!-- 客房服务 start -->
				<div class="index-list">
					<div class="left-index">
						<ul>
							<li><img src="${pageContext.request.contextPath}/img/roomService/telephone.svg">
								<span>客房服务</span>
							</li>
						</ul>
					</div>
				</div>
				<div class="content-title content-title-index active content-wash">
					<ul>
						<li><a href="${pageContext.request.contextPath}/views/user/roomService/service/serviceWash.jsp">洗衣单收费</a></li>
						<li><a href="${pageContext.request.contextPath}/views/user/roomService/service/serviceTakeaway.jsp">餐费</a></li>
						<li><a href="${pageContext.request.contextPath}/views/user/roomService/service/serviceWaterBill.jsp">饮用水费</a></li>
						<li><a href="${pageContext.request.contextPath}/views/user/roomService/service/serviceShoeCleaning.jsp">擦鞋费</a></li>
						<li><a href="${pageContext.request.contextPath}/views/user/roomService/service/serviceShopping.jsp">代购费</a></li>
						<li><a href="${pageContext.request.contextPath}/views/user/roomService/service/serviceBus.jsp">车费</a></li>

						<li><a href="${pageContext.request.contextPath}/views/user/office/shopManage.jsp">小卖铺</a></li>
						<li><a href="${pageContext.request.contextPath}/views/user/roomService/source/sourceIndex.jsp">能源费结算</a></li>
						<li><a href="${pageContext.request.contextPath}/views/user/roomService/expense/expenseIndex.jsp">LE承担费用</a></li>
						<li><a href="#">月结管理</a></li>
					</ul>
				</div>
				<!-- 客房服务 end -->

				<!-- 客房维修 start -->
				<div class="index-list">
					<div class="left-index">
						<ul>
							<li><img src="${pageContext.request.contextPath}/img/roomService/tools.svg">
								<span>客房维护</span>
							</li>
						</ul>
					</div>
				</div>
				<div class="content-title content-title-index">
					<ul>
						<li><a href="maintain/maintainNew.jsp">报修处理</a></li>
						<li><a href="#">检查检修</a></li>
						<li><a href="${pageContext.request.contextPath}/views/user/roomService/maintain/maintainManage.jsp">维修管理</a></li>
						<li><a href="${pageContext.request.contextPath}/views/user/roomService/maintain/maintainStat.jsp">维修统计</a></li>
						<li><a href="${pageContext.request.contextPath}/views/user/roomItem/itemIndex.jsp">客房物品管理</a></li>
					</ul>
				</div>
				<!-- 客房维修 end -->

				<!-- 能源费结算 start -->
				<div class="index-list">
					<div class="left-index">
						<ul>
							<li><img src="${pageContext.request.contextPath}/img/roomService/drops.svg">
								<span>租赁管理</span>
							</li>
						</ul>
					</div>
				</div>
				<div class="content-title content-title-index">
					<ul>
						<li><a href="${pageContext.request.contextPath}/views/user/tenant/generalMap.jsp">租客管理</a></li>
						<li><a href="${pageContext.request.contextPath}/views/user/tenant/newGuest.jsp">新增租客</a></li>
						<li><a href="${pageContext.request.contextPath}/views/user/tenant/guestList.jsp">租客一览表</a></li>
						<li><a href="${pageContext.request.contextPath}/views/user/tenant/roomManage.jsp">房源管理</a></li>
						<li><a href="#">房屋退租</a></li>
					</ul>
				</div>
				<!-- 能源费结算 end -->

				<!-- 客房费用结算 start -->
				<div class="index-list">
					<div class="left-index">
						<ul>
							<li><img src="${pageContext.request.contextPath}/img/roomService/calculate.svg">
								<span>收支管理</span>
							</li>
						</ul>
					</div>
				</div>
				<div class="content-title content-title-index">
					<ul>
						<li><a href="#">租赁款收付管理</a></li>
						<li><a href="#">发票管理</a></li>
						<li><a href="#">中介费管理</a></li>
						<li><a href="#">收支一览表</a></li>
						<li><a href="${pageContext.request.contextPath}/views/user/roomService/expense/expenseStatistics.jsp">客房费用统计</a></li>
						<%--<li><a href="${pageContext.request.contextPath}/views/user/roomService/expense/expenseLE.jsp?type=welfare">LE承担费用</a></li>--%>
					</ul>
				</div>
				<!-- 客房费用结算 end -->

				<!-- 事务提醒 start -->
				<div class="index-list">
					<div class="left-index">
						<ul>
							<li><img src="${pageContext.request.contextPath}/img/roomService/calendar.svg">
								<span>办公管理</span>
							</li>
						</ul>
					</div>
				</div>
				<div class="content-title content-title-index">
					<ul>
						<li><a href="${pageContext.request.contextPath}/views/user/roomService/affairReminder/mailboxIndex.jsp">站内信</a></li>
						<li><a href="${pageContext.request.contextPath}/views/user/roomService/affairReminder/diaryOverview.jsp">备忘录</a></li>
						<li><a href="${pageContext.request.contextPath}/views/user/roomItem/planList.jsp">物品申请</a></li>
						<li><a href="#">紧急事件处理</a></li>
						<li><a href="${pageContext.request.contextPath}/views/user/roomService/affairReminder/systemOverview.jsp">公告</a></li>

					</ul>
				</div>
				<!-- 客房费用结算 end -->
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

			<div class="detail-operation" style="margin-top: 40px;">
				<div class="btn btn-change btnchange">
					<a onclick="showEditPasswordModal();">修改密码</a>
				</div>
			</div>


			<div class="detail-operation">
				<div class="btn btn-change btnchange">
					<a href="${pageContext.request.contextPath}/logout.action">退出系统</a>
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
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/roomService.js"></script>
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