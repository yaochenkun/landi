var manage_type = "";
var room_type = "";
var owner_name = "";
var set_time = "";
var commend = "";
var replace_room = "";

var crossQuit = function () {
    $(".manage").css("display","none");
    $(".shadow").css("display","none");
}
// 获取租客信息（guest表）
var getGuestInfo = function (rid, rNum) {
	$.ajax({
		type: 'POST',
		url: '/LD/userRoom/getRoomInfo.action',
		contentType: 'application/json',
		dataType: 'json',
		data: '{"rid": ' + rid + ', "rNum": "'+ rNum +'", "op": "guest"}',
		success: function (data) {
			console.log(data);
			if (data.guest_info) {
				let info = data.guest_info;
				let name = info.guest_NAME;
				let tel = info.tel;
				let company = info.company;
				let title = info.title;
				let persons = info.persons;
				let comming = info.coming;
				let charge = info.charge;
				let car = info.car;
				let parking = info.parking;
				let comment = info.comment;
				$("#guestName").text(name);
				$("#telNum").text(tel);
				$("#company").text(company);
				$("#position").text(title);
				$("#totalNum").text(persons);
				$("#inDate").text(comming);
				$("#charge").text(charge);
				$("#park").text(parking);
				$("#comment").text(comment);
				$(".userInfo").css("display","block");
			}else{
				$(".user .noData").css("display","block");
			}
		}		
	});
};

// 获取房间基本信息（room表）
var getRoomInfo = function (rid, rNum) {
	console.log("获取房间基本信息（room表），rid:"+ rid + ",rNum:" + rNum);
	$.ajax({
		type: 'POST',
		url: '/LD/userRoom/getRoomInfo.action',
		contentType: 'application/json',
		dataType: 'json',
		data: '{"rid": ' + rid + ', "rNum": "'+ rNum +'", "op": "room"}',
		success: function (data) {
			console.log(data);
			if (data.room) {
				let info = data.room;
				let roomNo = info.room_NUMBER;
				let area = info.area;
				let state = info.state;
				let comm = info.comm;
				let rent = info.rent;
				$(".roomInfo .roomNo").text(roomNo);
				$(".roomInfo .area").text(area);
				$(".roomInfo .state").text(state);
				$(".roomInfo .comm").text(comm);
				$(".roomInfo .rent").text(rent);
				$(".roomInfo").css("display","block");
			}else{
				$(".room .noData").css("display","block");
			}
		}	
	});
};

var getMeters = function () {
	$.ajax({
		type: 'POST',
		url: '/LD/userRoom/getMeters.action',
		contentType: 'application/json',
		dataType: 'json',
		data: '{"rid": 1, "type": 2}',
		success: function (data) {
			console.log(data);
		}
		
	})
};

