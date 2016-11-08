(function(){
	// 展开菜单
    $(".homeMenu").click(function(){
   		$(".main-nav").animate({width:"160px"}, 100);
   		// 菜单箭头样式
   	    setInterval(function(){$("i:nth-child(3)").animate({"opacity":"0.1"},500).animate({"opacity":"1"},1000);},2500);
    	setTimeout(function(){
	    	setInterval(function(){$("i:nth-child(2)").animate({"opacity":"0.1"},500).animate({"opacity":"1"},1000);},2500); 
	    	setTimeout(function(){
	    		var i1 = setInterval(function(){$("i:nth-child(1)").animate({"opacity":"0.1"},500).animate({"opacity":"1"},1000);
    		},2500);},400);},200
    	);
   	});

    // 收起菜单
    $(".menuOne").click(function(){
    	$(".main-nav").animate({width:"0"}, 100);
    });

    // 选择物品种类
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

// 请求客房物品总览
var requestItemOverview = function(pageNum){
	console.log("请求第" + pageNum + "页物品总览信息");
	// $.ajax({
	// 	url:'/LD/searchOverview.action',
	// 	type:'post',
	// 	data:'pageNum='+ pageNum,
	// 	success:function(data){
	// 		console.log(data);

	 		// 清空表格和页码
			$("#itemOverviewTbody").html("")
			$("#itemOverviewBottom").html("");
			for(var i=0; i<5; i++){
				$("#itemOverviewTbody").append("<tr><td>1</td><td>1</td><td>1</td><td>1</td>"+
					"<td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td></tr>");
			}
			// 添加物品总览 底部页码
			$("#itemOverviewBottom").append("<div class='bottom-page'>"+
		        	"<span class='page-before' onclick='requestBeforeItemOverview();'>上一页&nbsp;&nbsp;</span>"+
		        	"<span><input id='itemOverview_nowpage' value='1' type='text' class='input_num'></span>"+
		        	"<span>&nbsp;/&nbsp;</span>"+
		        	"<span id='itemOverview_totalpage'>2</span>"+
		            "<span class='page-next' onclick='requestNextitemOverview();'>&nbsp;&nbsp;下一页</span>" +
		            "&nbsp;&nbsp;&nbsp;&nbsp;共83条记录</div>");
	// 	}
	// });
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
var requestItemByItemType = function(type,pageNum){
	    // 请求全部物品信息
		if(type == 0){
			requestItemOverview(1);
			return;
		}
		console.log("请求第" + pageNum + "页 type:"+ type + "物品总览信息");
	// $.ajax({
	// 	url:'/LD/searchItemByItemType.action',
	// 	type:'post',
	// 	data:'pageNum='+ pageNum +'&type=' + type,
	// 	success:function(data){
	// 		console.log(data);

	 		// 清空表格和页码
			$("#itemOverviewTbody").html("")
			$("#itemOverviewBottom").html("");
			for(var i=0; i<5; i++){
				$("#itemOverviewTbody").append("<tr><td>1</td><td>家具</td><td>1</td><td>1</td>"+
					"<td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>查看</td></tr>");
			}
			// 添加物品总览 底部页码
			$("#itemOverviewBottom").append("<div class='bottom-page'>"+
		        	"<span class='page-before' onclick='requestBeforeItemByType();'>上一页&nbsp;&nbsp;</span>"+
		        	"<span><input id='itemOverview_nowpage' value='1' type='text' class='input_num'></span>"+
		        	"<span>&nbsp;/&nbsp;</span>"+
		        	"<span id='itemOverview_totalpage'>2</span>"+
		            "<span class='page-next' onclick='requestNextItemByType();'>&nbsp;&nbsp;下一页</span>" +
		            "&nbsp;&nbsp;&nbsp;&nbsp;共83条记录</div>");
	// 	}
	// });
}

//根据物品种类拉取
var requestBeforeItemByType = function(){
	var nowpage = parseInt($("#itemOverview_nowpage").val());
	if(nowpage == 1) return;
	
	requestItemByItemType(1,nowpage-1);
}

//根据房间号 拉取下一页 物品总览信息（??当前处理，前端判断是否是最后一页）
var requestNextItemByType = function(){
	var nowpage = parseInt($("#itemOverview_nowpage").val());
	var totalpage = parseInt($("#itemOverview_totalpage").text());
	if(nowpage == totalpage) return;
	
	requestItemByItemType(1,nowpage+1);
}