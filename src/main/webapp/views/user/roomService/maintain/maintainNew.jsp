<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="org.omg.Dynamic.Parameter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath}/css/ld/user/home/public.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/service/serviceNew.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/plugin/simpleCalendar/date_pack.css"	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/maintain/maintainNew.css" rel="stylesheet" type="text/css" />

<title>维修报修</title>
</head>
<body>
	<jsp:include page="../../_header.jsp"></jsp:include>
	<jsp:include page="../../_modal.jsp" />
	<%
		String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String ID = request.getParameter("ID");
	%>
	<!-- 页面内容 start -->
	<div class="main">
		<div class="main-page">
			<div class="nav-path">
				<a href="../roomServiceIndex.jsp" title="回到首页"><i class="icon-home"></i></a>
				<i class="icon-path"></i>
				<a href="maintainManage.jsp">维修管理</a>
				<i class="icon-path"></i>
				<a href="javascript:void(0);">添加维修管理</a>
			</div>
			<div class="body">
				<div class="body-content">
					<ul>
						<li><span class="span">回复日期：</span>
							<input id="replyDate" type="text" value="<%=date%>"/>
						<li><span class="span">回复内容：</span></li>
						<textarea style="margin:-40px 0px 30px 120px;" id="description"></textarea>
						<li id="infoSource"><span class="span" >信息来源：</span>
							<input type="text"  value="" id="infoSourceInput"/>
							<div class="problemSortMenu">
								<ul>
									<li>第一太平</li>
									<li>积水工程部</li>
									<li>顾客支援中心</li>
								</ul>
							</div>
						</li>
						<li id="department"><span class="span">分配部门：</span>
							<input type="text" id="departmentInput" value="" />
							<div class="problemReasonMenu">
								<ul>
									<li>积水工程部</li><li>顾客支援中心</li>
									<li>藤田</li>
								</ul>
							</div>
						</li>

						<li><span class="span">LE确认完成：</span><input style="width:50px;" type="checkbox" id="complete"></li>
						<li><span class="span">维修费用：</span><input style="width:50px;" type="checkbox" id="checkFare" onclick="maintainFare();"></li>
					</ul>
					<ul style="display: none;" id="forFare">
						<li><span class="span">费用金额：</span>
							<input id="fare" type="text" /></li>
						<li><span class="span">费用明细：</span></li>
							<textarea style="margin:-40px 0px 30px 120px;" id="fareDetail"></textarea>
						<li id="fareAfford"><span class="span">费用承担：</span>
							<input type="text" id="fareAffordInput" />
							<div class="problemAffordMenu">
								<ul>
									<li>LE承担</li><li>租客承担</li>
									<li>SPC承担</li>
								</ul>
							</div>
						</li>
						<li><span class="span">当月月结</span>
							<input style="width:50px;" id="monthGet" type="checkbox" />
							<span style="margin-left: 85px;" class="span">已确认收款</span>
							<input style="width:50px;" id="alreadyGet" type="checkbox" />
						</li>
					</ul>
					<ul>
						<li><span class="span"></span><a onclick="addMaintain('<%=ID%>');" class="btn btn-goback goback">确认添加</a></li>

					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 页面内容 end -->
	<div class="shadow"></div>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/maintain/maintainNew.js"></script>
	<script>

	</script>
</body>
</html>