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
    <link href="${pageContext.request.contextPath}/css/plugin/simpleCalendar/date_pack.css"	rel="stylesheet" type="text/css" />

    <link href="${pageContext.request.contextPath}/css/ld/user/roomItem/roomItem.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/ld/user/roomItem/itemRoomOverview.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/ld/user/roomService/roomService.css" rel="stylesheet" type="text/css" />

    <title>查看历史回复</title>
</head>
<body>

<jsp:include page="../../_header.jsp" />
    <% String ID = request.getParameter("ID");
    String room = request.getParameter("ROOM");
    String des = request.getParameter("DES");
    String state = request.getParameter("STATE");
    String date = request.getParameter("DATE");
    String roomState = request.getParameter("ROOMSTATE");
    String level = request.getParameter("LEVEL");
    String type = request.getParameter("TYPE");
    String sub = request.getParameter("SUBTYPE");
    String comment = request.getParameter("COMMENT");
    %>

<!-- 页面内容 start -->
<div class="main">
    <div class="main-page">

        <div class="nav-path">
            <a href="../home/homeUser.jsp" title="回到首页"><i class="icon-home"></i></a>
            <i class="icon-path"></i> <a href="maintainManage.jsp">维修管理</a>
            <i class="icon-path"></i> <a href="maintainProblemHistory.jsp">历史回复</a>
        </div>

        <div class="nav-path" style="margin-top: -20px;">
            <div>
                <span style="padding-right: 20px;" id="roomnum"></span>
                <span style="padding-right: 20px;" id="des"></span>
                <span style="padding-right: 20px;" id="state"></span>
                <span style="padding-right: 20px;" id="date"></span>
                <a class="btn btn-edit btnEdit btnRight" onclick="exportList();" style="margin-left:285px;">导出</a>
                <a class="btn btn-edit btnEdit" onclick="printList();">打印</a>
            </div>
            <div>
                <span style="padding-right: 20px;" id="roomState"></span>
                <span style="padding-right: 20px;" id="comment"></span>
                <span style="padding-right: 20px;" id="level"></span>
                <span style="padding-right: 20px;" id="type"></span>
                <span style="padding-right: 20px;" id="subtype"></span>
            </div>
        </div>

        <div class="bill-area">
            <div class="bill-table">
                <!-- 费用 table start -->
                <table>
                    <thead>
                    <tr>
                        <th><span>回复日期</span></th>
                        <th><span>回复内容</span></th>
                        <th><span>信息来源</span></th>
                        <th><span>分配部门</span></th>
                        <th><span>完成状态</span></th>
                        <th><span>产生费用</span></th>
                        <th><span>费用承担</span></th>
                        <th><span>费用明细</span></th>
                        <th><span>删除</span></th>

                    </tr>
                    </thead>
                    <tbody id="problemHistoryTbody">

                    </tbody>
                </table>
                <!-- 费用 table end -->

                <%--<!-- 底部页面 start -->--%>
                <%--<div id="reminderOverviewBottom" class="bottom"></div>--%>
                <%--<!-- 底部页码 end -->--%>
            </div>
        </div>
    </div>
</div>
<!-- 页面内容 end -->

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
<!-- 导出插件 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/exportCsv/Blob.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/exportCsv/FileSaver.js"></script>

<!-- 打印插件 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/printer/print.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/maintain/maintainProblemHistory.js"></script>

<script>

    $("#roomNum").html('<%=room%>')
    $("#des").html('<%=des%>')
    $("#state").html('<%=state%>')
    $("#date").html('<%=date%>')
    $("#roomState").html('<%=roomState%>')
    $("#comment").html('<%=comment%>')
    $("#level").html('<%=level%>')
    $("#type").html('<%=type%>')
    $("#subtype").html('<%=sub%>')

    searchProblemHistory('<%=ID%>');
</script>
</body>
</html>
