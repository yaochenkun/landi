var unitPrice = 0; //单价

(function(){
	
	$("#serviceRoomNumber").focus(function(){
		$(this).removeClass("border-red");
		$("#roomIdWarning").css("display","none");
	});

	//为所有单选框设置更新合计计算响应
	$("#newBusComTable input").click(function(){
	
		selection = $(this).prop("checked");
		if(selection == false) {
			oriTotal = $("#monthTotal").val();
			$("#monthTotal").val(Number(oriTotal) - unitPrice);
		} else {
			oriTotal = $("#monthTotal").val();
			$("#monthTotal").val(Number(oriTotal) + unitPrice);
		}
	});

})();

///////////////////////////////////////////////////////条件查询车费信息
// 按房间号和日期查询车费信息
var searchFareByDate = function(pageNum, date){

	var roomNum = $("#searchRoomNum").val();
	var date = date || $("#month_picker").text();
	console.log("查询房间号：" + roomNum + " 日期：" + date + "的车费信息");
	$.ajax({
		url:'/LD/userRoom/searchFares.action',
		type:'post',
		dataType:'json',
		data:'{"pageNum":'+ pageNum +',"date":"'+ date +'","roomNum":"'+ roomNum +'"}',
		contentType:'application/json',
		success:function(data){
			console.log(data);
			
			// 清空表格和页码
			$("#busTable").html("");
			$("#serviceBusBottom").html("");

			if (data.recordTotal == 0) {
				$("#busTable").append("<tr><td colspan='9' class='emptyText'>没有相关信息！</td></tr>");
			} else {

				for(var i = 0; i < data.dataList.length; i++){
					var perRecord = data.dataList[i];
					$("#busTable").append(
						"<tr><td>"+ perRecord.room_NUM +"</td><td>"+ perRecord.guest_NAME +"</td>"+
						"<td>"+ perRecord.days +"</td><td>"+ perRecord.total +"&nbsp;元</td>"+
						"<td>"+ perRecord.year + "-" + perRecord.month +"</td>"+
						"<td>"+ perRecord.other_PEOPLE +"</td>"+
						"<td>"+ formatDate(new Date(perRecord.import_TIME)) +"</td>"+
						"<td>"+ formatDate(new Date(perRecord.edit_TIME)) +"</td>"+
						"<td><a id='editCom' href='serviceBusComEdit.jsp?id="+ perRecord.id +"'>编辑</a><a id='deleteCom' onclick='serviceBusComDelete("+ perRecord.id +")'>删除</a></td></tr>");
				}
				
				// 添加洗衣单收费 底部页码
				$("#serviceBusBottom").append("<div class='bottom-page'>"+
		        	"<span class='page-before' onclick='requestBeforeFareByDate();'>上一页&nbsp;&nbsp;</span>"+
		        	"<span><input id='fare_nowpage' value='"+ data.pageNow +"' type='text' class='input_num'></span>"+
		        	"<span>&nbsp;/&nbsp;</span>"+
		        	"<span id='fare_totalpage'>"+ data.pageTotal +"</span>"+
		            "<span class='page-next' onclick='requestNextFareByDate();'>&nbsp;&nbsp;下一页</span>" +
		            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ data.recordTotal +"&nbsp;</span>条记录</div>");
			}
		}
	});
};
//拉取上一页 车费信息
var requestBeforeFareByDate = function(){
	var nowpage = parseInt($("#fare_nowpage").val());
	if(nowpage == 1) return;
	searchFareByDate(nowpage - 1);
};

// 拉取下一页 车费信息
var requestNextFareByDate = function(){
	var nowpage = parseInt($("#fare_nowpage").val());
	var totalpage = parseInt($("#fare_totalpage").text());
	if(nowpage == totalpage) return;
	searchFareByDate(nowpage + 1);
};

/////////////////////////////////////////////////////// 添加车费记录
var addserviceBus = function(){
	// 判断房间号是否为空
	if($("#serviceRoomNumber").val() == ""){
		$("#roomIdWarning").css("display","block");
		$("#serviceRoomNumber").addClass("border-red");
		console.log("房间号为空！");
		return;
	}
	requestAddServiceBus();
};

