(function(){
	$("#serviceRoomNumber").focus(function(){
		$(this).removeClass("border-red");
		$("#roomIdWarning").css("display","none");
	});

	// 按房间号筛选洗衣单收费记录
	$("#searchWashButton").keyup(function(e){
		if(e.keyCode == 13){
			requestWash(1);
		}
	});

	// 表格划过样式事件
	$("tbody tr").hover(function(){
		$(this).children("td").toggleClass("td-hover");
		$(this).children(".trTitle").toggleClass("td-hover");
	},function(){
		$(this).children("td").toggleClass("td-hover");
		$(this).children(".trTitle").toggleClass("td-hover");
	});

	// 绑定用户勾选多选框事件
	$("table input[type='radio']").bind("click", function(e){

		var node = $(e.target);
		var price = Number(e.target.nextSibling.innerHTML);

		// 设置总件数和总价
		var priceTr = $(e.target).parent().parent().children(".price");
		var countInput = $(e.target).parent().parent().children("td").children("input[type='text']").val();
		if (countInput != "") {
			$("#totalCount").text(Number($("#totalCount").text()) - countInput);
			$("#totalPrice").text(Number($("#totalPrice").text() - Number(priceTr.text().substring(0, priceTr.text().length - 1)))); 
		}
		$("#totalCount").text(Number($("#totalCount").text()) + 1);
		$("#totalPrice").text(Number($("#totalPrice").text()) + price);
		
		
		// 设置默认件数
		node.parent().parent().children("td").children("input[type='text']").val(1);

		// 设置金额
		node.parent().parent().children(".price").text(price + " 元");
		node.parent().parent().children("td").children(".unitPrice").text(price);
		node.parent().parent().children().children(".delete").css("display", "block");
	});

	// 绑定个输入件数事件
	$("table input[type='text']").bind("focus", function(e){
		var oldCount = Number($(e.target).val());
		if (isNaN(oldCount)) return;

		var unitPrice = $(e.target).parent().parent().children("td").children(".unitPrice").text();
		$("#totalCount").text(Number($("#totalCount").text()) - oldCount);
		$("#totalPrice").text(Number($("#totalPrice").text()) - oldCount * unitPrice);
	});
	$("table input[type='text']").bind("blur", function(e){
		var newCount = Number($(e.target).val());
		if (isNaN(newCount)) return;

		var unitPrice = $(e.target).parent().parent().children("td").children(".unitPrice").text();
		$(e.target).parent().parent().children(".price").text(newCount * unitPrice + " 元");
		$("#totalCount").text(Number($("#totalCount").text()) + newCount);
		$("#totalPrice").text(Number($("#totalPrice").text()) + newCount * unitPrice);
	});

	var hehe;
	// 删除一条洗衣信息
	$("table .delete").bind("click", function(e){
		// 减少总件数和总价
		var priceTr = $(e.target).parent().parent().children(".price");
		var countInput = $(e.target).parent().parent().children("td").children("input[type='text']");
		if (isNaN(countInput.val())) return;
		$("#totalCount").text(Number($("#totalCount").text()) - countInput.val());
		$("#totalPrice").text(Number($("#totalPrice").text() - Number(priceTr.text().substring(0, priceTr.text().length - 1)))); 

		// 删除本行记录
		$(e.target).parent().parent().children("td").children("input[type='radio']").attr("checked", false);
		countInput.val("");
		priceTr.text("");
		$(e.target).css("display", "none");
	});
})();

///////////////////////////////////////////////////////// 按房间号搜索洗衣单收费记录
// 按房间号查询洗衣单收费记录
// 请求洗衣单收费信息
var requestWash = function(pageNum){
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
			$("#washTable").html("");
			$("#serviceWashBottom").html("");

			if (data.recordTotal == 0) {
				$("#washTable").append("<tr><td class='emptyData' colspan='7'>没有相关信息！</td></tr>")
				return;
			}

			var fragment = document.createDocumentFragment();
			for(var i = 0; i < data.pageList.length; i++){
				var perRecord = data.pageList[i];
				var tr = document.createElement("tr");
				tr.innerHTML = "<td>"+ formatDateForm(new Date(perRecord.date)) +"</td>"
					+"<td>"+ perRecord.room_NUM +"</td><td>"+ perRecord.guest_NAME +"</td>"
					+"<td>"+ perRecord.clothes +"</td><td>"+ perRecord.total_PRICE +"&nbsp;元</td>";
				fragment.appendChild(tr);
			}
			document.getElementById("washTable").appendChild(fragment);

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
//拉取上一页 洗衣单收费信息（按房间号查询）
var requestBeforeWash = function(){
	var nowpage = parseInt($("#wash_nowpage").val());
	if(nowpage == 1) return;
	requestWash(nowpage - 1);
};
// 拉取下一页 洗衣单收费信息（按房间号查询）
var requestNextWash = function(){
	var nowpage = parseInt($("#wash_nowpage").val());
	var totalpage = parseInt($("#wash_totalpage").text());
	if(nowpage == totalpage) return;
	requestWash(nowpage + 1);
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
	var count = Number($("#totalCount").text());
	var totalPrice = Number($("#totalPrice").text());

	// 添加clothes字段
	var array = [];
	// 水洗
	$("table .laundry input[type='radio']").each(function(){
		// 选中
		if($(this).is(":checked")) {
			var name = $(this).parent().parent().children(".name").text();
			var count = Number($(this).parent().parent().children("td").children("input[type='text']").val());
			var perCloth = {"name": name, "count": count, "mode": "水洗"};
			// console.log(perCloth);
			array.push(perCloth);
		}
	});
	// 干洗
	$("table .dry input[type='radio']").each(function(){
		// 选中
		if($(this).is(":checked")) {
			var name = $(this).parent().parent().children(".name").text();
			var count = Number($(this).parent().parent().children("td").children("input[type='text']").val());
			var perCloth = {"name": name, "count": count, "mode": "干洗"};
			// console.log(perCloth);
			array.push(perCloth);
		}
	});

	//单熨
	$("table .pressing input[type='radio']").each(function(){
		// 选中
		if($(this).is(":checked")) {
			var name = $(this).parent().parent().children(".name").text();
			var count = Number($(this).parent().parent().children("td").children("input[type='text']").val());
			var perCloth = {"name": name, "count": count, "mode": "单熨"};
			// console.log(perCloth);
			array.push(perCloth);
		}
	});

	$.ajax({
		url:'/LD/userRoom/addWash.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify({'date': date, 'roomNum': roomNum, 'guestName': guestName, 'count': count, 'totalPrice': totalPrice,
		'clothes' : JSON.stringify(array),
		'other' : JSON.stringify([])}),
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
