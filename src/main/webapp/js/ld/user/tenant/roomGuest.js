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


