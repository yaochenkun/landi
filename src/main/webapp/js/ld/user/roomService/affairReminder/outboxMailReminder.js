//拉取所有用户存入下拉菜单
var searchAllUsers = function() {

    $.ajax({
        url:'/LD/HomeUser/searchAllUsers.action',
        type:'get',
        dataType:'json',
        success:function(data){

            console.log(data);
			if(data.record != null) {

				//放入下拉列表
				for(var i = 0; i < data.record.length; i++)
					$(".dropDownMenu ul").append("<li style='height:30px;' rid='"+ data.record[i].id +"'>"+ data.record[i].username +"</li>");

                // 选择问题分类
                $(".dropDownMenu ul li").click(function(){
					var id = Number($(this).attr('rid'));
                    var username = $(this).text();

                    var curVal = $("#dropDownInput").val().trim();
                    var curRid = $("#dropDownInput").attr("rid").trim();


                    $("#dropDownInput").val(curVal === '' ? username : curVal + "," + username);
                    $("#dropDownInput").attr("rid", curRid === '' ? id : curRid + "," + id);
                });

			}
        }
    });
};



// 按关键字和提醒日期查询站内信信息(发件箱)
var searchMailReminderByPage = function(pageNum){

    var sid = Number($("#sid").attr("sid"));
	var keyword = $("#keyword").val();

    var dateStr = $(".pack_maintain").val();
    var remindDate = "";
    if(dateStr.trim() != "")
        remindDate = formatDateForm(new Date($(".pack_maintain").val()));

	console.log("查询关键字：" + keyword + " 提醒日期：" + remindDate + "的站内信信息");

	$.ajax({
		url:'/LD/reminder/searchMailRemindersByPage.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
        data:JSON.stringify({"sid" : sid,
            "keyword" : keyword,
            "remindDate" : remindDate,
            "pageNum" : pageNum}),
		success:function(data){

			console.log(data);
			
			// 清空表格
			$("#reminderOverviewTbody").html("");
			$("#reminderOverviewBottom").html("");

			if (data.recordTotal == 0) {
				$("#reminderOverviewTbody").append("<tr><td colspan='7' style='color: #ff4d4d;'>没有相关信息！</td></tr>");
				return;
			} else {
				for (var i = 0; i < data.pageList.length; i++) {
					var perRecord = data.pageList[i];
					$("#reminderOverviewTbody").append("<tr>"

                        + "<td>" + perRecord.id + "</td>"
                        + "<td>" + perRecord.receiver_NAME + "</td>"
                        + "<td>" + perRecord.title + "</td>"
                        + "<td>" + formatDateForm(new Date(perRecord.remind_DATE)) + "</td>"
                        + "<td>" + formatDateForm(new Date(perRecord.edit_TIME)) + "</td>"
                        + "<td>" + perRecord.state + "</td>"
                        + "<td>" + perRecord.receive_STATE + "</td>"
                        + "<td><a class='detail' href='editMail.jsp?id="+ perRecord.id +"'>详情</a><a class='delete' onclick='requestDeleteMailReminder("+ perRecord.id +")'>撤回</a></td></tr>");
				}
				// 添加车费 底部页码
				$("#reminderOverviewBottom").append("<div class='bottom-page'>"+
		        	"<span class='page-before' onclick='requestBeforeMailReminder();'>上一页&nbsp;&nbsp;</span>"+
		        	"<span><input id='reminder_nowpage' value='"+ data.pageNow +"' type='text' class='input_num'></span>"+
		        	"<span>&nbsp;/&nbsp;</span>"+
		        	"<span id='reminder_totalpage'>"+ data.pageTotal +"</span>"+
		            "<span class='page-next' onclick='requestNextMailReminder();'>&nbsp;&nbsp;下一页</span>" +
		            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ data.recordTotal +"&nbsp;</span>条记录</div>");
			}
		}
	});
};


