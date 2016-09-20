// 请求当前角色内容
var requestAjaxRoleChange = function(){
	$.ajax({
		type:'post',
		url:'/LD/HomeAdmin/requestRole.action',
		success:function(data){
			// {,,,}
			//console.log(data);
			
			// 清空角色下拉菜单
			$("#RoleEditMenu").html("");
			$("#RoleEditMenu").append("<ul id='RoleEditUL'></ul>");
			
			//逐条添加角色下拉菜单
			for(let item in data){
				//console.log(item);   //key
				//console.log(data[item]);  //value
				$("#RoleEditUL").append("<li id='RoleEdit"+ item +"' "+
				  "onclick='chooseRoleEdit(this);'>"+ data[item] +"</li>");
			}
		}
	});	
}

//选择用户角色
var chooseRoleEdit = function(li){
	//console.log($(li).index());
	//console.log($(li).text());
	$("#RoleEdit").html($(li).text()+"<span class='caret'></span>");
	$("#RoleEdit").append("<span style='display:none;' id='RoleEditSpan'>"+ $(li).attr("id").substring(8) +"</span>")
	// 清空角色下拉菜单
	$("#RoleEditMenu").html("");
		
	// 发出请求获取角色对应的权限
	requestAjaxRoleAuth(parseInt($("#RoleEditSpan").text()));
}

//发出请求获取角色对应的权限
var requestAjaxRoleAuth = function(role){
	console.log("request ajax RoleAuth");
	$.ajax({
		type:'post',
		url:'/LD/HomeAdmin/requestCap/'+ role +'.action',
		success:function(data){
			//console.log(data);
			//$("#checkbox_role11").
			// 遍历每个复选框
//			$('input[type="checkbox"]').each(function(){
//				$(this).attr("checked");
//			});
			// 取消选中
			for(let k=1; k<=18; k++){
				$("#checkbox_role" + k).removeAttr("checked");
			}			
			
			// 更新复选框选中状态
			for(let i=1; i<=18; i++){
				let curCheck = data % 2;
				data = parseInt(data/2);
				//console.log(curCheck);
				if(curCheck==1){
					// 添加选中状态
					$("#checkbox_role" + i).prop("checked",true);
				}
			}
		}
	});
}

// 提交变更后的角色权限 !!目前系统不能变更角色权限
//var requestEditRoleAuth = function(){
//	// 获取当前
//	var res = "";
//	for(let i=18; i>=1; i--){
//		if($("#checkbox_role" + i).is(":checked")){
//			res += 1;
//		}
//		else
//			res+=0;		
//	}
//	let role = parseInt(res,2);
//	console.log(res);
//	console.log(parseInt(res,2));
//	$.ajax({
//		type:'post',
//		url:'/LD/HomeAdmin/setRate/'+ role +'.action',
//		success:function(data){
//			//console.log(data);
//		}
//	});
//}



