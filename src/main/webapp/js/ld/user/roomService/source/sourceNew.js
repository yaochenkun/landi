(function(){
	$("#sourceRoomNumber").on({
		focus: function(){
			$(this).removeClass("border-red");
			$("#roomIdWarning").css("display","none");
		},
		keyup: function(){
			var rNumber = $(this).val();
			var rid = 0;
			$.ajax({
				url:'/LD/userRoom/getRoomIDByNumber.action',
				type:'post',
				data:'roomNumber=' + rNumber ,
				success:function(data){
					//console.log(data);
					if(!data){
						$("#meter").html("不存在该房间！");
						return;
					}
					rid = data.id;
					var type = 1;

					switch($("#sourceType").text()){
						case "水费":
						    type = 1;
							break;

						case "电费":
							type = 2;
							break;

						default:
						    console.log("没有匹配的费用！");
							break;
					}

					$.ajax({
						url:'/LD/userRoom/getMeters.action',
						type:'post',
						data:'rid='+ rid +'&type='+ type,
						success:function(data){
							//console.log(data);
							var type = data.meters1 == null ? 2 : 1;
							console.log(type);
							// 房间水表表号
							if(type == 1){
								if(data.meters1.length == 0){
									return;
								}
								$("#meter").text(data.meters1[0].meter_NUMBER);
							}
							// 房间电表
							else if(type == 2){
								if(data.meters2.length == 0){
									return;
								}
								$("#meter").text(data.meters2[0].meter_NUMBER);
							}
						}
					});
				}
			});
		}
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
	var charge = $(".body-content input").eq(2).val();
	var thisMonthNum = $(".body-content input").eq(3).val();

	// 抄表时间为当前系统时间
	var date = new Date();
	var meterDate = formatDate(date);

	// 表号
	var meterNo = $("#meter").text();

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