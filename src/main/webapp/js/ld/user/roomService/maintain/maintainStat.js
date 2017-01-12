// 请求第一页维修统计信息
var requestMaintainStat = function(pageNum){
	var date = $("#date_demo3").text();
	var dateArray = date.split(" 至 ");
	var startDate = dateArray[0];
	var endDate = dateArray[1];
	var roomNum = $("#searchRoomNum").val();

	$.ajax({
		url:'/LD/userRoom/searchMaintainStatic.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		data:'{"pageNum":'+ pageNum +',"from":"'+ startDate +'","to":"'+ endDate +'",'
			+'"roomNum":"'+ roomNum +'"}',
		success:function(data){
			console.log(data);
			// for(var i=0; i<2; i++){
			// 	var roomNum = "W34-1";
			// 	$("#maintainStatTbody").append("<tr><td>W34-1</td><td>大户型</td><td>户型类型</td><td>已入住</td>"+
			// 		"<td>Alice</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td>"+
			// 		"<td>1</td><td><a class='detail' href='maintainRoomDetail.jsp?roomNum="+ roomNum +"'>详情</a></td></tr>");
			// }
		}
	});
}