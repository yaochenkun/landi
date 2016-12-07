// 请求物品库存信息
var requestFacSta = function(){
	var facID = Number($("#facID").text());
	console.log("请求物品编号：" + facID + "的库存情况");

	$.ajax({
		url:'/LD/userItem/searchFacSta.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		data:'{"facID":'+ facID +'}',
		success:function(data){
			console.log(data);
			// 物品种类、子类、品牌、名称
			$(".fac-title .type").text(data.fac.type);
			$(".fac-title .cat").text(data.fac.cat);
			$(".fac-title .com").text(data.fac.company);
			$(".fac-title .name").text(data.fac.name);
			// 总量、可用、已分配、报废
			$(".fac-sta .count").eq(0).text(data.fac.total);
			$(".fac-sta .count").eq(1).text(data.fac.free);
			$(".fac-sta .count").eq(2).text(data.fac.working);
			$(".fac-sta .count").eq(3).text(data.fac.bad);
		}
	});
};

// 请求物品分配信息
var requestRoomItem = function (pageNum) {
	var facID = Number($("#facID").text());
	console.log("请求物品编号：" + facID + "第" + pageNum +"页的房间分配情况");
	$.ajax({
		url:'/LD/userItem/searchFacDetail.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		data:'{"facID":'+ facID +',"pageNum":'+ pageNum +'}',
		success:function(data){
			console.log(data);

			// // 清空物品详细信息
			$("#facDetailTbody").html("");
			$("#roomItemBottom").html("");
			
			var pageNow = data.pageNow;
			var pageTotal = data.pageTotal;
			var recordTotal = data.recordTotal;

			if (recordTotal == 0) {
				$("#facDetailTbody").append("<tr><td colspan='4'>没有相关信息！</td></tr>");
			} else {
				for(var i = 0; i < data.pageList.length; i++){
					var perFac = data.pageList[i];
					$("#facDetailTbody").append("<tr><td>"+ perFac.room_ID +"</td>"+
						"<td>"+ perFac.tag +"</td><td>"+ perFac.comm +"</td>"+
						"<td><span class='blue' onclick='transferFac(this);''>转移</span>"+
						"<span class='blue' onclick='requestToWarehouse(this);'>回仓库</span>"+
						"<span class='gray' onclick='requestFacBad(this);'>报废</span>"+
						"<span class='recID' style='display:none;'>"+ perFac.id +"</span></td></tr>");
				}
				// 添加物品总览 底部页码
				$("#roomItemBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeRoomItem();'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='roomItem_nowpage' value='"+ pageNow +"' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='roomItem_totalpage'>"+ pageTotal +"</span>"+
			            "<span class='page-next' onclick='requestNextRoomItem();'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ recordTotal +"&nbsp;</span>条记录</div>");
			}
		}
	});
};

// 请求上一页房间物品分配信息
var requestBeforeRoomItem = function(){
	var nowpage = parseInt($("#roomItem_nowpage").val());
	if(nowpage == 1) return;
	
	requestRoomItem(nowpage-1);
};

// 请求下一页房间物品分配信息
var requestNextRoomItem = function(){
	var nowpage = parseInt($("#roomItem_nowpage").val());
	var totalpage = parseInt($("#roomItem_totalpage").text());
	if(nowpage == totalpage) return;
	
	requestRoomItem(nowpage+1);
};

// 转移物品到其他房间
var transferFac = function(element){
	$(".shadow").css("display","block");
	$('#transferMenu').css("display","block");

 	setTimeout(function(){$('#transferMenu').addClass('showMenu');},50);
	$("#transferMenu").addClass("effect-fade");

	// 即将转移物品在数据库表中的id
	var recID = $(element).parent().children(".recID").text();
	$("#transferMenu .rec-id").text(recID);

	var roomNumber = $(element).parent().parent().children("td").eq(0).text();
	$("#transferMenu .roomNumber").text(roomNumber);

};
var closeTransferDiv = function(){
	$(".shadow").css("display","none");
	$("#transferMenu").removeClass('showMenu');
};

// 转移物品
var requestTransferFac = function(){
	var recID = Number($("#transferMenu .rec-id").text());
	var rNum = $("#transferMenu input").val();
	$.ajax({
		url:'/LD/userItem/transferFac.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		data:'{"recID":'+ recID +',"rNum":"'+ rNum +'"}',
		success:function(data){
			console.log(data);
			if(data == 1){
				alert("移动成功！");
				window.location.reload();
			} else {
				alert("移动失败！");
			}
		}
	});
}

// 物品回仓库
var requestToWarehouse = function(element){
	var recID = Number($(element).parent().children(".recID").text());
	// 将物品回仓库
	$.ajax({
		url:'/LD/userItem/toWarehouse.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		data:'{"recID":'+ recID +'}',
		success:function(data){
			console.log(data);
			if(data == 1){
				alert("回仓库成功！")
			} else {
				alert("回仓库失败！");
			}
		}
	});
};

// 物品报废
var requestFacBad = function(element){
	var recID = Number($(element).parent().children(".recID").text());
	$.ajax({
		url:'/LD/userItem/facBad.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		data:'{"recID":'+ recID +'}',
		success:function(data){
			console.log(data);
			if(data == 1){
				alert("报废成功！")
			} else {
				alert("报废失败！");
			}
		}
	});
};

// 新分配物品
var newDistribute = function(){
	$.ajax({
		url:'/LD/newDistribute.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		success:function(data){
			console.log(data);
		}
	});
};

// 新报废
var newfacBad = function(){
	$.ajax({
		url:'/LD/newFacBad.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		success:function(data){
			console.log(data);
		}
	});
}