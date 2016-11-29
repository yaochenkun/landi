// 显示计划详细信息
var requestPlanDetail = function () {
	var planID = Number($("#planID").text());
	console.log("请求采购计划：" + planID + "计划明细");
	$.ajax({
		url:'/LD/userItem/searchPlanDetail.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		data:'{"planID":'+ planID +'}',
		success:function(data){
			console.log(data);

			// // 清空明细
			// $("#facTbody").html("");

			// if(data.planDetail.length == 0){
			// 	$("#facTbody").html("<tr><td col=''>没有采购物品信息！</td></tr>");
			// } else {
			// 	for(var i=0; i<data.planDetail.length; i++){
			// 		var perFac = data.planDetail[i];
			// 		$("#facTbody").append("<tr><td>"+ perFac.fac_id +"</td>"+
			// 			"<td>家具</td><td>电视</td><td>海尔</td>"+
			// 			"<td>"+ perFac.fac_name +"</td><td>"+ perFac.total +"</td>"+
			// 			"<td>" + perFac.comment +"</td><td><span class='caigou'>采购</span></td></tr>");
			// 	}
			// }
		}
	});

	// 请求计划执行情况
	$.ajax({
		url:'/LD/userItem/searchPlanProgress.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		data:'{"planID":'+ planID +',"pNum":1}',
		success:function(data){
			console.log(data);

			// 清空采购计划执行情况
			// $("#planProgressBody").html("");

			// if(data.planProgress.length == 0){
			// 	$("#planProgressBody").html("没有计划执行记录");
			// }
			// for(var i=0; i<data.planProgress.length; i++){
			// 	var perProgress = data.planProgress[i];
			// 	$("#planProgressBody").append("<div class='perProgress'><span class='time'>2015-12-3</span>"+
			// 	    "<span class='term'>"+ perProgress.term +"</span>"+
			// 	    "用户&nbsp;&nbsp;<span class='user'>" + perProgress.staff + "</span>"+
			// 	    "采购物品&nbsp;&nbsp;<span class='item'>"+ perProgress.fac_id +"</span>"+
			// 	    "数量&nbsp;&nbsp;<span class='count'>"+ perProgress.total +"</span></div>");
			// }
		}
	});
}

var caigouFac = function(element){
	console.log();
	$(".shadow").css("display","block");
	$(".addItemDiv").css("display","block");
}

var closeDiv = function(){
	// console.log("hehe");
	$(".shadow").css("display","none");
	$(".addItemDiv").css("display","none");
}