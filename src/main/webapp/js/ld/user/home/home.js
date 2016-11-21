// 获取角色信息保存至全局变量中
let requestAjaxRoleArraySave = function(){
	// console.log("request Ajax role");
	
	$.ajax({
		type:'post',
		url:'/LD/HomeUser/requestRole.action',
		success:function(data){			
			console.log(data);
			//逐条保存角色 数值-名称对应关系
			for(let item in data){
				// console.log(item);   //key
				// console.log(data[item]);  //value
				if($("#roleTypeNum").text()==item){
					$("#roleTypeContent").text(data[item]);
				}
			}
			
		}
	});	
}

// 触发修改密码模态框
var showEditPasswordModal = function(){
	$("#editPassword").modal();
}

// 确认修改密码
var changePassword = function(){
	$("#editPassword p").eq(2).css("visibility","hidden");
	if($("#editPassword input").eq(0).val()!=$("#editPassword input").eq(1).val()){
		// 提醒两次输入的密码不一致
		$("#editPassword p").eq(2).text("两次输入的密码不一致！！请重新输入！").css("visibility","visible");
		return;
	}
		
	if($("#editPassword input").eq(0).val()==""){
		$("#editPassword p").eq(2).text("密码不能为空！！").css("visibility","visible");
		return;
	}
	
	$("#editPassword").modal("hide");
	$.ajax({
		type:'post',
		url:'/LD/HomeUser/changePassword.action',
		contentType:'application/json',
		data:'{"password":"'+$("#editPassword input").eq(0).val() +'"}',
		dataType:"json",
		success:function(data){
			console.log(data);
			alert("密码修改成功！");
		}
	});
}



