// 客房服务--代购费

// 初始绑定搜索键盘事件
$(function(){
	$("#search-input").keydown(function(e){
		// 回车键
		if(e.keyCode==13){
			requestFirstShoppingByRoomNum(this);
			return false;
		}
	})
});


//拉取第一页 代购费信息
var requestFirstShopping = function() {
	requestAjaxShopping(parseInt(1));    
}

//拉取上一页 代购费信息
var requestBeforeShopping = function() {
	var nowpage = parseInt($("#shoppinglist_nowpage").val());
	if(nowpage == 1) return;
	requestAjaxShopping(nowpage-1);
}

// 拉取下一页 代购费信息（??当前处理，前端判断是否是最后一页）
var requestNextShopping = function(){
	var nowpage = parseInt($("#shoppinglist_nowpage").val());
	var totalpage = parseInt($("#shoppinglist_totalpage").text());
	if(nowpage == totalpage) return;
	requestAjaxShopping(nowpage+1);
}

// 查询系统代购费信息
var requestAjaxShopping = function(pageNum){
	console.log("请求第"+ pageNum + "页代购费信息");
    var date = formatDateForm(new Date($(".pack_maintain").val()));	
	console.log('{"pageNum":'+ pageNum + ',"date":"' + date + '"}');
	
	$.ajax({
		url:'/LD/userRoom/roomSearchAgentPurchase.action',
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
				$("#shoppingTbody").html("");
				$("#serviceShoppingBottom").html("");

				var pageNow = data.pageNow;
				var pageTotal = data.pageTotal;
				var recordTotal = data.recordTotal;

				if (recordTotal == 0) {
					$("#shoppingTbody").append("<tr><td class='no-data' colspan='11' style='color: #ff4d4d'>"+
						"没有相关数据！</td></tr>");
					return;
				}
				
				for(var i=0; i<data.pageList.length; i++){
					var perRecord = data.pageList[i];
					console.log(perRecord);

					$("#shoppingTbody").append("<tr><td>"+ perRecord.room_NUM +"</td>"+
						"<td>"+ perRecord.guest_NAME +"</td><td>"+ perRecord.good_NAME +"</td>"+
						"<td>" + perRecord.count + "</td><td>" + perRecord.cover_PRICE + "元</td>"+
						'<td style="color:red">'+ perRecord.service_PRICE +"元</td><td>"+ perRecord.comment +"</td>"+
						"<td>"+ formatDateForm(new Date(perRecord.occur_TIME)) +"</td><td>" + 
						formatDate(new Date(perRecord.import_TIME)) + "</td><td>"+ formatDate(new Date(perRecord.edit_TIME)) +"</td>"+
						"<td><a id='editCom' href='serviceShoppingEdit.jsp?id="+ perRecord.id +"'>编辑</a><a id='deleteCom' onclick='serviceShoppingDelete("+ perRecord.id +")'>删除</a></td></tr>");
				}	
				// 添加代购费 底部页码
				$("#serviceShoppingBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeShopping();'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='shoppinglist_nowpage' value='"+ pageNow +"' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='shoppinglist_totalpage'>"+ pageTotal +"</span>"+
			            "<span class='page-next' onclick='requestNextShopping();'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recorTotal'>&nbsp;" + recordTotal +"&nbsp;</span>条记录</div>");
			}
		}
	});
}

////////////////////////////////////////////////////////////////条件查询 代购费信息 start
//根据房间号 拉取第一页 代购费信息
var requestFirstShoppingByRoomNum = function(element){
	var roomNum = $(element).parent().children("input").val();	
	requestAjaxShoppingByRoomNum(roomNum,parseInt(1));    
}

//根据房间号 拉取上一页 代购费信息
var requestBeforeShoppingByRoomNum = function(){
	var roomNum = $("#search-input").text();
	//console.log("roomId:"+room_id);
	var nowpage = parseInt($("#shoppinglist_nowpage").val());
	if(nowpage == 1) return;
	
	requestAjaxShoppingByRoomNum(roomNum,nowpage-1);
}

//根据房间号 拉取下一页 代购费信息（??当前处理，前端判断是否是最后一页）
var requestNextShoppingByRoomNum = function(){
	var roomNum = $("#search-input").text();
	//console.log("roomId:"+room_id);
	var nowpage = parseInt($("#shoppinglist_nowpage").val());
	var totalpage = parseInt($("#shoppinglist_totalpage").text());
	if(nowpage == totalpage) return;
	
	requestAjaxShoppingByRoomNum(roomNum,nowpage+1);
}


