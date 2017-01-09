(function(){
	$("#serviceRoomNumber").focus(function(){
		$(this).removeClass("border-red");
		$("#roomIdWarning").css("display","none");
	});

	// 洗衣单弹出框选择衣服种类
	$(".item-content a").click(function(){
		$(".item-content a").each(function(){
			if($(this).hasClass("active")){
				$(this).removeClass("active");
			}
		});
		$(this).addClass("active");
	});

	// 按房间号筛选洗衣单收费记录
	$("#searchWashButton").keyup(function(e){
		if(e.keyCode == 13){
			requestWashByRoomNum(1);
		}
	});
})();


// 请求洗衣单收费信息
var requestWash = function(pageNum){
	console.log("请求第" +  pageNum + "页洗衣单收费信息");
	$.ajax({
		url:'/LD/userRoom/searchWash.action',
		type:'post',
		dataType:'json',
		data:'{"pageNum":'+ pageNum +'}',
		contentType:'application/json',
		success:function(data){
			console.log(data);

			// 清空
			clearWashDiv();

			for(var i = 0; i < data.dataList.length; i++){
				addPerWash(data.dataList[i]);
			}

		    // 添加洗衣单收费 底部页码
			$("#serviceWashBottom").append("<div class='bottom-page'>"+
		        	"<span class='page-before' onclick='requestBeforeWash();'>上一页&nbsp;&nbsp;</span>"+
		        	"<span><input id='wash_nowpage' value='"+ data.pageNow +"' type='text' class='input_num'></span>"+
		        	"<span>&nbsp;/&nbsp;</span>"+
		        	"<span id='wash_totalpage'>"+ data.pageTotal +"</span>"+
		            "<span class='page-next' onclick='requestNextWash();'>&nbsp;&nbsp;下一页</span>" +
		            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recorTotal'>&nbsp;"+ data.recordTotal +"&nbsp;</span>条记录</div>");
	}
	});
};
//拉取上一页 洗衣单收费信息
var requestBeforeWash = function(){
	var nowpage = parseInt($("#wash_nowpage").val());
	if(nowpage == 1) return;
	requestWash(nowpage - 1);
};

// 拉取下一页 洗衣单收费信息
var requestNextWash = function(){
	var nowpage = parseInt($("#wash_nowpage").val());
	var totalpage = parseInt($("#wash_totalpage").text());
	if(nowpage == totalpage) return;
	requestWash(nowpage + 1);
};

///////////////////////////////////////////////////////// 按房间号搜索洗衣单收费记录
// 按房间号查询洗衣单收费记录
// 请求洗衣单收费信息
var requestWashByRoomNum = function(pageNum,roomNum){
	var roomNum = $("#searchWashButton").val();
	console.log("请求 房间："+ roomNum + " 第" +  pageNum + "页洗衣单收费信息");
	$.ajax({
		url:'/LD/userRoom/searchWash.action',
		type:'post',
		dataType:'json',
		data:'{"pageNum":'+ pageNum +',"roomNum":"'+ roomNum +'"}',
		contentType:'application/json',
		success:function(data){
			console.log(data);

			// 清空
			clearWashDiv();

			for(var i = 0; i < data.dataList.length; i++){
				addPerWash(data.dataList[i]);
			}

		    // 添加洗衣单收费 底部页码
			$("#serviceWashBottom").append("<div class='bottom-page'>"+
		        	"<span class='page-before' onclick='requestBeforeWashByRoomNum();'>上一页&nbsp;&nbsp;</span>"+
		        	"<span><input id='wash_nowpage' value='"+ data.pageNow +"' type='text' class='input_num'></span>"+
		        	"<span>&nbsp;/&nbsp;</span>"+
		        	"<span id='wash_totalpage'>"+ data.pageTotal +"</span>"+
		            "<span class='page-next' onclick='requestNextWashByRoomNum();'>&nbsp;&nbsp;下一页</span>" +
		            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recorTotal'>&nbsp;"+ data.recordTotal +"&nbsp;</span>条记录</div>");
	}
	});
};
//拉取上一页 洗衣单收费信息（按房间号查询）
var requestBeforeWashByRoomNum = function(){
	var nowpage = parseInt($("#wash_nowpage").val());
	if(nowpage == 1) return;
	requestWash(nowpage - 1);
};
// 拉取下一页 洗衣单收费信息（按房间号查询）
var requestNextWashByRoomNum = function(){
	var nowpage = parseInt($("#wash_nowpage").val());
	var totalpage = parseInt($("#wash_totalpage").text());
	if(nowpage == totalpage) return;
	requestWash(nowpage + 1);
};

//////////////////////////////////////////////////////// 洗衣单收费列表项
// 清空洗衣单收费列表
var clearWashDiv = function(){
	$(".date").html("<td>日期<span>Date.</span></td>");    
	$(".roomNo").html("<td>房间号<span>Room No.</span></td>");
	$(".name").html("<td>姓名<span>Name.</span></td>");	

	$(".shirt").html("<td>衬衫<span>Shirt.</span></td>");
	$(".topSuit").html("<td>西装上衣<span>Top of suit.</span></td>");	
	$(".trousers").html("<td>裤子<span>Trousers.</span></td>");
	$(".jacket").html("<td>夹克<span>Jacket.</span></td>");
	$(".middleCoat").html("<td>外套（中）<span>Coat（middle）.</span></td>");
	$(".longCoat").html("<td>外套（长）<span>Coat(long).</span></td>");	 
	$(".shortCotton").html("<td>棉质外套（短）<span>Cotton coat(short).</span></td>");
	$(".middleCotton").html("<td>棉质外套（中）<span>Cotton coat(middle).</span></td>"); 
	$(".longCotton").html("<td>棉质外套（长）<span>Cotton coat(long).</span></td>");
	$(".cashmere").html("<td>羊绒外套<span>Cashmere Coat.</span></td>");  	 
	$(".shortPants").html("<td>短裤<span>Short Pants.</span></td>");
	$(".waistcoat").html("<td>马甲<span>Waistcoat.</span></td>");    
	$(".tshirt").html("<td>T恤<span>T-shirt.</span></td>");
	$(".knitted").html("<td>羊毛衫<span>Knitted sweater.</span></td>");      
	$(".tie").html("<td>领带<span>Tie.</span></td>");
	$(".longSkirt").html("<td>长裙<span>Long Skirt.</span></td>");  
	$(".shortSkirt").html("<td>短裙<span>Short Skirt.</span></td>");
	$(".other").html("<td>其他<span>Other.</span></td>");        
	$(".total").html("<td>总件数<span>Total Items.</span></td>");
	$(".price").html("<td>价格<span>Price.</span></td>");        

	$("#serviceWashBottom").html("");
};

// 项洗衣单收费列表添加每列洗衣单收费项
var addPerWash = function(perRecord){
	$(".date").append("<td>"+ formatDateForm(new Date(perRecord.date)) +"</td>");
	$(".roomNo").append("<td>"+ perRecord.room_NUM +"</td>");
	$(".name").append("<td>"+ perRecord.name +"</td>");

	var shirt =  perRecord.shirt == 0 ? "" : perRecord.shirt;
	var top_OF_SUIT = perRecord.top_OF_SUIT  == 0 ? "" : perRecord.top_OF_SUIT;
	var trousers = perRecord.trousers  == 0 ? "" : perRecord.trousers;
	var jacket = perRecord.jacket  == 0 ? "" : perRecord.jacket;
	var coat_M = perRecord.coat_M  == 0 ? "" : perRecord.coat_M;
	var coat_L = perRecord.coat_L  == 0 ? "" : perRecord.coat_L;
	var coat_MS = perRecord.coat_MS  == 0 ? "" : perRecord.coat_MS;
	var coat_MM = perRecord.coat_MM  == 0 ? "" : perRecord.coat_MM;
	var coat_ML = perRecord.coat_ML  == 0 ? "" : perRecord.coat_ML;
	var cashmere = perRecord.cashmere  == 0 ? "" : perRecord.cashmere;
	var short_PANTS = perRecord.short_PANTS  == 0 ? "" : perRecord.short_PANTS;
	var waistcoat = perRecord.waistcoat  == 0 ? "" : perRecord.waistcoat;
	var t_SHRIT = perRecord.t_SHRIT  == 0 ? "" : perRecord.t_SHRIT;
	var knitted = perRecord.knitted  == 0 ? "" : perRecord.knitted;
	var tie = perRecord.tie  == 0 ? "" : perRecord.tie;
	var long_SKIRT = perRecord.long_SKIRT  == 0 ? "" : perRecord.long_SKIRT;
	var short_SKIRT = perRecord.short_SKIRT  == 0 ? "" : perRecord.short_SKIRT;
	var other = perRecord.other  == 0 ? "" : perRecord.other;
	var total = perRecord.total  == 0 ? "" : perRecord.total;
	var price = perRecord.price  == 0 ? "" : perRecord.price;

	$(".shirt").append("<td>" +shirt +"</td>");
	$(".topSuit").append("<td>"+ top_OF_SUIT +"</td>");
	$(".trousers").append("<td>"+ trousers +"</td>");
	$(".jacket").append("<td>"+ jacket +"</td>");
	$(".middleCoat").append("<td>"+ coat_M +"</td>");
	$(".longCoat").append("<td>"+ coat_L +"</td>");
	$(".shortCotton").append("<td>"+ coat_MS +"</td>");
	$(".middleCotton").append("<td>"+ coat_MM +"</td>");
	$(".longCotton").append("<td>"+ coat_ML +"</td>");
	$(".cashmere").append("<td>"+ cashmere +"</td>");
	$(".shortPants").append("<td>"+ short_PANTS +"</td>");
	$(".waistcoat").append("<td>"+ waistcoat +"</td>");
	$(".tshirt").append("<td>"+ t_SHRIT +"</td>");
	$(".knitted").append("<td>"+ knitted +"</td>");
	$(".tie").append("<td>"+ tie +"</td>");
	$(".longSkirt").append("<td>"+ long_SKIRT +"</td>");
	$(".shortSkirt").append("<td>"+ short_SKIRT +"</td>");
	$(".other").append("<td>"+ other +"</td>");
	$(".total").append("<td>"+ total +"</td>");
	$(".price").append("<td>"+ price +"</td>");
};

/////////////////////////////////////////// 添加洗衣单收费
// 添加洗衣单收费
var addserviceWash = function(){
	// 判断房间号是否为空
	if($("#serviceRoomNumber").val() == ""){
		$("#roomIdWarning").css("display","block");
		$("#serviceRoomNumber").addClass("border-red");
		console.log("房间号为空！");
		return;
	}
	requestAddServiceWash();
}; 
var requestAddServiceWash = function(){
	console.log("添加房间洗衣单收费！");

	var date = formatDateForm(new Date());
	var roomNum = $("#serviceRoomNumber").val();
	var guestName = $("#guestName").val();

	var total = $("#clothTotal").text();
	var totalPrice = $("#totalPrice").val();

	var clothDetail = "";
	$("#clothList .perCloth").each(function(){
		clothDetail += '"'+ $(this).children(".clothType").text() +'":'+ $(this).children(".count").text() +',';
	});
	clothDetail = clothDetail == "" ? "" : clothDetail.substring(0,clothDetail.length-1);

	// console.log(clothDetail);
	$.ajax({
		url:'/LD/userRoom/addWash.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:'{"date":"'+ date +'","roomNum":"'+ roomNum +'","guestName":"'+ guestName +'",'
			+'"total":'+ total +',"totalPrice":'+ totalPrice + ',' + clothDetail +'}',
		success:function(data){
			console.log(data);
			if(data == 1){
				showModalBox("success","添加成功！");
			}else if(data == 0){
				showModalBox("error","添加失败！");
			}
		}
	});
};

/////////////////////////////////////////////////////选择衣服种类弹出框
// 选择衣服种类
var chooseClothes = function(){
	$(".shadow").css("display","block");
	$(".addItemDiv").css("display","block");

	setTimeout(function(){$('.addItemDiv').addClass('showMenuModal');},50);
	$(".addItemDiv").addClass("effect-fade");
};
// 关闭选择衣服种类弹出框
var closeClothesDiv = function(){
	$(".shadow").css("display","none");
	$(".addItemDiv").removeClass('showMenuModal'); 
	setTimeout(function(){$(".addItemDiv").css("display","none");},200);
};
// 选择一件衣服
var addOneWashCloth = function(){
	var text = "";
	var clothType = "";
	$(".item-content a").each(function(){
		if($(this).hasClass("active")){
			text = $(this).text();
			clothType = $(this).next("span").text();
		}
	});
	var count = Number($("#item-count input").val());
	$("#clothList").append("<div class='perCloth'><span>"+ text +"</span>"
		+"<span class='clothType' style='display:none;'>"+ clothType +"</span>&nbsp;"
		+"<span class='count'>"+ count +"</span>&nbsp;件"
		+"<a class='delete' onclick='deleteCloth(this);' href='javascript:void(0);'>删除</a></div>");

	$("#clothTotal").text(Number($("#clothTotal").text()) + count);
	closeClothesDiv();
}; 
// 删除选择的衣服
var deleteCloth = function(element){
	$("#clothTotal").text(Number($("#clothTotal").text()) - Number($(element).parent().children(".count").text()));
	$(element).parent().remove();
};