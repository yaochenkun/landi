(function() {
	// 点击添加物品按钮
	$(".addItem").click(function(){
		$.ajax({
			url:'/LD/userItem/getItemType.action',
			type:'post',
			success:function(data){
				//console.log(data);
				$("#item-type .item-content").html("");
				$("#item-cat .item-content").html("");
				$("#item-com .item-content").html("");
				$("#item-name .item-content").html("");
				if(data != null){
					for(var i=0; i<data.length; i++){
						$("#item-type .item-content").append("<a class='btn btn-item' onclick='chooseItemType(this);'>"+ data[i] +"</a>");
					}
				}
			}
		});
		$(".shadow").css("display","block");
		$(".addItemDiv").css("display","block");
	});

	// 改变必填项选中
	$(".li-num input").focus(function(){
		$(".li-num input").removeClass("border-red");
	});
})();

// 2. 选择物品种类
var chooseItemType = function(element){
	$("#item-type .btn-item").removeClass("item-active");
	$(element).addClass("item-active");

	// 清空物品子类、物品品牌和物品名称
	$("#item-cat .item-content").html("");
	$("#item-com .item-content").html("");
	$("#item-name .item-content").html("");

	// 获取物品名称
	$.ajax({
		url:'/LD/userItem/getItemCat.action',
		type:'post',
		data:'{"type":"'+ $(element).text() +'"}',
		dataType:'json',
		contentType:'application/json',
		success:function(data){
			//console.log(data);
			if(data != null){
				for(var i=0; i<data.length; i++){
					$("#item-cat .item-content").append("<a class='btn btn-item' onclick='changeItemCatState(this);'>"+ data[i] +"</a>");
				}
			}else{
				$("#item-cat .item-content").html("");
			}
		}
	});

	// 获取物品品牌
	$.ajax({
		url:'/LD/userItem/getItemCom.action',
		type:'post',
		data:'{"type":"'+ $(element).text() +'"}',
		dataType:'json',
		contentType:'application/json',
		success:function(data){
			//console.log(data);
			if(data != null){
				for(var i=0; i<data.length; i++){
					$("#item-com .item-content").append("<a class='btn btn-item' onclick='changeItemComState(this);'>"+ data[i] +"</a>");
				}
			}else{
				$("#item-com .item-content").html("");
			}
		}
	});
};

// 3. 改变物品名称/品牌样式
var changeItemCatState = function(element){
	$("#item-cat .btn-item").removeClass("item-active");
	$(element).addClass("item-active");
};
var changeItemComState = function(element){
	$("#item-com .btn-item").removeClass("item-active");
	$(element).addClass("item-active");
};

// 4. 确认添加物品
var addOneItem = function(){
	var FAC_TYPE = "",FAC_NAME="",FAC_BRAND="";
	var FAC_MODEL= $("#item-brand input").val(),
		count = $("#item-count input").val(),
		perPrice = $("#item-perPrice input").val(),
		comment = $("#item-comment input").val();
	$("#item-type .btn-item").each(function(){
		if($(this).hasClass("item-active")){
			FAC_TYPE = $(this).text();
		}
	});
	$("#item-cat .btn-item").each(function(){
		if($(this).hasClass("item-active")){
			FAC_NAME = $(this).text();
		}
	});
	$("#item-com .btn-item").each(function(){
		if($(this).hasClass("item-active")){
			FAC_BRAND = $(this).text();
		}
	});
    // 新增序号
    if($(".eachItem").length == 0){
    	var no = 1;
    }
    else{
    	var no = Number($(".eachItem:last .no").text()) + 1;
    }
	$(".addItem").before("<tr class='eachItem'><td><span class='no'>"+ no +"</span></td>"+
		    "<td><input type='text' value='"+ FAC_TYPE +"' /></td><td><input type='text' value='"+ FAC_NAME +"' /></td>"+
			"<td><input type='text' value='"+ FAC_BRAND +"' /></td><td><input type='text' value='"+ FAC_MODEL +"' /></td>"+
			"<td><input type='text' value='"+ count +"' /></td><td><input type='text' value='"+ perPrice +"' /></td>"+
			"<td><input type='text' value='"+ comment +"' /></td>"+
			"<td class='operation' onclick='deleteOneItem(this)'>删除</td></tr>");
	$(".shadow").css("display","none");
	$(".addItemDiv").css("display","none");
};

// 删除一项物品
var deleteOneItem = function(element){
	$(element).parent().nextAll(".eachItem").each(function(){
		console.log($(this).children("td").children(".no").text);
		$(this).children("td").children(".no").text(Number($(this).children("td").children(".no").text())-1);
	});
	$(element).parent().remove();
}


// 添加采购计划
var addPlan = function(){
	// 检测必填项
	if($(".li-num input").val() == ""){
		$(".li-num input").addClass("border-red");
		$(window).scrollTop(0);
		return;
	}

	var planID = $(".li-num input").val(),
	    planManager = $(".planTitle input").eq(1).val(),
	    ctime = $(".planTitle input").eq(2).val(),
	    note = $(".planTitle input").eq(3).val();

	// 计划采购物品
	var itemList = "";
	for(var i=1; i<=$(".eachItem").length; i++){
		var I = $(".eachItem").eq(i-1).children("td").children("input");
		var perItem = '"item'+ i +'":{"FAC_ID":'+ $(".eachItem").eq(i-1).children("td").children(".no").text() +','
		    +'"FAC_TYPE":'+ I.eq(0).val() +',"FAC_NAME":'+ I.eq(1).val()+',"FAC_BRAND":"'+ I.eq(2).val() +'",'
		    +'"FAC_MODEL":"'+ I.eq(3).val() +'","count":'+ I.eq(4).val() +',"unitPrice":'+ I.eq(5).val()+','
		    +'"totalPrice":'+ I.eq(6).val() +',"comment":"'+ I.eq(7).val() +'"},';
		itemList += perItem;
	}

	if(itemList.length !=0) itemList = itemList.substring(0,itemList.length-1);

	$.ajax({
		url:'/LD/addPlan.action',
		type:'post',
		data:'{"planID":'+ planID +',"planManager":"'+ planManager +'","ctime":"'+ ctime +'",'
			+'"note":"'+ note +'","itemList":{'+ itemList +'}}',
		dataType:'json',
		contentType:'application/json',
		success:function(data){
			// console.log(data);
			// if(data == 1){
			// 	alert("添加成功！");
			// }
			// else if(data == 0){
			// 	alert("添加失败！");
			// }
		}
	});
}
