// 定义全局对象保存 角色-名称 对应关系
let roleMap = {};

// 用户管理拉取第一页用户
var requestFirstUser = function(){
	requestAjaxUserList(parseInt(1));    
}

//获取角色信息保存至全局变量中
let requestAjaxRoleArraySave = function(){
	console.log("request Ajax role");
	$.ajax({
		type:'post',
		url:'/LD/HomeAdmin/requestRole.action',
		success:function(data){			
			//逐条保存角色 数值-名称对应关系
			for(let item in data){
				//console.log(item);   //key
				//console.log(data[item]);  //value
				roleMap[item] = data[item];
			}
			requestFirstUser();
		}
	});	
}

// 拉取 上一页用户
var requestBeforeUser = function(){
	var nowpage = parseInt($("#userlist_nowpage").val());
	if(nowpage == 1) return;
	requestAjaxUserList(nowpage-1);
}

// 拉取 下一页用户 （??当前处理，前端判断是否是最后一页）
var requestNextUser = function(){
	var nowpage = parseInt($("#userlist_nowpage").val());
	var totalpage = parseInt($("#userlist_totalpage").text());
	if(nowpage == totalpage) return;
	requestAjaxUserList(nowpage+1);
}

//Ajax请求用户列表
var requestAjaxUserList = function(pageNum){
	console.log("Ajax request userList");
	$.ajax({
		type:'post',
		url: "/LD/HomeAdmin/searchUserList/"+ pageNum +'.action',
		success:function(data){
			console.log(data);
			//?? 转成Json格式
			var JsonData = data;
            //var JsonData = JSON.parse(data);
            var totalPage = JsonData.pageTotal;
            var nowPage = JsonData.pageNow;
            
            //清空 user的table 和页码
            $("#users_table").html("");
			$("#userBottom").html("");
			
			// 添加用户表的title
			var tabletitle = $("<tr><td>用户编号</td><td>用户名</td><td>姓名</td>"+
                         "<td>工号</td><td>部门</td><td>职务（角色）</td><td>最近登录时间</td><td>操作</td></tr> ");
			$("#users_table").append(tabletitle);
			
			//添加每一行用户信息
            for(var i=0; i<JsonData.pageList.length; i++){
            	var peruser = JsonData.pageList[i];
            	
                // 将时间戳变为2016-12-12显示          	
            	var date = new Date(peruser.ltime);
            	var showDate = date.toLocaleDateString().replace(/\//g,"-");
            	//console.log(showDate);
            	
            	var tr = $("<tr><td>"+ peruser.id +"</td>"+
            		 "<td>"+ peruser.username +"</td>"+"<td>"+ peruser.name +"</td>"+
            	     "<td>"+ peruser.num +"</td>"+"<td>"+ peruser.depart +"</td>"+
            	     "<td>"+ roleMap[peruser.role] +"</td>"+"<td>"+ showDate +"</td>"+
            	     "<td><span onclick=\"resetPasswd("+ peruser.id + ",'" + peruser.username +"');\" class='spanblue'>重置密码&nbsp;&nbsp;</span>"+
            	     "<span onclick=\"deleteUser("+ peruser.id +",'"+ peruser.username +"')\" class='spanred'>禁用</span></td></tr>");
                $("#users_table").append(tr);
            }
            
            //添加用户列表 底部页码
            var bottomPage = $("<div class='bottom-page'>"+
            	"<span class='page-before' onclick='requestBeforeUser();'>上一页&nbsp;&nbsp;</span>"+
            	"<span><input id='userlist_nowpage' value='"+ nowPage +"' type='text' class='input_num'></span>"+
            	"<span>&nbsp;/&nbsp;</span>"+
            	"<span id='userlist_totalpage'>"+ totalPage +"</span>"+
                "<span class='page-next' onclick='requestNextUser();'>&nbsp;&nbsp;下一页</span></div>");
            $("#userBottom").append(bottomPage);
		}
	});
}

// 重置密码
var resetPasswd = function(id,username){
	console.log(id);
	console.log(username);
	// 发送重置密码请求
//	$.ajax({
//		type:'post',
//		url:'/LD/HomeAdmin/resetPasswd/'+ parseInt(id) +'.action',
//		success:function(data){
//			
//		}
//	});
	showDialogPasswdSuccess(username);
}

// 显示重置密码成功界面
var showDialogPasswdSuccess =function(username){
	// $(".dialog-success").slideDown(1000);
	$(".dialog-resetPasswd-success h4").html("用户&nbsp;"+ username +"&nbsp;密码重置成功！");
	$(".dialog-resetPasswd-success").animate({top:"30%"},500);
}
// 隐藏重置密码成功界面
var hideDialogPasswdSuccess = function(){
	$(".dialog-resetPasswd-success").animate({top:"-20%"},500);
}

// 删除用户
var deleteUser = function(id,username){
	// 发出删除用户请求
//	$.ajax({
//		type:'post',
//		url:'/LD/HomeAdmin/deleteUser/'+ parseInt(id) +'.action',
//		success:function(data){
//			
//		}
//	});
	showDialogDeleteSuccess(username);
}

//显示成功删除用户界面
showDialogDeleteSuccess = function(username){
	$(".dialog-deleteUser-success h4").html("成功删除用户&nbsp;" + username);
	$(".dialog-deleteUser-success").animate({top:"30%"},500);
}

//隐藏成功删除用户界面
hideDialogDeleteSuccess = function(){
	$(".dialog-deleteUser-success").animate({top:"-20%"},500);
}
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

$("#AdminName, #AdminUsername").change(function(){
	console.log("12");
	$("#AdminUsername").removeClass("form-control-red");
});

// 添加用户，发送Json格式数据
var requestAjaxAddUser = function(){
	let username = $("#AdminUsername").val();
	let name = $("#AdminName").val();
	let num = $("#AdminNum").val();
	let depart = $("#AdminDepart").text();
	let role = parseInt($("#AdminRoleSpan").text());
	
	if(username==""){
		console.log("用户名为空！");
		$("#AdminUsername").addClass("form-control-red");
		return;
	}
	

	$.ajax({
		type:'post',
		url:'/LD/HomeAdmin/addUser.action',
	    contentType:'application/json',
		//data:'{"ID":123,"USERNAME":"haha","NAME":"123","NUM":1,"DEPART":"123","ROLE":1,"AUTH":262143}',
	    data:'{"USERNAME":"'+ username +'","NAME":"'+ name +'","NUM":"'+ num +'",'+
	         '"DEPART":"'+ depart +'","ROLE":'+ role +'}',
	    dataType:'json',
		success:function(data){
			console.log(data);
		}
	});
}

// 获取部门信息
var requestAjaxDepart = function(){
	console.log("request Ajax depart");
	$.ajax({
		type:'post',
		url:'/LD/HomeAdmin/requestDepart.action',
		success:function(data){
			//console.log(data);
			
			// 清空部门下拉菜单
			$("#AdminDepartMenu").html("");
			$("#AdminDepartMenu").append("<ul id='AdminDepartUL'></ul>");
			// 逐条添加部门下拉菜单
			for(var i=0; i<data.departList.length; i++){
				//console.log(data.departList[i]);
				$("#AdminDepartUL").append("<li onclick='chooseAdminDepart(this);'>"+ data.departList[i] +"</li>");
			}
		}
	});			
}

// 选择用户部门
var chooseAdminDepart = function(li){
	//console.log($(li).index());
	//console.log($(li).text());
	$("#AdminDepart").html($(li).text()+"<span class='caret'></span>");
	// 清空部门下拉菜单
	$("#AdminDepartMenu").html("");
}

//获取角色信息
var requestAjaxRole = function(){
	console.log("request Ajax role");
	$.ajax({
		type:'post',
		url:'/LD/HomeAdmin/requestRole.action',
		success:function(data){
			// {,,,}
			//console.log(data);
			
			// 清空角色下拉菜单
			$("#AdminRoleMenu").html("");
			$("#AdminRoleMenu").append("<ul id='AdminRoleUL'></ul>");
			
			//逐条添加角色下拉菜单
			for(let item in data){
				//console.log(item);   //key
				//console.log(data[item]);  //value
				$("#AdminRoleUL").append("<li id='AdminRole"+ item +"' "+
				  "onclick='chooseAdminRole(this);'>"+ data[item] +"</li>");
			}
		}
	});	
}

// 选择用户角色
var chooseAdminRole = function(li){
	//console.log($(li).index());
	//console.log($(li).text());
	$("#AdminRole").html($(li).text()+"<span class='caret'></span>");
	$("#AdminRole").append("<span style='display:none;' id='AdminRoleSpan'>"+ $(li).attr("id").substring(9) +"</span>")
	// 清空角色下拉菜单
	$("#AdminRoleMenu").html("");
}


//设置下拉菜单隐藏事件
$(function(){
	$(document).bind("click",function(e){
		var target = $(e.target);
		//console.log(target);
		//console.log(target.closest("#AdminDepart").length);
		// 没有点击 AdminDepart
		if(target.closest("#AdminDepart").length==0){
			$("#AdminDepartMenu").hide();
		}
		else{
			$("#AdminDepartMenu").show();
		}
		// 没有点击 AdminRole
		if(target.closest("#AdminRole").length==0){
			$("#AdminRoleMenu").hide();
		}
		else
			$("#AdminRoleMenu").show();
		
	});
});