// 获取家具信息
var getFurniture = function (pageNum) {
	var rid = Number($("#rid").text());
	var rNum = $("#rNum").text();
	console.log("获取家具信息，房间ID：" + rid + "，房间Num：" + rNum);
	$.ajax({
		type: 'POST',
		url: '/LD/userRoom/getRoomInfo.action',
		contentType: 'application/json',
		dataType: 'json',
		data: '{"rid": ' + rid + ', "rNum": "'+ rNum +'", "op": "家具","pageNum":'+ pageNum +',"type":"家具"}',
		success: function (data) {
			console.log(data);
			// 清空列表和页码
			$("#item_furniture").html("");
			$("#furnitureBottom").html("");

			var pageNow = data.pageNow;
			var pageTotal = data.pageTotal;
			var recordTotal = data.recordTotal;

			if (recordTotal == 0) {
				$("#item_furniture").append("<tr><td class='no-data' colspan='6'>"+
					"没有相关数据！</td></tr>");
				return;
			}
			
			for(var i=0; i<data.pageList.length; i++){
				var perRecord = data.pageList[i];

				$("#item_furniture").append("<tr><td>"+ perRecord.item_ID +"</td>"+
					"<td>"+ perRecord.id +"</td><td>"+ perRecord.id +"</td>"+
					"<td>"+ perRecord.type +"</td>" +
					"<td>"+ perRecord.tag +"</td><td>"+ perRecord.comm +"</td></tr>");
			}	

			// 添加电费 底部页码
			$("#furnitureBottom").append("<div class='bottom-page'>"+
		        	"<span class='page-before' onclick='requestBeforeFurniture();'>上一页&nbsp;&nbsp;</span>"+
		        	"<span><input id='furniture_nowpage' value='"+ pageNow +"' type='text' class='input_num'></span>"+
		        	"<span>&nbsp;/&nbsp;</span>"+
		        	"<span id='furniture_totalpage'>"+ pageTotal +"</span>"+
		            "<span class='page-next' onclick='requestNextFurniture();'>&nbsp;&nbsp;下一页</span>" +
		            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ recordTotal +"&nbsp;</span>条记录</div>");
		}
	});
};
var requestBeforeFurniture = function(){
	var nowpage = parseInt($("#furniture_nowpage").val());
	if(nowpage == 1) return;
	
	getFurniture(nowpage-1);
};
var requestNextFurniture = function(){
	var nowpage = parseInt($("#furniture_nowpage").val());
	var totalpage = parseInt($("#furniture_totalpage").text());
	if(nowpage == totalpage) return;
	
	getFurniture(nowpage+1);
};


// 获取家电信息
var getElectric = function (pageNum) {
	var rid = Number($("#rid").text());
	var rNum = $("#rNum").text();
	console.log("获取家电信息，房间ID：" + rid + "，房间Num：" + rNum);
	$.ajax({
		type: 'POST',
		url: '/LD/userRoom/getRoomInfo.action',
		contentType: 'application/json',
		dataType: 'json',
		data: '{"rid": ' + rid + ', "rNum": "'+ rNum +'", "op": "家电","pageNum":'+ pageNum +',"type":"家电"}',
		success: function (data) {
			console.log(data);
			// 清空列表和页码
			$("#item_electric").html("");
			$("#electricBottom").html("");

			var pageNow = data.pageNow;
			var pageTotal = data.pageTotal;
			var recordTotal = data.recordTotal;

			if (recordTotal == 0) {
				$("#item_electric").append("<tr><td class='no-data' colspan='6'>"+
					"没有相关数据！</td></tr>");
				return;
			}
			
			for(var i=0; i<data.pageList.length; i++){
				var perRecord = data.pageList[i];

				$("#item_electric").append("<tr><td>"+ perRecord.item_ID +"</td>"+
					"<td>"+ perRecord.id +"</td><td>"+ perRecord.id +"</td>"+
					"<td>"+ perRecord.type +"</td>" +
					"<td>"+ perRecord.tag +"</td><td>"+ perRecord.comm +"</td></tr>");
			}	

			// 添加电费 底部页码
			$("#electricBottom").append("<div class='bottom-page'>"+
		        	"<span class='page-before' onclick='requestBeforeElectric();'>上一页&nbsp;&nbsp;</span>"+
		        	"<span><input id='electric_nowpage' value='"+ pageNow +"' type='text' class='input_num'></span>"+
		        	"<span>&nbsp;/&nbsp;</span>"+
		        	"<span id='electric_totalpage'>"+ pageTotal +"</span>"+
		            "<span class='page-next' onclick='requestNextElectric();'>&nbsp;&nbsp;下一页</span>" +
		            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ recordTotal +"&nbsp;</span>条记录</div>");
		}
	});
};
var requestBeforeElectric = function(){
	var nowpage = parseInt($("#electric_nowpage").val());
	if(nowpage == 1) return;
	
	getElectric(nowpage-1);
};
var requestNextElectric = function(){
	var nowpage = parseInt($("#furniture_nowpage").val());
	var totalpage = parseInt($("#electric_totalpage").text());
	if(nowpage == totalpage) return;
	
	getElectric(nowpage+1);
};

