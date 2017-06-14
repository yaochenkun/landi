<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- 二级导航栏 start -->
<div class="main-nav">
	<div class="aside-box">
		<ul>
			<li class="menuOne">
				<span class="span">
					<i class="i1">&lt;</i>&nbsp;<i class="i2">&lt;</i>&nbsp;<i class="i3">&lt;</i>&nbsp;收起
				</span>
			</li>

			<li><a class="linormal" onclick="handleClickMenuItem('${curUser.RESET_PASSWD}', '${pageContext.request.contextPath}' + '/views/user/home/homeUser.jsp')" href="javascript:void(0)">
				<span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;首页</a>
			</li>

			<li><a class="linormal" onclick="handleClickMenuItem('${curUser.RESET_PASSWD}', '${pageContext.request.contextPath}' + '/views/user/tenant/generalMap.jsp')" href="javascript:void(0)">
				<span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;租客管理</a>
			</li>

			<li><a class="linormal" onclick="handleClickMenuItem('${curUser.RESET_PASSWD}', '${pageContext.request.contextPath}' + '/views/user/roomService/roomServiceIndex.jsp')" href="javascript:void(0)">
				<span class="glyphicon glyphicon-usd"></span>&nbsp;&nbsp;客房服务管理</a>
			</li>

			<li><a class="linormal" onclick="handleClickMenuItem('${curUser.RESET_PASSWD}', '${pageContext.request.contextPath}' + '/views/user/roomItem/itemRoomOverview.jsp')" href="javascript:void(0)">
				<span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;客房物品管理</a>
			</li>

			<li><a class="linormal" onclick="handleClickMenuItem('${curUser.RESET_PASSWD}', '${pageContext.request.contextPath}' + '/views/user/office/shopManage.jsp')" href="javascript:void(0)">
				<span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;&nbsp;办公室管理</a>
			</li>

<!-- 			<li><a class="linormal" href="javascript:void(0);">
				<span class="glyphicon glyphicon-plus"></span>&nbsp;&nbsp;其他</a>
			</li> -->
		</ul>
	</div>
</div>
<script>

	var handleClickMenuItem = function(hasResetPasswd, targetUrl) {

        //检查是否修改过密码
	    if(hasResetPasswd == 0) {

			showModalBox("error", "请先在首页修改初始密码！")
		} else {

	        //跳转到目标url
            window.location.href = targetUrl;
		}
	}

</script>
<!-- 二级导航栏 end-->