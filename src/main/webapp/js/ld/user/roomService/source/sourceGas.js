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

// 查询系统燃气费信息(??燃气费信息 type为3)
var requestAjaxGas = function(pageNum){
	var type = parseInt(3); 
	console.log("请求第"+ pageNum + "页燃气费信息");
	$.ajax({
		url:'/LD/userRoom/roomSearchSource.action',
		type:'post',
		contentType:'application/json',
		data:'{"type":"'+ type +'","pageNum":'+ pageNum +'}',
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.State == "Invalid"){
				alert("您没有权限访问本页数据，请尝试升级权限或回退。");
				return;
			}
			else if(data.State == "Valid"){
				// 清空列表和页码
				$("#gasTbody").html("");
				$("#serviceGasBottom").html("");

				var pageNow = data.pageNow;
				var pageTotal = data.pageTotal;
				var recordTotal = data.recordTotal;

				if (recordTotal == 0) {
					$("#gasTbody").append("<tr><td class='no-data' colspan='11' style='color: #ff4d4d'>"+
						"没有相关数据！</td></tr>");
					return;
				}
							
				for(var i=0; i<data.pageList.length; i=i+2){
					var perRecord = data.pageList[i];
					var perRecord2 = data.pageList[i+1];

					// 将时间戳变为2016-12-12显示          	
            		var dDate = new Date(perRecord.time);
            		var cbDate = dDate.toLocaleDateString().replace(/\//g,"-");

            		var dDate2 = new Date(perRecord2.time);
            		var cbDate2 = dDate2.toLocaleDateString().replace(/\//g,"-");

					$("#gasTbody").append("<tr><td>"+ perRecord.room_NUMBER +"</td>"+
						"<td>"+ perRecord.guest_NAME +"</td><td>"+ perRecord.meter +"</td>"+
						"<td>"+ perRecord.last_DATA +"</td>"+
						"<td>"+ perRecord.current_DATA +"</td><td>"+ perRecord.money +"</td>"+
						"<td>"+ perRecord.meter +"</td>"+
						"<td>"+ perRecord2.last_DATA +"</td>"+
						"<td>"+ perRecord2.current_DATA +"</td><td>"+ perRecord2.money +"</td>"+
						"<td>"+ cbDate2 +"</td></tr>");
				}	

				// 添加燃气费 底部页码
				$("#serviceGasBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeGas();'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='gaslist_nowpage' value='"+ pageNow +"' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='gaslist_totalpage'>"+ Math.ceil(pageTotal)+"</span>"+
			            "<span class='page-next' onclick='requestNextGas();'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>"+ Math.ceil(recordTotal/2) +"</span>条记录</div>");
			}
		}
	});
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


// 根据房间号查询系统燃气费信息(燃气费信息type为3)
var requestAjaxGasByRoomNum = function(roomNum,pageNum){
	console.log("请求房间："+ roomNum +"  第" + pageNum + "页的燃气费信息");
	var type = parseInt(3);
	
	$.ajax({
		url:'/LD/userRoom/roomSearchSource.action',
		type:'post',
		contentType:'application/json',
		data:'{"type":"'+ type +'","pageNum":'+ pageNum +',"rNum":"'+ roomNum +'"}',
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.State == "Invalid"){
				alert("您没有权限访问本页数据，请尝试升级权限或回退。");
				return;
			}
			else if(data.State == "Valid"){
				// 清空列表和页码
				$("#gasTbody").html("");
				$("#serviceGasBottom").html("");

				var pageNow = data.pageNow;
				var pageTotal = data.pageTotal;
				var recordTotal = data.recordTotal;

				if (recordTotal == 0) {
					$("#gasTbody").append("<tr><td class='no-data' colspan='11' style='color: #ff4d4d'>"+
						"没有相关数据！</td></tr>");
					return;
				}
							
				for(var i=0; i<data.pageList.length; i=i+2){
					var perRecord = data.pageList[i];
					var perRecord2 = data.pageList[i+1];

					// 将时间戳变为2016-12-12显示          	
            		var dDate = new Date(perRecord.time);
            		var cbDate = dDate.toLocaleDateString().replace(/\//g,"-");

            		var dDate2 = new Date(perRecord2.time);
            		var cbDate2 = dDate2.toLocaleDateString().replace(/\//g,"-");

					$("#gasTbody").append("<tr><td>"+ perRecord.room_NUMBER +"</td>"+
						"<td>"+ perRecord.guest_NAME +"</td><td>"+ perRecord.meter +"</td>"+
						"<td>"+ perRecord.last_DATA +"</td>"+
						"<td>"+ perRecord.current_DATA +"</td><td>"+ perRecord.money +"</td>"+
						"<td>"+ perRecord.meter +"</td>"+
						"<td>"+ perRecord2.last_DATA +"</td>"+
						"<td>"+ perRecord2.current_DATA +"</td><td>"+ perRecord2.money +"</td>"+
						"<td>"+ cbDate2 +"</td></tr>");
				}	
				// 添加燃气费 底部页码
				$("#serviceGasBottom").append("<div class='searchRoomNum' style='display:none;'>"+ roomNum +"</div>");
				$("#serviceGasBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeGasByRoomNum();'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='gaslist_nowpage' value='"+ pageNow +"' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='gaslist_totalpage'>"+ Math.ceil(pageTotal/2) +"</span>"+
			            "<span class='page-next' onclick='requestNextGasByRoomNum();'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>"+ Math.ceil(recordTotal/2) +"</span>条记录</div>");
			}
		}
	});
}
////////////////////////////////////////////////////////////////条件查询 燃气费信息 end




