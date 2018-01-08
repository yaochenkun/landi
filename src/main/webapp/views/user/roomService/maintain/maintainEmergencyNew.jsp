<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="org.ld.model.User"%>
<%@ page import="java.util.Date, java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css"	rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/ld/user/home/public.css"	rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/plugin/simpleCalendar/date_pack.css"	rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/ld/user/roomItem/roomItem.css" rel="stylesheet" type="text/css" />
    <%--<link href="${pageContext.request.contextPath}/css/ld/user/roomItem/planNew.css" rel="stylesheet" type="text/css" />--%>
    <link href="${pageContext.request.contextPath}/css/ld/user/roomService/service/serviceNew.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/ld/user/roomService/service/serviceNewWaterBill.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/ld/user/roomService/maintain/maintainEmergencyNew.css" rel="stylesheet" type="text/css" />

    <title>紧急事件申报</title>
</head>
<body>

<jsp:include page="../../_header.jsp" />
<jsp:include page="../../_modal.jsp" />

<%--<div class="nav-second">--%>
    <%--<div class="toolbar">--%>
        <%--<div class="nav-secondul">--%>
            <%--<ul>--%>
                <%--<li class="linormal"><a	href="${pageContext.request.contextPath}/views/user/roomItem/itemRoomOverview.jsp">物品统计</a></li>--%>
                <%--<li class="liactive"><a	href="${pageContext.request.contextPath}/views/user/roomItem/planList.jsp">采购管理</a></li>--%>
            <%--</ul>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>

