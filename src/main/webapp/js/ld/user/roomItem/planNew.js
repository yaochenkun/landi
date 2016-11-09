(function() {
	// 点击添加物品按钮
	$(".addItem").click(function(){
	    // 新增序号
	    if($(".eachItem").length == 0){
	    	var no = 1;
	    }
	    else{
	    	var no = Number($(".eachItem:last .no").text()) + 1;
	    }
		$(".addItem").before("<tr class='eachItem'><td><span class='no'>"+ no +"</span></td>"+
			    "<td><input type='text' value='1' /></td><td><input type='text' value='1' /></td>"+
				"<td><input type='text' value='1' /></td><td><input type='text' value='1' /></td>"+
				"<td><input type='text' value='1' /></td><td><input type='text' value='1' /></td>"+
				"<td><input type='text' value='1' /></td><td><input type='text' value='1' /></td>"+
				"<td class='operation' onclick='deleteOneItem(this)'>删除</td></tr>");
	});

	// 改变必填项选中
	$(".li-num input").focus(function(){
		$(".li-num input").removeClass("border-red");
	});
})();

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
