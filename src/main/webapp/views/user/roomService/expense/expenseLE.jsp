<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/ld/user/home/public.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/ld/user/tenant/tenantPublic.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/ld/user/roomItem/roomItem.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/ld/user/roomService/expense/expenseLE.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/ld/user/roomService/roomService.css" rel="stylesheet" type="text/css" />
    <title>LE承担费用</title>
</head>
<body>
    <jsp:include page="../../_header.jsp" />

    <% String type = request.getParameter("type");%>
    <%!
        String convert(String a){
            if(a.equals("welfare")) return "福利";
            if(a.equals("appease")) return "安抚";
            else  return "error";
        }
    %>

    <!-- 三级导航栏 start-->
    <%--<div class="nav-second">--%>
        <%--<div class="toolbar">--%>
            <%--<div class="nav-secondul">--%>
                <%--<ul>--%>
                    <%--<% if(type.equals("welfare")) {%>--%>
                    <%--<li class="liactive"><a href="expenseLE.jsp?type=welfare">福利费</a></li>--%>
                    <%--<li class="linormal"><a href="expenseLE.jsp?type=appease">安抚费</a></li>--%>
                    <%--<%} else {%>--%>
                    <%--<li class="linormal"><a href="expenseLE.jsp?type=welfare">福利费</a></li>--%>
                    <%--<li class="liactive"><a href="expenseLE.jsp?type=appease">安抚费</a></li>--%>
                    <%--<%}%>--%>
                <%--</ul>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
    <div class="main">
    <div class="main-page">
    <div class="nav-path">
        <a href="../../home/homeUser.jsp" title="回到首页"><i
                class="icon-home"></i></a> <i class="icon-path"></i> <a
            href="expenseIndex.jsp">LE承担费用</a> <i class="icon-path"></i> <a
            href="expenseLE.jsp?type=<%=type%>"><%=convert(type)+'费'%></a>
        <a class="btn btn-new new" href="newExpense.jsp?type=<%=type%>">新增<%=convert(type)%>费记录</a>
    </div>


    <!-- 三级导航栏 end-->
    <!-- 页面内容 start-->
    <div class="main" style="margin-top: 10px;">

        <div class="main-title">
            <input type="text" placeholder="房间号..." id="roomNumber"/>
            <a class="btnSearch" onclick="getExpenseInfo($('#roomNumber').val(),parseInt(1),'<%=type%>');">搜索</a>
            <a class="btn btn-edit" style="margin-left:10px;" onclick="printList('<%=type%>');">打印</a>
            <a class="btn btn-edit" onclick="exportList('<%=type%>');">导出</a>
        </div>

        <div class="main-page">
            <div class="bill-area">
                <div class="bill-table">
                    <table>
                        <thead>
                        <tr>
                            <th><span>房间号</span></th>
                            <th><span>租客</span></th>
                            <th><span>项目</span></th>
                            <th><span>客服人员</span></th>
                            <th><span>操作人员</span></th>
                            <th><span>原因</span></th>
                            <th><span>金额</span></th>
                        </tr>
                        </thead>
                        <tbody id="Tbody"></tbody>
                    </table>
                    <div id="Bottom" class="bottom"></div>
                </div>
            </div>
        </div>
    </div>
        </div>
    </div>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/exportCsv/Blob.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/exportCsv/FileSaver.js"></script>
    <!-- 打印插件 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/printer/print.min.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
    <%--<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/roomService.js"></script>--%>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/expense/expenseLE.js"></script>

    <script type="text/javascript">
        getExpenseInfo($("#roomNumber").val(),parseInt(1),'<%=type%>');
    </script>
</body>
</html>
