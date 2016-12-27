<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.ld.app.CurEnv, org.ld.model.User"%>
<%@ page import="java.util.Date, java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/home/public.css"	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomItem/roomItem.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/maintain/maintainStat.css" rel="stylesheet" type="text/css" />
<title>维修统计</title>
</head>
<body>

	<jsp:include page="../../_header.jsp" />
	<jsp:include page="../../_leftMenu.jsp" />

	<!-- 页面内容 strat -->
	<div class="main">
		<div class="main-page">
			<div class="nav-path">
				<a href="../roomServiceIndex.jsp" title="回到首页"><i class="icon-home"></i></a>
				<i class="icon-path"></i>
				<a href="maintainIndex.jsp">客房维修</a>
				<i class="icon-path"></i>
				<a href="javascript:void(0);">维修统计</a>
			</div>
			<div class="bill-area">
				<div class="table-title"></div>

				<div class="bill-table">
					<!-- 费用 table start -->
					<table>
						<thead>
							<tr id='theadFirst'>
								<th rowspan="2"><span>房间号</span></th>
								<th rowspan="2" colspan="2"><span>房间信息</span></th>
								<th rowspan="2" colspan="2"><span>入住情况</span></th>
								<th colspan="4"><span>问题等级合计</span></th>
								<th colspan="2"><span>未解决</span></th>
								<th rowspan="2"><span>合计</span></th>
								<th rowspan="2"><span>操作</span></th>
							</tr>
							<tr id='theadSecond'>
								<th><span>一级</span></th><th><span>二级</span></th>
								<th><span>三级</span></th><th><span>四级</span></th>
								<th><span>未解决第四等级问题</span></th><th><span>其余未解决</span></th>
							</tr>
						</thead>
						<tbody id="maintainStatTbody"></tbody>
					</table>
					<!-- 费用 table end -->

					<!-- 底部页面 start -->
					<div id="maintainManageBottom" class="bottom"></div>
					<!-- 底部页码 end -->
				</div>
			</div>
		</div>
	</div>
	<!-- 页面内容 end -->

	<!-- 确认修复弹出框 start -->
<!-- 	<div class="shadow"></div>	
	<div id="confirmMenu" class="menuDiv">
		<div class="menuContent">
			<div class="menuTitle">
				确认修复
				<span onclick="closeConfirmDiv();">×</span>
			</div>
			<div class="menuBody">
				<div class="menuContent"><span class="goodsName"></span>维修费用：&nbsp;
					<input type="text" value="2"/>
				</div>
				<a class="btn btn-submit" onclick="requestConfirmMaintain();">确认修复</a>
			</div>
		</div>
	</div> -->
	<!-- 确认修复弹出框 end -->

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/maintain/maintainStat.js"></script>
	<script>
	    // 请求第一页维修统计信息
	    requestMaintainStat(1);
	</script>
</body>
</html>