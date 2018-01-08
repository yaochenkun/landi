<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="org.ld.model.User"%>
<%@ page import="java.util.Date, java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/ld/user/home/public.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/ld/user/roomItem/roomItem.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/ld/user/roomItem/itemRoomOverview.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/ld/user/roomService/roomService.css" rel="stylesheet" type="text/css" />

    <title>新增检查检修</title>
</head>
<body>

<jsp:include page="../../_header.jsp" />
<%
    String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
%>
<!-- 页面内容 start -->
<div class="main">
    <div class="main-page">

        <div class="nav-path">
            <a href="../../home/homeUser.jsp" title="回到首页"><i class="icon-home"></i></a>
            <i class="icon-path"></i> <a href="maintainCheck.jsp">检查检修</a>
            <i class="icon-path"></i> <a href="maintainCheckNew.jsp">新增检查检修</a>

        </div>

        <div class="bill-area">
            <div>
                <span>房间号:</span><input type="text" id="room"/>
                <a class="btn btn-edit btnEdit" onclick="add();">确认添加</a>
                <a class="btn btn-edit btnEdit" href="maintainCheck.jsp">取消添加</a>

            </div>

            <div class="bill-table">
                <div>
                    <span>检修内容:</span><input type="text" />
                    <span>检查时间:</span><input type="text" value="<%=date%>"/>

                </div>
                <!-- 费用 table start -->
                <table>
                    <thead>
                    <tr>
                        <th style="width: 11%;"><span>选择保修</span></th>
                        <th style="width: 11%;"><span>房间号</span></th>
                        <th style="width: 11%;"><span>问题位置及描述</span></th>
                        <th style="width: 11%;"><span>问题等级</span></th>
                        <th style="width: 11%;"><span>问题分类</span></th>
                        <th style="width: 11%;"><span>问题子类</span></th>
                        <th style="width: 13%;"><span>问题需要解决的时间</span></th>
                        <th style="width: 11%;"><span>备注</span></th>
                        <th style="width: 8%;"><span>操作</span></th>

                    </tr>
                    </thead>
                    <tbody id="maintainCheckNewTbody">

                    </tbody>
                </table>
                <!-- 费用 table end -->

                <!-- 底部页面 start -->
                <div style="margin-top: 50px;margin-left: 500px;" id="maintainCheckNewBottom" class="bottom"></div>
                <!-- 底部页码 end -->
            </div>
        </div>
    </div>
</div>
<!-- 页面内容 end -->

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/maintain/maintainCheckNew.js"></script>

<script>


</script>
</body>
</html>
