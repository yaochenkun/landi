(function(){
	$("#sourceRoomNumber").on({
		focus: function(){
			$(this).removeClass("border-red");
		 	$("#roomIdWarning").css("display","none");
		},
		keyup: function(){
			var rNumber = $("#sourceRoomNumber").val();
			$.ajax({
				url:'/LD/userRoom/getRoomIDByNumber.action',
				type:'post',
				data:'roomNumber=' + rNumber ,
				success:function(data){
					//console.log(data);
					if(!data){
						return;
					}
					rid = data.id;

					$.ajax({
						url:'/LD/userRoom/getMeters.action',
						type:'post',
						data:'rid='+ rid +'&type=3',
						success:function(data){
							//console.log(data);
							// 房间燃气表表号
							if(data.meters3.length == 0){
								return;
							}
							$("#meterOne").val(data.meters3[0].meter_NUMBER);
							$("#meterTwo").val(data.meters3[1].meter_NUMBER);			
						}
					});
				}
			});
		}
	});
})();

// 添加燃气费 
var addSourceGas = function(){

	var roomNumber = $("#sourceRoomNumber").val();
	var guestName = $(".body-content input").eq(1).val();
	var meterDate = $(".body-content input").eq(2).val();

	var firstMeterNo = $(".body-content input").eq(3).val();
	var firstthisMonthNum = $(".body-content input").eq(4).val();
	var firstCharge = $(".body-content input").eq(5).val();

	var secondMeterNo = $(".body-content input").eq(6).val();
	var secondthisMonthNum = $(".body-content input").eq(7).val();
	var secondCharge = $(".body-content input").eq(8).val();

	$.ajax({
		url:'/LD/userRoom/addSourceGas.action',
		type:'post',
		contentType:'application/json',
		data:'{"roomNumber":"'+ roomNumber +'","guestName":"'+ guestName +'","meterDate":"'+ meterDate +'",'
		       +'"firstMeterNo":"'+ firstMeterNo +'","firstthisMonthNum":'+ firstthisMonthNum +','
		       +'"firstCharge":'+ firstCharge +','
		       +'"secondMeterNo":"'+ secondMeterNo +'","secondthisMonthNum":'+ secondthisMonthNum +','
		       +'"secondCharge":'+ secondCharge +'}',
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data == 1){
				alert("添加成功！");
				window.location.href = "http://" + window.location.host +
					    	"/LD/views/user/roomService/source/sourceGas.jsp";
			} else if (data == 0){
				alert("添加失败！");
			}
		}
	});
}