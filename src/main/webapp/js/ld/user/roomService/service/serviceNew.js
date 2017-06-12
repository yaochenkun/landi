(function(){
	$(document).on("click",function(e){
		$(".resMenu").css("display","none");
		$(".staffMenu").css("display","none");
	});
	
	$("#resInput").click(function(e){
		$(".resMenu").css("display","block");
		$(".staffMenu").css("display","none");
		// 阻止事件冒泡
		e.stopPropagation();
	});
	
	$(".resMenu li").click(function(){
		$("#resInput").val($(this).text());
	});
	
	$("#staffInput").click(function(e){
		$(".staffMenu").css("display","block");
		$(".resMenu").css("display","none");
		e.stopPropagation();
	});

//	$(".staffMenu li").click(function(){
//		$("#staffInput").val($(this).text());
//	});
		
	$("#serviceRoomNumber").focus(function(){
		$(this).removeClass("border-red");
		$("#roomIdWarning").css("display","none");
	});
})();


//获取点餐人
var requestStaff=function(duty){
	//var duty="点餐";
	
	$.ajax({
		url:'/LD/userRoom/searchStaff.action',
		type:'post',
		contentType:'application/json',
		data:'{"duty":"'+ duty +'"}',
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.State=="Invalid"){
				$("#staffInput").val("信息获取失败!");
				return;
			}
			if(data.staffs == null){
				$("#staffInput").val("无相关信息！");
				return;
			}
			for(var i=0;i<data.staffs.length;i++){
				var staff=data.staffs[i];
				$("#staff").append("<li>"+staff.id+" "+staff.name+"</li>");
				//if(i == 0) $("#staffInput").val(staff.id+" "+staff.name);
			}
		}
	});
	//为动态添加的元素加入事件
	$(".staffMenu ul li").live("click",function(){
		$("#staffInput").val($(this).text());
	});

}

// 添加餐费服务
var addservice_Takeaway = function(){

    // 判断房间号是否为空
	if($("#serviceRoomNumber").val() == ""){
		$("#roomIdWarning").css("display","block");
		$("#serviceRoomNumber").addClass("border-red");
		console.log("房间号为空！");
		return;
	}
	if($("#guestName").val() == "尚无客户，请重新填写房间号" || $("#guestName").val() == "数据库异常"){
		return;
	}
	addTakeawayServiceAjax();
}

// 添加餐费服务 
var addTakeawayServiceAjax = function(){
	var roomNumber = $("#serviceRoomNumber").val();
	var guestName = $("#guestName").val();
	var count = $("#count").val();
	var note = $("#comment").val();
	var time = formatDateForm(new Date($("#time").val()));		
	var res=$("#resInput").val();	
	var pay_for=$('input:radio[name="pay"]:checked').val();
	var staff=$("#staffInput").val().split(" ");
    var staff_id=staff[0];
    var staff_name=staff[1];
    
	$.ajax({
		url:'/LD/userRoom/addTakeaway.action',
		type:'post',
		contentType:'application/json',
		data:'{"roomNumber":"'+ roomNumber + '","guestName":"'+ guestName +'",'
			  +'"count":'+ count + ',"note":"'+ note +'","time":"' + time + '","res":"'
			  + res + '","pay_for":"' + pay_for + '","staff_id":'+ staff_id + ',"staff_name":"' 
			  + staff_name +'"}',
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data == 1){
				showModalBox("success","添加成功！");
			}else if(data == 0){
				showModalBox("error","添加失败！");
			}
		}
	});
}


//客户姓名联动
var associateGuestName = function(element){

	var roomNum = $(element).val(); //这里是需要根据页面元素变的
	$.ajax({
		url:'/LD/userRoom/searchGuestName.action',
		type:'post',
		dataType:'json',
		data:'{"roomNum":"'+ roomNum +'"}',
		contentType:'application/json',
		success:function(data){
			console.log(data);

			if(data.State == "Valid") {
				if(data.guest_NAME != null) {
					$("#guestName").val(data.guest_NAME); //这里是需要根据页面元素变的
				} else {
					$("#guestName").val("尚无客户，请重新填写房间号");
				}
			} else {
				$("#guestName").val("数据库异常");
			}
		}
	});

};