// 获取灯具信息
var getLight = function (pageNum) {
	var rid = Number($("#rid").text());
	var rNum = $("#rNum").text();
	console.log("获取灯具信息，房间ID：" + rid + "，房间Num：" + rNum);
	$.ajax({
		type: 'POST',
		url: '/LD/userRoom/getRoomInfo.action',
		contentType: 'application/json',
		dataType: 'json',
		data: '{"rid": ' + rid + ', "rNum": "'+ rNum +'", "op": "灯具","pageNum":'+ pageNum +',"type":"灯具"}',
		success: function (data) {
			console.log(data);
			// 清空列表和页码
			$("#item_light").html("");
			$("#lightBottom").html("");

			var pageNow = data.pageNow;
			var pageTotal = data.pageTotal;
			var recordTotal = data.recordTotal;

			if (recordTotal == 0) {
				$("#item_light").append("<tr><td class='no-data' colspan='6'>"+
					"没有相关数据！</td></tr>");
				return;
			}
			
			for(var i=0; i<data.pageList.length; i++){
				var perRecord = data.pageList[i];

				$("#item_light").append("<tr><td>"+ perRecord.item_ID +"</td>"+
					"<td>"+ perRecord.id +"</td><td>"+ perRecord.id +"</td>"+
					"<td>"+ perRecord.type +"</td>" +
					"<td>"+ perRecord.tag +"</td><td>"+ perRecord.comm +"</td></tr>");
			}	

			// 添加电费 底部页码
			$("#lightBottom").append("<div class='bottom-page'>"+
		        	"<span class='page-before' onclick='requestBeforeLight();'>上一页&nbsp;&nbsp;</span>"+
		        	"<span><input id='light_nowpage' value='"+ pageNow +"' type='text' class='input_num'></span>"+
		        	"<span>&nbsp;/&nbsp;</span>"+
		        	"<span id='light_totalpage'>"+ pageTotal +"</span>"+
		            "<span class='page-next' onclick='requestNextLight();'>&nbsp;&nbsp;下一页</span>" +
		            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ recordTotal +"&nbsp;</span>条记录</div>");
		}
	});
};
var requestBeforeLight = function(){
	var nowpage = parseInt($("#light_nowpage").val());
	if(nowpage == 1) return;
	
	getLight(nowpage-1);
};
var requestNextLight = function(){
	var nowpage = parseInt($("#furniture_nowpage").val());
	var totalpage = parseInt($("#light_totalpage").text());
	if(nowpage == totalpage) return;
	
	getLight(nowpage+1);
};


// 获取窗帘信息
var getCurtain = function (pageNum) {
	var rid = Number($("#rid").text());
	var rNum = $("#rNum").text();
	console.log("获取窗帘信息，房间ID：" + rid + "，房间Num：" + rNum);
	$.ajax({
		type: 'POST',
		url: '/LD/userRoom/getRoomInfo.action',
		contentType: 'application/json',
		dataType: 'json',
		data: '{"rid": ' + rid + ', "rNum": "'+ rNum +'", "op": "窗帘","pageNum":'+ pageNum +',"type":"窗帘"}',
		success: function (data) {
			console.log(data);
			// 清空列表和页码
			$("#item_curtain").html("");
			$("#curtainBottom").html("");

			var pageNow = data.pageNow;
			var pageTotal = data.pageTotal;
			var recordTotal = data.recordTotal;

			if (recordTotal == 0) {
				$("#item_curtain").append("<tr><td class='no-data' colspan='6'>"+
					"没有相关数据！</td></tr>");
				return;
			}
			
			for(var i=0; i<data.pageList.length; i++){
				var perRecord = data.pageList[i];

				$("#item_curtain").append("<tr><td>"+ perRecord.item_ID +"</td>"+
					"<td>"+ perRecord.id +"</td><td>"+ perRecord.id +"</td>"+
					"<td>"+ perRecord.type +"</td>" +
					"<td>"+ perRecord.tag +"</td><td>"+ perRecord.comm +"</td></tr>");
			}	

			// 添加电费 底部页码
			$("#curtainBottom").append("<div class='bottom-page'>"+
		        	"<span class='page-before' onclick='requestBeforeCurtain();'>上一页&nbsp;&nbsp;</span>"+
		        	"<span><input id='curtain_nowpage' value='"+ pageNow +"' type='text' class='input_num'></span>"+
		        	"<span>&nbsp;/&nbsp;</span>"+
		        	"<span id='curtain_totalpage'>"+ pageTotal +"</span>"+
		            "<span class='page-next' onclick='requestNextCurtain();'>&nbsp;&nbsp;下一页</span>" +
		            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ recordTotal +"&nbsp;</span>条记录</div>");
		}
	});
};
var requestBeforeCurtain = function(){
	var nowpage = parseInt($("#curtain_nowpage").val());
	if(nowpage == 1) return;
	
	getCurtain(nowpage-1);
};
var requestNextCurtain = function(){
	var nowpage = parseInt($("#furniture_nowpage").val());
	var totalpage = parseInt($("#curtain_totalpage").text());
	if(nowpage == totalpage) return;
	
	getCurtain(nowpage+1);
};

