// 请求第一页维修统计信息
var requestMaintainStat = function(pageNum){
	// $.ajax({
	// 	url:'/LD',
	// 	type:'post',
	// 	dataType:'json',
	// 	contentType:'application/json',
	// 	data:'{}',
	// 	success:function(data){
	// 		console.log(data);
			for(var i=0; i<2; i++){
				var roomNum = "W34-1";
				$("#maintainStatTbody").append("<tr><td>W34-1</td><td>大户型</td><td>户型类型</td><td>已入住</td>"+
					"<td>Alice</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td>"+
					"<td>1</td><td><a class='detail' href='maintainRoomDetail.jsp?roomNum="+ roomNum +"'>详情</a></td></tr>");
			}
	// 	}
	// });
}