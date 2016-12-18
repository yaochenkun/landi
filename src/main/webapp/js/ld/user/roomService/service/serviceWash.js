(function(){
	$("#serviceRoomNumber").focus(function(){
		$(this).removeClass("border-red");
		$("#roomIdWarning").css("display","none");
	});
})();


// 请求洗衣单收费信息
var requestWash = function(){
	// $.ajax({
	// 	url:'/LD/userItem/searchServiceWash.action',
	// 	type:'post',
	// 	dataType:'json',
	// 	data:'{}',
	// 	contentType:'application/json',
	// 	success:function(data){
	// 		console.log(data);
			for(var i=0; i<2; i++){
				$(".date").append("<td>2016-11-12</td>");
				$(".roomNo").append("<td>W34-1</td>");
				$(".name").append("<td>1</td>");
				$(".shirt").append("<td>1</td>");
				$(".topSuit").append("<td>1</td>");
				$(".trousers").append("<td>1</td>");
				$(".jacket").append("<td>1</td>");
				$(".middleCoat").append("<td>1</td>");
				$(".longCoat").append("<td>1</td>");
				$(".shortCotton").append("<td>1</td>");
				$(".middleCotton").append("<td>1</td>");
				$(".longCotton").append("<td>1</td>");
				$(".cashmere").append("<td>1</td>");
				$(".shortPants").append("<td>1</td>");
				$(".waistcoat").append("<td>1</td>");
				$(".tshirt").append("<td>1</td>");
				$(".knitted").append("<td>1</td>");
				$(".tie").append("<td>1</td>");
				$(".longSkirt").append("<td>1</td>");
				$(".shortSkirt").append("<td>1</td>");
				$(".other").append("<td>1</td>");
				$(".total").append("<td>1</td>");
				$(".price").append("<td>1</td>");
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


// 添加洗衣单收费
var addserviceWash = function(){
	// 判断房间号是否为空
	if($("#serviceRoomNumber").val() == ""){
		$("#roomIdWarning").css("display","block");
		$("#serviceRoomNumber").addClass("border-red");
		console.log("房间号为空！");
		return;
	}
	requestAddServiceWash();
}; 

var requestAddServiceWash = function(){
	console.log("添加房间洗衣单收费！");
	$.ajax({
		url:'/LD/addserviceWash.action',
		type:'post',
		dataType:'application/json',
		data:'{}',
		success:function(data){
			console.log(data);
		}
	});
};