// 获取备品信息
var getLittle = function (pageNum) {
	var rid = Number($("#rid").text());
	var rNum = $("#rNum").text();
	console.log("获取备品信息，房间ID：" + rid + "，房间Num：" + rNum);
	$.ajax({
		type: 'POST',
		url: '/LD/userRoom/getRoomInfo.action',
		contentType: 'application/json',
		dataType: 'json',
		data: '{"rid": ' + rid + ', "rNum": "'+ rNum +'", "op": "备品","pageNum":'+ pageNum +',"type":"备品"}',
		success: function (data) {
			console.log(data);
			// 清空列表和页码
			$("#item_little").html("");
			$("#littleBottom").html("");

			var pageNow = data.pageNow;
			var pageTotal = data.pageTotal;
			var recordTotal = data.recordTotal;

			if (recordTotal == 0) {
				$("#item_little").append("<tr><td class='no-data' colspan='6'>"+
					"没有相关数据！</td></tr>");
				return;
			}
			
			for(var i=0; i<data.pageList.length; i++){
				var perRecord = data.pageList[i];

				$("#item_little").append("<tr><td>"+ perRecord.item_ID +"</td>"+
					"<td>"+ perRecord.id +"</td><td>"+ perRecord.id +"</td>"+
					"<td>"+ perRecord.type +"</td>" +
					"<td>"+ perRecord.tag +"</td><td>"+ perRecord.comm +"</td></tr>");
			}	

			// 添加电费 底部页码
			$("#littleBottom").append("<div class='bottom-page'>"+
		        	"<span class='page-before' onclick='requestBeforeLittle();'>上一页&nbsp;&nbsp;</span>"+
		        	"<span><input id='little_nowpage' value='"+ pageNow +"' type='text' class='input_num'></span>"+
		        	"<span>&nbsp;/&nbsp;</span>"+
		        	"<span id='little_totalpage'>"+ pageTotal +"</span>"+
		            "<span class='page-next' onclick='requestNextLittle();'>&nbsp;&nbsp;下一页</span>" +
		            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ recordTotal +"&nbsp;</span>条记录</div>");
		}
	});
};
var requestBeforeLittle = function(){
	var nowpage = parseInt($("#little_nowpage").val());
	if(nowpage == 1) return;
	
	getLittle(nowpage-1);
};
var requestNextLittle = function(){
	var nowpage = parseInt($("#furniture_nowpage").val());
	var totalpage = parseInt($("#little_totalpage").text());
	if(nowpage == totalpage) return;
	
	getLittle(nowpage+1);
};

//房源管理

var changeSelection = function(element) {
	$(element).siblings().each(function(){$(this).removeClass("item-active");});
	$("#room-type a").each(function(){$(this).removeClass("item-active");});
	$(element).addClass("item-active");
}


