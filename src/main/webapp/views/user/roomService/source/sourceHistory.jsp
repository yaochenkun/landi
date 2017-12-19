<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css"  rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/ld/user/home/public.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/ld/user/roomService/roomService.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/ld/user/roomService/source/sourceHistory.css" rel="stylesheet" type="text/css" />

    <title>费用查看</title>
</head>
<body>
    <jsp:include page="../../_header.jsp"></jsp:include>
    <jsp:include page="../../_modal.jsp" />
    <!-- 页面内容 start -->
    <div class="main">
        <div class="main-page">

            <!-- 面包屑导航 start -->
            <div class="nav-path">
                <a href="../../home/homeUser.jsp" title="回到首页">
                    <i class="icon-home"></i></a> <i class="icon-path"></i>
                <a href="sourceIndex.jsp">能源费结算</a>

                <% String type = request.getParameter("type");
                    String content = "";
                    String contentOne = "";
                    if(type.matches("water")){
                        contentOne = "水费";
                        content = "sourceWater.jsp";}
                    else if(type.matches("elec")){
                        contentOne = "电费";
                        content = "sourceElec.jsp";}
                    else if(type.matches("gas")){
                        contentOne = "燃气费";
                        content = "sourceGas.jsp";
                    }
                    String rnum = request.getParameter("number");
                    String state = request.getParameter("state");
                    String guest = request.getParameter("guest");
                    String init = request.getParameter("init");

                    String key = "";
                    if(state.matches("one")){
                        key = "查看";}
                    else if(state.matches("all")){
                        key = "历史查看";}
                    String contentTwo = contentOne + key;

                    Calendar c  = Calendar.getInstance();
                    c.setTime(new Date());
                    int year = c.get(Calendar.YEAR);
                %>
                <i class="icon-path"></i>
                <a id="sourceType" href="<%=content%>"><%=contentOne %></a>
                <i class="icon-path"></i>
                <a href="javascript:void(0);"><%=contentTwo %></a>
            </div>
            <!-- 面包屑导航 end -->
            <div class="bill-area">
                <div class="label1"><span class="key">房间</span><span class="value"><%=rnum%></span> <span class="key">初始表数</span><span class="value"><%=init%></span><span class="key">年度</span><span class="value"><%=year%></span></div>
                <div class="label2"><span class="key">表号</span><span class="value">----</span><span class="key">用户姓名</span><span class="value"><%=guest%></span></div>

                <div class="bill-table">
                    <!-- 费用 table start -->
                    <table>
                        <thead>
                        <tr>
                            <th><span>1</span></th>
                            <th><span>2</span></th>
                            <th><span>3</span></th>
                            <th><span>4</span></th>
                            <th><span>5</span></th>
                            <th><span>6</span></th>
                            <th><span>7</span></th>
                            <th><span>8</span></th>
                            <th><span>9</span></th>
                            <th><span>10</span></th>
                            <th><span>11</span></th>
                            <th><span>12</span></th>
                        </tr>
                        </thead>
                        <tbody id="historyTbody"></tbody>
                    </table>
                    <!-- 费用 table end -->

                    <!-- 底部页面 start -->
                    <%--<div id="serviceWaterBottom" class="bottom"></div>--%>
                    <!-- 底部页码 end -->
                </div>
            </div>
        </div>
    </div>

    <!-- 页面内容 end -->


    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
    <%--<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/roomService.js"></script>--%>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/source/sourceHistory.js"></script>
    <script  type="text/javascript">
        findHistory('<%=type%>','<%=rnum%>','<%=guest%>','<%=state%>');
    </script>
</body>
</html>
