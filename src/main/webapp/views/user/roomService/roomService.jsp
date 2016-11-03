<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/ld/user/home/public.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/ld/user/roomService/roomService.css" rel="stylesheet" type="text/css"/>
	<title>客房服务</title>
</head>
<body>
	<jsp:include page="../_header.jsp"></jsp:include>
	<!-- 导航栏 start-->
	<div class="roomNav">
		<ul class="roomNavInner">
			<!-- 客房服务管理 start -->
			<div class="dropMenu">
				<div class="nav_title">客房服务管理</div>			 
	 			<div class="index">
	 				<!-- 客房服务 start -->
	 				<div class="plate plate-roomService">
	 					<div class="plate-title">
	 						<div class="title-head">
	 							<img src="../../../img/roomService/shirt.svg"/><span>&nbsp;&nbsp;&nbsp;客房服务</span>
	 						</div>
	 					</div>
	 					<div class="plate-content">
	 						<div class="content-title">
	 							<ul>
	 								<li><div class="icon"></div><span>洗衣单收费</span></li>
	 								<li><div class="icon"></div><span>餐费</span></li>
	 								<li><div class="icon"></div><span>桶装水费</span></li>
	 								<li><div class="icon"></div><span>擦鞋费</span></li>
	 								<li><div class="icon"></div><span>代购费</span></li>
	 								<li><div class="icon"></div><span>车费</span></li>
	 								<li><div class="icon"></div><span>其他</span></li>
	 							</ul>						
	 							<div class="xb-icon"></div>	
	 						</div>
	 					</div>
	 				</div>
	 				<!-- 客房服务 end -->
	 				<!-- 客房维修 start -->
	 				<div class="plate plate-repair">
	 					<div class="plate-title">
	 					    <div class="title-head">
	 							<img src="../../../img/roomService/tools.svg"/><span>&nbsp;&nbsp;&nbsp;客房维修</span>
	 						</div>
	 					</div>
	 					<div class="plate-content">
	 					    <div class="content-title">
	 							<ul>
	 								<li><div class="icon"></div><span>维修报费</span></li>
	 								<li><div class="icon"></div><span>维修管理</span></li>
	 								<li><div class="icon"></div><span>维修统计</span></li>
	 							</ul>
	 					    </div>
	 					</div>
	 				</div>
	 				<!-- 客房维修 end -->				
					<!-- 能源费结算 start -->
	 				<div class="plate plate-resource">
	 					<div class="plate-title">
	 					    <div class="title-head">
	 							<img src="../../../img/roomService/drops.svg"/><span>&nbsp;&nbsp;&nbsp;能源费结算</span>
	 						</div>
	 					</div>
	 					<div class="plate-content">
	 					    <div class="content-title">
	 							<ul>
	 								<li><div class="icon"></div><span>水费</span></li>
	 								<li><div class="icon"></div><span>电费</span></li>
	 								<li><div class="icon"></div><span>燃气费</span></li>
	 							</ul>
	 					    </div>
	 					</div>
	 				</div>
	 				<!-- 能源费结算 end -->
	 				<!-- 客房费用结算 start -->
	 				<div class="plate plate-other">
	 					<div class="plate-title">
	 					    <div class="title-head">
	 							<img src="../../../img/roomService/calculate.svg"/><span>&nbsp;&nbsp;&nbsp;客房费用结算</span>
	 						</div>
	 					</div>
	 					<div class="plate-content">
	 					    <div class="content-title">
	 							<ul>
	 								<li><div class="icon"></div><span>统计费用</span></li>
	 								<li><div class="icon"></div><span>其他费用</span></li>
	 							</ul>
	 					    </div>
	 					</div>
	 				</div>
	 			</div>
	 			<!-- 客房费用结算 end -->
 			</div>
 		    <!-- 客房服务管理 end -->

			<li class="nav-li"><a href="${pageContext.request.contextPath}/views/user/home/homeUser.jsp">首页</a></li>
			<li class="nav-li"><a href="${pageContext.request.contextPath}/views/user/tenant/generalMap.jsp">租客管理</a></li>
			<li class="nav-li"><a href="javascript:voic(0);">客房物品管理</a></li>
			<li class="nav-li"><a href="javascript:voic(0);">办公室管理</a></li>
			<li class="nav-li"><a href="javascript:voic(0);">其他</a></li>
		</ul>
	</div>
	<!-- 导航栏 end -->
    
    <!-- 页面内容 strat -->
 	<div class="main">
		<div class="main-page">
			<div class="nav-path">
				<a href="" title="回到首页"><i class="icon-home"></i></a>
				<i class="icon-path"></i>
				<a href="">客房服务</a>
				<i class="icon-path"></i>
				<a href="">餐费</a>
			</div>
			<div class="bill-area">
				<div class="bill-table">
					<!-- 费用 table start -->
					<table>
						<thead>
							<tr>
							<th><span>房间号</span><p>Room No.</p>
								<div class="search-roomNo">
									<div class="search-wrap">
										<input type="text" class="search-input" placeholder="请输入房间号..." />
										<a class="search-btn" href=""></a>
										<a class="btn btn-edit btnedit">搜索</a>
									</div>
								</div>
							</th>
							<th><span>客人姓名</span><p>Customer Name</p>
								<!--<div class="search-customerName">
									<div class="search-wrap">
										<input type="text" class="search-input" placeholder="请输入客户姓名..." />
										<a class="search-btn" href=""></a>
										<a class="btn btn-edit btnedit">搜索</a>
									</div>
								</div>-->
							</th>
							<th><span>物品</span><p>Items</p>
								<!--<div class="search-items"></div>-->
							</th>
							<th><span>数量</span><p>Quantity</p></th>
							<th><span>送交时间</span><p>Time for delivery</p></th>
							<th><span>金额</span><p>Sum</p></th>
							<th><span>备注</span><p>Note</p></th>
							</tr>
						</thead>
						<tbody>
							<tr><td><span>1</span></td><td>Ada</td><td>衣服</td><td>1</td><td>2016-3-30</td><td>2,000&nbsp;元</td><td>无</td></tr>
						<tr><td><span>2</span></td><td>Ada</td><td>衣服</td><td>1</td><td>2016-3-30</td><td>2,000&nbsp;元</td><td>无</td></tr><tr><td><span>5</span></td><td>Ada</td><td>衣服</td><td>1</td><td>2016-3-30</td><td>2,000&nbsp;元</td><td>无</td></tr><tr><td><span>1</span></td><td>Ada</td><td>衣服</td><td>1</td><td>2016-3-30</td><td>2,000&nbsp;元</td><td>无</td></tr><tr><td><span>1</span></td><td>Ada</td><td>衣服</td><td>1</td><td>2016-3-30</td><td>2,000&nbsp;元</td><td>无</td></tr><tr><td><span>1</span></td><td>Ada</td><td>衣服</td><td>1</td><td>2016-3-30</td><td>2,000&nbsp;元</td><td>无</td></tr><tr><td><span>1</span></td><td>Ada</td><td>衣服</td><td>1</td><td>2016-3-30</td><td>2,000&nbsp;元</td><td>无</td></tr>
						<tr><td><span>1</span></td><td>Ada</td><td>衣服</td><td>1</td><td>2016-3-30</td><td>2,000&nbsp;元</td><td>无</td></tr>
						<tr><td><span>1</span></td><td>Ada</td><td>衣服</td><td>1</td><td>2016-3-30</td><td>2,000&nbsp;元</td><td>无</td></tr><tr><td><span>1</span></td><td>Ada</td><td>衣服</td><td>1</td><td>2016-3-30</td><td>2,000&nbsp;元</td><td>无</td></tr>
						<tr><td><span>1</span></td><td>Ada</td><td>衣服</td><td>1</td><td>2016-3-30</td><td>2,000&nbsp;元</td><td>无</td></tr>
						<tr><td><span>1</span></td><td>Ada</td><td>衣服</td><td>1</td><td>2016-3-30</td><td>2,000&nbsp;元</td><td>无</td></tr>

						<tr><td><span>1</span></td><td>Ada</td><td>衣服</td><td>1</td><td>2016-3-30</td><td>2,000&nbsp;元</td><td>无</td></tr>
						<tr><td><span>1</span></td><td>Ada</td><td>衣服</td><td>1</td><td>2016-3-30</td><td>2,000&nbsp;元</td><td>无</td></tr>
						<tr><td><span>1</span></td><td>Ada</td><td>衣服</td><td>1</td><td>2016-3-30</td><td>2,000&nbsp;元</td><td>无</td></tr>

						</tbody>
					</table>
					<!-- 费用 tabke end -->

					<!--<div class="page-bottom">
						<div class="page-wrap">
							<a data-target="1" href="">1</a>
							<a data-target="2" href="">2</a>
							<span>...</span>
							<a data-target="3" href="">3</a>
							<a data-target="2" href="" class="down-page"><em>下一页</em><i class="next-i">></i></a>
							<span>共15条记录</span>
						</div>
					</div>-->
				</div>
			</div>
		</div>
 	</div>
    <!-- 页面内容 end -->

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/roomService.js"></script>
</body>
</html>