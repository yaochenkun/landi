// 请求物品库存信息
var requestFacSta = function(){
	var facID = Number($("#facID").text());
	console.log("请求物品编号：" + facID + "的库存情况");
	$.ajax({
		url:'/LD/userItem/searchFacSta.action',
		dataType:'json',
		contentType:'application/json',
		data:'{"facID":'+ facID +'}',
		success:function(data){
			console.log(data);
			// 总量
			$(".fac-sta .count").eq(0).text(data.total);
			// 可用
			$(".fac-sta .count").eq(1).text(data.free);
			// 已分配
			$(".fac-sta .count").eq(2).text(data.working);
			// 报废
			$(".fac-sta .count").eq(3).text(data.bad);
		}
	});
}

// 请求物品分配信息
var requestFacDetail = function () {
	$.ajax({
		url:'/LD/userItem/searchFacDetail.action',
		dataType:'json',
		contentType:'application/json',
		data:'{"facID":12}',
		success:function(data){
			console.log(data);

			// 清空物品详细信息
			$("#facDetailTbody").html("");

			if (data.facDetail.length == 0) {
				$("#facDetailTbody").append("<tr><td colspan='4'>没有相关信息！</td></tr>");
			} else {
				for(var i = 0; i < data.facDetail.length; i++){
					var perFac = data.facDetail[i];
					$("#facDetailTbody").append("<tr><td>"+ perFac.fac_id +"</td>"+
						"<td>"+ perFac.room_number +"</td><td>"+ perFac.comment +"</td>"+
						"<td><span class='blue'>转移</span><span class='blue'>回仓库</span>"+
						"<span class='gray'>报废</span></td></tr>");
				}
			}
		}
	});
}

// 将物品回仓库
var gobackToWarehouse = function(element){
	var facID = Number($(element).parent().parent().children("td").eq(1).text());
	if(confirm("确定将"+ facID +"回仓库吗？")){
		// 将物品回仓库
		$.ajax({
			url:'/LD/userItem/toWarehouse.action',
			dataType:'json',
			contentType:'application/json',
			data:'"facID":12',
			success:function(data){
				console.log(data);
			}
		});
	}
}

// 移动物品
var transferFac = function(element){
	var facID = prompt("请输入转移的房间号：");
	$.ajax({
		url:'/LD/userItem/toWarehouse.action',
		dataType:'json',
		contentType:'application/json',
		data:'{"facID":'+ facID +'}',
		success:function(data){
			console.log(data);
			if(data == 1){
				alert("移动成功！")
			} else {
				alert("移动失败！");
			}
		}
	});
}

// 物品报废
var facBad = function(element){
	$.ajax({
		url:'/LD/userItem/facBad.action',
		dataType:'json',
		contentType:'application/json',
		data:'{"facID":'+ facID +'}',
		success:function(data){
			console.log(data);
			if(data == 1){
				alert("移动成功！")
			} else {
				alert("移动失败！");
			}
		}
	});
}