// 客房服务--擦鞋费

// 初始绑定搜索键盘事件
$(function(){
	$(".search-input").keydown(function(e){
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

// 查询系统擦鞋费信息(擦鞋费信息 type为3)
var requestAjaxShoeCleaning = function(pageNum){
	var type = parseInt(3); 
	console.log("请求第"+ pageNum + "页擦鞋费信息");
	
//	$.ajax({
//		url:'/LD/userRoom/roomSearchBill.action',
//		type:'post',
//		contentType:'application/json',
//		data:'{"pageNum":"'+ pageNum +'","type":"'+ type +'","rnum":0}',
//		dataType:'json',
//		success:function(data){
//			console.log(data);
			// 清空列表和页码
			$("#shoeCleaningTbody").html("");
			$("#serviceShoeCleaningBottom").html("");
			
			for(var i=0; i<20; i++){
				$("#shoeCleaningTbody").append("<tr><td><span>1</span></td><td>Ada</td><td>衣服</td><td>1</td>"+
						"<td>2016-3-30</td><td>2,000&nbsp;元</td><td>无</td></tr>");
			}	
			// 添加擦鞋费 底部页码
			$("#serviceShoeCleaningBottom").append("<div class='bottom-page'>"+
		        	"<span class='page-before' onclick='requestBeforeShoeCleaning();'>上一页&nbsp;&nbsp;</span>"+
		        	"<span><input id='shoeCleaninglist_nowpage' value='1' type='text' class='input_num'></span>"+
		        	"<span>&nbsp;/&nbsp;</span>"+
		        	"<span id='shoeCleaninglist_totalpage'>2</span>"+
		            "<span class='page-next' onclick='requestNextShoeCleaning();'>&nbsp;&nbsp;下一页</span>" +
		            "&nbsp;&nbsp;&nbsp;&nbsp;共83条记录</div>");
//		}
//	});
}

////////////////////////////////////////////////////////////////条件查询 擦鞋费信息 start
//根据房间号 拉取第一页 擦鞋费信息
var requestFirstShoeCleaningByRoomNum = function(element){
	$(".search-roomNo").css("height","0");
	var roomNum = $(element).parent().children("input").val();
	
	requestAjaxShoeCleaningByRoomNum(roomNum,parseInt(1));    
}

//根据房间号 拉取上一页 擦鞋费信息
var requestBeforeShoeCleaningByRoomNum = function(){
	var roomNum = $(".searchRoomNum").text();
	//console.log("roomId:"+room_id);
	var nowpage = parseInt($("#shoeCleaninglist_nowpage").val());
	if(nowpage == 1) return;
	
	requestAjaxShoeCleaningByRoomNum(roomNum,nowpage-1);
}

//根据房间号 拉取下一页 擦鞋费信息（??当前处理，前端判断是否是最后一页）
var requestNextShoeCleaningByRoomNum = function(){
	var roomNum = $(".searchRoomNum").text();
	//console.log("roomId:"+room_id);
	var nowpage = parseInt($("#shoeCleaninglist_nowpage").val());
	var totalpage = parseInt($("#shoeCleaninglist_totalpage").text());
	if(nowpage == totalpage) return;
	
	requestAjaxShoeCleaningByRoomNum(roomNum,nowpage+1);
}


// 根据房间号查询系统擦鞋费信息(擦鞋费信息type为3)
var requestAjaxShoeCleaningByRoomNum = function(roomNum,pageNum){
	console.log("请求房间："+ roomNum +"  第" + pageNum + "页的擦鞋费信息");
	
	var type = parseInt(3);
	
	$.ajax({
		url:'/LD/userRoom/roomSearchBill.action',
		type:'post',
		contentType:'application/json',
		data:'{"type":"'+ type +'","pageNum":"'+ pageNum +'","rnum":"'+ roomNum +'"}',
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
				
				for(var i=0; i<data.pageList.length; i++){
					var perRecord = data.pageList[i];

					// 将时间戳变为2016-12-12显示          	
            		var dDate = new Date(perRecord.rtime);
            		var deliveryDate = dDate.toLocaleDateString().replace(/\//g,"-");

					$("#shoeCleaningTbody").append("<tr><td>"+ perRecord.room_NUMBER +"</td>"+
						    "<td>"+ perRecord.guest_NAME +"</td><td>" + perRecord.item + "</td>"+
						    "<td>"+ perRecord.count +"</td><td>"+ deliveryDate +"</td>"+
							"<td>"+ perRecord.money +"&nbsp;元</td><td>"+ perRecord.comment +"</td></tr>");
				}	
				// 添加餐费 底部页码
				$("#serviceShoeCleaningBottom").append("<div class='searchRoomNum' style='display:none;'>"+ roomNum +"</div>");
				$("#serviceShoeCleaningBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeShoeCleaningByRoomNum();'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='shoeCleaninglist_nowpage' value='" + data.pageNow +"' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='shoeCleaninglist_totalpage'>"+ data.pageTotal +"</span>"+
			            "<span class='page-next' onclick='requestNextShoeCleaningByRoomNum();'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共"+ data.recordTotal +"条记录</div>");
			}
		}
	});
}
////////////////////////////////////////////////////////////////条件查询 擦鞋费信息 end




