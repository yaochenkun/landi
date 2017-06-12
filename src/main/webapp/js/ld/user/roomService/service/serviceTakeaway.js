// 客房服务--餐费

// 初始绑定搜索键盘事件
$(function(){
	$("#searchRoomNumber").keydown(function(e){
		// 回车键
		if(e.keyCode==13){
			requestFirstTakeawayByRoomNum(this);
			return false;
		}
	})
});


//拉取第一页 餐费信息
var requestFirstTakeaway = function(){
	requestAjaxTakeaway(parseInt(1));    
}

//拉取上一页 餐费信息
var requestBeforeTakeaway = function(){
	var nowpage = parseInt($("#takeawaylist_nowpage").val());
	if(nowpage == 1) return;
	requestAjaxTakeaway(nowpage-1);
}

// 拉取下一页 餐费信息（??当前处理，前端判断是否是最后一页）
var requestNextTakeaway = function(){
	var nowpage = parseInt($("#takeawaylist_nowpage").val());
	var totalpage = parseInt($("#takeawaylist_totalpage").text());
	if(nowpage == totalpage) return;
	requestAjaxTakeaway(nowpage+1);
}

// 查询系统餐费信息( rNum不传递，为null)
var requestAjaxTakeaway = function(pageNum){
	
	var date = formatDateForm(new Date($(".pack_maintain").val()));
	console.log(date);
	console.log("请求第"+ pageNum + "页餐费信息");
	console.log('{"pageNum":'+ pageNum + ',"date":"' + date + '"}');
	
	$.ajax({
		url:'/LD/userRoom/roomSearchMeal.action',
		type:'post',
		contentType:'application/json',
		data:'{"pageNum":'+ pageNum + ',"date":"' + date + '"}',
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.State == "Invalid"){
				alert("您没有权限访问本页数据，请尝试升级权限或回退！");
				return;
			}
			else if(data.State == "Valid"){
				// 清空列表和页码
				$("#takeawayTbody").html("");
				$("#serviceTakeawayBottom").html("");

				var pageNow = data.pageNow;
				var pageTotal = data.pageTotal;
				var recordTotal = data.recordTotal;

				if (recordTotal == 0) {
					$("#takeawayTbody").append("<tr><td class='no-data' colspan='9' style='color: #ff4d4d'>"+
						"没有相关数据！</td></tr>");
					return;
				}
				
				for(var i=0; i<data.pageList.length; i++){
					var perRecord = data.pageList[i];

            		console.log(perRecord);
					$("#takeawayTbody").append("<tr><td>"+ perRecord.room_NUM +"</td>"+
						    "<td>"+ perRecord.guest_NAME +"</td><td>" + perRecord.restaurant_NAME + "</td>"+
						    '<td style="color:red;">'+ perRecord.total_PRICE +"&nbsp;元</td><td>"+ perRecord.comment +"</td>"+
							"<td>"+ formatDateForm(new Date(perRecord.occur_TIME)) +"</td><td>"+ formatDate(new Date(perRecord.import_TIME)) +
							"</td><td>"+formatDate(new Date(perRecord.edit_TIME))+"</td>"+
							"<td><a id='editCom' href='serviceTakeawayEdit.jsp?id="+ perRecord.id +"'>编辑</a><a id='deleteCom' onclick='serviceTakeawayDelete("+ perRecord.id +")'>删除</a></td></tr>");
				}	
				// 添加餐费 底部页码
				$("#serviceTakeawayBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeTakeaway();'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='takeawaylist_nowpage' value='"+ pageNow +"' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='takeawaylist_totalpage'>"+ pageTotal +"</span>"+
			            "<span class='page-next' onclick='requestNextTakeaway();'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ recordTotal +"&nbsp;</span>条记录</div>");
			}
		}
	});
}

///////////////////////////////////////////////////条件查询 餐费信息 start
//根据房间号 拉取第一页 餐费信息
var requestFirstTakeawayByRoomNum = function(element){
	var roomNum = $("#searchRoomNumber").val();
	console.log(roomNum);
	requestAjaxTakeawayByRoomNum(roomNum,parseInt(1));    
}

//根据房间号 拉取上一页 餐费信息
var requestBeforeTakeawayByRoomNum = function(){
	var roomNum = $("#searchRoomNumber").val();
	//console.log("roomId:"+room_id);
	var nowpage = parseInt($("#takeawaylist_nowpage").val());
	if(nowpage == 1) return;
	
	requestAjaxTakeawayByRoomNum(roomNum,nowpage-1);
}

//根据房间号 拉取下一页 餐费信息（??当前处理，前端判断是否是最后一页）
var requestNextTakeawayByRoomNum = function(){
	var roomNum = $("#searchRoomNumber").val();
	//console.log("roomId:"+room_id);
	var nowpage = parseInt($("#takeawaylist_nowpage").val());
	var totalpage = parseInt($("#takeawaylist_totalpage").text());
	if(nowpage == totalpage) return;
	
	requestAjaxTakeawayByRoomNum(roomNum,nowpage+1);
}


