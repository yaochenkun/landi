<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/ld/user/home/public.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/ld/user/roomService/roomService.css"	rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/ld/user/roomService/service/serviceNew.css" rel="stylesheet" type="text/css" />
    <title>添加费用</title>
</head>
<body>
    <jsp:include page="../../_header.jsp"></jsp:include>
    <jsp:include page="../../_modal.jsp" />

    <% String type = request.getParameter("type");%>
    <%!
        String convert(String a){
            if(a.equals("welfare")) return "福利";
            if(a.equals("appease")) return "安抚";
            else  return "error";
        }
    %>
    <!-- 页面内容 start -->
    <div class="main">
        <div class="main-page">
            <div class="nav-path">
                <a href="../roomServiceIndex.jsp" title="回到首页"><i class="icon-home"></i></a>
                <i class="icon-path"></i>
                <a href="../service/serviceIndex.jsp">客房费用结算</a>
                <i class="icon-path"></i>
                <a id="serviceType" href="expenseLE.jsp?type=<%=type%>">LE承担费用</a>
                <i class="icon-path"></i>
                <a href="javascript:void(0);">新增<%=convert(type)%>费记录</a>
            </div>
            <div class="body">
                <div class="body-content">
                    <ul>
                        <li><span class="span">房间号：</span>
                            <input id="roomNumber" type="text" value="W33-2" onblur="associateGuestName(this);"/>
                            <span class="red red-right">*&nbsp;必填</span></li>
                        <li><span class="span">客户姓名：</span><input type="text" id="guestName" disabled="disabled" /></li>
                        <li><span class="span">项目：</span><input type="text" id="project" value=""/></li>
                        <li><span class="span">客服人员：</span><input type="text" id="service_staff" value=""/></li>
                        <li><span class="span">操作人员：</span><input type="text" id="operation_staff" value=""/></li>
                        <li><span class="span">原因：</span><input type="text" id="reason" value=""/></li>
                        <li><span class="span">金额：</span><input type="text" id="cost" value="0"/>元</li>
                        <li><span class="span"></span><a onclick="addDate('<%=type%>');" class="btn btn-goback goback">确认添加</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="shadow"></div>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/simpleCalendar/jquery.min.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/expense/newExpense.js"></script>
    <script type="text/javascript">
        associateGuestName(document.getElementById("roomNumber"));
    </script>
</body>
</html>
