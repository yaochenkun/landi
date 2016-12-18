// 请求车费信息
var requestBus = function(){
	// $.ajax({
	// 	url:'/LD/userItem/searchServiceWash.action',
	// 	type:'post',
	// 	dataType:'json',
	// 	data:'{}',
	// 	contentType:'application/json',
	// 	success:function(data){
	// 		console.log(data);
			for(var i=0; i<2; i++){
				$(".date").append("<td colspan='2'>2016-11-12</td>");
				$(".roomNo").append("<td colspan='2'>W34-1</td>");
				$(".name").append("<td colspan='2'>Alice</td>");

				$(".price").append("<td>通勤记录</td><td>价格</td>")
				$(".one").append("<td>1</td><td>50&nbsp;元</td>");
				$(".two").append("<td>1</td><td>50&nbsp;元</td>");
				$(".three").append("<td>1</td><td>50&nbsp;元</td>");
				$(".four").append("<td>1</td><td>50&nbsp;元</td>");
				$(".five").append("<td>1</td><td>50&nbsp;元</td>");
				$(".six").append("<td>1</td><td>50&nbsp;元</td>");
				$(".seven").append("<td>1</td><td>50&nbsp;元</td>");
				$(".eight").append("<td>1</td><td>50&nbsp;元</td>");
				$(".nine").append("<td>1</td><td>50&nbsp;元</td>");
				$(".ten").append("<td>1</td><td>50&nbsp;元</td>");
				$(".eleven").append("<td>1</td><td>50&nbsp;元</td>");
				$(".twelve").append("<td>1</td><td>50&nbsp;元</td>");
				$(".thirteen").append("<td>1</td><td>50&nbsp;元</td>");
				$(".fourteen").append("<td>1</td><td>50&nbsp;元</td>");
				$(".fifteen").append("<td>1</td><td>50&nbsp;元</td>");
				$(".sixteen").append("<td>1</td><td>50&nbsp;元</td>");
				$(".seventeen").append("<td>1</td><td>50&nbsp;元</td>");
				$(".eighteen").append("<td>1</td><td>50&nbsp;元</td>");
				$(".ninteen").append("<td>1</td><td>50&nbsp;元</td>");
				$(".twenty").append("<td>1</td><td>50&nbsp;元</td>");
				$(".twentyOne").append("<td>1</td><td>50&nbsp;元</td>");
				$(".twentyTwo").append("<td>1</td><td>50&nbsp;元</td>");
				$(".twentyThree").append("<td>1</td><td>50&nbsp;元</td>");
				$(".twentyFour").append("<td>1</td><td>50&nbsp;元</td>");
				$(".twentyFive").append("<td>1</td><td>50&nbsp;元</td>");
				$(".twentySix").append("<td>1</td><td>50&nbsp;元</td>");
				$(".twentySeven").append("<td>1</td><td>50&nbsp;元</td>");
				$(".twentyEight").append("<td>1</td><td>50&nbsp;元</td>");
				$(".twentyNine").append("<td>1</td><td>50&nbsp;元</td>");
				$(".thirty").append("<td>1</td><td>50&nbsp;元</td>");
				$(".thirtyOne").append("<td>1</td><td>50&nbsp;元</td>");
				$(".total").append("<td>10天</td><td>50&nbsp;元</td>");
			}

			// 添加洗衣单收费 底部页码
				$("#serviceWashBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeShopping();'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='shoppinglist_nowpage' value='1' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='shoppinglist_totalpage'>2</span>"+
			            "<span class='page-next' onclick='requestNextShopping();'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recorTotal'>&nbsp;5&nbsp;</span>条记录</div>");
	// 	}
	// });
};