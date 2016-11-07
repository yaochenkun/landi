(function(){
	$("#sourceRoomNumber").focus(function(){
		$(this).removeClass("border-red");
		$("#roomIdWarning").css("display","none");
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
	var firstMeterReading = $(".body-content input").eq(6).val();

	var secondMeterNo = $(".body-content input").eq(7).val();
	var secondthisMonthNum = $(".body-content input").eq(8).val();
	var secondCharge = $(".body-content input").eq(9).val();
	var secondMeterReading = $(".body-content input").eq(10).val();

	$.ajax({
		url:'/LD/addSourceGas.action',
		type:'post',
		contentType:'application/json',
		data:'{"roomNumber":"'+ roomNumber +'","guestName":"'+ guestName +'","meterDate":"'+ meterDate +'",'
		       +'"firstMeterNo":'+ firstMeterNo +',"firstthisMonthNum":'+ firstthisMonthNum +','
		       +'"firstCharge":'+ firstCharge +',"firstMeterReading":"'+ firstMeterReading +'",'
		       +'"secondMeterNo":'+ secondMeterNo +',"secondthisMonthNum":'+ secondthisMonthNum +','
		       +'"secondCharge":'+ secondCharge +',"secondMeterReading":"'+ secondMeterReading +'"}',
		dataType:'json',
		success:function(data){
			console.log(data);
		}
	});
}