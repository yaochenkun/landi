// 客房服务--代购费

// 初始绑定搜索键盘事件
$(function(){
	$(".search-input").keydown(function(e){
		// 回车键
		if(e.keyCode==13){
			requestFirstShoppingByRoomNum(this);
			return false;
		}
	})
});


//拉取第一页 代购费信息
var requestFirstShopping = function(){
	requestAjaxShopping(parseInt(1));    
}

//拉取上一页 代购费信息
var requestBeforeShopping = function(){
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

// 查询系统代购费信息(代购费信息 type为4)
var requestAjaxShopping = function(pageNum){
	var type = parseInt(4); 
	console.log("请求第"+ pageNum + "页代购费信息");
	
	$.ajax({
		url:'/LD/userRoom/roomSearchBill.action',
		type:'post',
		contentType:'application/json',
		data:'{"pageNum":"'+ pageNum +'","type":"'+ type +'"}',
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
					$("#shoppingbody").append("<tr><td class='no-data' colspan='7' style='color: #ff4d4d'>"+
						"没有相关数据！</td></tr>");
					return;
				}
				
				for(var i=0; i<data.pageList.length; i++){
					var perRecord = data.pageList[i];

					// 将时间戳变为2016-12-12显示          	
            		var dDate = new Date(perRecord.rtime);
            		var deliveryDate = dDate.toLocaleDateString().replace(/\//g,"-");

					$("#shoppingTbody").append("<tr><td>"+ perRecord.room_NUMBER +"</td>"+
						"<td>"+ perRecord.guest_NAME +"</td><td>"+ perRecord.item +"</td>"+
						"<td>"+ perRecord.count +"</td><td>"+ deliveryDate +"</td>"+
						"<td>"+ perRecord.money +"&nbsp;元</td><td>"+ perRecord.comment +"</td></tr>");
				}	
				// 添加代购费 底部页码
				$("#serviceShoppingBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeShopping();'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='shoppinglist_nowpage' value='"+ pageNow +"' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='shoppinglist_totalpage'>"+ pageTotal +"</span>"+
			            "<span class='page-next' onclick='requestNextShopping();'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recorTotal'>" + recordTotal +"</span>条记录</div>");
			}
		}
	});
}

////////////////////////////////////////////////////////////////条件查询 代购费信息 start
//根据房间号 拉取第一页 代购费信息
var requestFirstShoppingByRoomNum = function(element){
	$(".search-roomNo").css("height","0");
	var roomNum = $(element).parent().children("input").val();
	
	requestAjaxShoppingByRoomNum(roomNum,parseInt(1));    
}

//根据房间号 拉取上一页 代购费信息
var requestBeforeShoppingByRoomNum = function(){
	var roomNum = $(".searchRoomNum").text();
	//console.log("roomId:"+room_id);
	var nowpage = parseInt($("#shoppinglist_nowpage").val());
	if(nowpage == 1) return;
	
	requestAjaxShoppingByRoomNum(roomNum,nowpage-1);
}

//根据房间号 拉取下一页 代购费信息（??当前处理，前端判断是否是最后一页）
var requestNextShoppingByRoomNum = function(){
	var roomNum = $(".searchRoomNum").text();
	//console.log("roomId:"+room_id);
	var nowpage = parseInt($("#shoppinglist_nowpage").val());
	var totalpage = parseInt($("#shoppinglist_totalpage").text());
	if(nowpage == totalpage) return;
	
	requestAjaxShoppingByRoomNum(roomNum,nowpage+1);
}


// 根据房间号查询系统代购费信息(代购费信息type为4)
var requestAjaxShoppingByRoomNum = function(roomNum,pageNum){
	console.log("请求房间："+ roomNum +"  第" + pageNum + "页的代购费信息");
	
	var type = parseInt(4);
	
	$.ajax({
		url:'/LD/userRoom/roomSearchBill.action',
		type:'post',
		contentType:'application/json',
		data:'{"type":"'+ type +'","pageNum":"'+ pageNum +'","rNum":"'+ roomNum +'"}',
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
					$("#shoppingTbody").append("<tr><td class='no-data' colspan='7' style='color: #ff4d4d'>"+
						"没有相关数据！</td></tr>");
					return;
				}
				
				for(var i=0; i<data.pageList.length; i++){
					var perRecord = data.pageList[i];

					// 将时间戳变为2016-12-12显示          	
            		var dDate = new Date(perRecord.rtime);
            		var deliveryDate = dDate.toLocaleDateString().replace(/\//g,"-");

					$("#shoppingTbody").append("<tr><td>"+ perRecord.room_NUMBER +"</td>"+
						    "<td>"+ perRecord.guest_NAME +"</td><td>" + perRecord.item + "</td>"+
						    "<td>"+ perRecord.count +"</td><td>"+ deliveryDate +"</td>"+
							"<td>"+ perRecord.money +"&nbsp;元</td><td>"+ perRecord.comment +"</td></tr>");
				}	
				// 添加餐费 底部页码
				$("#serviceShoppingBottom").append("<div class='searchRoomNum' style='display:none;'>"+ roomNum +"</div>");
				$("#serviceShoppingBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeShoppingByRoomNum();'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='shoppinglist_nowpage' value='" + pageNow +"' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='shoppinglist_totalpage'>"+ pageTotal +"</span>"+
			            "<span class='page-next' onclick='requestNextShoppingByRoomNum();'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共"+ recordTotal +"条记录</div>");
			}
		}
	});
}
////////////////////////////////////////////////////////////////条件查询 代购费信息 end