/**********************编辑*******************************/
//根据id查取一条餐费记录
var searchTakeawayById = function(id){

	console.log("查询"+id+"号餐费记录");
	$.ajax({
		url:'/LD/userRoom/searchMealById.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify({"id":id}),
		success:function(data){
			console.log(data);
			if(data.State == "Valid" && data.record != null){
				
				record = data.record;

				//将获取到的数据显示出来

				$("#serviceRoomNumber").val(record.room_NUM).attr("disabled","disabled");
				$("#guestName").val(record.guest_NAME);
				$("#count").val(record.total_PRICE);
				$("#comment").val(record.comment);
				$("#time").val(formatDateForm(new Date(record.occur_TIME)));
				if(record.pay_MODE == 0){
					$("input:radio[value=0]").attr("checked","checked");
				}
				else{
					$("input:radio[value=1]").attr("checked","checked");
				}
											
				var staff_id=record.staff_ID;
			    var staff_name=record.staff_NAME;
			    var staff = staff_id + " " + staff_name;
			    var res = record.restaurant_NAME;
			    
			    $("#staffInput").val(staff);
			    $("#resInput").val(res);			    

		}
		else{
			alert("数据异常！");
			}
		}
	});
}

//确认更新id记录
var updateServiceTakeawayEdit = function(id){
	console.log("请求更新"+id+"号餐费记录");

	var roomNumber = $("#serviceRoomNumber").val();
	var guestName = $("#guestName").val();
	var count = $("#count").val();
	var note = $("#comment").val();
	var time = formatDateForm(new Date($("#time").val()));
	var res=$("#resInput").val();	
	var pay_for=$('input:radio[name="pay"]:checked').val();
	var staff=$("#staffInput").val().split(" ");
    var staff_id=staff[0];
    var staff_name=staff[1];
    
	$.ajax({
		url:'/LD/userRoom/updateMealById.action',
		type:'post',
		contentType:'application/json',
		data:'{"roomNumber":"'+ roomNumber + '","guestName":"'+ guestName +'",'
			  +'"count":'+ count + ',"note":"'+ note +'","time":"' + time + '","res":"'
			  + res + '","pay_for":"' + pay_for + '","staff_id":'+ staff_id + ',"staff_name":"' 
			  + staff_name +'","id":'+ id +'}',
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data == 1){
				showModalBox("success","变更成功！");
			}else if(data == 0){
				showModalBox("success","变更失败！");
			}
		}
	});
};
/****************************擦鞋********************************/
var auto_sum = function(){
	var count = $("#count").val();
	var sum = parseInt(count)*10;     //默认一双鞋10元   ???
	$("#sum").val(sum);
}

var addservice_ShoeCleaning = function(){
    // 判断房间号是否为空
	if($("#serviceRoomNumber").val() == ""){
		$("#roomIdWarning").css("display","block");
		$("#serviceRoomNumber").addClass("border-red");
		console.log("房间号为空！");
		return;
	}
	if($("#guestName").val() == "尚无客户，请重新填写房间号" || $("#guestName").val() == "数据库异常"){
		return;
	}
	addShoeCleaningServiceAjax();
}

var addShoeCleaningServiceAjax = function(){
	var roomNumber = $("#serviceRoomNumber").val();
	var guestName = $("#guestName").val();
	var count = $("#count").val();

	var sum = $("#sum").val();
	var note = $("#comment").val();
	var time=formatDateForm(new Date($("#time").val()));
	var pay_for=$('input:radio[name="pay"]:checked').val();
	
	$.ajax({
		url:'/LD/userRoom/addShoeCleaning.action',
		type:'post',
		contentType:'application/json',
		data:'{"roomNumber":"'+ roomNumber + '","guestName":"'+ guestName +'",'
			  +'"count":'+ count + ',"note":"'+ note +'","time":"' + time + '","pay_for":"' + pay_for + '","sum":' 
			  + sum +'}',
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data == 1){
				showModalBox("success","添加成功!");
			}else if(data == 0){
				showModalBox("error","添加失败!");
			}
		}
	});
}

var searchShoeCleaningById = function(id){
	console.log("查询"+id+"号餐费记录");
	$.ajax({
		url:'/LD/userRoom/searchShoeCleaningById.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify({"id":id}),
		success:function(data){
			console.log(data);
			if(data.State == "Valid" && data.record != null){
				
				record = data.record;

				//将获取到的数据显示出来

				$("#serviceRoomNumber").val(record.room_NUM).attr("disabled","disabled");
				$("#guestName").val(record.guest_NAME);
				$("#count").val(record.count);
				$("#sum").val(record.total_PRICE);
				$("#comment").val(record.comment);
				$("#time").val(formatDateForm(new Date(record.occur_TIME)));
				if(record.pay_MODE == 0){
					$("input:radio[value=0]").attr("checked","checked");
				}
				else{
					$("input:radio[value=1]").attr("checked","checked");
				}
			}
			else{
				alert("数据异常！");
			}
		}
	});
}