// 根据房间号查询系统餐费信息
var requestAjaxTakeawayByRoomNum = function(roomNum,pageNum){
	console.log("请求房间："+ roomNum +"  第" + pageNum + "页的餐费信息");
	var date = formatDateForm(new Date($(".pack_maintain").val()));
	
	console.log('{"pageNum":"'+ pageNum +'","rNum":"'+ roomNum + '","date":"'+ date +'"}');
	$.ajax({
		url:'/LD/userRoom/roomSearchMeal.action',
		type:'post',
		contentType:'application/json',
		data: '{"pageNum":"'+ pageNum +'","rNum":"'+ roomNum + '","date":"'+ date +'"}',
		dataType:'json',
		success:function(data){
		    console.log(data);
			if(data.State == "Invalid"){
				alert("您没有权限访问本页数据，请尝试升级权限或回退。");
				return;
			}
			else if(data.State == "Valid"){
				$("#takeawayTbody").html("");
				$("#serviceTakeawayBottom").html("");
				
				var pageNow = data.pageNow;
				var pageTotal = data.pageTotal;
				var recordTotal = data.recordTotal;
				if (recordTotal == 0) {
					$("#takeawayTbody").append("<tr><td class='no-data' colspan='9' style='color: #ff4d4d'>"+
						"没有相关数据！</td></tr>");
					return;
				}

				for(var i=0; i<data.pageList.length; i++){
					var perRecord = data.pageList[i];

					$("#takeawayTbody").append("<tr><td>"+ perRecord.room_NUM +"</td>"+
						    "<td>"+ perRecord.guest_NAME +"</td><td>" + perRecord.restaurant_NAME + "</td>"+
						    '<td style="color:red;">'+ perRecord.total_PRICE +"&nbsp;元</td><td>"+ perRecord.comment +"</td>"+
							"<td>"+ formatDateForm(new Date(perRecord.occur_TIME)) +"</td><td>"+ formatDate(new Date(perRecord.import_TIME)) +
							"</td><td>"+formatDate(new Date(perRecord.edit_TIME))+"</td>"+
							"<td><a id='editCom' href='serviceTakeawayEdit.jsp?id="+ perRecord.id +"'>编辑</a><a id='deleteCom' onclick='serviceTakeawayDelete("+ perRecord.id +")'>删除</a></td></tr>");
				}	
				// 添加餐费 底部页码
				$("#serviceTakeawayBottom").append("<div class='searchRoomNum' style='display:none;'>"+ roomNum +"</div>");
				$("#serviceTakeawayBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeTakeawayByRoomNum();'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='takeawaylist_nowpage' value='" + pageNow +"' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='takeawaylist_totalpage'>"+ pageTotal +"</span>"+
			            "<span class='page-next' onclick='requestNextTakeawayByRoomNum();'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ recordTotal +"&nbsp;</span>条记录</div>");
			}
		}
	});
}
////////////////////////////////////////////////////////////////条件查询 餐费信息 end

//删除id记录
var serviceTakeawayDelete = function(id){
	console.log("删除"+ id +"号餐费记录");
	$.ajax({
		url:'/LD/userRoom/deleteMeal.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify({"id":id}),
		success:function(data){
			console.log(data);
			if(data == 1){
				showModalBox("success","删除成功");
				//requestFirstTakeaway(); //重新查询一遍
				requestFirstTakeawayByRoomNum($("#searchRoomNumber").val());
			}else if(data == 0){
				showModalBox("error","删除失败");
			}
		}
	});
};

//导出
var exportList = function(){
	var BB = self.Blob;
    var fileName = "TakeawayList_" + formatDateDot(new Date()) + ".csv";
    var content = ",,,,餐费记录表\n房间号,客户姓名,餐厅,金额,备注,点餐时间,上传时间,最后编辑时间\n";
    
    //根据当前房间号查询内容，请求所有记录（不分页）
	var roomNum = $("#searchRoomNumber").val();
	var date = formatDateForm(new Date($(".pack_maintain").val()));
	
	$.ajax({
		url:'/LD/userRoom/searchAllMeal.action',
		type:'post',
		dataType:'json',
		data:'{"date":"'+ date +'","roomNum":"'+ roomNum +'"}',
		contentType:'application/json',
		success:function(data){
			
			records = data.dataList;
		
			if(data.State == "Valid"){
				for(var i=0;i<records.length;i++){
					var record = records[i];
					content += record.room_NUM + "," + 
					   record.guest_NAME + "," + 
					   record.restaurant_NAME + "," + 
					   record.total_PRICE + " 元," +
					   record.comment + "," + 
					   formatDateForm(new Date(record.occur_TIME)) + "," + 
					   formatDate(new Date(record.import_TIME)) + "," + 
					   formatDate(new Date(record.edit_TIME)) + "\n";										
				}
				saveAs(new BB(["\ufeff" + content] , {type: "text/plain;charset=utf8"}), fileName);						
			}
			else{
				showModalBox("error","导出失败");
			}			
		}
	});
}

//打印
var printList = function(){
	printData = [];

	var roomNum = $("#searchRoomNumber").val();
	var date = formatDateForm(new Date($(".pack_maintain").val()));
	
	$.ajax({
		url:'/LD/userRoom/searchAllMeal.action',
		type:'post',
		dataType:'json',
		data:'{"date":"'+ date +'","roomNum":"'+ roomNum +'"}',
		contentType:'application/json',
		success:function(data){
			console.log(data);

			records = data.dataList;
			
			if(data.State == "Valid"){
				for(var i=0;i<records.length;i++){
					var record = records[i];
					
					curRow = {};
					curRow["房间号"] = record.room_NUM;
					curRow["客户姓名"] = record.guest_NAME;
					curRow["餐厅"] = record.restaurant_NAME;	
					curRow["金额"] = record.total_PRICE + "元";
					curRow["备注"] = record.comment;
					curRow["发生时间"] = formatDate(new Date(record.occur_TIME));
					curRow["上传时间"] = formatDate(new Date(record.import_TIME));
					curRow["编辑时间"] = formatDate(new Date(record.edit_TIME));
	
					printData.push(curRow);
				}
				
				//打印
	 			printJS({printable: printData, 
	 			 		 properties: ['房间号', '客户姓名', '餐厅', '金额', '备注', '发生时间' , '上传时间', '编辑时间'], 
	 			 		 type: 'json',
	 		     	     font_size: '9pt'});
			}else{
				showModalBox("error","打印失败");
			}			
		}
	});
}

