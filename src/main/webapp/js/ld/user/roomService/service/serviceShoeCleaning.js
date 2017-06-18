// 客房服务--擦鞋费

// 初始绑定搜索键盘事件
$(function(){
	$("#search-input").keydown(function(e){
		// 回车键
		if(e.keyCode==13){
			requestFirstShoeCleaningByRoomNum(this);
			return false;
		}
	})
});


//拉取第一页 擦鞋费信息
var requestFirstShoeCleaning = function(){
	requestAjaxShoeCleaning(parseInt(1));    
}

//拉取上一页 擦鞋费信息
var requestBeforeShoeCleaning = function(){
	var nowpage = parseInt($("#shoeCleaninglist_nowpage").val());
	if(nowpage == 1) return;
	requestAjaxShoeCleaning(nowpage-1);
}

// 拉取下一页 擦鞋费信息（??当前处理，前端判断是否是最后一页）
var requestNextShoeCleaning = function(){
	var nowpage = parseInt($("#shoeCleaninglist_nowpage").val());
	var totalpage = parseInt($("#shoeCleaninglist_totalpage").text());
	if(nowpage == totalpage) return;
	requestAjaxShoeCleaning(nowpage+1);
}

// 查询系统擦鞋费信息
var requestAjaxShoeCleaning = function(pageNum){
	console.log("请求第"+ pageNum + "页擦鞋费信息");
	var date = formatDateForm(new Date($(".pack_maintain").val()));
	
	console.log('{"pageNum":'+ pageNum + ',"date":"' + date + '"}');
	
	$.ajax({
		url:'/LD/userRoom/roomSearchShoeCleaning.action',
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
				$("#shoeCleaningTbody").html("");
				$("#serviceShoeCleaningBottom").html("");

				var pageNow = data.pageNow;
				var pageTotal = data.pageTotal;
				var recordTotal = data.recordTotal;

				if (recordTotal == 0) {
					$("#shoeCleaningTbody").append("<tr><td class='no-data' colspan='9' style='color: #ff4d4d'>"+
						"没有相关数据！</td></tr>");
					return;
				}
				
				for(var i=0; i<data.pageList.length; i++){
					var perRecord = data.pageList[i];	
					console.log(perRecord);

					$("#shoeCleaningTbody").append("<tr><td>"+ perRecord.room_NUM +"</td>"+
						"<td>"+ perRecord.guest_NAME +"</td><td>"+ perRecord.count +"双</td>"+
						'<td style="color:red;">'+ perRecord.total_PRICE +"元</td><td>"+ perRecord.comment +"</td><td>" + formatDateForm(new Date(perRecord.occur_TIME)) +"</td>"+
						"<td>"+ formatDate(new Date(perRecord.import_TIME)) +"</td><td>"+ formatDate(new Date(perRecord.edit_TIME)) +"</td>"+
						"<td><a id='editCom' href='serviceShoeCleaningEdit.jsp?id="+ perRecord.id +"'>编辑</a><a id='deleteCom' onclick='serviceShoeCleaningDelete("+ perRecord.id +")'>删除</a></td></tr>");
				}	
				// 添加擦鞋费 底部页码
				$("#serviceShoeCleaningBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeShoeCleaning();'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='shoeCleaninglist_nowpage' value='"+ pageNow +"' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='shoeCleaninglist_totalpage'>"+ pageTotal +"</span>"+
			            "<span class='page-next' onclick='requestNextShoeCleaning();'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ recordTotal +"&nbsp;</span>条记录</div>");
			}
		}
	});
}

////////////////////////////////////////////////////////////////条件查询 擦鞋费信息 start
//根据房间号 拉取第一页 擦鞋费信息
var requestFirstShoeCleaningByRoomNum = function(element){
	var roomNum = $(element).parent().children("input").val();	
	requestAjaxShoeCleaningByRoomNum(roomNum,parseInt(1));    
}

//根据房间号 拉取上一页 擦鞋费信息
var requestBeforeShoeCleaningByRoomNum = function(){
	var roomNum = $("#search-input").text();
	var nowpage = parseInt($("#shoeCleaninglist_nowpage").val());
	if(nowpage == 1) return;
	
	requestAjaxShoeCleaningByRoomNum(roomNum,nowpage-1);
}

//根据房间号 拉取下一页 擦鞋费信息（??当前处理，前端判断是否是最后一页）
var requestNextShoeCleaningByRoomNum = function(){
	var roomNum = $("#search-input").text();
	var nowpage = parseInt($("#shoeCleaninglist_nowpage").val());
	var totalpage = parseInt($("#shoeCleaninglist_totalpage").text());
	if(nowpage == totalpage) return;
	
	requestAjaxShoeCleaningByRoomNum(roomNum,nowpage+1);
}


