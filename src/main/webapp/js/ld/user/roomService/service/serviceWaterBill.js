// 客房服务--桶装水费

// 初始绑定搜索键盘事件
$(function(){
	$(".search-input").keydown(function(e){
		// 回车键
		if(e.keyCode==13){
			requestFirstWaterBillByRoomNum(this);
			return false;
		}
	})
});


//拉取第一页 桶装水费信息
var requestFirstWaterBill = function(){
	requestAjaxWaterBill(parseInt(1));    
}

//拉取上一页 桶装水费信息
var requestBeforeWaterBill = function(){
	var nowpage = parseInt($("#waterBilllist_nowpage").val());
	if(nowpage == 1) return;
	requestAjaxWaterBill(nowpage-1);
}

// 拉取下一页 桶装水费信息（??当前处理，前端判断是否是最后一页）
var requestNextWaterBill = function(){
	var nowpage = parseInt($("#waterBilllist_nowpage").val());
	var totalpage = parseInt($("#waterBilllist_totalpage").text());
	if(nowpage == totalpage) return;
	requestAjaxWaterBill(nowpage+1);
}

// 查询系统桶装水费信息(桶装水费信息 type为2)
var requestAjaxWaterBill = function(pageNum){
	var type = parseInt(2); 
	console.log("请求第"+ pageNum + "页桶装水费信息");
	
	$.ajax({
		url:'/LD/userRoom/roomSearchBill.action',
		type:'post',
		contentType:'application/json',
		data:'{"pageNum":"'+ pageNum +'","type":"'+ type +'"}',
		dataType:'json',
		success:function(data){
			//console.log(data);
			if(data.State == "Invalid"){
				alert("您没有权限访问本页数据，请尝试升级权限或回退！");
				return;
			}
			else if(data.State == "Valid"){
				// 清空列表和页码
				$("#waterBillTbody").html("");
				$("#serviceWaterBillBottom").html("");

				var pageNow = data.pageNow;
				var pageTotal = data.pageTotal;
				var recordTotal = data.recordTotal;

				if (recordTotal == 0) {
					$("#waterBillTbody").append("<tr><td class='no-data' colspan='7' style='color: #ff4d4d'>"+
						"没有相关数据！</td></tr>");
					return;
				}
				
				for(var i=0; i<data.pageList.length; i++){
					var perRecord = data.pageList[i];

					// 将时间戳变为2016-12-12显示          	
            		var dDate = new Date(perRecord.rtime);
            		// var deliveryDate = dDate.toLocaleDateString().replace(/\//g,"-");
            		var deliveryDate = formatDate(dDate);

					$("#waterBillTbody").append("<tr><td>"+ perRecord.room_NUMBER +"</td>"+
						"<td>"+ perRecord.guest_NAME +"</td><td>"+ perRecord.item +"</td>"+
						"<td>"+ perRecord.count +"</td><td>"+ deliveryDate +"</td>"+
						"<td>"+ perRecord.money +"&nbsp;元</td><td>"+ perRecord.comment +"</td></tr>");
				}	
				// 添加桶装水费 底部页码
				$("#serviceWaterBillBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeWaterBill();'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='waterBilllist_nowpage' value='"+ pageNow +"' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='waterBilllist_totalpage'>"+ pageTotal +"</span>"+
			            "<span class='page-next' onclick='requestNextWaterBill();'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>"+ recordTotal +"</span>条记录</div>");
			}
		}
	});
}

////////////////////////////////////////////////////////////////条件查询 桶装水费信息 start
//根据房间号 拉取第一页 桶装水费信息
var requestFirstWaterBillByRoomNum = function(element){
	$(".search-roomNo").css("height","0");
	var roomNum = $(element).parent().children("input").val();
	
	requestAjaxWaterBillByRoomNum(roomNum,parseInt(1));    
}

//根据房间号 拉取上一页 桶装水费信息
var requestBeforeWaterBillByRoomNum = function(){
	var roomNum = $(".searchRoomNum").text();
	//console.log("roomId:"+room_id);
	var nowpage = parseInt($("#waterBilllist_nowpage").val());
	if(nowpage == 1) return;
	
	requestAjaxWaterBillByRoomNum(roomNum,nowpage-1);
}

//根据房间号 拉取下一页 桶装水费信息（??当前处理，前端判断是否是最后一页）
var requestNextWaterBillByRoomNum = function(){
	var roomNum = $(".searchRoomNum").text();
	//console.log("roomId:"+room_id);
	var nowpage = parseInt($("#waterBilllist_nowpage").val());
	var totalpage = parseInt($("#waterBilllist_totalpage").text());
	if(nowpage == totalpage) return;
	
	requestAjaxWaterBillByRoomNum(roomNum,nowpage+1);
}


// 根据房间号查询系统桶装水费信息(桶装水费信息type为2)
var requestAjaxWaterBillByRoomNum = function(roomNum,pageNum){
	console.log("请求房间："+ roomNum +"  第" + pageNum + "页的桶装水费信息");
	
	var type = parseInt(2);
	
	$.ajax({
		url:'/LD/userRoom/roomSearchBill.action',
		type:'post',
		contentType:'application/json',
		data:'{"type":"'+ type +'","pageNum":"'+ pageNum +'","rNum":"'+ roomNum +'"}',
		dataType:'json',
		success:function(data){
			// console.log(data);
			if(data.State == "Invalid"){
				alert("您没有权限访问本页数据，请尝试升级权限或回退。");
				return;
			}
			else if(data.State == "Valid"){
				$("#waterBillTbody").html("");
				$("#serviceWaterBillBottom").html("");

				var pageNow = data.pageNow;
				var pageTotal = data.pageTotal;
				var recordTotal = data.recordTotal;
				if (recordTotal == 0) {
					$("#waterBillTbody").append("<tr><td class='no-data' colspan='7' style='color: #ff4d4d'>"+
						"没有相关数据！</td></tr>");
					return;
				}
				
				for(var i=0; i<data.pageList.length; i++){
					var perRecord = data.pageList[i];

					// 将时间戳变为2016-12-12显示          	
            		var dDate = new Date(perRecord.rtime);
            		// var deliveryDate = dDate.toLocaleDateString().replace(/\//g,"-");
            		var deliveryDate = formatDate(dDate);

					$("#waterBillTbody").append("<tr><td>"+ perRecord.room_NUMBER +"</td>"+
						    "<td>"+ perRecord.guest_NAME +"</td><td>" + perRecord.item + "</td>"+
						    "<td>"+ perRecord.count +"</td><td>"+ deliveryDate +"</td>"+
							"<td>"+ perRecord.money +"&nbsp;元</td><td>"+ perRecord.comment +"</td></tr>");
				}	
				// 添加餐费 底部页码
				$("#serviceWaterBillBottom").append("<div class='searchRoomNum' style='display:none;'>"+ roomNum +"</div>");
				$("#serviceWaterBillBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeWaterBillByRoomNum();'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='waterBilllist_nowpage' value='" + pageNow +"' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='waterBilllist_totalpage'>"+ pageTotal +"</span>"+
			            "<span class='page-next' onclick='requestNextWaterBillByRoomNum();'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ recordTotal +"&nbsp;</span>条记录</div>");
			}
		}
	});
}
////////////////////////////////////////////////////////////////条件查询 桶装水费信息 end




