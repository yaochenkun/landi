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

	var name = $("#addGoodUL input").eq(0).val();
	var type = $("#addGoodUL input").eq(1).val();
	var cat = $("#addGoodUL input").eq(2).val();
	var buyPrice = Number($("#addGoodUL input").eq(3).val());
	var sellPrice = Number($("#addGoodUL input").eq(4).val());
	var total = Number($("#addGoodUL input").eq(5).val());

	$.ajax({
		url:'/LD/userItem/addGoods.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:'{"name":"'+ name +'","type":"'+ type +'","cat":"'+ cat +'","buyPrice":'+ buyPrice +','
			+'"sellPrice":'+ sellPrice +',"total":'+ total +'}',
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