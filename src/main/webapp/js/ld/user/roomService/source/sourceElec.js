// 客房服务--电费

// 初始绑定搜索键盘事件
$(function(){
	$(".search-input").keydown(function(e){
		// 回车键
		if(e.keyCode==13){
			requestFirstElecByRoomNum(this);
		}
	})
});


//拉取第一页 电费信息
var requestFirstElec = function(){
	requestAjaxElec(parseInt(1));    
}

//拉取上一页 电费信息
var requestBeforeElec = function(){
	var nowpage = parseInt($("#eleclist_nowpage").val());
	if(nowpage == 1) return;
	requestAjaxElec(nowpage-1);
}

// 拉取下一页 电费信息（??当前处理，前端判断是否是最后一页）
var requestNextElec = function(){
	var nowpage = parseInt($("#eleclist_nowpage").val());
	var totalpage = parseInt($("#eleclist_totalpage").text());
	if(nowpage == totalpage) return;
	requestAjaxElec(nowpage+1);
}

// 查询系统电费信息(??电费信息 type为1)
var requestAjaxElec = function(pageNum){
	var type = parseInt(1); 
	console.log("请求第"+ pageNum + "页电费信息");
	
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
				$("#elecTbody").html("");
				$("#serviceElecBottom").html("");
				
				for(var i=0; i<20; i++){
					$("#elecTbody").append("<tr><td>1</td><td>Ada</td><td>1</td><td>1200</td>"+
							"<td>1455</td><td>2300</td><td>34.6</td><td>Alice</td><td>2016-6-1</td></tr>");
				}	
				// 添加电费 底部页码
				$("#serviceElecBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeElec();'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='eleclist_nowpage' value='1' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='eleclist_totalpage'>2</span>"+
			            "<span class='page-next' onclick='requestNextElec();'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共83条记录</div>");
	// 		}
	// 	}
	// });
}

////////////////////////////////////////////////////////////////条件查询 电费信息 start
//根据房间号 拉取第一页 电费信息
var requestFirstElecByRoomNum = function(element){
	$(".search-roomNo").css("height","0");
	var roomNum = $(element).parent().children("input").val();
	
	requestAjaxElecByRoomNum(roomNum,parseInt(1));    
}

//根据房间号 拉取上一页 电费信息
var requestBeforeElecByRoomNum = function(){
	var roomNum = $(".searchRoomNum").text();
	//console.log("roomId:"+room_id);
	var nowpage = parseInt($("#eleclist_nowpage").val());
	if(nowpage == 1) return;
	
	requestAjaxElecByRoomNum(roomNum,nowpage-1);
}

//根据房间号 拉取下一页 电费信息（??当前处理，前端判断是否是最后一页）
var requestNextElecByRoomNum = function(){
	var roomNum = $(".searchRoomNum").text();
	//console.log("roomId:"+room_id);
	var nowpage = parseInt($("#eleclist_nowpage").val());
	var totalpage = parseInt($("#eleclist_totalpage").text());
	if(nowpage == totalpage) return;
	
	requestAjaxElecByRoomNum(roomNum,nowpage+1);
}


// 根据房间号查询系统电费信息(电费信息type为1)
var requestAjaxElecByRoomNum = function(roomNum,pageNum){
	console.log("请求房间："+ roomNum +"  第" + pageNum + "页的电费信息");
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
				$("#elecTbody").html("");
				$("#serviceElecBottom").html("");
				
					for(var i=0; i<20; i++){
					$("#elecTbody").append("<tr><td>1</td><td>Ada</td><td>1</td><td>1200</td>"+
							"<td>1455</td><td>2300</td><td>34.6</td><td>Alice</td><td>2016-6-1</td></tr>");
				}	
				// 添加电费 底部页码
				$("#serviceElecBottom").append("<div class='searchRoomNum' style='display:none;'>"+ roomNum +"</div>");
				$("#serviceElecBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeElecByRoomNum();'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='eleclist_nowpage' value='1' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='eleclist_totalpage'>2</span>"+
			            "<span class='page-next' onclick='requestNextElecByRoomNum();'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共12条记录</div>");
	// 		}
	// 	}
	// });
}
////////////////////////////////////////////////////////////////条件查询 电费信息 end




