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
		if(unitPrice == "") {$(this).val(0); return;}
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
		countInput.val(0);
		priceTr.text("");
		$(e.target).css("display", "none");
		$(e.target).next().text("");
	});
})();

//查询所有衣服的水洗、干洗、单熨的单价
var requestUnitPrice = function(){

	$.ajax({
		url:'/LD/userRoom/getLaundryPrice.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		success:function(data){
			
			console.log(data);

			//将单价写入表中
			$(".bill-table tr:not(:first:last)").each(function(){

				clothName = $(this).find(".name").text();
				if(data[clothName] == undefined) return;
				var prices = data[clothName].split(",");
				var laundryPrice = prices[0];
				var dryPrice = prices[1];
				var pressingPrice = prices[2];
				if(laundryPrice != -1) $(this).find(".laundry span").text(laundryPrice);
				if(dryPrice != -1) $(this).find(".dry span").text(dryPrice);
				if(pressingPrice != -1) $(this).find(".pressing span").text(pressingPrice);
			});
		}
	});
};


///////////////////////////////////////////////////////// 按房间号搜索洗衣单收费记录
// 按房间号查询洗衣单收费记录
// 请求洗衣单收费信息
var requestWash = function(pageNum){

	var roomNum = $("#searchWashButton").val();
	var date = $(".pack_maintain").val();
	console.log("请求 房间："+ roomNum + " 第" +  pageNum + "页洗衣单收费信息");
	$.ajax({
		url:'/LD/userRoom/searchWash.action',
		type:'post',
		dataType:'json',
		data:'{"pageNum":'+ pageNum +',"roomNum":"'+ roomNum +'", "date":"'+ date +'"}',
		contentType:'application/json',
		success:function(data){
			console.log(data);

			// 清空
			$("#washTable").html("");
			$("#serviceWashBottom").html("");

			if (data.recordTotal == 0) {
				$("#washTable").append("<tr><td class='emptyData' colspan='9'>没有相关信息！</td></tr>")
				return;
			}

			var fragment = document.createDocumentFragment();
			for(var i = 0; i < data.pageList.length; i++){
				var perRecord = data.pageList[i];
				var tr = document.createElement("tr");

				//拼接字符串
				clothes = JSON.parse(perRecord.clothes);
				others = JSON.parse(perRecord.other);
				var details = "";
				for(var j = 0; j < clothes.length; j++)
					details += clothes[j].mode + "&nbsp;:&nbsp;" + clothes[j].name + "&nbsp;x&nbsp;" + clothes[j].count + "</br>";
				for(var j = 0; j < others.length; j++)
					details += others[j].mode + "&nbsp;:&nbsp;" + others[j].name + "&nbsp;x&nbsp;" + others[j].count + "</br>";

				tr.innerHTML = "<td>"+ perRecord.room_NUM +"</td><td>"+ perRecord.guest_NAME +"</td>"
					+"<td>"+ details +"</td><td>"+ perRecord.count +"</td><td>"+ perRecord.total_PRICE +"&nbsp;元</td>"
					+"<td>"+ formatDateForm(new Date(perRecord.date)) +"</td>"
					+"<td>"+ formatDate(new Date(perRecord.import_TIME)) +"</td>"
					+"<td>"+ formatDate(new Date(perRecord.edit_TIME)) +"</td>"
					+"<td><a id='editCom' href='serviceWashEdit.jsp?id="+ perRecord.id +"'>编辑</a><a id='deleteCom' onclick='serviceWashDelete("+ perRecord.id +")'>删除</a></td>";
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
	var normalClothes = [];
	var otherClothes = [];

	// 水洗
	$("table .laundry input[type='radio']").each(function(){
		// 选中
		if($(this).is(":checked")) {

			var perCloth;
			if($(this).attr("name").indexOf("other") == -1){ //系统提供的衣服种类
				var name = $(this).parent().parent().children(".name").text();
				var count = Number($(this).parent().parent().children("td").children("input[type='text']").val());
				perCloth = {"name": name, "count": count, "mode": "水洗"};
				normalClothes.push(perCloth);
			}
			else { //其他自定义种类
				var name = $(this).parent().parent().find(".name input[type='text']").val();
				var count = Number($(this).parent().parent().children("td").eq(4).children("input[type='text']").val());
				var unitPrice = $(this).next().val();

				perCloth = {"name": name, "count": count, "mode": "水洗", "price" : Number(unitPrice)};
				otherClothes.push(perCloth);
			}
		}
	});
	// 干洗
	$("table .dry input[type='radio']").each(function(){
		// 选中
		if($(this).is(":checked")) {

			var perCloth;
			if($(this).attr("name").indexOf("other") == -1){ //系统提供的衣服种类
				var name = $(this).parent().parent().children(".name").text();
				var count = Number($(this).parent().parent().children("td").children("input[type='text']").val());
				perCloth = {"name": name, "count": count, "mode": "干洗"};
				normalClothes.push(perCloth);
			}
			else {//其他自定义种类
				var name = $(this).parent().parent().find(".name input[type='text']").val();
				var count = Number($(this).parent().parent().children("td").eq(4).children("input[type='text']").val());
				var unitPrice = $(this).next().val();
				perCloth = {"name": name, "count": count, "mode": "干洗", "price" : Number(unitPrice)};
				otherClothes.push(perCloth);
			}
		}
	});

	//单熨
	$("table .pressing input[type='radio']").each(function(){
		// 选中
		if($(this).is(":checked")) {

			var perCloth;
			if($(this).attr("name").indexOf("other") == -1){ //系统提供的衣服种类
				var name = $(this).parent().parent().children(".name").text();
				var count = Number($(this).parent().parent().children("td").children("input[type='text']").val());
				perCloth = {"name": name, "count": count, "mode": "单熨"};
				normalClothes.push(perCloth);
			}
			else { //其他自定义种类
				var name = $(this).parent().parent().find(".name input[type='text']").val();
				var count = Number($(this).parent().parent().children("td").eq(4).children("input[type='text']").val());
				var unitPrice = $(this).next().val();
				perCloth = {"name": name, "count": count, "mode": "单熨", "price" : Number(unitPrice)};
				otherClothes.push(perCloth);
			}
		}
	});

	$.ajax({
		url:'/LD/userRoom/addWash.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify({'date': date, 
							 'roomNum': roomNum, 
							 'guestName': guestName, 
							 'count': count, 
							 'totalPrice': totalPrice,
							 'clothes' : JSON.stringify(normalClothes),
							 'other' : JSON.stringify(otherClothes)}),
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

//点击其他按钮，加一行
var appendOther = function(element){

	//获取当前下标,并置下一次的下标
	index  = $(element).attr("index");
	index++;
	$(element).attr("index", index);

	//增加左侧“其他”大行所能容纳的总行数
	row = $(element).parent().prevAll().find(".trTitle").eq(0);
	rowsNum = Number(row.attr("rowspan")) + 1;
	row.attr("rowspan", rowsNum);

	//向前追加一行
	newRow = '<tr>'+
			'<td class="name"><input type="text" value="其他'+ index +'"></td>'+
			'<td class="laundry"><input type="radio" name="other'+ index +'"><input type="text" value="10"></td>'+
			'<td class="dry"><input type="radio" name="other'+ index +'"><input type="text" value="10"></td>'+
			'<td class="pressing"><input type="radio" name="other'+ index +'"><input type="text" value="10"></td>'+
			'<td><input type="text" value="0"></td><td class="price"></td>'+
			'<td><span class="delete">清空</span><span style="display:none" class="unitPrice"></span></td></tr>';

	$(element).parent().before(newRow);


	//为多选按钮、件数、清空绑定事件
	// 绑定用户勾选多选框事件

	$(element).parent().prev().find("input[type='radio']").on("click", function(e){

		var node = $(e.target);
		var price = Number($(e.target).next().val());

		// 设置总件数和总价
		var priceTr = $(e.target).parent().parent().children(".price");
		var countInput = priceTr.prev().children("input[type='text']").val();
		if (countInput != "") {
			$("#totalCount").text(Number($("#totalCount").text()) - countInput);
			$("#totalPrice").text(Number($("#totalPrice").text() - Number(priceTr.text().substring(0, priceTr.text().length - 1)))); 
		}
		$("#totalCount").text(Number($("#totalCount").text()) + 1);
		$("#totalPrice").text(Number($("#totalPrice").text()) + price);
		
		
		// 设置默认件数
		priceTr.prev().children("input[type='text']").val(1);

		// 设置金额
		node.parent().parent().children(".price").text(price + " 元");
		node.parent().parent().find(".unitPrice").text(price);
		node.parent().parent().children().children(".delete").css("display", "block");
	});


	//绑定输入单价事件
	$(element).parent().prev().find("input[type='radio']").next().on("focus", function(e){

		//检查该单价框前面的单选框是否选中
		if($(e.target).prev().prop("checked") == false) return;

		//若选中（最上方总件数、总费用要减少）
		var unitPrice = Number($(e.target).parent().parent().find(".unitPrice").text());
		var curCount = Number($(e.target).parent().parent().children("td").eq(4).children("input").val());
		if(isNaN(curCount)) return;

		$("#totalCount").text(Number($("#totalCount").text()) - curCount);
		$("#totalPrice").text(Number($("#totalPrice").text()) - curCount * unitPrice);
	});
	$(element).parent().prev().find("input[type='radio']").next().on("blur", function(e){

		//检查该单价框前面的单选框是否选中
		if($(e.target).prev().prop("checked") == false) return;

		//若选中（最上方总件数、总费用要更新）
		var unitPrice = Number($(e.target).val());
		var curCount = Number($(e.target).parent().parent().children("td").eq(4).children("input").val());
		if(isNaN(unitPrice) || isNaN(curCount)) return;

		$("#totalCount").text(Number($("#totalCount").text()) + curCount);
		$("#totalPrice").text(Number($("#totalPrice").text()) + curCount * unitPrice);
		$(e.target).parent().parent().children(".price").text(curCount * unitPrice + " 元");
		$(e.target).parent().parent().find(".unitPrice").text(unitPrice);
	});



	// 绑定输入件数事件
	$(element).parent().prev().find("input[type='text']").eq(4).on("focus", function(e){

		var oldCount = Number($(e.target).val());
		if (isNaN(oldCount)) return;

		var unitPrice = Number($(e.target).parent().parent().find(".unitPrice").text());
		$("#totalCount").text(Number($("#totalCount").text()) - oldCount);
		$("#totalPrice").text(Number($("#totalPrice").text()) - oldCount * unitPrice);
	});
	$(element).parent().prev().find("input[type='text']").eq(4).on("blur", function(e){

		var newCount = Number($(e.target).val());
		if (isNaN(newCount)) return;

		var unitPrice = $(e.target).parent().parent().find(".unitPrice").text();
		if(unitPrice == "") {$(this).val(0);return;}
		$(e.target).parent().parent().children(".price").text(newCount * unitPrice + " 元");
		$("#totalCount").text(Number($("#totalCount").text()) + newCount);
		$("#totalPrice").text(Number($("#totalPrice").text()) + newCount * unitPrice);
	});

	var hehe;
	// 删除一条洗衣信息
	$(element).parent().prev().find(".delete").on("click", function(e){

		// 减少总件数和总价
		var priceTr = $(e.target).parent().parent().find(".price");
		var countInput = $(e.target).parent().parent().children("td").eq(4).children("input[type='text']");
		console.log(priceTr.text().length);
		if (isNaN(countInput.val())) return;
		$("#totalCount").text(Number($("#totalCount").text()) - countInput.val());
		$("#totalPrice").text(Number($("#totalPrice").text() - Number(priceTr.text().substring(0, priceTr.text().length - 2)))); 

		// 删除本行记录
		$(e.target).parent().parent().find("input[type='radio']").attr("checked", false);
		countInput.val(0);
		priceTr.text("");
		$(e.target).css("display", "none");
		$(e.target).next().text("");
	});

};

//根据id查取一条洗衣记录
var searchWashById = function(id){

	console.log("查询"+id+"号洗衣记录");
	$.ajax({
		url:'/LD/userRoom/searchWashById.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify({"id":id}),
		success:function(data){
			console.log(data);
			if(data.State == "Valid" && data.record != null){
				
				record = data.record;

				//将获取到的数据显示出来

				//1.表头
				$("#serviceRoomNumber").val(record.room_NUM);
				$("#guestName").val(record.guest_NAME);
				$(".pack_maintain").val(formatDateForm(new Date(record.date)));
				$("#totalCount").text(Number(record.count));
				$("#totalPrice").text(Number(record.total_PRICE));

				//2.系统提供的衣服
				clothes = JSON.parse(record.clothes);
				clothes.map(function(cloth){

					//寻找cloth.name的那一行
					$("table tr .name").each(function(){
						if($(this).text() == cloth.name){

							var unitPrice;
							if(cloth.mode == "水洗") {
								element = $(this).parent().find(".laundry input[type='radio']");
								element.prop("checked", true);
								unitPrice = Number(element.next().text());
							}
							else if(cloth.mode == "干洗") {
								element = $(this).parent().find(".dry input[type='radio']");
								element.prop("checked", true);
								unitPrice = Number(element.next().text());
							}
							else {
								element = $(this).parent().find(".pressing input[type='radio']");
								element.prop("checked", true);
								unitPrice = Number(element.next().text());
							}

							$(this).parent().find("input[type='text']").val(cloth.count); //设置数量
							$(this).parent().find(".price").text(Number(cloth.count) * unitPrice + " 元");
							$(this).parent().find(".delete").show();
							$(this).parent().find(".delete").next().text(unitPrice);
						}
					});
				});

				//3.其他衣服
				others = JSON.parse(record.other);
				others.map(function(other){
					
					//添加一行
					otherBtn = $("table tr .addOther").parent().get(0);
					$(otherBtn).trigger("click");

					//追加信息（名称、单选项与单价、件数、总价、清空按钮）
					curRow = $("table tr .addOther").parent().parent().prev().get(0);

					//名称
					$(curRow).children("td").eq(0).children("input[type='text']").val(other.name); //姓名

					//单选项与单价
					if(other.mode == "水洗"){
						$(curRow).children("td").eq(1).children("input[type='radio']").prop("checked",true); //单选项
						$(curRow).children("td").eq(1).children("input[type='text']").val(other.price);
					}else if(other.mode == "干洗"){
						$(curRow).children("td").eq(2).children("input[type='radio']").prop("checked",true); //单选项
						$(curRow).children("td").eq(2).children("input[type='text']").val(other.price);
					}else{
						$(curRow).children("td").eq(3).children("input[type='radio']").prop("checked",true); //单选项
						$(curRow).children("td").eq(3).children("input[type='text']").val(other.price);
					}

					//设置隐藏单价
					$(curRow).children("td").find(".delete").next().text(other.price);

					//件数
					$(curRow).children("td").eq(4).children("input[type='text']").val(other.count);

					//总价
					$(curRow).children("td").eq(5).text(Number(other.price) * Number(other.count) + " 元");

					//清空按钮
					$(curRow).children("td").eq(6).children(".delete").show();
				});
			}
		}
	});
}


//确认更新id记录
var updateServiceWashEdit = function(id){
	console.log("请求更新"+id+"号洗衣记录");

	var date = $(".pack_maintain").val();
	var roomNum = $("#serviceRoomNumber").val();
	var guestName = $("#guestName").val();
	var count = Number($("#totalCount").text());
	var totalPrice = Number($("#totalPrice").text());

	// 添加clothes字段
	var normalClothes = [];
	var otherClothes = [];

	// 水洗
	$("table .laundry input[type='radio']").each(function(){
		// 选中
		if($(this).is(":checked")) {

			var perCloth;
			if($(this).attr("name").indexOf("other") == -1){ //系统提供的衣服种类
				var name = $(this).parent().parent().children(".name").text();
				var count = Number($(this).parent().parent().children("td").children("input[type='text']").val());
				perCloth = {"name": name, "count": count, "mode": "水洗"};
				normalClothes.push(perCloth);
			}
			else { //其他自定义种类
				var name = $(this).parent().parent().find(".name input[type='text']").val();
				var count = Number($(this).parent().parent().children("td").eq(4).children("input[type='text']").val());
				var unitPrice = $(this).next().val();

				perCloth = {"name": name, "count": count, "mode": "水洗", "price" : Number(unitPrice)};
				otherClothes.push(perCloth);
			}
		}
	});
	// 干洗
	$("table .dry input[type='radio']").each(function(){
		// 选中
		if($(this).is(":checked")) {

			var perCloth;
			if($(this).attr("name").indexOf("other") == -1){ //系统提供的衣服种类
				var name = $(this).parent().parent().children(".name").text();
				var count = Number($(this).parent().parent().children("td").children("input[type='text']").val());
				perCloth = {"name": name, "count": count, "mode": "干洗"};
				normalClothes.push(perCloth);
			}
			else {//其他自定义种类
				var name = $(this).parent().parent().find(".name input[type='text']").val();
				var count = Number($(this).parent().parent().children("td").eq(4).children("input[type='text']").val());
				var unitPrice = $(this).next().val();
				perCloth = {"name": name, "count": count, "mode": "干洗", "price" : Number(unitPrice)};
				otherClothes.push(perCloth);
			}
		}
	});

	//单熨
	$("table .pressing input[type='radio']").each(function(){
		// 选中
		if($(this).is(":checked")) {

			var perCloth;
			if($(this).attr("name").indexOf("other") == -1){ //系统提供的衣服种类
				var name = $(this).parent().parent().children(".name").text();
				var count = Number($(this).parent().parent().children("td").children("input[type='text']").val());
				perCloth = {"name": name, "count": count, "mode": "单熨"};
				normalClothes.push(perCloth);
			}
			else { //其他自定义种类
				var name = $(this).parent().parent().find(".name input[type='text']").val();
				var count = Number($(this).parent().parent().children("td").eq(4).children("input[type='text']").val());
				var unitPrice = $(this).next().val();
				perCloth = {"name": name, "count": count, "mode": "单熨", "price" : Number(unitPrice)};
				otherClothes.push(perCloth);
			}
		}
	});

	$.ajax({
		url:'/LD/userRoom/updateWashById.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify({'id': id,
							 'date': date, 
							 'roomNum': roomNum, 
							 'guestName': guestName, 
							 'count': count, 
							 'totalPrice': totalPrice,
							 'clothes' : JSON.stringify(normalClothes),
							 'other' : JSON.stringify(otherClothes)}),
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

//删除id记录
var serviceWashDelete = function(id){
	console.log("删除"+ id +"号洗衣记录");
	$.ajax({
		url:'/LD/userRoom/deleteWash.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify({"id":id}),
		success:function(data){
			console.log(data);
			if(data == 1){
				showModalBox("success","删除成功");
				requestWash(1); //重新查询一遍
			}else if(data == 0){
				showModalBox("error","删除失败");
			}
		}
	});
};

//导出洗衣单列表至 excel中
var exportList = function(){
    var BB = self.Blob;
    var fileName = "WashList_" + formatDateDot(new Date()) + ".csv";
    var content = ",,,,洗衣单记录表\n房间号,客户姓名,洗衣详情,合计件数,合计费用,发生时间,上传时间,最后编辑时间\n";
    
    //根据当前房间号与日期编辑框的查询内容，请求所有记录（不分页）
	var roomNum = $("#searchWashButton").val();
	var date = $(".pack_maintain").val();
	console.log("请求 房间："+ roomNum + " 所有洗衣单收费信息");
	$.ajax({
		url:'/LD/userRoom/searchAllWashes.action',
		type:'post',
		dataType:'json',
		data:'{"date":"'+ date +'","roomNum":"'+ roomNum +'"}',
		contentType:'application/json',
		success:function(data){
			console.log(data);

			(data.dataList).map(function(record){

				//拼接洗衣详情字串
				clothes = JSON.parse(record.clothes);
				others = JSON.parse(record.other);
				details = '';
				clothes.map(function(cloth){
					details += cloth["mode"] + "：" + cloth["name"] + "x" + cloth["count"] + "\n";
				});
				others.map(function(other){
					details += other["mode"] + "：" + other["name"] + "x" + other["count"] + "\n";
				});
				details = '\"'+ details +'\"';

				content += record.room_NUM + "," + 
						   record.guest_NAME + "," + 
						   details + "," +
						   record.count + "," + 
						   record.total_PRICE + " 元," +
						   formatDate(new Date(record.occur_TIME)) + "," + 
						   formatDate(new Date(record.import_TIME)) + "," + 
						   formatDate(new Date(record.edit_TIME)) + "\n";
			});

			saveAs(new BB(["\ufeff" + content] , {type: "text/plain;charset=utf8"}), fileName);
		}
	});
};


//客户姓名联动
var associateGuestName = function(element){

	var roomNum = $(element).val(); //这里是需要根据页面元素变的
	$.ajax({
		url:'/LD/userRoom/searchGuestName.action',
		type:'post',
		dataType:'json',
		data:'{"roomNum":"'+ roomNum +'"}',
		contentType:'application/json',
		success:function(data){
			console.log(data);

			if(data.State == "Valid") {
				if(data.guest_NAME != null) {
					$("#guestName").val(data.guest_NAME); //这里是需要根据页面元素变的
				} else {
					$("#guestName").val("尚无客户，请重新填写房间号");
				}
			} else {
				showModalBox("error", "无操作权限");
			}
		}
	});

};

//打印洗衣单
var printList = function()  
{  
	printData = [];

	//根据当前房间号与日期编辑框的查询内容，请求所有记录（不分页）
	var roomNum = $("#searchWashButton").val();
	var date = $(".pack_maintain").val();
	console.log("请求 房间："+ roomNum + " 所有洗衣单收费信息");
	$.ajax({
		url:'/LD/userRoom/searchAllWashes.action',
		type:'post',
		dataType:'json',
		data:'{"date":"'+ date +'","roomNum":"'+ roomNum +'"}',
		contentType:'application/json',
		success:function(data){
			console.log(data);

			(data.dataList).map(function(record){

				//拼接洗衣详情字串
				clothes = JSON.parse(record.clothes);
				others = JSON.parse(record.other);
				details = '';
				clothes.map(function(cloth){
					details += cloth["mode"] + ":" + cloth["name"] + "x" + cloth["count"] + "</br>";
				});
				others.map(function(other){
					details += other["mode"] + ":" + other["name"] + "x" + other["count"] + "</br>";
				});


				curRow = {};
				curRow["房间号"] = record.room_NUM;
				curRow["客户姓名"] = record.guest_NAME;
				curRow["洗衣详情"] = details;
				curRow["合计件数"] = record.count;
				curRow["合计费用"] = record.total_PRICE + " 元";
				curRow["发生时间"] = formatDate(new Date(record.occur_TIME));
				curRow["上传时间"] = formatDate(new Date(record.import_TIME));
				curRow["最后编辑时间"] = formatDate(new Date(record.edit_TIME));

				printData.push(curRow);
			});

			//打印
 			printJS({printable: printData, 
 			 		 properties: ['房间号', '客户姓名', '洗衣详情', '合计件数', '合计费用', '发生时间', '上传时间', '最后编辑时间'], 
 			 		 type: 'json',
 		     	     font_size: '9pt'});
		}
	});
};