<!-- 页面内容 strat -->
<div class="main">
    <div class="main-page">
        <div class="planTitle">
            <h4>新增报修</h4>
            <a class="btn btn-goback goback" href="${pageContext.request.contextPath}/views/user/home/homeUser.jsp">返&nbsp;&nbsp;&nbsp;回</a>
            <ul class="ul">
            </ul>
        </div>

        <div class="body">
            <div class="body-content" style="margin-left: 5%;">
                <ul>

                    <div id="theBegin">
                        <li><span class="span">房间号：</span>
                            <input id="roomNum" type="text" value="" onblur="associateGuestName(this)"/>
                            <span class="red red-right">*&nbsp;必填</span></li>
                        <li id="roomIdWarning"><span class="span"></span><span class="red">不能为空！</span></li>
                        <li><span class="span">入住状态：</span><input type="text" value="" disabled="disabled" id="roomState"/></li>
                        <li><span class="span">租客姓名：</span><input type="text" value="" disabled="disabled" id="guestName"/></li>
                        <li><span class="span">发生时间：</span><input type="text" value="" id="occurTime" placeholder="请按格式输入：2017-12-19 21:07"/></li>
                        <li><span class="span">到场时间：</span><input type="text" value="" id="arriveTime" placeholder="请按格式输入：2017-12-19 21:07"/></li>
                        <li><span class="span">申报人：</span><input type="text" value=${curUser.USERNAME} disabled="disabled" id="shenbaoren"/></li>
                        <li><span class="span">到场处理人：</span><input type="text" value="" id="dealing" placeholder="请按格式输入：张三;李四"/></li>
                        <li><span class="span">造成损害：</span><span>报修</span>
                            <input  type="checkbox" onclick="damageType();" id="repair" style="width: 2em;padding-right: 10px;"/>
                            <span>人员</span><input  type="checkbox" onclick="damageType();" id="people" style="width: 2em;padding-right: 10px;"/>
                            <span>财务</span><input  type="checkbox" onclick="damageType();" id="object" style="width: 2em;padding-right: 10px;"/></li>

                        <li id="only1"><span class="span">是否有目击人：</span><span>有</span>
                            <input type="checkbox" onclick="haveWitness();" id="yes" style="width: 2em;padding-right: 10px;"/>
                            <span>无</span><input type="checkbox" onclick="haveWitness();" id="no" style="width: 2em;padding-right: 10px;"/>
                        </li>
                    </div>

                    <div id="repairPart">
                        <hr style="margin-top: 0px;">

                        <li><span class="span" style="width: 18em;">报修位置及问题描述：</span></li>
                        <textarea rows="5" cols="100" style="margin-top:-20px;" id="description1"></textarea>

                        <li id="only2" style="padding-top: 20px;"><span class="span" style="width: 11em;">初步分析问题产生原因：</span>
                            <span>有</span><input style="width: 2em;padding-right: 10px;"  type="checkbox" id="reasonYes" onclick="problemReasonCheck()"/>
                            <span>无</span><input style="width: 2em;padding-right: 10px;" type="checkbox" id="reasonNo" onclick="problemReasonCheck();"/>
                        </li>

                        <li id="hide"><span class="span" style="width: 18em;">初步分析问题原因描述：</span></li>
                        <textarea rows="5" cols="100" style="margin-top:-20px;" id="testarea1"></textarea>
                        <hr style="margin-top: 0px;">
                    </div>

                    <div id="peopleDamagePart">
                        <hr style="margin-top: 0px;">
                        <li id="only3"><span class="span" style="width: 9em;">是否有伤员：</span>
                            <span>有</span><input id='hurtPeople' style="width: 2em;padding-right: 10px;"  type="checkbox" onclick="isHurtPeople()"/>
                            <span>无</span><input id='noHurtPeople' style="width: 2em;padding-right: 10px;" type="checkbox" onclick="isHurtPeople()"/>
                        </li>

                        <li id="hide1"><span class="span" style="width: 9em;">伤员姓名：</span><input id="hurtName" style="width: 10em;margin-right: 5em;" type="text"/>
                            <span class="span" style="width: 9em;">联系电话：</span><input id="hurtTel" style="width: 10em;" type="text"/>
                        </li>

                        <li id="hide2"><span class="span" style="width: 9em;">性别：</span><input id="hurtSex" style="width: 10em;margin-right: 5em;" type="text"/>
                            <span class="span" style="width: 9em;">国籍：</span><input id="hurtCountry" style="width: 10em;" type="text"/>
                        </li>

                        <li id="only4"><span class="span" style="width: 9em;">是否送医院救治：</span>
                            <span>有</span><input id="sendHosp" style="width: 2em;padding-right: 10px;"  type="checkbox" />
                            <span>无</span><input style="width: 2em;padding-right: 10px;"  type="checkbox"/>
                        </li>

                        <li id="hide3"><span class="span" style="width: 18em;">受伤部位描述：</span></li>
                        <textarea id="textarea2" rows="5" cols="100" style="margin-top:-20px;" ></textarea>

                        <hr style="margin-top: 0px;">
                    </div>

                    <div id="objectDamagePart">
                        <hr style="margin-top: 0px;">


                        <li><span class="span" style="width: 9em;">损失物品估计：</span> <input  id="damageObject" type="text"/>
                        </li>

                        <li><span class="span" style="width: 18em;">损失物品明细：</span></li>
                        <textarea id="textarea3" rows="5" cols="100" style="margin-top:-20px;" ></textarea>

                        <hr style="margin-top: 0px;">
                    </div>

                    <div id="witnessPart">
                        <hr style="margin-top: 0px;">

                        <li><span class="span" style="width: 9em;">其他目击人：</span><input id="w1" type="text" style="width: 10em;margin-right: 5em;"/>
                            <span class="span" style="width: 9em;">电话：</span><input id="t1"  type="text"  style="width: 10em;"/>
                        </li>

                        <li><span class="span" style="width: 9em;">其他目击人：</span><input id="w2"  type="text"  style="width: 10em;margin-right: 5em;"/>
                            <span class="span" style="width: 9em;">电话：</span><input id="t2"   type="text"  style="width: 10em;"/>
                        </li>

                        <li><span class="span" style="width: 9em;">其他目击人：</span><input id="w3"  type="text"  style="width: 10em;margin-right: 5em;"/>
                            <span class="span" style="width: 9em;">电话：</span><input id="t3"   type="text"  style="width: 10em;margin-right: 5em;"/>
                        </li>

                        <hr style="margin-top: 0px;">
                    </div>

                    <div id="theEnd">

                        <li><span class="span" style="width: 18em;">备注：</span></li>
                        <textarea id="comment" rows="5" cols="100" style="margin-top:-20px;"></textarea>
                        <li><span class="span"></span><a onclick="addEmergencyProblem();" class="btn btn-goback goback" style="float:left;">确认添加</a></li>

                    </div>

                </ul>
            </div>
        </div>

    </div>
</div>


<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/simpleCalendar/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/simpleCalendar/date_pack.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
<%--<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomItem/planNew.js"></script>--%>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/maintain/maintainEmergencyNew.js"></script>
<script type="text/javascript">
    // 初始化时间
    var nowDate = new Date();
    $(".pack_maintain").val(formatDateForm(nowDate));
    $('.pack_maintain').date_input();

</script>
</body>
</html>
