(function(){
	$("#goodsName").focus(function(){
		$(this).removeClass("border-red");
		$("#goodsNameWarning").css("display","none");
	});
})();

// 添加商品
var addGood = function(){
	// 判断商品名号是否为空
	if($("#goodsName").val() == ""){
		$("#goodsNameWarning").css("display","block");
		$("#goodsName").addClass("border-red");
		console.log("商品名为空！");
		return;
	}

	var goodsName = $(".body-content input").eq(0).val();
	var purchasePrice = Number($(".body-content input").eq(1).val());
	var sellingPrice = Number($(".body-content input").eq(2).val());
	var total = Number($(".body-content input").eq(3).val());

	// $.ajax({
	// 	url:'',
	// 	type:'post',
	// 	contentType:'application/json',
	// 	dataType:'json',
	// 	data:'{}',
	// 	success:function(data){
	// 		console.log(data);
	// 	}
	// });
};