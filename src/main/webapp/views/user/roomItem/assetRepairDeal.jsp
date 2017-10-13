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
<link href="${pageContext.request.contextPath}/css/plugin/simpleCalendar/date_pack.css"	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomItem/roomItem.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomItem/planNew.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/css/ld/user/roomService/service/serviceNew.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/css/ld/user/roomService/service/serviceNewWaterBill.css" rel="stylesheet" type="text/css" />

	<title>报修处理</title>
</head>
<body>

	<jsp:include page="../_header.jsp" />
	<jsp:include page="../_leftMenu.jsp" />
	<jsp:include page="../_modal.jsp" />

	<div class="nav-second">
		<div class="toolbar">
			<div class="nav-secondul">
				<ul>
					<li class="linormal"><a	href="${pageContext.request.contextPath}/views/user/roomItem/itemRoomOverview.jsp">物品统计</a></li>
					<li class="liactive"><a	href="${pageContext.request.contextPath}/views/user/roomItem/planList.jsp">采购管理</a></li>
				</ul>
			</div>
		</div>
	</div>

	<!-- 页面内容 strat -->
	<div class="main">
		<div class="main-page">
			<div class="planTitle">
				<h4>报修处理</h4>
				<a class="btn btn-goback goback" href="assetRepairOverview.jsp">返&nbsp;&nbsp;&nbsp;回</a>
				<ul class="ul">
				</ul>
			</div>

			<div class="body">
				<div class="body-content" style="margin-left: 5%;">
					<ul>

						<li><span class="span">房间号：</span>
							<input id="roomNum" type="text" value="" onblur="associateGuestName(this)" disabled/>
							<span class="red red-right">*&nbsp;必填</span></li>
						<li id="roomIdWarning"><span class="span"></span><span class="red">不能为空！</span></li>
						<li><span class="span">入住状态：</span><input type="text" value="" disabled="disabled" id="roomState"/></li>
						<li><span class="span">租客姓名：</span><input type="text" value="" disabled="disabled" id="guestName"/></li>

						<li><span class="span">申报日期：</span><input type="text" class="pack_maintain" id="reflectDate" disabled></li>
						<li><span class="span">申报人：</span><input type="text" value="${curUser.NAME}" disabled="disabled" /></li>


						<li><span class="span" style="width: 18em;">报修位置及问题描述：</span></li>
						<textarea rows="5" cols="100" style="margin-top:-20px;" id="description" disabled></textarea>

						<li style="margin-top:10px;"><span class="span" style="width: 18em;">初步分析问题原因描述：</span></li>
						<textarea rows="5" cols="100" style="margin-top:-20px;" id="outsiderReason" disabled></textarea>

						<li style="margin-top:10px;"><span class="span" style="width: 18em;">备注：</span></li>
						<textarea rows="5" cols="100" style="margin-top:-20px;" id="outsiderComment" disabled></textarea>





						<li id="problemTypeDropDownList" style="margin-top:10px;">
							<span class="span">问题分类：</span>
							<input type="text" id="problemTypeDropDownInput" value="" readonly/>
							<a href="javascript:void(0);" onclick="showNewProbTypeModal();" style="color:#2277da; margin-left: 20px;" >新增分类</a>
							<div class="dropDownMenu">
								<ul>
								</ul>
							</div>
						</li>



						<li id="problemSubTypeDropDownList">
							<span class="span">问题子类：</span>
							<input type="text" id="problemSubypeDropDownInput" value="" readonly/>
							<a href="javascript:void(0);" onclick="showNewProbSubTypeModal();" style="color:#2277da; margin-left: 20px;" >新增子类</a>
							<div class="dropDownMenu">
								<ul>
								</ul>
							</div>
						</li>


						<li><span class="span">LE管理资产：</span><input type="checkbox" onclick="changeLEManageAsset();" id="isLEManage" checked/></li>

						<div id="le-manage-asset">
							<hr style="margin-top: 0px;">

							<li id="dropDownList" style="margin-top: 20px;">
								<span class="span">问题等级：</span>
								<input type="text" id="dropDownInput" value="一级" readonly/>
								<div class="dropDownMenu">
									<ul>
										<li>一级</li>
										<li>二级</li>
										<li>三级</li>
										<li>四级</li>
									</ul>
								</div>
							</li>

							<li><span class="span" style="width: 18em;">更新/补充问题描述：</span></li>
							<textarea rows="5" cols="100" style="margin-top:-20px;" id="extraDescription"></textarea>




							<li style="margin-top:10px;"><span class="span" style="width: 11em;">需求解决时间：</span><input type="text" class="pack_maintain" id="solveDate"></li>

							<li><span class="span" style="width: 18em;">备注：</span></li>
							<textarea rows="5" cols="100" style="margin-top:-20px;" id="repairerComment"></textarea>

							<li style="margin-top:20px;">
								<form method="post"
									  enctype="multipart/form-data"
									  action="${pageContext.request.contextPath}/problem/uploadProblemPictureByDeal.action">
									<span class="span">上传照片：</span>
									<input id="addPictureBtn" name="file" type="file" style="display: inline; margin-left: -15px;"/>

									<input type="submit" id = "requestUploadBtn" style="display:none;" value="" />
									<input id="problemId" name="problemId" value="-1" style="display:none;">
								</form>
							</li>







							<hr style="margin-top: 0px;">
						</div>
							<li style="margin-top:-20px;"><span class="span"></span><a onclick="dealProblem(${param.id});" class="btn btn-goback goback" style="float:left;">确认处理</a></li>

					</ul>
				</div>
			</div>

		</div>
	</div>


	<!-- 新增物品种类弹出框 start -->
	<div id="newProbTypeMenu" class="addItemDiv" style="width:300px; height:300px;left:40%;top:200px;">
		<div class="facContent">
			<div class="fac-title">
				<span>新增问题分类</span>
				<span class="cross" onclick="closeNewProbTypeDiv();">×</span>
			</div>
			<div class="fac-body">
				<div id="prob-type-name" class="item">
					<span class="span">名称</span>
					<div class="item-content"><input type="text" value="" /></div>
				</div>
			</div>

			<div class="fac-foot">
				<a class="btn btn-submit" onclick="requestNewProbType();">确定新增</a>
			</div>
		</div>
	</div>

	<!-- 新增物品种类弹出框 start -->
	<div id="newProbSubTypeMenu" class="addItemDiv" style="width:300px; height:300px;left:40%;top:200px;">
		<div class="facContent">
			<div class="fac-title">
				<span>新增问题子类</span>
				<span class="cross" onclick="closeNewProbSubTypeDiv();">×</span>
			</div>
			<div class="fac-body">
				<div id="prob-subtype-name" class="item">
					<span class="span">名称</span>
					<div class="item-content"><input type="text" value="" /></div>
				</div>
			</div>

			<div class="fac-foot">
				<a class="btn btn-submit" onclick="requestNewProbSubType();">确定新增</a>
			</div>
		</div>
	</div>



	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/simpleCalendar/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/simpleCalendar/date_pack.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/ld/user/roomItem/roomItem.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/ld/user/roomItem/planNew.js"></script>

	<script type="text/javascript"
			src="${pageContext.request.contextPath }/js/ld/user/roomItem/assetRepairDeal.js"></script>




		<script type="text/javascript">
			// 初始化时间
			var nowDate = new Date();
			$(".pack_maintain").val(formatDateForm(nowDate));
			$('.pack_maintain').date_input();


			//获取该条记录的信息
            searchProblemInfo(${param.id});

		</script>
</body>
</html>
