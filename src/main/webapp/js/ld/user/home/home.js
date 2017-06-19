//获取事务提醒数据
requestReminder = function(uid, remindDate) {

    $.ajax({
        url:'/LD/reminder/searchReminderByDate.action',
        type:'post',
        contentType:'application/json',
        dataType:'json',
        data:JSON.stringify({"uid" : uid,
            "remindDate" : remindDate}),
        success:function(data){
            console.log(data);


            //在右侧事件栏添加事件
			parentUl  = $(".event-content");
            parentUl.empty();

			//个人日志
            if(data.diaryReminder != null && data.diaryReminder.length > 0) {
				for(var i = 0; i < data.diaryReminder.length; i++)
                	appendEventItem(parentUl, data.diaryReminder[i], 'diaryReminder');
			}

			//站内信
            if(data.mailReminder != null && data.mailReminder.length > 0) {
                for(var i = 0; i < data.mailReminder.length; i++)
                    appendEventItem(parentUl, data.mailReminder[i], 'mailReminder');
            }

            //系统提醒
            if(data.systemReminder != null && data.systemReminder.length > 0) {
                for(var i = 0; i < data.systemReminder.length; i++)
                    appendEventItem(parentUl, data.systemReminder[i], 'systemReminder');
            }

        }
    });
}

requestRemindDays = function(uid, month) {

    $.ajax({
        url:'/LD/reminder/searchRemindDays.action',
        type:'post',
        contentType:'application/json',
        dataType:'json',
        data:JSON.stringify({"uid" : uid, "month" : month}),
        success:function(data){
            console.log(data);

            (data.dataList).map(function(day){
                $(".calendar-day-" + day).children('span').addClass("highlightColor");
            });

        }
    });
}

appendEventItem = function(parentUl, reminder, reminderType) {

	var stateIcon = reminder.state == '完成' ? 'ok' : 'remove';
    parentUl.append('<li class="event-item" onclick="requestReminderDetail('+ reminder.id +', \'' + reminderType + '\')"><span class="glyphicon glyphicon-'+ stateIcon +'"></span><span>'+ reminder.title + '</span></li>')
}

//请求reminderType类型、id的事件详情
requestReminderDetail =  function(id, reminderType) {

	//弹出详情对话框
    $(".shadow").css("display","block");
    $('#reminderDetailMenu').css("display","block");

    setTimeout(function(){$('#reminderDetailMenu').addClass('showMenuModal');},50);
    $("#reminderDetailMenu").addClass("effect-fade");


    //请求查询
    console.log("查询"+ id +"号" + reminderType +"事务记录");
    $.ajax({
        url:'/LD/reminder/searchReminderById_Type.action',
        type:'post',
        contentType:'application/json',
        dataType:'json',
        data:JSON.stringify({"id":id, "reminderType": reminderType}),
        success:function(data){
            console.log(data);
            if(data.State == "Valid"){
                if(data.record != null){
                    record = data.record;

                    $("#reminderTitle").val(record.title);
                    $("#reminderContent").val(record.content);


                    //把id和reminderType记录在finish按钮上
                    $("#finishBtn").attr("reminderId", id);
                    $("#finishBtn").attr("reminderType", reminderType)

                    //完成按钮
                    if(record.state == "未完成") {
                        $("#finishBtn").text("确定完成");
                        $("#finishBtn").removeAttr("disabled");
					} else {
                        $("#finishBtn").text("已完成");
                        $("#finishBtn").attr("disabled", "true");
					}
                }
            } else {
                showModalBox("error","无操作权限");
            }
        }
    });
}

//请求完成事务
var requestFinishReminder = function(element, uid) {

	if($(element).text() == "已完成")
		return;

    console.log("请求完成" + id + "号" + reminderType + "事务记录");

	var id = $("#finishBtn").attr("reminderId");
	var reminderType =  $("#finishBtn").attr("reminderType");

    $.ajax({
        url:'/LD/reminder/updateReminderStateById_Type.action',
        type:'post',
        contentType:'application/json',
        dataType:'json',
        data:JSON.stringify({"id":id, "reminderType": reminderType}),
        success:function(data){
            console.log(data);
            if(data == 1){
                showModalBox("success","成功完成!");
                closeReminderDetailDiv();

                //重新查一遍
                var currentDate = $("#currentDate").text();
                requestReminder(uid, currentDate);

            } else {
                showModalBox("error","完成失败");
            }
        }
    });
}

//让未来的日期也可以点击
var setFutureDaysClickable = function() {
    $('.day').each(function() {
        $(this).addClass("past");
    });
}


// 关闭事务详情弹出框
var closeReminderDetailDiv = function(){
    $(".shadow").css("display","none");
    $("#reminderDetailMenu").removeClass('showMenuModal');
    setTimeout(function(){$("#reminderDetailMenu").css("display","none");},200);
};


// 获取角色信息保存至全局变量中
requestAjaxRoleArraySave = function(){
	// console.log("request Ajax role");
	
	$.ajax({
		type:'post',
		url:'/LD/HomeUser/requestRole.action',
		success:function(data){			
			console.log(data);
			//逐条保存角色 数值-名称对应关系
			for(item in data){
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

			//刷新当前页面重新获取session
			window.location.href = "http://" + window.location.host + "/LD/views/user/home/homeUser.jsp";
		}
	});
}



