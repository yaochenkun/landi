
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/ld/user/home/public.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/ld/user/roomService/roomService.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/ld/user/roomService/source/sourceTotal.css" rel="stylesheet" type="text/css" />
    <title>能源费总表</title>
</head>
<body>
    <jsp:include page="../../_header.jsp"></jsp:include>

    <!-- 页面内容 start -->
    <div class="main">
        <div class="main-page">
            <div class="nav-path">
                <a href="../../home/homeUser.jsp" title="回到首页"><i
                        class="icon-home"></i></a> <i class="icon-path"></i> <a
                    href="sourceIndex.jsp">能源费结算</a> <i class="icon-path"></i> <a
                    href="sourceTotal.jsp">能源费总表</a>
            </div>
            <div class="bill-area">
                <input id="roomNumber" type="text" class="search-input" placeholder="请输入房间号..." />
                <a class="btn btn-edit btnSearch" onclick="requestSourceTotal($('#roomNumber').val())">搜索</a>
                <div class="bill-table">
                    <!-- 费用 table start -->
                    <table>
                        <thead>
                            <tr id="trOne">
                                <th rowspan="2" id="test1"><span>房间号</span></th>
                                <th rowspan="2"><span>租客姓名</span></th>
                                <th colspan="5"><span>燃&nbsp;气&nbsp;费&nbsp;</span></th>
                                <th colspan="5"><span>电&nbsp;表&nbsp;</span></th>
                                <th colspan="5"><span>水&nbsp;表&nbsp;</span></th>
                                <th rowspan="2">能源费合计</th>

                            </tr>
                            <tr id="trTwo">
                                <th>表 号</th>
                                <th>上次表数</th>
                                <th>月份</th>
                                <th>费用</th>
                                <th>当前阶数</th>

                                <th>表 号</th>
                                <th>上次表数</th>
                                <th>月份</th>
                                <th>费用</th>
                                <th>当前阶数</th>

                                <th>表 号</th>
                                <th>上次表数</th>
                                <th>月份</th>
                                <th>费用</th>
                                <th>当前阶数</th>


                            </tr>
                        </thead>
                        <tbody id="sourceTbody"></tbody>
                    </table>
                    <!-- 费用 table end -->

                    <!-- 底部页面 start -->
                    <%--<div id="serviceGasBottom" class="bottom"></div>--%>
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
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/source/sourceTotal.js"></script>
    <script type="text/javascript">
        // 拉取第一页餐费信息
        requestSourceTotal($('#roomNumber').val());
    </script>
</body>
</html>
