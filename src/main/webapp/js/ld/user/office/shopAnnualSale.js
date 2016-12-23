(function(){
	// 年份回车查询年销售量
	$("#searchYear").keyup(function(e){
		if(e.keyCode == 13){
			var year = $(this).val();
			console.log("查询年份：" + year);
			requestAnnualSale(year,1);
		}
	});
})();

// 请求某商品年销售量
var requestAnnualSale = function(year,pageNum){
	var goodId = $("#goodId").text();
	console.log("请求 "+ year +" 年 商品："+ goodId + " 第 " + pageNum + " 页的年销售信息");
	// $.ajax({
	// 	url:'/',
	// 	type:'post',
	// 	dataType:'json',
	// 	contentTypr:'application/json',
	// 	data:'{}',
	// 	success:function(data){
	// 		console.log(data);
			// 清空
			$("#annualSaleTbody").html("");
			
			for(var i=0; i<2; i++){
				$("#annualSaleTbody").append("<tr><td>买入</td><td>1</td><td>1</td>"+
					"<td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td>"+
					"<td>1</td><td>1</td><td>1</td></tr><tr><td>卖出</td><td>1</td>"+
					"<td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td>"+
					"<td>1</td><td>1</td><td>1</td><td>1</td></tr>");
			}
	// 	}
	// });
}