var updateServiceShoeCleaningEdit = function(id){
	//确认更新id记录
	console.log("请求更新"+id+"号擦鞋费记录");

	var roomNumber = $("#serviceRoomNumber").val();
	var guestName = $("#guestName").val();
	var count = $("#count").val();
	var sum = $("#sum").val();
	var note = $("#comment").val();
	var time=formatDateForm(new Date($("#time").val()));
	var pay_for=$('input:radio[name="pay"]:checked').val();
    
	$.ajax({
		url:'/LD/userRoom/updateshoeCleaningById.action',
		type:'post',
		contentType:'application/json',
		data:'{"roomNumber":"'+ roomNumber + '","guestName":"'+ guestName +'",'
		  +'"count":'+ count + ',"note":"'+ note +'","time":"' + time + '","pay_for":"' + pay_for + '","sum":' 
		  + sum + ',"id":'+ id +'}',
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data == 1){
				showModalBox("success","变更成功！");
			}else if(data == 0){
				showModalBox("error","变更失败！");
			}
		}
	});
};

/*********************代购*********************************/
var addservice_Shopping = function(){
	// 判断房间号是否为空
	if($("#serviceRoomNumber").val() == ""){
		$("#roomIdWarning").css("display","block");
		$("#serviceRoomNumber").addClass("border-red");
		console.log("房间号为空！");
		return;
	}
	if($("#guestName").val() == "尚无客户，请重新填写房间号" || $("#guestName").val() == "数据库异常"){
		return;
	}
	addShoppingServiceAjax();
}

var addShoppingServiceAjax = function(){
	var roomNumber = $("#serviceRoomNumber").val();
	var guestName = $("#guestName").val();
	var item=$("#item").val();
	var count = $("#count").val();
	var sum = $("#sum").val();
	var tip = $("#tip").val();
	var note = $("#comment").val();
	var time=formatDateForm(new Date($("#time").val()));
	var pay_for=$('input:radio[name="pay"]:checked').val();
	var staff=$("#staffInput").val().split(" ");
    var staff_id=staff[0];
    var staff_name=staff[1];
    
	$.ajax({
		url:'/LD/userRoom/addShopping.action',
		type:'post',
		contentType:'application/json',
		data:'{"roomNumber":"'+ roomNumber + '","guestName":"'+ guestName +'",'
			  +'"item":"'+ item +'","count":'+ count + ',"sum":'+ sum + ',"tip":'+ tip +',"note":"'+ note +'","time":"' + time + 
			  '","pay_for":"' + pay_for + '","staff_id":'+ staff_id + ',"staff_name":"' 
			  + staff_name +'"}',
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data == 1){
				showModalBox("success","添加成功！");
			}else if(data == 0){
				showModalBox("error","添加失败！");
			}
		}
	});
}

var searchShoppingById = function(id){
	
	$.ajax({
		url:'/LD/userRoom/searchShoppingById.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify({"id":id}),
		success:function(data){
			console.log(data);
			if(data.State == "Valid" && data.record != null){
				
				record = data.record;
				console.log(record);
				//将获取到的数据显示出来

				$("#serviceRoomNumber").val(record.room_NUM).attr("disabled","disabled");
				$("#guestName").val(record.guest_NAME);
				$("#item").val(record.good_NAME);
				$("#count").val(record.count);
				$("#sum").val(record.cover_PRICE);
				$("#tip").val(record.service_PRICE);
				$("#comment").val(record.comment);
				$("#time").val(formatDateForm(new Date(record.occur_TIME)));
				if(record.pay_MODE == 0){
					$("input:radio[value=0]").attr("checked","checked");
				}
				else{
					$("input:radio[value=1]").attr("checked","checked");
				}
				var staff_id=record.staff_ID;
			    var staff_name=record.staff_NAME;
			    var staff = staff_id + " " + staff_name;
			    
			    $("#staffInput").val(staff);
			   		 
			}
			else{
				alert("数据异常！");
			}
		}
	});
}

var updateServiceShoppingEdit = function(id){
	var roomNumber = $("#serviceRoomNumber").val();
	var guestName = $("#guestName").val();
	var item=$("#item").val();
	var count = $("#count").val();
	var sum = $("#sum").val();
	var tip = $("#tip").val();
	var note = $("#comment").val();
	var time=formatDateForm(new Date($("#time").val()));
	var pay_for=$('input:radio[name="pay"]:checked').val();
	var staff=$("#staffInput").val().split(" ");
    var staff_id=staff[0];
    var staff_name=staff[1];
    
	$.ajax({
		url:'/LD/userRoom/updateShoppingById.action',
		type:'post',
		contentType:'application/json',
		data:'{"roomNumber":"'+ roomNumber + '","guestName":"'+ guestName +'",'
		  +'"item":"'+ item +'","count":'+ count + ',"sum":'+ sum + ',"tip":'+ tip +',"note":"'+ note +'","time":"' + time + 
		  '","pay_for":"' + pay_for + '","staff_id":'+ staff_id + ',"staff_name":"' 
		  + staff_name +'","id":' + id +'}',
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data == 1){	
				showModalBox("success","变更成功！");
			}else if(data == 0){
				showModalBox("error","变更失败！");
			}
		}
	});
}