(function(){
	$("#serviceRoomNumber").focus(function(){
		$(this).removeClass("border-red");
		$("#roomIdWarning").css("display","none");
	});
})();

// 添加客房服务分类 
var addservice = function(){

    // 判断房间号是否为空
	if($("#serviceRoomNumber").val() == ""){
		$("#roomIdWarning").css("display","block");
		$("#serviceRoomNumber").addClass("border-red");
		console.log("房间号为空！");
		return;
	}
	switch($("#serviceType").text()){
		case "餐费":
		    //console.log("添加餐费");
			addServiceType(1);
			break;

		case "桶装水费":
			addServiceType(2);
			break;

		case "擦鞋费":
		    addServiceType(3);
		    break;

		case "代购费":
			addServiceType(4);
			break;

		default:
		    console.log("没有匹配的费用！");
			break;
	}
}

// 添加客房服务 
var addServiceType = function(type){
	console.log("新增客房服务类别为：" + type);
	var roomNumber = $("#serviceRoomNumber").val();
	var guestName = $(".body-content input").eq(1).val();
	var item = $(".body-content input").eq(2).val();
	var count = $(".body-content input").eq(3).val();
	var delivery = $(".body-content input").eq(4).val();
	var sum = $(".body-content input").eq(5).val();
	var note = $(".body-content input").eq(6).val();

	$.ajax({
		url:'/LD/addServie.action',
		type:'post',
		contentType:'application/json',
		data:'{"type":'+ type +',"roomNumber":"'+ roomNumber +'","guestName":"'+ guestName +'","item":"'+ item +'",'
			  +'"count":'+ count +',"delivery":"'+ delivery +'","sum":'+ sum +',"note":"'+ note +'"}',
		dataType:'json',
		success:function(data){
			console.log(data);
		}
	});
}