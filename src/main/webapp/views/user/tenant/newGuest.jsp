<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/home/public.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/plugin/simpleCalendar/date_pack.css"	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/tenant/tenantPublic.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/tenant/newGuest.css" rel="stylesheet" type="text/css" />
<title>房间管理</title>
</head>
<body>
	<jsp:include page="../_header.jsp"></jsp:include>
	<jsp:include page="../_leftMenu.jsp"></jsp:include>
	<jsp:include page="../_modal.jsp"></jsp:include>

	<!-- 三级菜单 begin -->
	<div class="nav-second">
		<div class="toolbar">
			<div class="nav-secondul">
				<ul>
					<li class="linormal"><a	href="generalMap.jsp">租客一览图</a></li>
					<li class="linormal"><a href="guestList.jsp">租客一览表</a></li>
					<li class="liactive"><a	href="newGuest.jsp">新增租客</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 三级菜单 end -->

	<!-- 页面内容 start-->
	<div class="content">

		<!-- 租客信息 start -->
		<div class="tab-content tab-content-guest">
			<div class="tab-content-title">
				<span>1</span>租客信息
			</div>
			<!--  extra body start-->
			<div class="extra-body">
				<div class="tab-content-body">
					<div class="form">
						<div class="item item-name">
							<span class="spanLabel"><span class="red">*&nbsp;</span>租客姓名：</span>
							<div class="fl">
								<input id="guest_name" type="text" class="text" value="Ada" />
							</div>
							<span class="spanLabel"><span class="red">*&nbsp;</span>客源类型：</span>
							<div class="fl">
								<input type="radio" name="guestType" value="欧美" checked="checked"/><span style="margin-left:10px;margin-right:10px">欧美</span>
								<input type="radio" name="guestType" value="日本"/><span style="margin-left:10px;margin-right:10px">日本</span>
								<input type="radio" name="guestType" value="其它"/><span style="margin-left:10px;">其它</span>
							</div>
						</div>
						<div class="item item-guestothers">
							<span class="spanLabel">其它租客：</span>
							<div class="fl">
								<input id="guest_others" type="text" class="text" value="张三,李四,王五" />
							</div>
							<div class="fl">
								<input type="checkbox" class="checkbox" style="display: inline; margin-right:10px;"/><span class="spanLabel">即将入住</span>
							</div>
						</div>
						<div class="item item-room">
							<span class="spanLabel"><span class="red">*&nbsp;</span>房间号：</span>
							<div class="fl">
								<input id="guest_roomNumber" type="text" class="text" value="W33-3" />
							</div>
							<span class="spanLabel"><span class="red">*&nbsp;</span>户型：</span>
							<div class="fl"></div>
						</div>
						<div class="item item-tel">
							<span class="spanLabel"><span class="red">*&nbsp;</span>合同编号：</span>
							<div class="fl">
								<input id="guest_contractID" type="text" class="text" value="S131" />
							</div>
							<span class="spanLabel"><span class="red">*&nbsp;</span>联系电话：</span>
							<div class="fl">
								<input id="guest_tel" type="text" class="text" value="13581818113" />
							</div>
						</div>
						<div class="item item-company">
							<span class="spanLabel">所在公司：</span>
							<div class="fl">
								<input type="text" class="text" value="Amazon" />
							</div>
							<span class="spanLabel">职务：</span>
							<div class="fl">
								<input type="text" class="text" value="经理" />
							</div>
						</div>
						<div class="item item-guestnumber">
							<span class="spanLabel">入住人数：</span>
							<div class="fl">
								<input type="text" class="text" value="2" />
							</div>
						</div>
						<div class="item item-time">
							<span class="spanLabel">入住日期：</span>
							<div class="fl">
								<input type="text" class="text pack_maintain"/>
							</div>
							<span class="spanLabel">到期时间：</span>
							<div class="fl">
								<input type="text" class="text pack_maintain" />
							</div>
						</div>
						<div class="item item-car">
							<span class="spanLabel">租金：</span>
							<div class="fl">
								<input type="text" class="text" value="15000.5" />
							</div>
							<span class="spanLabel">车位：</span>
							<div class="fl">
								<input type="text" class="text" value="T3" />
							</div>
						</div>
						<div class="item item-birthday">
							<span class="spanLabel">生日：</span>
							<div class="fl">
								<input type="text" class="text pack_maintain" style="width:150px"/>
								<input id="birthday-reminder" type="checkbox" class="checkbox" style="display: inline; margin-right:10px;" onclick="clickBirthdayReminder(this);" uid="-1" username="" title="" content=""/><span class="spanLabel">设置提醒</span>
							</div>
							<span class="spanLabel">Email：</span>
							<div class="fl">
								<input type="text" class="text" value="无" />
							</div>
						</div>
						<div class="item item-companytel">
							<span class="spanLabel">单位联系人姓名：</span>
							<div class="fl">
								<input type="text" class="text" value="无" />
							</div>
							<span class="spanLabel">单位联系人电话：</span>
							<div class="fl">
								<input type="text" class="text" value="无" />
							</div>
						</div>
						<div class="item item-companyaccount">
							<span class="spanLabel">单位账户信息：</span>
							<div class="fl">
								<input type="text" class="text" value="无" />
							</div>
							<span class="spanLabel">单位开票信息：</span>
							<div class="fl">
								<input type="text" class="text" value="无" />
							</div>
						</div>
						<div class="item item-companypay">
							<span class="spanLabel">单位付款方式：</span>
							<div class="fl">
								<input type="radio" name="payMode" value="现金" checked="checked"/><span style="margin-left:10px;margin-right:10px">现金</span>
								<input type="radio" name="payMode" value="银行转账"/><span style="margin-left:10px;margin-right:10px">银行转账</span>
								<input type="radio" name="payMode" value="支票"/><span style="margin-left:10px;margin-right:10px">支票</span>
							</div>
						</div>
						<div class="item item-remark">
							<span class="spanLabel">备注：</span>
							<div class="fl">
								<input type="text" class="text" value="无" />
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- extra-body end-->
		</div>
		<!-- 租客信息 end -->

		<!-- 业主 start -->
		<div class="tab-content tab-content-owner">
			<div class="tab-content-title">
				<span>2</span>业主
			</div>
			<!--  extra body start-->
			<div class="extra-body">
				<div class="tab-content-body">
					<div class="form">
						<div class="item item-type">
							<span class="spanLabel">业主类型：</span>
							<div class="fl">
								<input type="radio" name="ownerType" value="SPC" checked ="checked" onclick="clickSPC();"/><span style="margin-left:10px;margin-right:10px">SPC</span>
								<input type="radio" name="ownerType" value="小业主" onclick="clickXiaoYeZhu();"/><span style="margin-left:10px;margin-right:10px">小业主</span>
							</div>
							<span class="spanLabel">证件号：</span>
							<div class="fl">
								<input type="text" class="text" value="09478093845093840593845" />
							</div>
						</div>
						<div class="item item-name" id="xiaoyezhuName" style="display: none;">
							<span class="spanLabel">业主姓名：</span>
							<div class="fl">
								<input type="text" class="text" value="bob"/>
							</div>
						</div>
						<div class="item item-rent">
							<span class="spanLabel">租金：</span>
							<div class="fl">
								<input type="text" class="text" value="20000.5" />
							</div>
							<span class="spanLabel">服务费：</span>
							<div class="fl">
								<input type="text" class="text" value="10000.5" />
							</div>
						</div>
						<div class="item item-signreturn">
							<span class="spanLabel">签约返还：</span>
							<div class="fl">
								<input type="text" class="text" value="0" oninput="calActualReturn();"/>
							</div>
							<span class="spanLabel">税金：</span>
							<div class="fl">
								<input type="text" class="text" value="0" oninput="calActualReturn();"/>
							</div>
						</div>
						<div class="item item-spc">
							<span class="spanLabel">物业费：</span>
							<div class="fl">
								<input type="text" class="text" value="0" oninput="calActualReturn();"/>
							</div>
							<span class="spanLabel">采暖费：</span>
							<div class="fl">
								<input type="text" class="text" value="0" oninput="calActualReturn();"/>
							</div>
						</div>
						<div class="item item-othermoney">
							<span class="spanLabel">其它费用：</span>
							<div class="fl">
								<input type="text" class="text" value="0" oninput="calActualReturn();" />
							</div>
							<span class="spanLabel">实际返还：</span>
							<div class="fl">
								<input type="text" class="text" value="0" disabled/>
							</div>
						</div>



						<div class="item item-account">
							<span class="spanLabel">业主账户信息：</span>
							<div class="fl">
								<input type="text" class="text" value="98320192830192" />
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--  extra body end-->
		</div>
		<!-- 业主 end -->

		<!-- 中介 start -->
		<div class="tab-content tab-content-agency">
			<div class="tab-content-title">
				<span>3</span>中介
			</div>
			<!--  extra body start-->
			<div class="extra-body">
				<div class="tab-content-body">
					<div class="form">
						<div class="item item-company">
							<span class="spanLabel">中介公司：</span>
							<div class="fl">
								<input type="text" class="text" value="链家" />
							</div>
						</div>
						<div class="item item-first">
							<span class="spanLabel">中介首年费率：</span>
							<div class="fl">
								<input type="text" class="text" value="0.36" />
							</div>
							<span class="spanLabel">LE首年费率：</span>
							<div class="fl">
								<input type="text" class="text" value="0.30" />
							</div>
						</div>
						<div class="item item-second">
							<span class="spanLabel">中介次年费率：</span>
							<div class="fl">
								<input type="text" class="text" value="0.26" />
							</div>
							<span class="spanLabel">LE次年费率：</span>
							<div class="fl">
								<input type="text" class="text" value="0.26" />
							</div>
						</div>
						<div class="item item-third">
							<span class="spanLabel">中介三年后费率：</span>
							<div class="fl">
								<input type="text" class="text" value="0.16" />
							</div>
							<span class="spanLabel">LE三年后费率：</span>
							<div class="fl">
								<input type="text" class="text" value="0.16" />
							</div>
						</div>
						<div class="item item-fourth">
							<span class="spanLabel">中介公司费用：</span>
							<div class="fl">
								<input type="text" class="text" value="36000.2" />
							</div>
							<span class="spanLabel">LE中介服务费用：</span>
							<div class="fl">
								<input type="text" class="text" value="26000.2" />
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- extra body end-->
		</div>
		<!-- 中介 end -->

		<!-- 房款收付日期 start -->
		<div class="tab-content tab-content-housepay">
			<div class="tab-content-title">
				<span>4</span>房款收付日期
			</div>
			<!--  extra body start-->
			<div class="extra-body">
				<div class="tab-content-body">
					<div class="form">

						<div class="item-list item-bill">
							<div class="item item-date">
								<span class="spanLabel">开发票日期：</span>
								<div class="fl">
									<input type="text" class="text pack_maintain" />
								</div>
							</div>
							<div class="item item-cycle">
								<span class="spanLabel">周期：</span>
								<div class="fl">
									<input type="text" class="text" value="30" />
								</div>
								<span class="spanLabel">提前时间：</span>
								<div class="fl">
									<input type="text" class="text" value="30" />
								</div>
							</div>
						</div>

						<div class="item-list item-rent">
							<div class="item item-date">
								<span class="spanLabel">收租金日期：</span>
								<div class="fl">
									<input type="text" class="text pack_maintain"/>
								</div>
							</div>
							<div class="item item-cycle">
								<span class="spanLabel">周期：</span>
								<div class="fl">
									<input type="text" class="text" value="30" />
								</div>
								<span class="spanLabel">方式：</span>
								<div class="fl">
									<input type="text" class="text" value="现金" />
								</div>
							</div>
						</div>
						<div class="item-list item-return">
							<div class="item item-date">
								<span class="spanLabel">付返款日期：</span>
								<div class="fl">
									<input type="text" class="text pack_maintain" />
								</div>
							</div>
							<div class="item item-cycle">
								<span class="spanLabel">周期：</span>
								<div class="fl">
									<input type="text" class="text" value="30" />
								</div>
							</div>
						</div>


						<div class="item-list item-beginenddate">
							<div class="item item-begindate">
								<span class="spanLabel">起始日期：</span>
								<div class="fl">
									<input type="text" class="text pack_maintain"/>
								</div>
							</div>
							<div class="item item-enddate">
								<span class="spanLabel">结束日期：</span>
								<div class="fl">
									<input type="text" class="text pack_maintain" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- extra body end-->
		</div>
		<!-- 房款收付日期 end -->

		<!-- 服务 start -->
		<div class="tab-content tab-content-service">
			<div class="tab-content-title">
				<span>5</span>服务
			</div>
			<!--  extra body start -->
			<div class="extra-body">
				<div class="tab-content-body">
					<div class="form">
						<table>
							<thead>
								<tr>
									<th rowspan="2" colspan="3">服务名称</th>
									<th colspan="2">LE租赁条件书</th>
									<th colspan="2">SPC租赁条件书</th>
									<th rowspan="2">周期</th>
									<th rowspan="2">备注</th>
									<th rowspan="2">赠送</th>
									<th rowspan="2">操作</th>
								</tr>
								<tr>
									<th>费用</th>
									<th>数量</th>
									<th>费用</th>
									<th>数量</th>
								</tr>
							</thead>
							<tbody>
								<tr class="col-LE">
									<td rowspan="9" class="rowOne">基本费用</td>
									<td colspan="2" class="title">LE管理费</td>
									<td>1.2</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td></td>
									<td></td>
									<td></td>
									<td class="operation"></td>
								</tr>
								<tr class="col-wash">
									<td colspan="2" class="title">布草洗涤费</td>
									<td>1.5</td>
									<td>1</td>
									<td></td>
									<td></td>
									<td>1</td>
									<td>1</td>
									<td></td>
									<td></td>
								</tr>
								<tr class="col-consume">
									<td colspan="2" class="title">布草消耗费</td>
									<td>1.5</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr class="col-car">
									<td colspan="2" class="title">车费</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td></td>
									<td>1</td>
									<td>1</td>
									<td></td>
									<td></td>
								</tr>
								<tr class="col-light">
									<td colspan="2" class="title">灯泡费</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr class="col-tax">
									<td colspan="2" class="title">税金</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr class="col-Int">
									<td colspan="2" class="title">网费</td>
									<td><input type="text" value="1000.5" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="1000" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="无" /></td>
									<td><input type="checkbox" giveMoney="0" giveComment="" onclick="clickGive(this);"/></td>
									<td></td>
								</tr>
								<tr class="col-resource">
									<td class="title">能源费</td>
									<td><input type="checkbox" class="checkbox" /><span>自费</span></td>
									<td><input type="text" value="1000.5" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="1000.2" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="无" /></td>
									<td><input type="checkbox" giveMoney="0" giveComment="" onclick="clickGive(this);"/></td>
									<td></td>
								</tr>
								<tr class="col-breakfast">
									<td colspan="2" class="title">早餐人数</td>
									<td><input type="text" value="1000" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="1000" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="无" /></td>
									<td><input type="checkbox" giveMoney="0" giveComment="" onclick="clickGive(this);"/></td>
									<td></td>
								</tr>

								<tr class="col-park">
									<td rowspan="10" class="rowOne">其他费用</td>
									<td colspan="2" class="title">停车费</td>
									<td><input type="text" value="1000" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="1000" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="无" /></td>
									<td><input type="checkbox" giveMoney="0" giveComment="" onclick="clickGive(this);"/></td>
									<td></td>
								</tr>
								<tr class="col-tv">
									<td colspan="2" class="title">电视费</td>
									<td><input type="text" value="1000" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="1000" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="无" /></td>
									<td><input type="checkbox" giveMoney="0" giveComment="" onclick="clickGive(this);"/></td>
									<td></td>
								</tr>
								<tr class="col-newspaper">
									<td colspan="2" class="title">报刊杂志费</td>
									<td><input type="text" value="1000" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="1000" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="无" /></td>
									<td><input type="checkbox" giveMoney="0" giveComment="" onclick="clickGive(this);"/></td>
									<td></td>
								</tr>
								<tr class="col-cloth">
									<td colspan="2" class="title">洗衣费</td>
									<td><input type="text" value="1000" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="1000" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="无" /></td>
									<td><input type="checkbox" giveMoney="0" giveComment="" onclick="clickGive(this);"/></td>
									<td></td>
								</tr>
								<tr class="col-lunch-choose">
									<td class="title">餐券</td>
									<td onclick="showChooseRestaurant();">选择饭店</td>
									<td colspan="8"></td>
								</tr>
								<tr class="col-break">
									<td colspan="2" class="title">早餐费</td>
									<td><input type="text" value="1000" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="1000" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="无" /></td>
									<td><input type="checkbox" giveMoney="0" giveComment="" onclick="clickGive(this);"/></td>
									<td></td>
								</tr>
								<tr class="col-shopping">
									<td colspan="2" class="title">购物卡</td>
									<td><input type="text" value="1000" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="1000" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="无" /></td>
									<td><input type="checkbox" giveMoney="0" giveComment="" onclick="clickGive(this);"/></td>
									<td></td>
								</tr>
								<tr class="col-barrelwater">
									<td colspan="2" class="title">桶装水</td>
									<td><input type="text" value="1000" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="1000" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="无" /></td>
									<td><input type="checkbox" giveMoney="0" giveComment="" onclick="clickGive(this);"/></td>
									<td></td>
								</tr>
								<tr class="col-bottlewater">
									<td colspan="2" class="title">矿泉水</td>
									<td><input type="text" value="1000" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="1000" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="无" /></td>
									<td><input type="checkbox" giveMoney="0" giveComment="" onclick="clickGive(this);"/></td>
									<td></td>
								</tr>
								<tr class="col-daily">
									<td colspan="2" class="title">日用品</td>
									<td><input type="text" value="1000" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="1000" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="1" /></td>
									<td><input type="text" value="无" /></td>
									<td><input type="checkbox" giveMoney="0" giveComment="" onclick="clickGive(this);"/></td>
									<td></td>
								</tr>
								<tr class="col-add-add">
									<td colspan="2" class="addService" onclick="addServiceTr();">+&nbsp;增加项目</td>
									<td colspan="8"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- extra body end-->
		</div>
		<!-- 服务 end -->

		<!-- 扫描件 start -->
		<div class="tab-content tab-content-owner">
			<div class="tab-content-title">
				<span>6</span>扫描件
			</div>
			<!--  extra body start-->
			<div class="extra-body">
				<div class="tab-content-body">
					<div class="form">
						<form modelAttribute="user" method="post"
							  enctype="multipart/form-data"
							  action="${pageContext.request.contextPath }/guest/uploadGuestScanning.action">
							<div class="item item-LE" style="margin-bottom:20px;">
								<div class="btn btn-upload">+ LE条件书</div>
								<div class="fileName"></div>
								<input id="uploadLE" type="file" name="file"/>
							</div>
							<div class="item item-SPC" style="margin-bottom:20px;">
								<div class="btn btn-upload">+ SPC条件书</div>
								<div class="fileName"></div>
								<input id="uploadSPC" type="file" name="file"/>
							</div>
							<div class="item item-guestID">
								<div class="btn btn-upload">+ 客人证件</div>
								<div class="fileName"></div>
								<input id="uploadGuestID" type="file" name="file"/>
							</div>

							<!--提交按钮-->
							<input type="submit" id = "requestUploadBtn" style="display:none;" value="" />
							<input id="guestId" name="guestId" value="-1" style="display:none;">
						</form>
					</div>
				</div>
			</div>
			<!--  extra body end-->
		</div>
		<!--  扫描件-->

		<div class="newGuestBtn">
			<a class="btnnew" onclick="addGuest();">确认添加</a>
		</div>

	</div>
	<!-- 页面内容 end-->

	<!-- 珠串 start -->
	<div class="step-nav">
		<div class="icon-group">
			<a class="list-icon-link" href="javascript:void(0);">1</a>
			<div class="list-icon-text">
				<div class="inner">租客信息</div>
			</div>
			<a class="list-icon-link" href="javascript:void(0);">2</a>
			<div class="list-icon-text">
				<div class="inner">业主</div>
			</div>
			<a class="list-icon-link" href="javascript:void(0);">3</a>
			<div class="list-icon-text">
				<div class="inner">中介</div>
			</div>
			<a class="list-icon-link" href="javascript:void(0);">4</a>
			<div class="list-icon-text">
				<div class="inner">房款收付日期</div>
			</div>
			<a class="list-icon-link" href="javascript:void(0);">5</a>
			<div class="list-icon-text">
				<div class="inner">服务</div>
			</div>
			<a class="list-icon-link" href="javascript:void(0);">6</a>
			<div class="list-icon-text">
				<div class="inner">扫描件</div>
			</div>
		</div>
	</div>
	<!-- 珠串 start -->

	<!-- 选择饭店 start -->
	<div class="thick-div"></div>
	<div class="thick-box">
		<div class="thick-wrap">
			<div class="thick-title">
				请选择饭店<span>×</span>
			</div>
			<div class="thick-body">
				<div class="red warning">！最多选三家</div>
				<div class="restaurant">
					<a class="a" href="javascript:void(0);">香格里拉</a> <a class="a"
						href="javascript:void(0);">Plaza</a> <a class="a"
						href="javascript:void(0);">阿拉伯之塔</a> <a class="a"
						href="javascript:void(0);">香格里拉</a> <a class="a"
						href="javascript:void(0);">Plaza</a> <a class="a"
						href="javascript:void(0);">阿拉伯之塔</a>
					<div class="btn btn-edit btnedit" onclick="chooseRestaurant();">确定</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 选择饭店 end -->

	<!-- 回到顶部底部 start-->
	<div class="bar">
		<a class="bar-top">顶部</a> <a class="bar-bottom">底部</a>
	</div>
	<!-- 回到顶部底部 end-->


	<!-- 赠送弹出框start -->
	<div id="newGiveMenu" class="addItemDiv">
		<div class="facContent">
			<div class="fac-title">
				赠送详情
				<span onclick="closeGiveDiv();">×</span>
			</div>
			<div class="fac-body">

				<div id="give-money" class="item">
					<span class="span">赠送金额：</span>
					<div class="item-content"><input type="text" value="" />&nbsp;&nbsp;元</div>
				</div>

				<div id="give-comment" class="item">
					<span class="span">备注：</span>
					<div class="item-content"><input type="text" value="" style="width:300px"/></div>
				</div>
			</div>
			<div class="fac-foot">
				<a class="btn btn-submit" onclick="addGive();">确定</a>
			</div>
		</div>
	</div>
	<!-- 赠送弹出框 end -->


	<!-- 生日提醒弹出框start -->
	<div id="newBirthdayReminderMenu" class="addItemDiv" style="height:500px;">
		<div class="facContent">
			<div class="fac-title">
				生日提醒
				<span onclick="closeBirthdayReminderMenu();">×</span>
			</div>
			<div class="fac-body" style=" overflow-y:none;">

				<div  class="item">
					<span class="span">提醒人：</span>
					<div class="item-content">
					<input type="text" id="dropDownInput" value="" uid="" readonly/>
					<div class="dropDownMenu">
						<ul>
						</ul>
					</div>
					</div>
				</div>

				<div id="reminder-title" class="item">
					<span class="span">主题：</span>
					<div class="item-content"><input id="reminderTitle" type="text" value=""/></div>
				</div>
				<div id="reminder-content" class="item">
					<span class="span">内容：</span>
					<div class="item-content"><textarea id="reminderContent" cols="155" rows="10"></textarea></div>
				</div>
			</div>
			<div class="fac-foot">
				<span id="currentDate" style="display:none"></span>
				<a class="btn btn-submit" id="finishBtn" onclick="addBirthdayReminder();">确认</a>
			</div>
		</div>
	</div>
	<!-- 生日提醒弹出框 end -->



	<div class="shadow"></div>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/simpleCalendar/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/simpleCalendar/date_pack.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/tenant/newGuest.js"></script>
	<script>(function(){changeLeftMenu(1);})(); </script>
	<script type="text/javascript">
        // 设置为当前时间
        var nowDate = new Date();
        $(".pack_maintain").val(formatDateForm(nowDate));
        $('.pack_maintain').date_input();

        // 事件冒泡（隐藏下拉菜单）
        $(document).on("click",function(e){
            $(".dropDownMenu").css("display","none");

        })

        // 显示问题分类下拉菜单
        $("#dropDownInput").click(function(e){
            $(".dropDownMenu").css("display","block");

            // 阻止事件冒泡
            e.stopPropagation();
        });

        //拉取所有用户
        searchAllUsers();
	</script>
</body>
</html>