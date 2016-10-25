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
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/admin/rate.js"></script>
	<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/ld/admin/public.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/ld/admin/rate.css" rel="stylesheet" type="text/css"/>
	<title>能源费管理</title>
</head>
<body>
	<jsp:include page="_header.jsp"/>
    <jsp:include page="_leftMenu.jsp"/>
    
    <!-- 右侧菜单 start  -->
    <div class="nav-second">
        <div class="toolbar">
            <div class="nav-secondul">
                <ul>
                    <li class="liactive"><a href="${pageContext.request.contextPath }/views/admin/rateList.jsp">能源费管理</a></li>
                    <li class="linormal"><a href="${pageContext.request.contextPath }/views/admin/rateOther.jsp">其他费用管理</a></li>
                </ul>
            </div>    
        </div>
    </div>
    <!-- 右侧菜单 start  -->
       
    <!-- 页面内容 start -->
    <!-- 水费 start -->
    <div class="content">
        <div class="content-body">
        <div class="water">
            <div class="head">
                <img src="${pageContext.request.contextPath}/img/water.svg"/>
                <h3>水费</h3>
            </div>
            <div class="body">
                <dl>
                    <dt>一&nbsp;阶</dt><dd></dd>
                    <dt>数&nbsp;额</dt><dd></dd>
                </dl>
                <dl>
                    <dt>二&nbsp;阶</dt><dd></dd>
                    <dt>数&nbsp;额</dt><dd></dd>
                </dl>
                <dl>
                    <dt>三&nbsp;阶</dt><dd></dd>
                    <dt>数&nbsp;额</dt><dd></dd>
                </dl>
            </div>
        </div>
        <!-- 水费 end -->

        <!-- 电费 start -->
        <div class="power">
            <div class="head">
                <img src="${pageContext.request.contextPath}/img/power.svg"/>
                <h3>电费</h3>
            </div>
            <div class="body">
                <dl>
                    <dt>一&nbsp;阶</dt><dd></dd>
                    <dt>数&nbsp;额</dt><dd></dd>
                </dl>
                <dl>
                    <dt>二&nbsp;阶</dt><dd></dd>
                    <dt>数&nbsp;额</dt><dd></dd>
                </dl>
                <dl>
                    <dt>三&nbsp;阶</dt><dd></dd>
                    <dt>数&nbsp;额</dt><dd></dd>
                </dl>
            </div>
        </div>
        <!-- 电费 end -->

        <!-- 燃气费 start -->
        <div class="gas">
            <div class="head">
                <img src="${pageContext.request.contextPath}/img/gas.svg"/>
                <h3>燃气费</h3>
            </div>
            <div class="body">
                <dl>
                    <dt>一&nbsp;阶</dt><dd></dd>
                    <dt>数&nbsp;额</dt><dd></dd>
                </dl>
                <dl>
                    <dt>二&nbsp;阶</dt><dd></dd>
                    <dt>数&nbsp;额</dt><dd></dd>
                </dl>
                <dl>
                    <dt>三&nbsp;阶</dt><dd></dd>
                    <dt>数&nbsp;额</dt><dd></dd>
                </dl>
            </div>
        </div>
        <!-- 燃气费 end-->
        </div>
    </div>
    <div id='editButton'><a class="btn btn-change btnchange" onclick="EditRatePage();">编&nbsp;&nbsp;辑</a></div>
    <!-- 页面内容 end-->
    
    <!-- jsp页面初始化操作 -->
    <script type="text/javascript">
       // 请求 收费标准
       $(function(){
    	   requestAjaxRate();
    	   changeLeftMenu(3);
       });
    </script>
    
</body>
</html>