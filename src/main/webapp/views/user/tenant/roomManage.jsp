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
    <link href="${pageContext.request.contextPath}/css/ld/user/tenant/roomManage.css" rel="stylesheet" type="text/css" />
    <title>房源管理</title>
</head>
<body>
        <jsp:include page="../_header.jsp" />

        <!-- 三级导航栏 start-->
        <%--<div class="nav-second">--%>
            <%--<div class="toolbar">--%>
                <%--<div class="nav-secondul">--%>
                    <%--<ul>--%>
                        <%--<li class="linormal"><a href="generalMap.jsp">租客一览图</a></li>--%>
                        <%--<li class="linormal"><a href="guestList.jsp">租客一览表</a></li>--%>
                        <%--<li class="linormal"><a href="newGuest.jsp">新增租客</a></li>--%>
                        <%--<li class="liactive"><a href="javascript:void(0);">房源管理</a></li>--%>
                    <%--</ul>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
        <!-- 三级导航栏 end-->
        <div class="main">
            <div class="main-page">

                <div class="nav-path">
                    <a href="../home/homeUser.jsp" title="回到首页"><i class="icon-home"></i></a>
                    <i class="icon-path"></i> <a href="roomManage.jsp">房源管理</a>
                </div>

        <!-- 页面内容 start-->
        <div class="main" style="margin-top:-20px;">
            <div class="main-title">
                <input type="text" placeholder="房间号..." id="roomNumber"/>
                <input type="text" placeholder="房源类型..." id="roomType"/>
                <a class="btnSearch" onclick="getRoomManageInfo($('#roomNumber').val(),$('#roomType').val(),parseInt(1));">搜索</a>
                <a class="btn btn-edit" style="margin-left:10px;" onclick="printList();">打印</a>
                <a class="btn btn-edit" onclick="exportList();">导出</a>
            </div>
            <div class="main-page">
                <div class="bill-area">
                    <div class="bill-table">
                        <table>
                            <thead>
                                <tr>
                                    <th><span>房间号</span></th>
                                    <th><span>房源类型</span></th>
                                    <th><span>业主姓名</span></th>
                                    <th><span>接收时间</span></th>
                                    <th><span>退还日期</span></th>
                                    <th><span>替换房间</span></th>
                                    <th><span>备注</span></th>
                                </tr>
                            </thead>
                            <tbody id="roomManageTbody"></tbody>
                        </table>
                        <div id="roomManageBottom" class="bottom"></div>
                    </div>
                </div>

            </div>
        </div>
            </div>
        </div>
        <!-- 页面内容 end-->

        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>

        <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/exportCsv/Blob.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/exportCsv/FileSaver.js"></script>
        <!-- 打印插件 -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/printer/print.min.js"></script>

        <script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/tenant/roomManage.js"></script>

        <script type="text/javascript">
            getRoomManageInfo($("#roomNumber").val(),$("#roomType").val(),parseInt(1));
        </script>


</body>
</html>
