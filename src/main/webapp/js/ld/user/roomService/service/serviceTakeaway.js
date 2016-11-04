// 客房服务--餐费

// 初始绑定搜索键盘事件
$(function(){
	$(".search-input").keydown(function(e){
		// 回车键
		if(e.keyCode==13){
			requestFirstTakeawayByRoomNum(this);
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

// 查询系统餐费信息(餐费信息 type为1)
var requestAjaxTakeaway = function(pageNum){
	var type = parseInt(1); 
	console.log("请求第"+ pageNum + "页餐费信息");
	
//	$.ajax({
//		url:'/LD/userRoom/roomSearchBill.action',
//		type:'post',
//		contentType:'application/json',
//		data:'{"pageNum":"'+ pageNum +'","type":"'+ type +'"}',
//		dataType:'json',
//		success:function(data){
//			console.log(data);
			// 清空列表和页码
			$("#takeawayTbody").html("");
			$("#serviceTakeawayBottom").html("");
			
			for(var i=0; i<20; i++){
				$("#takeawayTbody").append("<tr><td><span>1</span></td><td>Ada</td><td>衣服</td><td>1</td>"+
						"<td>2016-3-30</td><td>2,000&nbsp;元</td><td>无</td></tr>");
			}	
			// 添加餐费 底部页码
			$("#serviceTakeawayBottom").append("<div class='bottom-page'>"+
		        	"<span class='page-before' onclick='requestBeforeTakeaway();'>上一页&nbsp;&nbsp;</span>"+
		        	"<span><input id='takeawaylist_nowpage' value='1' type='text' class='input_num'></span>"+
		        	"<span>&nbsp;/&nbsp;</span>"+
		        	"<span id='userlist_totalpage'>2</span>"+
		            "<span class='page-next' onclick='requestNextTakeaway();'>&nbsp;&nbsp;下一页</span>" +
		            "&nbsp;&nbsp;&nbsp;&nbsp;共83条记录</div>");
//		}
//	});
}

////////////////////////////////////////////////////////////////条件查询 餐费信息 start
//根据房间号 拉取第一页 餐费信息
var requestFirstTakeawayByRoomNum = function(element){
	$(".search-roomNo").css("height","0");
	var roomNum = $(element).parent().children("input").val();
	
	requestAjaxTakeawayByRoomNum(roomNum,parseInt(1));    
}

//根据房间号 拉取上一页 餐费信息
var requestBeforeTakeawayByRoomNum = function(){
	var roomNum = $(".searchRoomNum").text();
	//console.log("roomId:"+room_id);
	var nowpage = parseInt($("#takeawaylist_nowpage").val());
	if(nowpage == 1) return;
	
	requestAjaxTakeawayByRoomNum(roomNum,nowpage-1);
}

//根据房间号 拉取下一页 餐费信息（??当前处理，前端判断是否是最后一页）
var requestNextTakeawayByRoomNum = function(){
	var roomNum = $(".searchRoomNum").text();
	//console.log("roomId:"+room_id);
	var nowpage = parseInt($("#takeawaylist_nowpage").val());
	var totalpage = parseInt($("#takeawaylist_totalpage").text());
	if(nowpage == totalpage) return;
	
	requestAjaxTakeawayByRoomNum(roomNum,nowpage+1);
}


// 根据房间号查询系统餐费信息(餐费信息type为1)
var requestAjaxTakeawayByRoomNum = function(roomNum,pageNum){
	console.log("请求房间："+ roomNum +"  第" + pageNum + "页的餐费信息");
	var type = parseInt(1);
	
//	$.ajax({
//		url:'/LD/userRoom/roomSearchBill.action',
//		type:'post',
//		contentType:'application/json',
//		data:'{"type":"'+ type +'","pageNum":"'+ pageNum +'","roomNum":"'+ roomNum +'"}',
//		dataType:'json',
//		success:function(data){
//			console.log(data);
			
			$("#takeawayTbody").html("");
			$("#serviceTakeawayBottom").html("");
			
			for(var i=0; i<20; i++){
				$("#takeawayTbody").append("<tr><td><span>1</span></td><td>Ada</td><td>衣服</td><td>1</td>"+
						"<td>2016-3-30</td><td>2,000&nbsp;元</td><td>无</td></tr>");
			}	
			// 添加餐费 底部页码
			$("#serviceTakeawayBottom").append("<div class='searchRoomNum' style='display:none;'>"+ roomNum +"</div>");
			$("#serviceTakeawayBottom").append("<div class='bottom-page'>"+
		        	"<span class='page-before' onclick='requestBeforeTakeawayByRoomNum();'>上一页&nbsp;&nbsp;</span>"+
		        	"<span><input id='takeawaylist_nowpage' value='1' type='text' class='input_num'></span>"+
		        	"<span>&nbsp;/&nbsp;</span>"+
		        	"<span id='userlist_totalpage'>2</span>"+
		            "<span class='page-next' onclick='requestNextTakeawayByRoomNum();'>&nbsp;&nbsp;下一页</span>" +
		            "&nbsp;&nbsp;&nbsp;&nbsp;共83条记录</div>");
//		}
//	});
}
////////////////////////////////////////////////////////////////条件查询 餐费信息 end




