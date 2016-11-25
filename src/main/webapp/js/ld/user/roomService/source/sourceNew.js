(function(){
	$("#sourceRoomNumber").focus(function(){
		$(this).removeClass("border-red");
		$("#roomIdWarning").css("display","none");
	});
})();

// 添加能源费分类 
var addsource = function(){

    // 判断房间号是否为空
	if($("#sourceRoomNumber").val() == ""){
		$("#roomIdWarning").css("display","block");
		$("#sourceRoomNumber").addClass("border-red");
		console.log("房间号为空！");
		return;
	}
	switch($("#sourceType").text()){
		case "水费":
		    //console.log("添加餐费");
			addSourceType(1);
			break;

		case "电费":
			addSourceType(2);
			break;

		default:
		    console.log("没有匹配的费用！");
			break;
	}
}

// 添加客房服务 
var addSourceType = function(type){
	console.log("新增能源费类别为：" + type);
	var roomNumber = $("#sourceRoomNumber").val();
	var guestName = $(".body-content input").eq(1).val();
	var meterNo = $(".body-content input").eq(2).val();
	var charge = $(".body-content input").eq(3).val();
	var thisMonthNum = $(".body-content input").eq(4).val();
	var meterDate = $(".body-content input").eq(5).val();

	$.ajax({
		url:'/LD/userRoom/addSource.action',
		type:'post',
		contentType:'application/json',
		data:'{"type":'+ Number(type) +',"roomNumber":"'+ roomNumber +'","guestName":"'+ guestName +'",'
				+'"meterNo":"'+ meterNo +'","thisMonthNum":'+ thisMonthNum +',"charge":'+ charge +','
				+'"meterDate":"'+ meterDate +'"}',
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data == 1){
				alert("添加成功！");
				switch($("#sourceType").text()){
					case "水费":
					    window.location.href = "http://" + window.location.host +
					    	"/LD/views/user/roomService/source/sourceWater.jsp";
						break;
					case "电费":
						  window.location.href = "http://" + window.location.host +
					    	"/LD/views/user/roomService/source/sourceElec.jsp";
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