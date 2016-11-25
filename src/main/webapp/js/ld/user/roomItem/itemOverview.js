(function(){
    // 选择物品种类
    $(".itemTypeMenu li").click(function(){
    	$(".itemType .span").html($(this).text());
    	$(".itemTypeMenu").fadeOut(300);
    	var type = "";
    	switch($(this).index()){
    		case 0:
    			typeName = "全部"
    			break;
    		case 1:
    			typeName = "家电";
    		 	break;
    		case 2:
    			typeName = "家具";
    		 	break;
    		case 3:
    			typeName = "灯具";
    		 	break;
    		case 4:
    			typeName = "窗帘";
    		 	break;
    		case 5:
    			typeName = "浴屏";
    		 	break; 
    		case 6:
    			typeName = "备品";
    		 	break;
    		default:
    		 	break;
    	};
    	$("#itemTypeName").text(typeName);
    	requestItemByItemType(1);
    });

    // 物品种类
    $(".itemType").hover(function(){
    	$(".itemTypeMenu").fadeIn(300);
    },function(){
    	$(".itemTypeMenu").fadeOut(300);
    });
})();

// 请求客房物品总览
var requestItemOverview = function(pageNum){
	console.log("请求第" + pageNum + "页物品总览信息");
	$.ajax({
		url:'/LD/userItem/searchItemOverview.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:'{"pageNum":'+ pageNum +'}',
		success:function(data){
			console.log(data);

			if(data.State == "Invalid"){
				alert("您没有权限访问本页数据，请尝试升级权限或回退！");
				return;
			}
			else if(data.State == "Valid"){

		 		// 清空表格和页码
				$("#itemOverviewTbody").html("")
				$("#itemOverviewBottom").html("");

				var pageNow = data.pageNow;
				var pageTotal = data.pageTotal;
				var recordTotal = data.recordTotal;

				if (recordTotal == 0) {
					$("#itemOverviewTbody").append("<tr><td class='no-data' colspan='11' style='color: #ff4d4d'>"+
						"没有相关数据！</td></tr>");
					return;
				}

				for(var i=0; i<data.pageList.length; i++){
					var perRecord = data.pageList[i];

					$("#itemOverviewTbody").append("<tr><td>"+ perRecord.item_ID +"</td>"+
						"<td>"+ perRecord.type +"</td><td>"+ perRecord.cat +"</td>"+
						"<td>"+ perRecord.tag +"</td><td>"+ perRecord.state +"</td>"+
						"<td>"+ perRecord.state +"</td><td>"+ perRecord.state +"</td>"+
						"<td>"+ perRecord.company +"</td><td>"+ perRecord.comm +"</td>"+
						"<td>查看</td></tr>");
				}
				// 添加物品总览 底部页码
				$("#itemOverviewBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeItemOverview();'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='itemOverview_nowpage' value='"+ pageNow +"' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='itemOverview_totalpage'>"+ pageTotal +"</span>"+
			            "<span class='page-next' onclick='requestNextitemOverview();'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>"+ recordTotal +"</span>条记录</div>");
			}
		}
	});
}

//根据房间号 拉取上一页 物品总览信息
var requestBeforeItemOverview = function(){
	var nowpage = parseInt($("#itemOverview_nowpage").val());
	if(nowpage == 1) return;
	
	requestItemOverview(nowpage-1);
}

//根据房间号 拉取下一页 物品总览信息（??当前处理，前端判断是否是最后一页）
var requestNextitemOverview = function(){
	var nowpage = parseInt($("#itemOverview_nowpage").val());
	var totalpage = parseInt($("#itemOverview_totalpage").text());
	if(nowpage == totalpage) return;
	
	requestItemOverview(nowpage+1);
}

////////////////////////////////////////////////////////////////////////////
// 根据物品种类筛选
var requestItemByItemType = function(pageNum){
	    // 请求的物品物品名称
	    var type = $("#itemTypeName").text();

	    // 请求全部物品信息
		if(type == "全部"){
			requestItemOverview(1);
			return;
		}
		console.log("请求第" + pageNum + "页 type:"+ type + "物品总览信息");

	    $.ajax({
		url:'/LD/userItem/searchItemOverview.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:'{"pageNum":'+ pageNum +',"type":"' + type +'"}',
		success:function(data){
			console.log(data);

			if(data.State == "Invalid"){
				alert("您没有权限访问本页数据，请尝试升级权限或回退！");
				return;
			}
			else if(data.State == "Valid"){

		 		//清空表格和页码
				$("#itemOverviewTbody").html("")
				$("#itemOverviewBottom").html("");

				var pageNow = data.pageNow;
				var pageTotal = data.pageTotal;
				var recordTotal = data.recordTotal;
				if (recordTotal == 0) {
					$("#shoppingTbody").append("<tr><td class='no-data' colspan='7' style='color: #ff4d4d'>"+
						"没有相关数据！</td></tr>");
					return;
				}
				
				for(var i=0; i<data.pageList.length; i++){
					var perRecord = data.pageList[i];
					$("#itemOverviewTbody").append("<tr><td>"+ perRecord.item_ID +"</td>"+
							"<td>"+ perRecord.type +"</td><td>"+ perRecord.cat +"</td>"+
							"<td>"+ perRecord.tag +"</td><td>"+ perRecord.state +"</td>"+
							"<td>"+ perRecord.state +"</td><td>"+ perRecord.state +"</td>"+
							"<td>"+ perRecord.company +"</td><td>"+ perRecord.comm +"</td>"+
							"<td>查看</td></tr>");
				}
				// 添加物品总览 底部页码
				$("#itemOverviewBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeItemByType();'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='itemOverview_nowpage' value='"+ pageNow +"' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='itemOverview_totalpage'>"+ pageTotal +"</span>"+
			            "<span class='page-next' onclick='requestNextItemByType();'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>"+ recordTotal +"</span>条记录</div>");
			}
		}
	});
}

//根据物品种类拉取
var requestBeforeItemByType = function(){
	var nowpage = parseInt($("#itemOverview_nowpage").val());
	if(nowpage == 1) return;
	
	requestItemByItemType(nowpage-1);
}

//根据房间号 拉取下一页 物品总览信息（??当前处理，前端判断是否是最后一页）
var requestNextItemByType = function(){
	var nowpage = parseInt($("#itemOverview_nowpage").val());
	var totalpage = parseInt($("#itemOverview_totalpage").text());
	if(nowpage == totalpage) return;
	
	requestItemByItemType(nowpage+1);
}