// 根据房间号查询系统擦鞋费信息
var requestAjaxShoeCleaningByRoomNum = function(roomNum,pageNum){
	console.log("请求房间："+ roomNum +"  第" + pageNum + "页的擦鞋费信息");
	var date = formatDateForm(new Date($(".pack_maintain").val()));	
	console.log('{"pageNum":"'+ pageNum +'","rNum":"'+ roomNum + '","date":"'+ date +'"}');
	
	$.ajax({
		url:'/LD/userRoom/roomSearchShoeCleaning.action',
		type:'post',
		contentType:'application/json',
		data:'{"pageNum":"'+ pageNum +'","rNum":"'+ roomNum + '","date":"'+ date +'"}',
		dataType:'json',
		success:function(data){
			// console.log(data);
			if(data.State == "Invalid"){
				alert("您没有权限访问本页数据，请尝试升级权限或回退。");
				return;
			}
			else if(data.State == "Valid"){
				$("#shoeCleaningTbody").html("");
				$("#serviceShoeCleaningBottom").html("");

				var pageNow = data.pageNow;
				var pageTotal = data.pageTotal;
				var recordTotal = data.recordTotal;
				if (recordTotal == 0) {
					$("#shoeCleaningTbody").append("<tr><td class='no-data' colspan='9' style='color: #ff4d4d'>"+
						"没有相关数据！</td></tr>");
					return;
				}
				
				for(var i=0; i<data.pageList.length; i++){
					var perRecord = data.pageList[i];					

            		$("#shoeCleaningTbody").append("<tr><td>"+ perRecord.room_NUM +"</td>"+
    						"<td>"+ perRecord.guest_NAME +"</td><td>"+ perRecord.count +"双</td>"+
    						'<td style="color:red;">'+ perRecord.total_PRICE +"元</td><td>"+ perRecord.comment +"</td><td>" + formatDateForm(new Date(perRecord.occur_TIME)) +"</td>"+
    						"<td>"+ formatDate(new Date(perRecord.import_TIME)) +"</td><td>"+ formatDate(new Date(perRecord.edit_TIME)) +"</td>"+
    						"<td><a id='editCom' href='serviceShoeCleaningEdit.jsp?id="+ perRecord.id +"'>编辑</a><a id='deleteCom' onclick='serviceShoeCleaningDelete("+ perRecord.id +")'>删除</a></td></tr>");
				}	
				// 添加餐费 底部页码
				$("#serviceShoeCleaningBottom").append("<div class='searchRoomNum' style='display:none;'>"+ roomNum +"</div>");
				$("#serviceShoeCleaningBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeShoeCleaningByRoomNum();'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='shoeCleaninglist_nowpage' value='" + pageNow +"' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='shoeCleaninglist_totalpage'>"+ pageTotal +"</span>"+
			            "<span class='page-next' onclick='requestNextShoeCleaningByRoomNum();'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ recordTotal +"&nbsp;</span>条记录</div>");
			}
		}
	});
}
////////////////////////////////////////////////////////////////条件查询 擦鞋费信息 end

var serviceShoeCleaningDelete = function(id){
	console.log("删除"+ id +"号餐费记录");
	$.ajax({
		url:'/LD/userRoom/deleteShoeCleaning.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify({"id":id}),
		success:function(data){
			console.log(data);
			if(data == 1){
				showModalBox("success","删除成功");
				requestFirstShoeCleaningByRoomNum($("#search-input").text()); //重新查询一遍
			}else if(data == 0){
				showModalBox("error","删除失败");
			}
		}
	});
}

		
//导出
var exportList = function(){
	var BB = self.Blob;
    var fileName = "ShoeCleaningList_" + formatDateDot(new Date()) + ".csv";
    var content = ",,,,擦鞋费记录表\n房间号,客户姓名,数量,金额,备注,发生时间,上传时间,最后编辑时间\n";
    
    //根据当前房间号查询内容，请求所有记录（不分页）
	var roomNum = $("#search-input").val();
	var date = formatDateForm(new Date($(".pack_maintain").val()));
	console.log('{"date":"'+ date +'","roomNum":"'+ roomNum +'"}');	
	
	$.ajax({
		url:'/LD/userRoom/searchAllShoeCleaning.action',
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
					   record.count + "," + 
					   record.total_PRICE + " 元," +
					   record.comment + "," + 
					   formatDate(new Date(record.occur_TIME)) + "," + 
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
	var roomNum = $("#search-input").val();
	var date = formatDateForm(new Date($(".pack_maintain").val()));
	console.log('{"date":"'+ date +'","roomNum":"'+ roomNum +'"}');	
	
	$.ajax({
		url:'/LD/userRoom/searchAllShoeCleaning.action',
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
					curRow["数量"] = record.count;
					curRow["金额"] = record.total_PRICE + "元";
					curRow["备注"] = record.comment;
					curRow["发生时间"] = formatDate(new Date(record.occur_TIME));
					curRow["上传时间"] = formatDate(new Date(record.import_TIME));
					curRow["最后编辑时间"] = formatDate(new Date(record.edit_TIME));
	
					printData.push(curRow);
				}
				
				//打印
	 			printJS({printable: printData, 
	 			 		 properties: ['房间号', '客户姓名', '数量', '金额', '备注', '发生时间' , '上传时间', '最后编辑时间'], 
	 			 		 type: 'json',
	 		     	     font_size: '9pt'});
			}else{
				showModalBox("error","打印失败");
			}			
		}
	});
}
