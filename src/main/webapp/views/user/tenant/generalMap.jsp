<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/admin/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/admin/roomAsset.js"></script>
	<link href="${pageContext.request.contextPath}/css/ld/user/tenant/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<%-- <link href="${pageContext.request.contextPath}/css/ld/admin/public.css" rel="stylesheet" type="text/css"/>
	 --%>
	 <link href="${pageContext.request.contextPath }/css/ld/user/tenant/generalMap.css" rel="stylesheet" type="text/css" />
	<title>租客管理</title>
</head>
<body>
	<jsp:include page="../_header.jsp"></jsp:include>
	
    <!-- 二级导航栏 start -->    
    <div class="main-nav"> 
        <div class="aside-box">
            <ul>
                <li class="linormal"><span class="glyphicon glyphicon-home"></span><a href="${pageContext.request.contextPath}/views/user/home/homeUser.jsp">&nbsp;&nbsp;首页</a></li>
                <li class="liactive"><span class="glyphicon glyphicon-user"></span><a href="${pageContext.request.contextPath}/views/user/tenant/generalMap.jsp">&nbsp;&nbsp;租客管理</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-usd"></span><a href="${pageContext.request.contextPath}/views/user/roomAsset.jsp">&nbsp;&nbsp;固定资产</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-list-alt"></span><a href="">&nbsp;&nbsp;采购</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-shopping-cart"></span><a href="">&nbsp;&nbsp;小卖部</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-heart-empty"></span><a href="">&nbsp;&nbsp;爱心驿站</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-indent-left"></span><a href="">&nbsp;&nbsp;统计信息</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-plus"></span><a href="">&nbsp;&nbsp;其他</a></li>
            </ul>
        </div>
    </div>
    <div class="nav-second">
        <div class="toolbar">
            <div class="nav-secondul">
                <ul>               
                <li class="liactive"><a href="javascript:void(0);">租客一览图</a></li>
                <li class="linormal"><a href="${pageContext.request.contextPath}/views/user/tenant/roomStatus.jsp">租客一览表</a></li> 
                <li class="linormal"><a href="${pageContext.request.contextPath}/views/user/tenant/newGuest.jsp">新增租客</a></li>
                <li class="linormal"><a href="javascript:void(0);">服务变更及结算</a></li> 
                <li class="linormal"><a href="${pageContext.request.contextPath}/views/user/tenant/roomPic.jsp">上传查房图片</a></li> 
                </ul>
            </div>    
        </div>
    </div>
    <!-- 二级导航栏 end-->

    <!-- 租客一览图 -->
    <div class="body-content">
	    <div class="general-map">
	        <table class="table table-bordered" style="border-top:none;border-right:none;" id="building">
	            <tr>
	              <td rowspan="2" colspan="2" style="border-left:none;"></td>
	              <td style="border-top:1px solid #dddddd;" colspan="2" id="W35-1"><a href="${pageContext.request.contextPath}/views/user/tenant/roomStatus.jsp?rid='W35-1'">姓名</a><br></td>
	              <td style="border-top:1px solid #dddddd;" id="W35-2"><a href="${pageContext.request.contextPath}/views/user/tenant/roomStatus.jsp?rid='W35-2'">姓名</a></td>
	              <td rowspan="66"></td>
	              <td style="border-top:1px solid #dddddd;" id="E35-2"><a href="${pageContext.request.contextPath}/views/user/tenant/roomStatus.jsp?rid='E35-2'"></a></td>
	              <td style="border-top:1px solid #dddddd;" colspan="2" id="E35-1"><a href="${pageContext.request.contextPath}/views/user/tenant/roomStatus.jsp?rid='E35-1'"></a></td>
	              <td rowspan="2" colspan="2"></td>
	            </tr>
	            <tr>
	              <td style="border-top:none;" colspan="2"><a href="${pageContext.request.contextPath}/views/user/tenant/roomStatus.jsp?rid='W35-1'">W35-1</a></td>
	              <td style="border-top:none;"><a href="${pageContext.request.contextPath}/views/user/tenant/roomStatus.jsp?rid='W35-2'">W35-2</a></td>
	              <td style="border-top:none;"><a href="${pageContext.request.contextPath}/views/user/tenant/roomStatus.jsp?rid='E35-2'">E35-2</a></td>
	              <td style="border-top:none;" colspan="2"><a href="${pageContext.request.contextPath}/views/user/tenant/roomStatus.jsp?rid='E35-1'">E35-1</a></td>
	            </tr>
	        </table>
	   </div>
   </div>
    
<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/tenant/generalMap.js"></script>
<script>
	getRoomState();
	getRoomInfo();
</script>
</body>
</html>