// 根据房间号查询系统代购费信息
var requestAjaxShoppingByRoomNum = function(roomNum,pageNum){
	console.log("请求房间："+ roomNum +"  第" + pageNum + "页的代购费信息");
	var date = formatDateForm(new Date($(".pack_maintain").val()));	
	console.log('{"pageNum":"'+ pageNum +'","rNum":"'+ roomNum + '","date":"'+ date +'"}');
	
	$.ajax({
		url:'/LD/userRoom/roomSearchAgentPurchase.action',
		type:'post',
		contentType:'application/json',
		data:'{"pageNum":"'+ pageNum +'","rNum":"'+ roomNum + '","date":"'+ date +'"}',
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.State == "Invalid"){
				alert("您没有权限访问本页数据，请尝试升级权限或回退！");
				return;
			}
			else if(data.State == "Valid"){
				$("#shoppingTbody").html("");
				$("#serviceShoppingBottom").html("");

				var pageNow = data.pageNow;
				var pageTotal = data.pageTotal;
				var recordTotal = data.recordTotal;
				if (recordTotal == 0) {
					$("#shoppingTbody").append("<tr><td class='no-data' colspan='11' style='color: #ff4d4d'>"+
						"没有相关数据！</td></tr>");
					return;
				}
				
				for(var i=0; i<data.pageList.length; i++){
					var perRecord = data.pageList[i];

					$("#shoppingTbody").append("<tr><td>"+ perRecord.room_NUM +"</td>"+
							"<td>"+ perRecord.guest_NAME +"</td><td>"+ perRecord.good_NAME +"</td>"+
							"<td>" + perRecord.count + '</td><td style="color:red">' + perRecord.cover_PRICE + "元</td>"+
							'<td style="color:red;">'+ perRecord.service_PRICE +"元</td><td>"+ perRecord.comment +"</td>"+
							"<td>"+ formatDateForm(new Date(perRecord.occur_TIME)) +"</td><td>" + 
							formatDate(new Date(perRecord.import_TIME)) + "</td><td>"+ formatDate(new Date(perRecord.edit_TIME)) +"</td>"+
							"<td><a id='editCom' href='serviceShoppingEdit.jsp?id="+ perRecord.id +"'>编辑</a><a id='deleteCom' onclick='serviceShoppingDelete("+ perRecord.id +")'>删除</a></td></tr>");
				}	
				// 添加餐费 底部页码
				$("#serviceShoppingBottom").append("<div class='searchRoomNum' style='display:none;'>"+ roomNum +"</div>");
				$("#serviceShoppingBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeShoppingByRoomNum();'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='shoppinglist_nowpage' value='" + pageNow +"' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='shoppinglist_totalpage'>"+ pageTotal +"</span>"+
			            "<span class='page-next' onclick='requestNextShoppingByRoomNum();'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ recordTotal +"&nbsp;</span>条记录</div>");
			}
		}
	});
}
////////////////////////////////////////////////////////////////条件查询 代购费信息 end

var serviceShoppingDelete = function(id){
	console.log("删除"+ id +"号餐费记录");
	$.ajax({
		url:'/LD/userRoom/deleteShopping.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify({"id":id}),
		success:function(data){
			console.log(data);
			if(data == 1){
				showModalBox("success","删除成功");
				requestFirstShoppingByRoomNum($("#search-input").text()); //重新查询一遍
			}else if(data == 0){
				showModalBox("error","删除失败");
			}
		}
	});
}

//导出
var exportList = function(){
	var BB = self.Blob;
    var fileName = "ShoppingList_" + formatDateDot(new Date()) + ".csv";
    var content = ",,,,代购费记录表\n房间号,客户姓名,物品,件数,垫付费,服务费,垫付人,发生时间,上传时间,最后编辑时间\n";
    
    //根据当前房间号查询内容，请求所有记录（不分页）
	var roomNum = $("#search-input").val();
	var date = formatDateForm(new Date($(".pack_maintain").val()));
	
	$.ajax({
		url:'/LD/userRoom/searchAllShopping.action',
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
					   record.good_NAME + "," +
					   record.count + "," + 
					   record.cover_PRICE + " 元," +
					   record.service_PRICE + "元," +
					   record.staff_NAME + "," +
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
		url:'/LD/userRoom/searchAllShopping.action',
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
					curRow["物品"] = record.good_NAME;
					curRow["数量"] = record.count;
					curRow["垫付费"] = record.cover_PRICE + "元";
					curRow["服务费"]= record.service_PRICE+ " 元";
					curRow["垫付人"] = record.staff_NAME;
					curRow["发生时间"] = formatDate(new Date(record.occur_TIME));
					curRow["上传时间"] = formatDate(new Date(record.import_TIME));
					curRow["最后编辑时间"] = formatDate(new Date(record.edit_TIME));
	
					printData.push(curRow);
				}
				
				//打印
	 			printJS({printable: printData, 
	 			 		 properties: ['房间号', '客户姓名', '物品', '数量', '垫付费', '服务费', '垫付人', '发生时间' , '上传时间', '最后编辑时间'], 
	 			 		 type: 'json',
	 		     	     font_size: '9pt'});
			}else{
				showModalBox("error","打印失败");
			}			
		}
	});
}