// 查询（本月）某个房间的通勤车记录
var searchBusCom = function(){
	// 判断房间号是否为空
	if($("#serviceRoomNumber").val() == ""){
		$("#roomIdWarning").css("display","block");
		$("#serviceRoomNumber").addClass("border-red");
		console.log("房间号为空！");
		return;
	}
	var roomNum = $("#serviceRoomNumber").val();
	var datearr = $("#newBusDate").val().split("-");
	var date = datearr[0] + "-" + datearr[1];

	$.ajax({
		url:'/LD/userRoom/searchFare.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		data:'{"roomNum":"'+ roomNum +'","date":"'+ date +'","pageNum":1}',
		success:function(data){
			console.log(data);
			
			// 显示表格及确认添加按钮
			$("#newBusComTable").css("display", "table");
			$(".monthTotalLi").css("display", "block");
	
			// 清空表格
			for (var i = 0; i < 31; i++) {
				$("#newBusComTable input").eq(i).removeAttr("checked");
			}	
			
			//更新单价
			unitPrice = data.unitPrice;	
			
			var record = data.record;
			if (record == null) {
				$("#monthTotal").val(0); //本月合计从0开始
				return;
			} 
					
			// 更新复选框为选中状态
			if(record.first == 1) $("#newBusComTable input").eq(0).prop("checked",true);
			if(record.second == 1) $("#newBusComTable input").eq(1).prop("checked",true);
			if(record.third == 1) $("#newBusComTable input").eq(2).prop("checked",true);
			if(record.fourth == 1) $("#newBusComTable input").eq(3).prop("checked",true);
			if(record.fifth == 1) $("#newBusComTable input").eq(4).prop("checked",true);
			if(record.sixth == 1) $("#newBusComTable input").eq(5).prop("checked",true);
			if(record.seventh == 1) $("#newBusComTable input").eq(6).prop("checked",true);
			if(record.eighth == 1) $("#newBusComTable input").eq(7).prop("checked",true);
			if(record.ninth == 1) $("#newBusComTable input").eq(8).prop("checked",true);
			if(record.tenth == 1) $("#newBusComTable input").eq(9).prop("checked",true);
			if(record.eleventh == 1) $("#newBusComTable input").eq(10).prop("checked",true);
			if(record.twelfth == 1) $("#newBusComTable input").eq(11).prop("checked",true);
			if(record.thirteenth == 1) $("#newBusComTable input").eq(12).prop("checked",true);
			if(record.fourteenth == 1) $("#newBusComTable input").eq(13).prop("checked",true);
			if(record.fifteenth == 1) $("#newBusComTable input").eq(14).prop("checked",true);
			if(record.sixteenth == 1) $("#newBusComTable input").eq(15).prop("checked",true);
			if(record.seventeenth == 1) $("#newBusComTable input").eq(16).prop("checked",true);
			if(record.eighteenth == 1) $("#newBusComTable input").eq(17).prop("checked",true);
			if(record.nineteenth == 1) $("#newBusComTable input").eq(18).prop("checked",true);
			if(record.twentieth == 1) $("#newBusComTable input").eq(19).prop("checked",true);
			if(record.twenty_FIRST == 1) $("#newBusComTable input").eq(20).prop("checked",true);
			if(record.twenty_SECOND == 1) $("#newBusComTable input").eq(21).prop("checked",true);
			if(record.twenty_THIRD == 1) $("#newBusComTable input").eq(22).prop("checked",true);
			if(record.twenty_FOURTH == 1) $("#newBusComTable input").eq(23).prop("checked",true);
			if(record.twenty_FIFTH == 1) $("#newBusComTable input").eq(24).prop("checked",true);
			if(record.twenty_SIXTH == 1) $("#newBusComTable input").eq(25).prop("checked",true);
			if(record.twenty_SEVENTH == 1) $("#newBusComTable input").eq(26).prop("checked",true);
			if(record.twenty_EIGHTH == 1) $("#newBusComTable input").eq(27).prop("checked",true);
			if(record.twenty_NINTH == 1) $("#newBusComTable input").eq(28).prop("checked",true);
			if(record.thirtieth == 1) $("#newBusComTable input").eq(29).prop("checked",true);
			if(record.thirty_FIRST == 1) $("#newBusComTable input").eq(30).prop("checked",true);
			
			//更新单价
			unitPrice = data.unitPrice;
			
			//更新本月合计
			$("#monthTotal").val(record.total);
		}
	});
}
// 请求添加车费记录
var requestAddServiceBus = function(){
	console.log("添加车费记录");
	var roomNum = $("#serviceRoomNumber").val();
	var datearr = $("#newBusDate").val().split("-");
	var date = datearr[0] + "-" + datearr[1];
	var name = $("#guestName").val();
	var othersName = $("#othersName").val();

	// 遍历日期
	var perRecord = "";
	for(var i = 0; i < 31; i++){
		// var price = $("table input").eq(i).val();
		var isRecord = $("table input").eq(i).is(":checked") == true ? 1 : 0;
		perRecord += '{"day":'+ (i + 1) +',"selection":'+ isRecord +'},';
	}
	if(perRecord != ""){
		perRecord = perRecord.substring(0, perRecord.length -1);
	}
	console.log(perRecord);

	$.ajax({
		url:'/LD/userRoom/addFare.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:'{"date":"'+ date +'","roomNum":"'+ roomNum +'","name":"'+ name +'",'
			+'"perRecord":['+ perRecord +']' + ',"othersName":"'+ othersName +'"}',
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

////////////////////////////////////////////本编辑通勤车记录
// 根据id查询通勤车记录
var searchBusComEdit = function(id){

	$.ajax({
		url:'/LD/userRoom/searchFareById.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		data:'{"id":'+ id +'}',
		success:function(data){
			console.log(data);

			if (data.record == null) {
				showModalBox("error","未找到相关信息");
				return;
			} 
			
			//表上的房间号、时间、客人姓名
			$("#editServiceBusDate").val(data.record.year + "-" + data.record.month);
			$("#editServiceBusRoomNum").val(data.record.room_NUM);
			$("#editGuestName").val(data.record.guest_NAME);
			$("#editOthersName").val(data.record.other_PEOPLE);
			
			// 清空表格
			for (var i = 0; i < 31; i++) {
				$("#newBusComTable input").eq(i).removeAttr("checked");
			}	
			
			var record = data.record;
				
			// 更新复选框为选中状态
			if(record.first == 1) $("#newBusComTable input").eq(0).prop("checked",true);
			if(record.second == 1) $("#newBusComTable input").eq(1).prop("checked",true);
			if(record.third == 1) $("#newBusComTable input").eq(2).prop("checked",true);
			if(record.fourth == 1) $("#newBusComTable input").eq(3).prop("checked",true);
			if(record.fifth == 1) $("#newBusComTable input").eq(4).prop("checked",true);
			if(record.sixth == 1) $("#newBusComTable input").eq(5).prop("checked",true);
			if(record.seventh == 1) $("#newBusComTable input").eq(6).prop("checked",true);
			if(record.eighth == 1) $("#newBusComTable input").eq(7).prop("checked",true);
			if(record.ninth == 1) $("#newBusComTable input").eq(8).prop("checked",true);
			if(record.tenth == 1) $("#newBusComTable input").eq(9).prop("checked",true);
			if(record.eleventh == 1) $("#newBusComTable input").eq(10).prop("checked",true);
			if(record.twelfth == 1) $("#newBusComTable input").eq(11).prop("checked",true);
			if(record.thirteenth == 1) $("#newBusComTable input").eq(12).prop("checked",true);
			if(record.fourteenth == 1) $("#newBusComTable input").eq(13).prop("checked",true);
			if(record.fifteenth == 1) $("#newBusComTable input").eq(14).prop("checked",true);
			if(record.sixteenth == 1) $("#newBusComTable input").eq(15).prop("checked",true);
			if(record.seventeenth == 1) $("#newBusComTable input").eq(16).prop("checked",true);
			if(record.eighteenth == 1) $("#newBusComTable input").eq(17).prop("checked",true);
			if(record.nineteenth == 1) $("#newBusComTable input").eq(18).prop("checked",true);
			if(record.twentieth == 1) $("#newBusComTable input").eq(19).prop("checked",true);
			if(record.twenty_FIRST == 1) $("#newBusComTable input").eq(20).prop("checked",true);
			if(record.twenty_SECOND == 1) $("#newBusComTable input").eq(21).prop("checked",true);
			if(record.twenty_THIRD == 1) $("#newBusComTable input").eq(22).prop("checked",true);
			if(record.twenty_FOURTH == 1) $("#newBusComTable input").eq(23).prop("checked",true);
			if(record.twenty_FIFTH == 1) $("#newBusComTable input").eq(24).prop("checked",true);
			if(record.twenty_SIXTH == 1) $("#newBusComTable input").eq(25).prop("checked",true);
			if(record.twenty_SEVENTH == 1) $("#newBusComTable input").eq(26).prop("checked",true);
			if(record.twenty_EIGHTH == 1) $("#newBusComTable input").eq(27).prop("checked",true);
			if(record.twenty_NINTH == 1) $("#newBusComTable input").eq(28).prop("checked",true);
			if(record.thirtieth == 1) $("#newBusComTable input").eq(29).prop("checked",true);
			if(record.thirty_FIRST == 1) $("#newBusComTable input").eq(30).prop("checked",true);
			
			//更新单价
			unitPrice = data.unitPrice;

			//更新本月合计
			$("#monthTotal").val(record.total);
		}
	});
}

//请求更新（编辑）车费记录
var requestUpdateServiceBus = function(id){

	console.log("更新车费记录");

	//获取基本信息
	var roomNum = $("#editServiceBusRoomNum").val();
	var datearr = $("#editServiceBusDate").val().split("-");
	var date = datearr[0] + "-" + datearr[1];
	var name = $("#editGuestName").val();
	var othersName = $("#editOthersName").val();

	// 遍历日期
	var perRecord = "";
	for(var i = 0; i < 31; i++){
		// var price = $("table input").eq(i).val();
		var isRecord = $("table input").eq(i).is(":checked") == true ? 1 : 0;
		perRecord += '{"day":'+ (i + 1) +',"selection":'+ isRecord +'},';
	}
	if(perRecord != ""){
		perRecord = perRecord.substring(0, perRecord.length -1);
	}
	console.log(perRecord);

	$.ajax({
		url:'/LD/userRoom/updateFare.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:'{"id":'+ id +', "date":"'+ date +'","roomNum":"'+ roomNum +'","name":"'+ name +'",'
			+'"perRecord":['+ perRecord +']' + ',"othersName":"'+ othersName +'"}',
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

//删除通勤车记录
var serviceBusComDelete = function(id){
	console.log("删除"+ id +"号通勤车记录");
	$.ajax({
		url:'/LD/userRoom/deleteFare.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify({"id":id}),
		success:function(data){
			console.log(data);
			if(data == 1){
				showModalBox("success","删除成功");
				searchFareByDate(1); //重新查询一遍
			}else if(data == 0){
				showModalBox("error","删除失败");
			}
		}
	});
}

