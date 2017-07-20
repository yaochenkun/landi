// 客房服务--电费

// 初始绑定搜索键盘事件
$(function(){
	$(".search-input").keydown(function(e){
		// 回车键
		if(e.keyCode==13){
            requestElec($("#roomNumber").val(),parseInt(1));
		}
	})
});

var requestBeforeAndAfter = function(num,page){
    if(page<1) return;
    var totalpage = parseInt($("#waterlist_totalpage").text());
    if(page > totalpage) return;
    requestElec(num,page);
}

// 查询系统电费信息
var requestElec = function(num,pageNum){
	var type = 'elec';
	console.log("请求第"+ pageNum + "页电费信息");
	
	$.ajax({
		url:'/LD/userRoom/roomSearchSource.action',
		type:'post',
		contentType:'application/json',
		data:'{"pageNum":'+ pageNum +',"type":"'+ type + '","rNum":"' + num+ '"}',
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.State == "Invalid"){
                $("#elecTbody").append("<tr><td class='no-data' colspan='7' style='color: #ff4d4d'>"+
                    "您没有权限访问本页数据，请尝试升级权限或回退！</td></tr>");
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
					$("#elecTbody").append("<tr><td class='no-data' colspan='7' style='color: #ff4d4d'>"+
						"没有相关数据！</td></tr>");
					return;
				}
				
				for(var i=0; i<data.pageList.length; i++){
					var perRecord = data.pageList[i];

					$("#elecTbody").append("<tr><td>"+ perRecord.room_NUMBER +"</td>"+
						"<td>"+ perRecord.guest_NAME +"</td><td>"+ perRecord.meter +"</td>"+
						"<td>"+ perRecord.last_MONTH_VAL +
						"<td>"+ perRecord.cur_MONTH_VAL +"</td><td>"+ perRecord.money +"&nbsp;元</td>"+
						"<td>"+ formatDateForm(new Date(perRecord.cur_TIME)) +"</td></tr>");
				}	

				// 添加电费 底部页码
				$("#serviceElecBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeAndAfter(\"" + num + "\"," + pageNum + "-1);'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='eleclist_nowpage' value='"+ pageNow +"' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='eleclist_totalpage'>"+ pageTotal +"</span>"+
			            "<span class='page-next' onclick='requestBeforeAndAfter(\"" + num + "\"," + pageNum + "+1);'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ recordTotal +"&nbsp;</span>条记录</div>");
			}
		}
	});
}