//拉取上一页 车费信息
var requestBeforeMailReminder = function(){
	var nowpage = parseInt($("#reminder_nowpage").val());
	if(nowpage == 1) return;
    searchMailReminderByPage(nowpage - 1);
};

// 拉取下一页 车费信息
var requestNextMailReminder = function(){
	var nowpage = parseInt($("#reminder_nowpage").val());
	var totalpage = parseInt($("#reminder_totalpage").text());
	if(nowpage == totalpage) return;
    searchMailReminderByPage(nowpage + 1);
};

/////////////////////////////////////////////////////// 添加站内信记录

// 请求添加站内信
var requestAddMailReminder = function(){
	console.log("添加站内信记录");

	// 其他字段输入结果
	var rid = $("#dropDownInput").attr("rid"); //接受者id
    var rname = $("#dropDownInput").val(); //接受者name

	if(rid === '' ||  rname === '') {
		alert("收件人不能为空！");
		return;
	}


	var sid = Number($("#sid").attr("sid")); //发送者id
	var sname = $("#sid").attr("sname"); //发送者name

	var title = $("#reminderTitle").val();
	var content = $("#reminderContent").val();
	var remindDate = formatDateForm(new Date($(".pack_maintain").val()));

	$.ajax({
		url:'/LD/reminder/addMailReminder.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify({"rid" : rid,
			 				 "rname" : rname,
							 "sid" : sid,
            				 "sname" : sname,
							 "title" : title,
							 "content" : content,
							 "remindDate" : remindDate}),
		success:function(data){
			console.log(data);
			if(data == 1){
				showModalBox("success","发送成功！");
			}else if(data == 0){
				showModalBox("error","发送失败！");
			}
		}
	});
};

//根据id号查询站内信记录的详情
var searchMailReminderDetail = function(id){
	console.log("查询"+ id +"号其它车费记录");
	$.ajax({
		url:'/LD/reminder/searchMailReminderById.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify({"id":id}),
		success:function(data){
			console.log(data);
			if(data.State == "Valid"){
				if(data.record != null){
					record = data.record;

					$("#receiveState").text(record.receive_STATE);
                    $("#dropDownInput").val(record.receiver_NAME);
                    $("#reminderTitle").val(record.title);
                    $("#reminderContent").val(record.content);
                    $("#reminderReply").val(record.reply);
                    $(".pack_maintain").val(formatDateForm(new Date(record.remind_DATE)));
				}
			} else {
				showModalBox("error","无操作权限");
			}
		}
	});
}

//根据id删除通勤车记录
var requestDeleteMailReminder = function(id){
	console.log("删除"+ id +"号站内信记录");
	$.ajax({
		url:'/LD/reminder/deleteMailReminderById.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify({"id":id}),
		success:function(data){
			console.log(data);
			if(data == 1){
				showModalBox("success","删除成功");
                searchMailReminderByPage(1); //重新查一遍
			}else if(data == 0){
				showModalBox("error","删除失败");
			}
		}
	});
};

var updateMailReminder = function(id){
	
	console.log("请求更新"+id+"号站内信记录");

    // 其他字段输入结果
    // var rid = $("#dropDownInput").attr("rid")); //接受者id
    // var rname =  $("#dropDownInput").val();//接受者name
    var title = $("#reminderTitle").val();
    var content = $("#reminderContent").val();
    var remindDate = formatDateForm(new Date($(".pack_maintain").val()));


	$.ajax({
		url:'/LD/reminder/updateMailReminderById.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
        data:JSON.stringify({"id" : id,
            				 "title" : title,
            				 "content" : content,
            				 "remindDate" : remindDate}),
		success:function(data){
			console.log(data);
			if(data == 1){
				showModalBox("success","更新成功！");
			}else if(data == 0){
				showModalBox("error","更新失败！");
			}
		}
	});
};

//清空收件人多选项
var clearReceivers = function() {

    $("#dropDownInput").val("");
    $("#dropDownInput").attr("rid", "");
}