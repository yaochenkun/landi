<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.ld.model.User"%>
<%@ page import="java.util.Date, java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>用户信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/ld/user/home/public.css"	rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/ld/user/home/home.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/ld/user/roomService/roomService.css"	rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/ld/user/roomService/roomServiceIndex.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <jsp:include page="../_header.jsp" />
    <jsp:include page="../_modal.jsp" />

    <div class="content" style="margin-top: 70px">
        <div class="detail">

            <div class="btn btn-change btnchange">
                <a href="${pageContext.request.contextPath}/views/user/home/homeUser.jsp">返回</a>
            </div>

            <div class="detail-head">
                <span>功能菜单</span>
            </div>

            <div class="body">
                <!-- 客房服务 start -->
                <div class="index-list">
                    <div class="left-index">
                        <ul>
                            <li><img src="${pageContext.request.contextPath}/img/roomService/telephone.svg">
                                <span>客房服务</span>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="content-title content-title-index active content-wash">
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/views/user/roomService/service/serviceWash.jsp">洗衣单收费</a></li>
                        <li><a href="${pageContext.request.contextPath}/views/user/roomService/service/serviceTakeaway.jsp">餐费</a></li>
                        <li><a href="${pageContext.request.contextPath}/views/user/roomService/service/serviceWaterBill.jsp">饮用水费</a></li>
                        <li><a href="${pageContext.request.contextPath}/views/user/roomService/service/serviceShoeCleaning.jsp">擦鞋费</a></li>
                        <li><a href="${pageContext.request.contextPath}/views/user/roomService/service/serviceShopping.jsp">代购费</a></li>
                        <li><a href="${pageContext.request.contextPath}/views/user/roomService/service/serviceBus.jsp">车费</a></li>

                        <li><a href="${pageContext.request.contextPath}/views/user/office/shopManage.jsp">小卖铺</a></li>
                        <li><a href="${pageContext.request.contextPath}/views/user/roomService/source/sourceIndex.jsp">能源费结算</a></li>
                        <li><a href="${pageContext.request.contextPath}/views/user/roomService/expense/expenseIndex.jsp">LE承担费用</a></li>
                        <li><a href="${pageContext.request.contextPath}/views/user/roomService/expense/expenseStatistics.jsp">月结管理</a></li>
                    </ul>
                </div>
                <!-- 客房服务 end -->

                <!-- 客房维修 start -->
                <div class="index-list">
                    <div class="left-index">
                        <ul>
                            <li><img src="${pageContext.request.contextPath}/img/roomService/tools.svg">
                                <span>客房维护</span>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="content-title content-title-index">
                    <ul>
                        <li><a href="maintain/maintainNew.jsp">报修处理</a></li>
                        <li><a href="#">检查检修</a></li>
                        <li><a href="${pageContext.request.contextPath}/views/user/roomService/maintain/maintainManage.jsp">维修管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/views/user/roomService/maintain/maintainStat.jsp">维修统计</a></li>
                        <li><a href="${pageContext.request.contextPath}/views/user/roomItem/itemIndex.jsp">客房物品管理</a></li>
                    </ul>
                </div>
                <!-- 客房维修 end -->

                <!-- 能源费结算 start -->
                <div class="index-list">
                    <div class="left-index">
                        <ul>
                            <li><img src="${pageContext.request.contextPath}/img/roomService/drops.svg">
                                <span>租赁管理</span>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="content-title content-title-index">
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/views/user/tenant/generalMap.jsp">租客管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/views/user/tenant/newGuest.jsp">新增租客</a></li>
                        <li><a href="${pageContext.request.contextPath}/views/user/tenant/guestList.jsp">租客一览表</a></li>
                        <li><a href="${pageContext.request.contextPath}/views/user/tenant/roomManage.jsp">房源管理</a></li>
                        <li><a href="#">房屋退租</a></li>
                    </ul>
                </div>
                <!-- 能源费结算 end -->

                <!-- 客房费用结算 start -->
                <div class="index-list">
                    <div class="left-index">
                        <ul>
                            <li><img src="${pageContext.request.contextPath}/img/roomService/calculate.svg">
                                <span>收支管理</span>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="content-title content-title-index">
                    <ul>
                        <li><a href="#">租赁款收付管理</a></li>
                        <li><a href="#">发票管理</a></li>
                        <li><a href="#">中介费管理</a></li>
                        <li><a href="#">收支一览表</a></li>
                        <li><a href="${pageContext.request.contextPath}/views/user/roomService/expense/expenseStatistics.jsp">客房费用统计</a></li>
                        <%--<li><a href="${pageContext.request.contextPath}/views/user/roomService/expense/expenseLE.jsp?type=welfare">LE承担费用</a></li>--%>
                    </ul>
                </div>
                <!-- 客房费用结算 end -->

                <!-- 事务提醒 start -->
                <div class="index-list">
                    <div class="left-index">
                        <ul>
                            <li><img src="${pageContext.request.contextPath}/img/roomService/calendar.svg">
                                <span>办公管理</span>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="content-title content-title-index">
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/views/user/roomService/affairReminder/mailboxIndex.jsp">站内信</a></li>
                        <li><a href="${pageContext.request.contextPath}/views/user/roomService/affairReminder/diaryOverview.jsp">备忘录</a></li>
                        <li><a href="${pageContext.request.contextPath}/views/user/roomItem/planList.jsp">物品申请</a></li>
                        <li><a href="#">紧急事件处理</a></li>
                        <li><a href="${pageContext.request.contextPath}/views/user/roomService/affairReminder/systemOverview.jsp">公告</a></li>

                    </ul>
                </div>
                <!-- 客房费用结算 end -->
            </div>
        </div>
    </div>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/roomService.js"></script>

</body>
</html>
