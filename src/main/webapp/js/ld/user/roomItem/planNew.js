(function() {
	// 点击添加物品按钮(显示添加物品弹框)
	$(".addItem").click(function(){
		$.ajax({
			url:'/LD/userItem/getItemType.action',
			type:'post',
			success:function(data){
				//console.log(data);
				$("#item-type .item-content").html("");
				$("#item-cat .item-content").html("");
				$("#item-com .item-content").html("");
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

	///////////////////// 添加物品弹出框
	// 1. 关闭弹出框
	$(".addItemDiv .fac-title span").click(function(){
		$(".shadow").css("display","none");
		$(".addItemDiv").css("display","none");
	});
})();

// 2. 选择物品种类
var chooseItemType = function(element){
	$("#item-type .btn-item").removeClass("item-active");
	$(element).addClass("item-active");

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
					$("#item-cat .item-content").append("<a class='btn btn-item' onclick='changeItemCatState(this);'>"
						+ data[i] +"</a>");
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
					$("#item-com .item-content").append("<a class='btn btn-item' onclick='changeItemComState(this);'>"
						+ data[i] +"</a>");
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

	var type = "", cat = "", com = "";
	var flag = 0;
	$("#item-com .btn-item").each(function(){
		if($(this).hasClass("item-active")){
			flag = 1;
			com = $(this).text();
		}
	});
	if(flag == 1){
		$("#item-type .btn-item").each(function(){
			if($(this).hasClass("item-active")){
				type = $(this).text();
			}
		});
		$("#item-cat .btn-item").each(function(){
			if($(this).hasClass("item-active")){
				cat = $(this).text();
			}
		});
		requestFacName(type,cat,com);
	}
};
var changeItemComState = function(element){
	$("#item-com .btn-item").removeClass("item-active");
	$(element).addClass("item-active");

	var type = "", cat = "", com = "";
	var flag = 0;
	$("#item-cat .btn-item").each(function(){
		if($(this).hasClass("item-active")){
			flag = 1;
			cat = $(this).text();
		}
	});
	if(flag == 1){
		$("#item-type .btn-item").each(function(){
			if($(this).hasClass("item-active")){
				type = $(this).text();
			}
		});
		$("#item-com .btn-item").each(function(){
			if($(this).hasClass("item-active")){
				com = $(this).text();
			}
		});
		requestFacName(type,cat,com);
	}
};
var changeItemNameState = function(element){
	$("#item-name .btn-item").removeClass("item-active");
	$(element).addClass("item-active");
}

// 4. 确认添加物品
var addOneItem = function(){
	var FAC_TYPE = "",FAC_CAT="",FAC_BRAND="",FAC_NAME="",FACID=0;
	var	count = $("#item-count input").val(),
		totalPrice = $("#item-totalPrice input").val(),
		comment = $("#item-comment input").val();
	$("#item-type .btn-item").each(function(){
		if($(this).hasClass("item-active")){
			FAC_TYPE = $(this).text();
		}
	});
	$("#item-cat .btn-item").each(function(){
		if($(this).hasClass("item-active")){
			FAC_CAT = $(this).text();
		}
	});
	$("#item-com .btn-item").each(function(){
		if($(this).hasClass("item-active")){
			FAC_BRAND = $(this).text();
		}
	});
	$("#item-name .btn-item").each(function(){
		if($(this).hasClass("item-active")){
			FACID = $(this).parent().children(".facID").text();
			FAC_NAME = $(this).text();
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
		    "<td><input type='text' value='"+ FAC_TYPE +"' /></td><td><input type='text' value='"+ FAC_CAT +"' /></td>"+
			"<td><input type='text' value='"+ FAC_BRAND +"' /></td><td><input type='text' value='"+ FAC_NAME +"' /></td>"+
			"<td><input type='text' value='"+ count +"' /></td><td><input type='text' value='"+ totalPrice +"' /></td>"+
			"<td><input type='text' value='"+ comment +"' /></td>"+
			"<td class='operation' onclick='deleteOneItem(this)'>删除</td>"+
			"<td class='facid' style='display:none'>"+ FACID +"</td></tr>");
	$(".shadow").css("display","none");
	$(".addItemDiv").css("display","none");
};

// 5. 根据种类、子类和品牌获取物品名称
var requestFacName = function(type,cat,com){
	$.ajax({
		url:'/LD/userItem/searchItemList.action',
		type:'post',
		data:'{"type":"'+ type +'","cat":"'+ cat +'","band":"'+ com +'"}',
		dataType:'json',
		contentType:'application/json',
		success:function(data){
			console.log(data);
			$("#item-name .item-content").html("");
			if(!data){
				return;
			}
			for(var i=0; i<data.pageList.length; i++){
				$("#item-name .item-content").append("<a class='btn btn-item' onclick='changeItemNameState(this);'>"
					+ data.pageList[i].name +"</a>"+
					"<a class='facID' style='display:none;'>"+ data.pageList[i].id+"</a>");
			}
		}
	});
}

// 删除一项物品
var deleteOneItem = function(element){
	$(element).parent().nextAll(".eachItem").each(function(){
		console.log($(this).children("td").children(".no").text);
		$(this).children("td").children(".no").text(Number($(this).children("td").children(".no").text())-1);
	});
	$(element).parent().remove();
};


// 添加采购计划
var addPlan = function(){
	// 检测必填项
	if($(".li-num input").val() == ""){
		$(".li-num input").addClass("border-red");
		$(window).scrollTop(0);
		return;
	}

	var planID = $(".li-num input").val(),
	    planName = $(".planTitle input").eq(1).val(),
	    planManager = $(".planTitle input").eq(2).val(),
	    note = $(".planTitle input").eq(3).val(),
	    money = 1000,
	    ctime = "2016-11-29";	    

	// 计划采购物品
	var itemList = "";
	for(var i=1; i<=$(".eachItem").length; i++){
		var I = $(".eachItem").eq(i-1).children("td").children("input");
		var perItem = '"item'+ i +'":{"FAC_ID":'+ $(".eachItem").children(".facid").text() +','
		    +'"FAC_TYPE":"'+ I.eq(0).val() +'","FAC_CAT":"'+ I.eq(1).val()+'","FAC_BRAND":"'+ I.eq(2).val() +'",'
		    +'"FAC_NAME":"'+ I.eq(3).val() +'","count":'+ I.eq(4).val() +',"totalPrice":'+ I.eq(5).val()+','
		    +'"comment":"'+ I.eq(6).val() +'"},';
		itemList += perItem;
	};

	if(itemList.length !=0) itemList = itemList.substring(0,itemList.length-1);

	$.ajax({
		url:'/LD/userItem/newPlan.action',
		type:'post',
		data:'{"planID":"'+ planID +'","planManager":"'+ planManager +'","delivery":"'+ ctime +'",'
			+'"note":"'+ note +'","planName":"'+ planName +'","itemList":{'+ itemList +'}}',
		dataType:'json',
		contentType:'application/json',
		success:function(data){
			console.log(data);
			if(data == 1){
				alert("添加成功！");
			}
			else if(data == 0){
				alert("添加失败！");
			}
		}
	});
};
