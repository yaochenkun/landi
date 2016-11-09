(function(){
    // 选择订单号
    $(".itemTypeMenu li").click(function(){
    	$(".itemType .span").html($(this).text());
    	$(".itemTypeMenu").fadeOut(300);
    	requestItemByItemType($(this).index(),1);
    });

    // 物品种类
    $(".itemType").hover(function(){
    	$(".itemTypeMenu").fadeIn(300);
    },function(){
    	$(".itemTypeMenu").fadeOut(300);
    });
})();

// 请求采购计划
var requestPlanList = function(pageNum){
	console.log("请求第" + pageNum + "页采购计划信息");
	// $.ajax({
	// 	url:'/LD/searchOverview.action',
	// 	type:'post',
	// 	data:'pageNum='+ pageNum,
	// 	success:function(data){
	// 		console.log(data);

	 		// 清空表格和页码
			$("#planListTbody").html("")
			$("#planListBottom").html("");
			for(var i=0; i<5; i++){
				$("#planListTbody").append("<tr><td>1</td><td>1</td><td>1</td><td>1</td>"+
					"<td>1</td><td>1</td><td>1</td></tr>");
			}
			// 添加采购计划 底部页码
			$("#planListBottom").append("<div class='bottom-page'>"+
		        	"<span class='page-before' onclick='requestBeforePlanList();'>上一页&nbsp;&nbsp;</span>"+
		        	"<span><input id='planList_nowpage' value='1' type='text' class='input_num'></span>"+
		        	"<span>&nbsp;/&nbsp;</span>"+
		        	"<span id='planList_totalpage'>2</span>"+
		            "<span class='page-next' onclick='requestNextplanList();'>&nbsp;&nbsp;下一页</span>" +
		            "&nbsp;&nbsp;&nbsp;&nbsp;共83条记录</div>");
	// 	}
	// });
}

//根据房间号 拉取上一页 采购计划信息
var requestBeforePlanList = function(){
	var nowpage = parseInt($("#planList_nowpage").val());
	if(nowpage == 1) return;
	
	requestPlanList(nowpage-1);
}

//根据房间号 拉取下一页 采购计划信息（??当前处理，前端判断是否是最后一页）
var requestNextplanList = function(){
	var nowpage = parseInt($("#planList_nowpage").val());
	var totalpage = parseInt($("#planList_totalpage").text());
	if(nowpage == totalpage) return;
	
	requestPlanList(nowpage+1);
}

////////////////////////////////////////////////////////////////////////////
// 根据物品种类筛选
var requestItemByItemType = function(type,pageNum){
	    // 请求全部物品信息
		if(type == 0){
			requestPlanList(1);
			return;
		}
		console.log("请求第" + pageNum + "页 type:"+ type + "采购计划信息");
	// $.ajax({
	// 	url:'/LD/searchItemByItemType.action',
	// 	type:'post',
	// 	data:'pageNum='+ pageNum +'&type=' + type,
	// 	success:function(data){
	// 		console.log(data);

	 		// 清空表格和页码
			$("#planListTbody").html("")
			$("#planListBottom").html("");
			for(var i=0; i<5; i++){
				$("#planListTbody").append("<tr><td>1</td><td>家具</td><td>1</td><td>1</td>"+
					"<td>1</td><td>1</td><td>1</td></tr>");
			}
			// 添加采购计划 底部页码
			$("#planListBottom").append("<div class='bottom-page'>"+
		        	"<span class='page-before' onclick='requestBeforeItemByType();'>上一页&nbsp;&nbsp;</span>"+
		        	"<span><input id='planList_nowpage' value='1' type='text' class='input_num'></span>"+
		        	"<span>&nbsp;/&nbsp;</span>"+
		        	"<span id='planList_totalpage'>2</span>"+
		            "<span class='page-next' onclick='requestNextItemByType();'>&nbsp;&nbsp;下一页</span>" +
		            "&nbsp;&nbsp;&nbsp;&nbsp;共12条记录</div>");
	// 	}
	// });
}

//根据物品种类拉取
var requestBeforeItemByType = function(){
	var nowpage = parseInt($("#planList_nowpage").val());
	if(nowpage == 1) return;
	
	requestItemByItemType(1,nowpage-1);
}

//根据房间号 拉取下一页 采购计划信息（??当前处理，前端判断是否是最后一页）
var requestNextItemByType = function(){
	var nowpage = parseInt($("#planList_nowpage").val());
	var totalpage = parseInt($("#planList_totalpage").text());
	if(nowpage == totalpage) return;
	
	requestItemByItemType(1,nowpage+1);
}