// 客房服务--水费

// 初始绑定搜索键盘事件
$(function(){
	$(".search-input").keydown(function(e){
		// 回车键
		if(e.keyCode==13){
			requestFirstWaterByRoomNum(this);
		}
	})
});


//拉取第一页 水费信息
var requestFirstWater = function(){
	requestAjaxWater(parseInt(1));    
}

//拉取上一页 水费信息
var requestBeforeWater = function(){
	var nowpage = parseInt($("#waterlist_nowpage").val());
	if(nowpage == 1) return;
	requestAjaxWater(nowpage-1);
}

// 拉取下一页 水费信息（??当前处理，前端判断是否是最后一页）
var requestNextWater = function(){
	var nowpage = parseInt($("#waterlist_nowpage").val());
	var totalpage = parseInt($("#waterlist_totalpage").text());
	if(nowpage == totalpage) return;
	requestAjaxWater(nowpage+1);
}

// 查询系统水费信息(??水费信息 type为1)
var requestAjaxWater = function(pageNum){
	var type = parseInt(1); 
	console.log("请求第"+ pageNum + "页水费信息");
	
	// $.ajax({
	// 	url:'/LD/userRoom/roomSearchBill.action',
	// 	type:'post',
	// 	contentType:'application/json',
	// 	data:'{"pageNum":'+ pageNum +',"type":'+ type +',"rnum":0}',
	// 	dataType:'json',
	// 	success:function(data){
	// 		console.log(data);
	// 		if(data.State == "Invalid"){
	// 			alert("您没有权限访问本页数据，请尝试升级权限或回退。");
	// 			return;
	// 		}
	// 		else if(data.State == "Valid"){
				// 清空列表和页码
				$("#waterTbody").html("");
				$("#serviceWaterBottom").html("");
				
				for(var i=0; i<20; i++){
					$("#waterTbody").append("<tr><td>1</td><td>Ada</td><td>1</td><td>1200</td>"+
							"<td>1455</td><td>2300</td><td>34.6</td><td>Alice</td><td>2016-6-1</td></tr>");
				}	
				// 添加水费 底部页码
				$("#serviceWaterBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeWater();'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='waterlist_nowpage' value='1' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='waterlist_totalpage'>2</span>"+
			            "<span class='page-next' onclick='requestNextWater();'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共83条记录</div>");
	// 		}
	// 	}
	// });
}

////////////////////////////////////////////////////////////////条件查询 水费信息 start
//根据房间号 拉取第一页 水费信息
var requestFirstWaterByRoomNum = function(element){
	$(".search-roomNo").css("height","0");
	var roomNum = $(element).parent().children("input").val();
	
	requestAjaxWaterByRoomNum(roomNum,parseInt(1));    
}

//根据房间号 拉取上一页 水费信息
var requestBeforeWaterByRoomNum = function(){
	var roomNum = $(".searchRoomNum").text();
	//console.log("roomId:"+room_id);
	var nowpage = parseInt($("#waterlist_nowpage").val());
	if(nowpage == 1) return;
	
	requestAjaxWaterByRoomNum(roomNum,nowpage-1);
}

//根据房间号 拉取下一页 水费信息（??当前处理，前端判断是否是最后一页）
var requestNextWaterByRoomNum = function(){
	var roomNum = $(".searchRoomNum").text();
	//console.log("roomId:"+room_id);
	var nowpage = parseInt($("#waterlist_nowpage").val());
	var totalpage = parseInt($("#waterlist_totalpage").text());
	if(nowpage == totalpage) return;
	
	requestAjaxWaterByRoomNum(roomNum,nowpage+1);
}


// 根据房间号查询系统水费信息(水费信息type为1)
var requestAjaxWaterByRoomNum = function(roomNum,pageNum){
	console.log("请求房间："+ roomNum +"  第" + pageNum + "页的水费信息");
	var type = parseInt(1);
	
	// $.ajax({
	// 	url:'/LD/userRoom/roomSearchBill.action',
	// 	type:'post',
	// 	contentType:'application/json',
	// 	data:'{"type":"'+ type +'","pageNum":"'+ pageNum +'","rnum":"'+ roomNum +'"}',
	// 	dataType:'json',
	// 	success:function(data){
	// 		// console.log(data);
	// 		if(data.State == "Invalid"){
	// 			alert("您没有权限访问本页数据，请尝试升级权限或回退。");
	// 			return;
	// 		}
	// 		else if(data.State == "Valid"){
				$("#waterTbody").html("");
				$("#serviceWaterBottom").html("");
				
					for(var i=0; i<20; i++){
					$("#waterTbody").append("<tr><td>W2-1</td><td>Ada</td><td>1</td><td>1200</td>"+
							"<td>1455</td><td>2300</td><td>34.6</td><td>Alice</td><td>2016-6-1</td></tr>");
				}	
				// 添加水费 底部页码
				$("#serviceWaterBottom").append("<div class='searchRoomNum' style='display:none;'>"+ roomNum +"</div>");
				$("#serviceWaterBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeWaterByRoomNum();'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='waterlist_nowpage' value='1' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='waterlist_totalpage'>2</span>"+
			            "<span class='page-next' onclick='requestNextWaterByRoomNum();'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共12条记录</div>");
	// 		}
	// 	}
	// });
}
////////////////////////////////////////////////////////////////条件查询 水费信息 end




