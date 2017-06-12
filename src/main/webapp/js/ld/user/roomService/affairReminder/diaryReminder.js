// 按关键字和提醒日期查询个人日志信息
var searchDiaryReminderByPage = function(pageNum){

    var uid = Number($("#uid").attr("uid"));
	var keyword = $("#keyword").val();

    var dateStr = $(".pack_maintain").val();
    var remindDate = "";
    if(dateStr.trim() != "")
        remindDate = formatDateForm(new Date($(".pack_maintain").val()));

	console.log("查询关键字：" + keyword + " 提醒日期：" + remindDate + "的个人日志信息");

	$.ajax({
		url:'/LD/reminder/searchDiaryRemindersByPage.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
        data:JSON.stringify({"uid" : uid,
            "keyword" : keyword,
            "remindDate" : remindDate,
            "pageNum" : pageNum}),
		success:function(data){

			console.log(data);
			
			// 清空表格
			$("#reminderOverviewTbody").html("");
			$("#reminderOverviewBottom").html("");

			if (data.recordTotal == 0) {
				$("#reminderOverviewTbody").append("<tr><td colspan='6' style='color: #ff4d4d;'>没有相关信息！</td></tr>");
				return;
			} else {
				for (var i = 0; i < data.pageList.length; i++) {
					var perRecord = data.pageList[i];
					$("#reminderOverviewTbody").append("<tr>"

                        + "<td>" + perRecord.id + "</td>"
                        + "<td>" + perRecord.title + "</td>"
                        + "<td>" + formatDateForm(new Date(perRecord.remind_DATE)) + "</td>"
                        + "<td>" + formatDateForm(new Date(perRecord.edit_TIME)) + "</td>"
                        + "<td>" + perRecord.state + "</td>"
                        + "<td><a class='detail' href='editDiary.jsp?id="+ perRecord.id +"'>详情</a><a class='delete' onclick='requestDeleteDiaryReminder("+ perRecord.id +")'>删除</a></td></tr>");
				}
				// 添加车费 底部页码
				$("#reminderOverviewBottom").append("<div class='bottom-page'>"+
		        	"<span class='page-before' onclick='requestBeforeDiaryReminder();'>上一页&nbsp;&nbsp;</span>"+
		        	"<span><input id='reminder_nowpage' value='"+ data.pageNow +"' type='text' class='input_num'></span>"+
		        	"<span>&nbsp;/&nbsp;</span>"+
		        	"<span id='reminder_totalpage'>"+ data.pageTotal +"</span>"+
		            "<span class='page-next' onclick='requestNextDiaryReminder();'>&nbsp;&nbsp;下一页</span>" +
		            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ data.recordTotal +"&nbsp;</span>条记录</div>");
			}
		}
	});
};
//拉取上一页 车费信息
var requestBeforeDiaryReminder = function(){
	var nowpage = parseInt($("#reminder_nowpage").val());
	if(nowpage == 1) return;
    searchDiaryReminderByPage(nowpage - 1);
};

// 拉取下一页 车费信息
var requestNextDiaryReminder = function(){
	var nowpage = parseInt($("#reminder_nowpage").val());
	var totalpage = parseInt($("#reminder_totalpage").text());
	if(nowpage == totalpage) return;
    searchDiaryReminderByPage(nowpage + 1);
};

/////////////////////////////////////////////////////// 添加个人日志记录

// 请求添加个人日志
var requestAddDiaryReminder = function(){
	console.log("添加个人日志记录");

	// 其他字段输入结果
	var uid = Number($("#uid").attr("uid"));
	var title = $("#reminderTitle").val();
	var content = $("#reminderContent").val();
	var remindDate = formatDateForm(new Date($(".pack_maintain").val()));

	$.ajax({
		url:'/LD/reminder/addDiaryReminder.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify({"uid" : uid,
							 "title" : title,
							 "content" : content,
							 "remindDate" : remindDate}),
		success:function(data){
			console.log(data);
			if(data == 1){
				showModalBox("success","添加成功！");
			}else if(data == 0){
				showModalBox("error","添加失败！");
			}
		}
	});
};

//根据id号查询个人日志记录的详情
var searchDiaryReminderDetail = function(id){
	console.log("查询"+ id +"号其它车费记录");
	$.ajax({
		url:'/LD/reminder/searchDiaryReminderById.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify({"id":id}),
		success:function(data){
			console.log(data);
			if(data.State == "Valid"){
				if(data.record != null){
					record = data.record;


                    $("#reminderTitle").val(record.title);
                    $("#reminderContent").val(record.content);
                    $(".pack_maintain").val(formatDateForm(new Date(record.remind_DATE)));
				}
			} else {
				showModalBox("error","无操作权限");
			}
		}
	});
}

//根据id删除通勤车记录
var requestDeleteDiaryReminder = function(id){
	console.log("删除"+ id +"号个人日志记录");
	$.ajax({
		url:'/LD/reminder/deleteDiaryReminderById.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify({"id":id}),
		success:function(data){
			console.log(data);
			if(data == 1){
				showModalBox("success","删除成功");
                searchDiaryReminderByPage(1); //重新查一遍
			}else if(data == 0){
				showModalBox("error","删除失败");
			}
		}
	});
};

var updateDiaryReminder = function(id){
	
	console.log("请求更新"+id+"号个人日志记录");

    // 其他字段输入结果
    var title = $("#reminderTitle").val();
    var content = $("#reminderContent").val();
    var remindDate = formatDateForm(new Date($(".pack_maintain").val()));


	$.ajax({
		url:'/LD/reminder/updateDiaryReminderById.action',
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