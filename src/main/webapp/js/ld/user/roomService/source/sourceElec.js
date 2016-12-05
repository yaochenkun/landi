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

// 查询系统电费信息(??电费信息 type为2)
var requestAjaxElec = function(pageNum){
	var type = parseInt(2); 
	console.log("请求第"+ pageNum + "页电费信息");
	
	$.ajax({
		url:'/LD/userRoom/roomSearchSource.action',
		type:'post',
		contentType:'application/json',
		data:'{"pageNum":'+ pageNum +',"type":'+ type +'}',
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.State == "Invalid"){
				alert("您没有权限访问本页数据，请尝试升级权限或回退。");
				return;
			}
			else if(data.State == "Valid"){
				// 清空列表和页码
				$("#elecTbody").html("");
				$("#serviceElecBottom").html("");

				var pageNow = data.pageNow;
				var pageTotal = data.pageTotal;
				var recordTotal = data.recordTotal;

				if (recordTotal == 0) {
					$("#elecTbody").append("<tr><td class='no-data' colspan='9' style='color: #ff4d4d'>"+
						"没有相关数据！</td></tr>");
					return;
				}
				
				for(var i=0; i<data.pageList.length; i++){
					var perRecord = data.pageList[i];

					// 将时间戳变为2016-12-12显示          	
            		var dDate = new Date(perRecord.time);
            		// var cbDate = dDate.toLocaleDateString().replace(/\//g,"-");
            		var cbDate = formatDate(dDate);

					$("#elecTbody").append("<tr><td>"+ perRecord.room_NUMBER +"</td>"+
						"<td>"+ perRecord.guest_NAME +"</td><td>"+ perRecord.meter +"</td>"+
						"<td>"+ perRecord.last_DATA +
						"<td>"+ perRecord.current_DATA +"</td><td>"+ perRecord.money +"</td>"+
						"<td>"+ cbDate +"</td></tr>");
				}	

				// 添加电费 底部页码
				$("#serviceElecBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeElec();'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='eleclist_nowpage' value='"+ pageNow +"' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='eleclist_totalpage'>"+ pageTotal +"</span>"+
			            "<span class='page-next' onclick='requestNextElec();'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ recordTotal +"&nbsp;</span>条记录</div>");
			}
		}
	});
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


// 根据房间号查询系统电费信息(电费信息type为2)
var requestAjaxElecByRoomNum = function(roomNum,pageNum){
	console.log("请求房间："+ roomNum +"  第" + pageNum + "页的电费信息");
	var type = parseInt(2);
	
	$.ajax({
		url:'/LD/userRoom/roomSearchSource.action',
		type:'post',
		contentType:'application/json',
		data:'{"type":"'+ type +'","pageNum":"'+ pageNum +'","rNum":"'+ roomNum +'"}',
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.State == "Invalid"){
				alert("您没有权限访问本页数据，请尝试升级权限或回退。");
				return;
			}
			else if(data.State == "Valid"){
				$("#elecTbody").html("");
				$("#serviceElecBottom").html("");

				var pageNow = data.pageNow;
				var pageTotal = data.pageTotal;
				var recordTotal = data.recordTotal;

				if (recordTotal == 0) {
					$("#elecTbody").append("<tr><td class='no-data' colspan='9' style='color: #ff4d4d'>"+
						"没有相关数据！</td></tr>");
					return;
				}
				
				for(var i=0; i<data.pageList.length; i++){
					var perRecord = data.pageList[i];

					// 将时间戳变为2016-12-12显示          	
            		var dDate = new Date(perRecord.time);
            		// var cbDate = dDate.toLocaleDateString().replace(/\//g,"-");
            		var cbDate = formatDate(dDate);

					$("#elecTbody").append("<tr><td>"+ perRecord.room_NUMBER +"</td>"+
						"<td>"+ perRecord.guest_NAME +"</td><td>"+ perRecord.meter +"</td>"+
						"<td>"+ perRecord.last_DATA +"</td>"+
						"<td>"+ perRecord.current_DATA +"</td><td>"+ perRecord.money +"</td>"+
						"<td>"+ cbDate +"</td></tr>");
				}	
				// 添加电费 底部页码
				$("#serviceElecBottom").append("<div class='searchRoomNum' style='display:none;'>"+ roomNum +"</div>");
				$("#serviceElecBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeElecByRoomNum();'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='eleclist_nowpage' value='"+ pageNow +"' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='eleclist_totalpage'>"+ pageTotal +"</span>"+
			            "<span class='page-next' onclick='requestNextElecByRoomNum();'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ recordTotal +"&nbsp;</span>条记录</div>");
			}
		}
	});
}
////////////////////////////////////////////////////////////////条件查询 电费信息 end




