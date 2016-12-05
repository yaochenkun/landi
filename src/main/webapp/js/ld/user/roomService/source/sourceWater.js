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
				$("#waterTbody").html("");
				$("#serviceWaterBottom").html("");

				var pageNow = data.pageNow;
				var pageTotal = data.pageTotal;
				var recordTotal = data.recordTotal;

				if (recordTotal == 0) {
					$("#waterTbody").append("<tr><td class='no-data' colspan='9' style='color: #ff4d4d'>"+
						"没有相关数据！</td></tr>");
					return;
				}
				
				for(var i=0; i<data.pageList.length; i++){
					var perRecord = data.pageList[i];

					// 将时间戳变为2016-12-12显示          	
            		var dDate = new Date(perRecord.time);
            		// var cbDate = dDate.toLocaleDateString().replace(/\//g,"-");
            		var cbDate = formatDate(dDate);

					$("#waterTbody").append("<tr><td>"+ perRecord.room_NUMBER +"</td>"+
						"<td>"+ perRecord.guest_NAME +"</td><td>"+ perRecord.meter +"</td>"+
						"<td>"+ perRecord.last_DATA + "</td>" +
						"<td>"+ perRecord.current_DATA +"</td><td>"+ perRecord.money +"&nbsp;元</td>"+
						"<td>"+ cbDate +"</td></tr>");
				}	
				// 添加水费 底部页码
				$("#serviceWaterBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeWater();'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='waterlist_nowpage' value='"+ pageNow +"' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='waterlist_totalpage'>"+ pageTotal +"</span>"+
			            "<span class='page-next' onclick='requestNextWater();'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ recordTotal +"&nbsp;</span>条记录</div>");
			}
		}
	});
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
	
	$.ajax({
		url:'/LD/userRoom/roomSearchSource.action',
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
				$("#waterTbody").html("");
				$("#serviceWaterBottom").html("");
				
				var pageNow = data.pageNow;
				var pageTotal = data.pageTotal;
				var recordTotal = data.recordTotal;

				if (recordTotal == 0) {
					$("#waterTbody").append("<tr><td class='no-data' colspan='9' style='color: #ff4d4d'>"+
						"没有相关数据！</td></tr>");
					return;
				}
				
				for(var i=0; i<data.pageList.length; i++){
					var perRecord = data.pageList[i];

					// 将时间戳变为2016-12-12显示          	
            		var dDate = new Date(perRecord.time);
            		// var cbDate = dDate.toLocaleDateString().replace(/\//g,"-");
            		var cbDate = formatDate(dDate);

					$("#waterTbody").append("<tr><td>"+ perRecord.room_NUMBER +"</td>"+
						"<td>"+ perRecord.guest_NAME +"</td><td>"+ perRecord.meter +"</td>"+
						"<td>"+ perRecord.last_DATA + "</td>" +
						"<td>"+ perRecord.current_DATA +"</td><td>"+ perRecord.money +"&nbsp;元</td>"+
						"<td>"+ cbDate +"</td></tr>");
				}	

				// 添加水费 底部页码
				$("#serviceWaterBottom").append("<div class='searchRoomNum' style='display:none;'>"+ roomNum +"</div>");
				$("#serviceWaterBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeWaterByRoomNum();'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='waterlist_nowpage' value='"+ pageNow +"' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='waterlist_totalpage'>"+ pageTotal +"</span>"+
			            "<span class='page-next' onclick='requestNextWaterByRoomNum();'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ recordTotal +"&nbsp;</span>条记录</div>");
			}
		}
	});
}
////////////////////////////////////////////////////////////////条件查询 水费信息 end