//房源管理选择操作类型 弹窗布局
var initChoiceManageDiv = function (type , state) {
    $(".item:eq(0)").show();
    if(state == null ) {
    	$("#addroom").show();
    	$("#replaceroom").hide();
    	$("#deleteroom").hide();
	}
	else if(type == "LE" || type == "小业主") {
		$("#deleteroom").show();
		$("#replaceroom").hide();
		$("#addroom").hide();
	}
	else if(type == "SPC") {
		$("#replaceroom").show();
		$("#deleteroom").show();
		$("#addroom").hide();

	}
	$(".item:gt(0)").hide();
	$("#man-foot-content").hide();
}

//添加房源 弹窗布局
var addRoomDiv = function() {
	$("#room-type").show();
	$(".item:gt(1)").hide();
    $("#man-foot-content").show();
}
var addRoomDivForLEAndSPC = function () {
	$("#room-name").hide();
	$("#room-replace").hide();
	$("#man-date").show();
	$("#man-date .span").text("接收日期");
	$("#com").show();
	$("#man-foot-content").show();
}

var addRoomDivForOwner = function () {
	addRoomDivForLEAndSPC();
	$("#room-name").show();
}
//替换房源 弹窗布局
var replaceRoomDiv = function () {
	$("#room-type").hide();
	$("#room-name").hide();
	$("#room-replace").show();
	$("#man-date").show();
	$("#man-date .span").text("替换日期");
	$("#com").show();
    $("#man-foot-content").show();
}
//退还房源 弹窗布局
var deleteRoomDiv = function () {
	replaceRoomDiv();
	$("#room-replace").hide();
	$("#man-date .span").text("退还日期");
}

var addChange = function (element) {
	manage_type = "添加房源";
    changeSelection(element);
    addRoomDiv();
}

var replaceChange = function (element) {
	manage_type = "替换房源";
	changeSelection(element);
	replaceRoomDiv();
}

var delChange = function (element) {
	manage_type = "退还房源";
 	changeSelection(element);
 	deleteRoomDiv();
}

var addForLE = function (element) {
	room_type = "LE";
	changeSelection(element);
	addRoomDivForLEAndSPC();
}

var addForSPC = function (element) {
	room_type = "SPC";
	changeSelection(element);
	addRoomDivForLEAndSPC();
}
var addForOwner = function (element) {
	room_type = "小业主";
	changeSelection(element);
	addRoomDivForOwner();
}


var roomManage = function(rNum) {
    $(".shadow").css("display","block");
    $(".manage").css("display","block");
			console.log(manage_type);
	var roomType;
	var roomState;
    $.ajax({
		type:'post',
		url:'/LD/userRoom/getManageOption.action',
		contentType:'application/json',
		dataType:'json',
		data:'{"rNum":"'+ rNum +'"}',
		success:function(data){
			console.log(data);
			if(data.State == "Invalid") {
                crossQuit();
                console.log("房源管理失败！");
			}
			else {
				roomType = data.RoomType;
				roomState = data.State;
				console.log(roomType);
                initChoiceManageDiv(roomType , roomState);

			}

		}
	});
}

var addManage = function(rNum) {
	owner_name = $("#owner").val();
	set_time = formatDateForm(new Date($(".pack_maintain").val()));
	replace_room = $("#replace_room").val();
	commend = $("#commend").val();

	console.log('{"rNum":"' + rNum + '","room_type":"' + room_type + '","name":"' + owner_name + '","time":"' +
        set_time + '","replace_room":"' + replace_room + '","com":"' + commend + '","manage":"' + manage_type + '"}');
	$.ajax({
		type:'POST',
		url:'/LD/userRoom/updateRoomInfo.action',
		contentType:'application/json',
		dataType:'json',
		data:'{"rNum":"' + rNum + '","room_type":"' + room_type + '","name":"' + owner_name + '","time":"' +
		set_time + '","replace_room":"' + replace_room + '","com":"' + commend + '","manage":"' + manage_type + '"}',
		success:function(data){
			if(data == 0){
                crossQuit();
				showModalBox("error","操作失败！");
			}else {
                crossQuit();
				showModalBox("success","操作成功！")
			}

		}

	});
}