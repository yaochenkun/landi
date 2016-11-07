// 客房服务--燃气费

// 初始绑定搜索键盘事件
$(function(){
	$(".search-input").keydown(function(e){
		// 回车键
		if(e.keyCode==13){
			requestFirstGasByRoomNum(this);
		}
	})
});


//拉取第一页 燃气费信息
var requestFirstGas = function(){
	requestAjaxGas(parseInt(1));    
}

//拉取上一页 燃气费信息
var requestBeforeGas = function(){
	var nowpage = parseInt($("#gaslist_nowpage").val());
	if(nowpage == 1) return;
	requestAjaxGas(nowpage-1);
}

// 拉取下一页 燃气费信息（??当前处理，前端判断是否是最后一页）
var requestNextGas = function(){
	var nowpage = parseInt($("#gaslist_nowpage").val());
	var totalpage = parseInt($("#gaslist_totalpage").text());
	if(nowpage == totalpage) return;
	requestAjaxGas(nowpage+1);
}

// 查询系统燃气费信息(??燃气费信息 type为1)
var requestAjaxGas = function(pageNum){
	var type = parseInt(1); 
	console.log("请求第"+ pageNum + "页燃气费信息");
	
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
				$("#gasTbody").html("");
				$("#serviceGasBottom").html("");
				
				for(var i=0; i<20; i++){
					$("#gasTbody").append("<tr><td>W2-12</td><td>Ada</td><td>S21</td><td>1200</td>"+
							"<td>1455</td><td>2300</td><td>34.6</td><td>Alice</td><td>S21</td><td>1200</td>"+
							"<td>1455</td><td>2300</td><td>34.6</td><td>Alice</td><td>2016-6-1</td></tr>");
				}	
				// 添加燃气费 底部页码
				$("#serviceGasBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeGas();'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='gaslist_nowpage' value='1' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='gaslist_totalpage'>2</span>"+
			            "<span class='page-next' onclick='requestNextGas();'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共83条记录</div>");
	// 		}
	// 	}
	// });
}

////////////////////////////////////////////////////////////////条件查询 燃气费信息 start
//根据房间号 拉取第一页 燃气费信息
var requestFirstGasByRoomNum = function(element){
	$(".search-roomNo").css("height","0");
	var roomNum = $(element).parent().children("input").val();
	
	requestAjaxGasByRoomNum(roomNum,parseInt(1));    
}

//根据房间号 拉取上一页 燃气费信息
var requestBeforeGasByRoomNum = function(){
	var roomNum = $(".searchRoomNum").text();
	//console.log("roomId:"+room_id);
	var nowpage = parseInt($("#gaslist_nowpage").val());
	if(nowpage == 1) return;
	
	requestAjaxGasByRoomNum(roomNum,nowpage-1);
}

//根据房间号 拉取下一页 燃气费信息（??当前处理，前端判断是否是最后一页）
var requestNextGasByRoomNum = function(){
	var roomNum = $(".searchRoomNum").text();
	//console.log("roomId:"+room_id);
	var nowpage = parseInt($("#gaslist_nowpage").val());
	var totalpage = parseInt($("#gaslist_totalpage").text());
	if(nowpage == totalpage) return;
	
	requestAjaxGasByRoomNum(roomNum,nowpage+1);
}


// 根据房间号查询系统燃气费信息(燃气费信息type为1)
var requestAjaxGasByRoomNum = function(roomNum,pageNum){
	console.log("请求房间："+ roomNum +"  第" + pageNum + "页的燃气费信息");
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
				$("#gasTbody").html("");
				$("#serviceGasBottom").html("");
				
					for(var i=0; i<20; i++){
					$("#gasTbody").append("<tr><td>W2-12</td><td>Ada</td><td>S21</td><td>1200</td>"+
							"<td>1455</td><td>2300</td><td>34.6</td><td>Alice</td><td>S21</td><td>1200</td>"+
							"<td>1455</td><td>2300</td><td>34.6</td><td>Alice</td><td>2016-6-1</td></tr>");
				}	
				// 添加燃气费 底部页码
				$("#serviceGasBottom").append("<div class='searchRoomNum' style='display:none;'>"+ roomNum +"</div>");
				$("#serviceGasBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeGasByRoomNum();'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='gaslist_nowpage' value='1' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='gaslist_totalpage'>2</span>"+
			            "<span class='page-next' onclick='requestNextGasByRoomNum();'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共12条记录</div>");
	// 		}
	// 	}
	// });
}
////////////////////////////////////////////////////////////////条件查询 燃气费信息 end




