
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/ld/user/home/public.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/ld/user/roomService/expense/expenseStatistics.css" rel="stylesheet" type="text/css"/>

    <title>客房统计费用</title>
</head>
<body>
    <jsp:include page="../../_header.jsp" />
    <jsp:include page="../../_leftMenu.jsp" />

    <div class="main">
        <div class="main-page">
            <div class="nav-path">
                <a href="../../home/homeUser.jsp" title="回到首页"><i class="icon-home"></i></a>
                <i class="icon-path"></i>
                <a id="serviceType" href="javascript:void(0)"  style="color:#2277da;">客房统计费用</a>
            </div>
            <div class="body">
                <div class="body-content" style="margin-top:10px;">
                    <input id="roomNumber" type="text" placeholder="房间号..."/>
                    <a class="btn btnSearch" onclick="searchExpense()">搜索</a>
                    <span class="total">总额：</span><span ><span class="price">0</span>&nbsp;元</span>
                </div>
                <table class="bill-table">

                    <thead>
                        <tr>
                            <th colspan="2">水表号</th>
                            <th>一月表数</th>
                            <th>上月表数</th>
                            <th>本月表数</th>
                            <th>本月表费</th>
                            <th>时间</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>

                </table>
                <div class="export">

                </div>

            </div>
        </div>

    </div>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/expense/expenseStatistics.js"></script>


</body>
</html>
