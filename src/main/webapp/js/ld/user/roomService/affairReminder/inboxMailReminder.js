// 按关键字和提醒日期查询站内信信息(收件箱)
var searchInboxMailRemindersByPage = function(pageNum){

    var rid = Number($("#rid").attr("rid"));
	var keyword = $("#keyword").val();

    var dateStr = $(".pack_maintain").val();
    var remindDate = "";
    if(dateStr.trim() != "")
        remindDate = formatDateForm(new Date($(".pack_maintain").val()));

	console.log("查询关键字：" + keyword + " 提醒日期：" + remindDate + "的站内信信息");

	$.ajax({
		url:'/LD/reminder/searchInboxMailRemindersByPage.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
        data:JSON.stringify({"rid" : rid,
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
                        + "<td>" + perRecord.sender_NAME + "</td>"
                        + "<td>" + perRecord.title + "</td>"
                        + "<td>" + formatDateForm(new Date(perRecord.remind_DATE)) + "</td>"
                        + "<td>" + formatDateForm(new Date(perRecord.edit_TIME)) + "</td>"
                        + "<td>" + perRecord.state + "</td>"
                        + "<td>" + perRecord.receive_STATE + "</td>"
                        + "<td><a class='detail' href='detailMail.jsp?id="+ perRecord.id +"'>详情</a></td></tr>");
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
    searchInboxMailRemindersByPage(nowpage - 1);
};

// 拉取下一页 车费信息
var requestNextMailReminder = function(){
	var nowpage = parseInt($("#reminder_nowpage").val());
	var totalpage = parseInt($("#reminder_totalpage").text());
	if(nowpage == totalpage) return;
    searchInboxMailRemindersByPage(nowpage + 1);
};


//根据id号查询站内信记录的详情
var searchInboxMailReminderDetail = function(id){
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
                    $("#dropDownInput").val(record.sender_NAME);
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

//接受信件
var acceptMail = function(id) {

	console.log("接受"+ id + "号信件");
    $.ajax({
        url:'/LD/reminder/acceptMailById.action',
        type:'post',
        contentType:'application/json',
        dataType:'json',
        data:JSON.stringify({"id":id}),
        success:function(data){
            console.log(data);
            if(data !== 0){

                $("#receiveState").text("已接受");
                showModalBox("success","接受成功");
            } else {
                showModalBox("error","无操作权限");
            }
        }
    });

}

//回复信件
var replyMail = function(id) {

    console.log("回复"+ id + "号信件");
    $.ajax({
        url:'/LD/reminder/replyMailById.action',
        type:'post',
        contentType:'application/json',
        dataType:'json',
        data:JSON.stringify({"id":id, "reply": $("#reminderReply").val()}),
        success:function(data){
            console.log(data);
            if(data !== 0){

                $("#receiveState").text("已回复");
                showModalBox("success","回复成功");
            } else {
                showModalBox("error","无操作权限");
            }
        }
    });

}