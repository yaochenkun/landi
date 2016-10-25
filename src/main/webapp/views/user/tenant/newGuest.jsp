<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/ld/user/home/public.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/ld/user/tenant/newGuest.css" rel="stylesheet" type="text/css"/>
	<title>房间管理</title>
</head>
<body>
	<jsp:include page="../_header.jsp"></jsp:include>
    <jsp:include page="../_leftMenu.jsp"></jsp:include>
    
    <!-- 三级菜单 begin -->
    <div class="nav-second">
        <div class="toolbar">
            <div class="nav-secondul">
                <ul>               
                <li class="linormal"><a href="${pageContext.request.contextPath}/views/user/tenant/generalMap.jsp">租客一览图</a></li>
                <li class="linormal"><a href="${pageContext.request.contextPath}/views/user/tenant/roomStatus.jsp">租客一览表</a></li> 
                <li class="liactive"><a href="${pageContext.request.contextPath}/views/user/tenant/newGuest.jsp">新增租客</a></li>
                <li class="linormal"><a href="javascript:void(0);">服务变更及结算</a></li> 
                <li class="linormal"><a href="${pageContext.request.contextPath}/views/user/tenant/roomPic.jsp">上传查房图片</a></li> 
                </ul>
            </div>    
        </div>
    </div>
    <!-- 三级菜单 end -->
    
    <!-- 页面内容 start-->
    <div class="content">

        <!-- 租客信息 start -->
        <div class="tab-content tab-content-guest">
            <div class="tab-content-title"><span>1</span>租客信息</div>
            <!--  extra body start-->
            <div class="extra-body">
                <div class="tab-content-body">
                    <div class="form">
                        <div class="item item-name">
                            <span class="spanLabel"><span class="red">*&nbsp;</span>租客姓名：</span>
                            <div class="fl"><input type="text" class="text" value="Ada" /></div>
                            <div class="fl"><input type="checkbox" class="checkbox" /><span>即将入住</span></div>
                        </div>
                        <div class="item item-room">
                            <span class="spanLabel"><span class="red">*&nbsp;</span>房间号：</span>
                            <div class="fl"><input type="text" class="text" value="W12" /></div>
                            <span class="spanLabel"><span class="red">*&nbsp;</span>户型：</span>
                            <div class="fl"><input type="text" class="text" value="大户型" /></div>
                        </div>
                        <div class="item item-tel">
                            <span class="spanLabel"><span class="red">*&nbsp;</span>合同编号：</span>
                            <div class="fl"><input type="text" class="text" value="S131" /></div>
                            <span class="spanLabel"><span class="red">*&nbsp;</span>联系电话：</span>
                            <div class="fl"><input type="text" class="text" value="13581818113" /></div>
                        </div>
                        <div class="item item-company">
                            <span class="spanLabel">所在公司：</span>
                            <div class="fl"><input type="text" class="text" value="Amazon" /></div>
                            <span class="spanLabel">职务：</span>
                            <div class="fl"><input type="text" class="text" value="经理" /></div>
                        </div>
                        <div class="item item-guestnumber">
                            <span class="spanLabel">入住人数：</span>
                            <div class="fl"><input type="text" class="text" value="2" /></div>
                        </div>
                        <div class="item item-time">
                            <span class="spanLabel">入住日期：</span>
                            <div class="fl"><input type="text" class="text" value="2016-11-11" /></div>
                            <span class="spanLabel">到期时间：</span>
                            <div class="fl"><input type="text" class="text" value="2017-11-11" /></div>
                        </div>
                        <div class="item item-car">
                            <span class="spanLabel">租金：</span>
                            <div class="fl"><input type="text" class="text" value="15000" /></div>
                            <span class="spanLabel">车位：</span>
                            <div class="fl"><input type="text" class="text" value="T3" /></div>
                        </div>
                        <div class="item item-remark">
                            <span class="spanLabel">备注：</span>
                            <div class="fl"><input type="text" class="text" value="无" /></div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- extra-body end-->
        </div>
        <!-- 租客信息 end -->

        <!-- 业主 start -->
        <div class="tab-content tab-content-owner">
            <div class="tab-content-title"><span>2</span>业主</div>
            <!--  extra body start-->
            <div class="extra-body">
                <div class="tab-content-body">
                    <div class="form">
                        <div class="item item-name">
                            <span class="spanLabel">业主姓名：</span>
                            <div class="fl"><input type="text" class="text" value="bob" /></div>
                        </div>
                        <div class="item item-rent">
                            <span class="spanLabel">租金：</span>
                            <div class="fl"><input type="text" class="text" value="20000" /></div>
                            <span class="spanLabel">服务费：</span>
                            <div class="fl"><input type="text" class="text" value="10000" /></div>
                        </div>
                        <div class="item item-other">
                            <span class="spanLabel">签约返还：</span>
                            <div class="fl"><input type="text" class="text" value="5000" /></div>
                            <span class="spanLabel">其他：</span>
                            <div class="fl"><input type="text" class="text" value="无" /></div>
                        </div>
                    </div>
                </div>
            </div>
            <!--  extra body end-->
        </div>
        <!-- 业主 end -->

        <!-- 中介 start -->
        <div class="tab-content tab-content-agency">
            <div class="tab-content-title"><span>3</span>中介</div>
            <!--  extra body start-->
            <div class="extra-body">
            <div class="tab-content-body">
                <div class="form">
                    <div class="item item-company">
                        <span class="spanLabel">中介公司：</span>
                        <div class="fl"><input type="text" class="text" value="链家" /></div>
                    </div>
                    <div class="item item-first">
                        <span class="spanLabel">中介首年费率：</span>
                        <div class="fl"><input type="text" class="text" value="0.36" /></div>
                        <span class="spanLabel">LE首年费率：</span>
                        <div class="fl"><input type="text" class="text" value="0.30" /></div>
                    </div>
                    <div class="item item-second">
                        <span class="spanLabel">中介次年费率：</span>
                        <div class="fl"><input type="text" class="text" value="0.26" /></div>
                        <span class="spanLabel">LE次年费率：</span>
                        <div class="fl"><input type="text" class="text" value="0.26" /></div>
                    </div>
                    <div class="item item-third">
                        <span class="spanLabel">中介三年后费率：</span>
                        <div class="fl"><input type="text" class="text" value="0.16" /></div>
                        <span class="spanLabel">LE三年后费率：</span>
                        <div class="fl"><input type="text" class="text" value="0.16" /></div>
                    </div>
                    <div class="item item-fourth">
                        <span class="spanLabel">中介公司费用：</span>
                        <div class="fl"><input type="text" class="text" value="36000" /></div>
                        <span class="spanLabel">LE中介服务费用：</span>
                        <div class="fl"><input type="text" class="text" value="26000" /></div>
                    </div>
                </div>
            </div>
            </div>
            <!-- extra body end-->
        </div>
        <!-- 中介 end -->

        <!-- 房款收付日期 start -->
        <div class="tab-content tab-content-housepay">
            <div class="tab-content-title"><span>4</span>房款收付日期</div>
            <!--  extra body start-->
            <div class="extra-body">
            <div class="tab-content-body">
                <div class="form">
                    <div class="item-list item-rent">
                        <div class="item item-date">
                            <span class="spanLabel">收租金日期：</span>
                            <div class="fl"><input type="text" class="text" value="1月20日" /></div>
                        </div>
                        <div class="item item-cycle">
                            <span class="spanLabel">周期：</span>
                            <div class="fl"><input type="text" class="text" value="半年" /></div>
                            <span class="spanLabel">方式：</span>
                            <div class="fl"><input type="text" class="text" value="现金"/></div>
                        </div>
                    </div>
                    <div class="item-list item-return">
                        <div class="item item-date">
                            <span class="spanLabel">付返款日期：</span>
                            <div class="fl"><input type="text" class="text" value="3月1日"/></div>
                        </div>
                        <div class="item item-cycle">
                            <span class="spanLabel">周期：</span>
                            <div class="fl"><input type="text" class="text" value="一个月"/></div>
                        </div>
                    </div>
                    <div class="item-list item-bill">
                        <div class="item item-date">
                            <span class="spanLabel">开发票日期：</span>
                            <div class="fl"><input type="text" class="text" value="5月1日"/></div>
                        </div>
                        <div class="item item-cycle">
                            <span class="spanLabel">周期：</span>
                            <div class="fl"><input type="text" class="text" value="一个月"/></div>
                            <span class="spanLabel">提前时间：</span>
                            <div class="fl"><input type="text" class="text" value="一月"/></div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            <!-- extra body end-->
        </div>
        <!-- 房款收付日期 end -->

        <!-- 服务 start -->
        <div class="tab-content">
            <div class="tab-content-title"><span>5</span>服务</div>
            <!--  extra body start
            <div class="extra-body">
                <div class="tab-content-body">
                    <div class="form"></div>
                </div>
            </div>
             extra body end-->
        </div>
        <!-- 服务 end -->

        <div class="btn btn-new btnnew" onclick="addGuest();">确认添加</div>

    </div>   
    <!-- 页面内容 end-->

    <div class="step-nav">
        <div class="icon-group">
            <a class="list-icon-link" href="javascript:void(0);">1</a>
            <div class="list-icon-text"><div class="inner">租客信息</div></div>
            <a class="list-icon-link" href="javascript:void(0);">2</a>
            <div class="list-icon-text"><div class="inner">业主</div></div>
            <a class="list-icon-link" href="javascript:void(0);">3</a>
            <div class="list-icon-text"><div class="inner">中介</div></div>
            <a class="list-icon-link" href="javascript:void(0);">4</a>
            <div class="list-icon-text"><div class="inner">房款收付日期</div></div>
            <a class="list-icon-link" href="javascript:void(0);">5</a>
            <div class="list-icon-text"><div class="inner">服务</div></div>
        </div>
    </div>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/tenant/newGuest.js"></script>
</body>
</html>