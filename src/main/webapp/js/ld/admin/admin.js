// 用户管理拉取第一页用户
var requestFirstUser = function(){
	requestAjaxUserList(parseInt(1));    
}

// 拉取 上一页用户
var requestBeforeUser = function(){
	var nowpage = parseInt($("#userlist_nowpage").val());
	if(nowpage == 1) return;
	requestAjaxUserList(nowpage-1);
}

// 拉取 下一页用户
var requestNextUser = function(){
	var nowpage = parseInt($("#userlist_nowpage").val());
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
            //var totalPage = JsonData.pageTotal;
            var totalPage =1;
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
            	var tr = $("<tr><td>"+ peruser.id +"</td>"+
            		 "<td>"+ peruser.username +"</td>"+"<td>"+ peruser.name +"</td>"+
            	     "<td>"+ peruser.num +"</td>"+"<td>"+ peruser.depart +"</td>"+
            	     "<td>"+ peruser.role +"</td>"+"<td>"+ peruser.ltime +"</td>"+
            	     "<td><span>修改</span></td></tr>");
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
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

// 添加用户，发送Json格式数据
var requestAjaxAddUser = function(){
	let username = $("#AdminUsername").val();
	let name = $("#AdminName").val();
	let num = $("#AdminNum").val();
	let depart = $("#AdminDepart").text();
	let role = parseInt($("#AdminRoleSpan").text());

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

















