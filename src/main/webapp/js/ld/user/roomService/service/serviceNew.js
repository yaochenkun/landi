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
	addServiceType(ServiceType());
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
		url:'/LD/userRoom/addService.action',
		type:'post',
		contentType:'application/json',
		data:'{"type":'+ type +',"roomNumber":"'+ roomNumber +'","guestName":"'+ guestName +'","item":"'+ item +'",'
			  +'"count":'+ count +',"delivery":"'+ delivery +'","sum":'+ sum +',"note":"'+ note +'"}',
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data == 1){
				alert("添加成功！");
				switch($("#serviceType").text()){
					case "餐费":
					    window.location.href = "http://" +
					        window.location.host + "/LD/views/user/roomService/service/serviceTakeaway.jsp";
						break;

					case "桶装水费":
						window.location.href = "http://" +
					        window.location.host + "/LD/views/user/roomService/service/serviceWaterBill.jsp";
						break;

					case "擦鞋费":
					    window.location.href = "http://" +
					        window.location.host + "/LD/views/user/roomService/service/serviceShoeCleaning.jsp";
					    break;

					case "代购费":
						window.location.href = "http://" +
					        window.location.host + "/LD/views/user/roomService/service/serviceShopping.jsp";
						break;

					default:
					    console.log("没有匹配的费用！");
						break;
				}
			}else if(data == 0){
				alert("添加失败！");
			}
		}
	});
}

var ServiceType = function(){
	var type = 0;
	switch($("#serviceType").text()){
		case "餐费":
		    type = 1;
			break;

		case "桶装水费":
			type = 2;
			break;

		case "擦鞋费":
		    type = 3;
		    break;

		case "代购费":
			type = 4;
			break;

		default:
		    console.log("没有匹配的费用！");
			break;
	}
	return type;
}