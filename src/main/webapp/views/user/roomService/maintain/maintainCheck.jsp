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

    <title>检查检修</title>
</head>
<body>

<jsp:include page="../../_header.jsp" />

<!-- 页面内容 start -->
<div class="main">
    <div class="main-page">

        <div class="nav-path">
            <a href="../../home/homeUser.jsp" title="回到首页"><i class="icon-home"></i></a>
            <i class="icon-path"></i> <a href="maintainCheck.jsp">检查检修</a>
        </div>

        <div class="nav-path" style="margin-top: -20px;">
            <a class="btn btn-edit btnEdit btnRight" onclick="exportList();" style="margin-left:285px;">导出</a>
            <a class="btn btn-edit btnEdit" onclick="printList();">打印</a>
            <a class="btn btn-edit btnEdit" href="maintainCheckNew.jsp">新增检查检修</a>
        </div>

        <div class="bill-area">
            <div class="bill-table">
                <!-- 费用 table start -->
                <table>
                    <thead>
                    <tr>
                        <th style="width: 9%;"><span>检查检修内容</span></th>
                        <th style="width: 10%;"><span>检查检修创建时间</span></th>
                        <th style="width: 9%;"><span>最近更新时间</span></th>
                        <th style="width: 9%;"><span>检查房间</span></th>
                        <th style="width: 9%;"><span>问题房间</span></th>
                        <th style="width: 9%;"><span>问题数量</span></th>
                        <th style="width: 9%;"><span>完成房间</span></th>
                        <th style="width: 9%;"><span>完成数量</span></th>
                        <th style="width: 8%;"><span>补充</span></th>
                        <th style="width: 8%;"><span>查看</span></th>
                        <th style="width: 9%;"><span>剩余搁置</span></th>

                    </tr>
                    </thead>
                    <tbody id="maintainCheckTbody">

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


</script>
</body>
</html>
