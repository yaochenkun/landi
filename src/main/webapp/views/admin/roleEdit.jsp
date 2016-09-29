<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/admin/public.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/admin/roleEdit.js"></script>
	<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/ld/admin/public.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/ld/admin/roleEdit.css" rel="stylesheet" type="text/css"/>
	<title>角色权限管理</title>
</head>
<body>
	<!-- 一级导航栏 start-->
    <header class="navbar navbar-fixed-top navbar-ld">
        <div class="container-fluid">
            <div class="header-content">
                <div class="header-logo">
                    <img src="${pageContext.request.contextPath}/img/logo.png">
                </div>
                <!-- <div class="navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <div class="dropdown-toggle" data-toggle="dropdown" id="user_dropdown">
                             	 欢迎您，${CUR_ENV.cur_user.USERNAME}
                            <span class="caret"></span>
                            </div>
                            <ul class="dropdown-menu" aria-labelledby="user_dropdown" aria-expanded="false">
                              <li class="li"><a href="#">修改密码</a></li>
                              <li role="separator" class="divider"></li>
                              <li class="li"><a href="${pageContext.request.contextPath}/logout.action">退出</a></li>
                            </ul>
                        </li>
                   </ul>
                </div>-->
                <div class="navbar-collapse">
                                                               欢迎您，${CUR_ENV.cur_user.USERNAME}
                     <div class="logoutDiv"><a title="退出" class="logoutImg" href="${pageContext.request.contextPath}/logout.action"></a></div>
                </div>
            </div>
        </div>
    </header>
    <!-- 一级导航栏 end-->

    <!-- 二级导航栏 start -->
    <div class="main-nav"> 
        <div class="aside-box">
            <ul>
                <li class="linormal"><span class="glyphicon glyphicon-home"></span><a href="${pageContext.request.contextPath}/views/admin/homeAdmin.jsp">&nbsp;&nbsp;首页</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-user"></span><a href="${pageContext.request.contextPath}/views/admin/userList.jsp">&nbsp;&nbsp;用户管理</a></li>
                <li class="liactive"><span class="glyphicon glyphicon-lock"></span><a href="${pageContext.request.contextPath}/views/admin/roleEdit.jsp">&nbsp;&nbsp;角色权限查看</a></li>
                <li class="linormal"><span class="glyphicon glyphicon-list-alt"></span><a href="${pageContext.request.contextPath}/views/admin/rateList.jsp">&nbsp;&nbsp;收费标准管理</a></li>
            </ul>
        </div>
    </div>
    <div class="nav-second">
        <div class="toolbar">
            <div class="nav-secondul">
                <ul>
                    <li class="liactive">角色权限查看</li>
                </ul>
            </div>    
        </div>
       </div>
    <!-- 二级导航栏 end-->

    <!-- 页面内容 start -->
    <div class="content">
        <div class="title">
            <h4>角色</h4>
            <div id="RoleEdit" onclick="requestAjaxRoleChange();" class="form-control dropdownMenu"><span class="caret"></span></div>
            <div id="RoleEditMenu" class="dropdownMenu"></div>
           <!-- <div onclick="requestEditRoleAuth();" class="btn btn-change btnchange"><a>确认变更</a></div> -->
        </div>
 
        <!-- body start-->
        <div class="body">
            <!-- 固定资产 first start-->
            <div class="body-first">
                <h4>固定资产</h4>
                <div class="checkbox-group">
                    <input type="checkbox" id="checkbox_role1" class="checkbox" disabled="disabled"/> 
                    <label for="checkbox_role1"></label>  
                </div>        
                <div class="checkbox-text1">查看房屋信息</div>                
            
                <div class="checkbox-group">
                    <input type="checkbox" id="checkbox_role2" class="checkbox" disabled="disabled"/> 
                    <label for="checkbox_role2"></label>  
                </div>        
                <div class="checkbox-text1">修改房屋信息</div>            

                <div class="checkbox-group">
                    <input type="checkbox" id="checkbox_role3" class="checkbox" disabled="disabled"/> 
                    <label for="checkbox_role3"></label>  
                </div>        
                <div class="checkbox-text1">查看设备信息</div>   

                <div class="checkbox-group">
                    <input type="checkbox" id="checkbox_role4" class="checkbox" disabled="disabled"/> 
                    <label for="checkbox_role4"></label>  
                </div>        
                <div class="checkbox-text1">修改设备信息</div>       
            </div> 
            <!-- 固定资产 first end--> 
            
            <!-- 租客服务 second start-->
            <div class="body-second">
                <h4>租客服务</h4>
                <div class="checkbox-group">
                    <input type="checkbox" id="checkbox_role5" class="checkbox" disabled="disabled"/> 
                    <label for="checkbox_role5"></label>  
                </div>        
                <div class="checkbox-text2">查看租客及合同信息</div>                
            
                <div class="checkbox-group">
                    <input type="checkbox" id="checkbox_role6" class="checkbox" disabled="disabled"/> 
                    <label for="checkbox_role6"></label>  
                </div>        
                <div class="checkbox-text2">修改租客及合同信息</div>            

                <div class="checkbox-group">
                    <input type="checkbox" id="checkbox_role7" class="checkbox" disabled="disabled"/> 
                    <label for="checkbox_role7"></label>  
                </div>        
                <div class="checkbox-text2">查看租客日常服务</div>   

                <div class="checkbox-group">
                    <input type="checkbox" id="checkbox_role8" class="checkbox" disabled="disabled"/> 
                    <label for="checkbox_role8"></label>  
                </div>        
                <div class="checkbox-text2">修改租客日常服务</div>  
            </div>
            <!-- 租客服务 second end-->

            <!-- 小卖部 third start-->
            <div class="body-third">
                <h4>小卖部和爱心驿站</h4>
                <div class="checkbox-group">
                    <input type="checkbox" id="checkbox_role9" class="checkbox" disabled="disabled"/> 
                    <label for="checkbox_role9"></label>  
                </div>        
                <div class="checkbox-text3">查看小卖部</div>                
            
                <div class="checkbox-group">
                    <input type="checkbox" id="checkbox_role10" class="checkbox" disabled="disabled"/> 
                    <label for="checkbox_role10"></label>  
                </div>        
                <div class="checkbox-text3">经营小卖部</div>            

                <div class="checkbox-group">
                    <input type="checkbox" id="checkbox_role11" class="checkbox" disabled="disabled"/> 
                    <label for="checkbox_role11"></label>  
                </div>        
                <div class="checkbox-text3">查看爱心驿站</div>   

                <div class="checkbox-group">
                    <input type="checkbox" id="checkbox_role12" class="checkbox" disabled="disabled"/> 
                    <label for="checkbox_role12"></label>  
                </div>        
                <div class="checkbox-text3">管理爱心驿站</div> 
            </div>
            <!-- 小卖部 third end-->

            <!-- 采购 fourth start-->
            <div class="body-fourth">
                <h4>采购</h4>
                <div class="checkbox-group">
                    <input type="checkbox" id="checkbox_role13" class="checkbox" disabled="disabled"/> 
                    <label for="checkbox_role13"></label>  
                </div>        
                <div class="checkbox-text4">查看采购情况</div>                
            
                <div class="checkbox-group">
                    <input type="checkbox" id="checkbox_role14" class="checkbox" disabled="disabled"/> 
                    <label for="checkbox_role14"></label>  
                </div>        
                <div class="checkbox-text4">添加采购记录</div>            
            </div>
            <!-- 采购 fourth end-->

            <!-- 其他 fifth start-->
            <div class="body-fifth">
                <h4>其他</h4>
                <div class="checkbox-group">
                    <input type="checkbox" id="checkbox_role15" class="checkbox" disabled="disabled"/> 
                    <label for="checkbox_role15"></label>  
                </div>        
                <div class="checkbox-text5">查看系统日志</div>                
            
                <div class="checkbox-group">
                    <input type="checkbox" id="checkbox_role16" class="checkbox" disabled="disabled"/> 
                    <label for="checkbox_role16"></label>  
                </div>        
                <div class="checkbox-text5">查看收支统计</div>            

                <div class="checkbox-group">
                    <input type="checkbox" id="checkbox_role17" class="checkbox" disabled="disabled"/> 
                    <label for="checkbox_role17"></label>  
                </div>        
                <div class="checkbox-text5">查看办公室管理</div>   

                <div class="checkbox-group">
                    <input type="checkbox" id="checkbox_role18" class="checkbox" disabled="disabled"/> 
                    <label for="checkbox_role18"></label>  
                </div>        
                <div class="checkbox-text5">记录办公室管理</div> 
            </div>
            <!-- 其他 fifth end-->
        </div>
        <!-- body end-->
    </div>
    <!-- 页面内容 end-->
</body>
</html>