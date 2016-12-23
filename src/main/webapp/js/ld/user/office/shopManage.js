// 根据日期查询商品信息
var requestShopListByDate = function(date){
	console.log("查询商品日期："+date);
	// $.ajax({
	// 	url:'/LD/searchShopListByDate',
	// 	type:'post',
	// 	dataType:'json',
	// 	contentType:'application/json',
	// 	data:'{}',
	// 	success:function(data){
	// 		console.log(data);
			// 清空列表
			$("#shopListTbody").html("");
			for(var i=0; i<2; i++){
				$("#shopListTbody").append("<tr><td>虾条</td><td>1&nbsp;元</td><td>1&nbsp;元</td>"+
					"<td>1</td><td>1</td><td>1</td><td>1</td><td>"+
					"<span class='buy' onclick='showBuyGoodsDiv(this);'>买</span>"+
					"<span class='sale' onclick='showSaleGoodsDiv(this);'>卖</span>"+
					"<span class='use' onclick='showUseGoodsDiv(this);'>自用</span></td>"+
					"<td><a href='shopAnnualSale.jsp?goodId="+ 1 +"' class='annualSale' >查看年销售量</a></td></tr>");
		}
	// });
};

// 显示买入商品弹出框
var showBuyGoodsDiv = function(element){
	showPopMenu("buyGoodsMenu");
	$("#buyGoodsMenu .goodsName").text($(element).parent().parent().children("td").eq(0).text());
};
// 关闭买入商品弹出框
var closeBuyGoodsDiv = function(){
	closePopMenu("buyGoodsMenu");
};
// 请求买入商品
var requestBuyGoods = function(){
	var count = Number($("#buyGoodsMenu input").val());
	console.log("买入商品数量" + count);
	closeBuyGoodsDiv();
	// $.ajax({
	// 	url:'/LD/userRoom/buyGoods.action',
	// 	type:'post',
	// 	contentType:'application/json',
	// 	dataType:'json',
	// 	data:'{}',
	// 	success:function(data){
	// 		console.log(data);
	// 	}
	// });
};

// 显示卖出商品弹出框
var showSaleGoodsDiv = function(element){
	showPopMenu("saleGoodsMenu");
	$("#saleGoodsMenu .goodsName").text($(element).parent().parent().children("td").eq(0).text());
};
// 关闭卖出商品弹出框
var closeSaleGoodsDiv = function(){
	closePopMenu("saleGoodsMenu");
};
// 请求卖出商品
var requestSaleGoods = function(){
	var count = Number($("#saleGoodsMenu input").val());
	console.log("卖出商品数量" + count);
	closeSaleGoodsDiv();
	// $.ajax({
	// 	url:'/LD/userRoom/buyGoods.action',
	// 	type:'post',
	// 	contentType:'application/json',
	// 	dataType:'json',
	// 	data:'{}',
	// 	success:function(data){
	// 		console.log(data);
	// 	}
	// });
};

// 显示自用商品弹出框
var showUseGoodsDiv = function(element){
	showPopMenu("useGoodsMenu");
	$("#useGoodsMenu .goodsName").text($(element).parent().parent().children("td").eq(0).text());
};
// 关闭自用商品弹出框
var closeUseGoodsDiv = function(){
	closePopMenu("useGoodsMenu");
};
// 请求自用商品
var requestUseGoods = function(){
	var count = Number($("#useGoodsMenu input").val());
	console.log("自用商品数量" + count);
	closeUseGoodsDiv();
	// $.ajax({
	// 	url:'/LD/userRoom/buyGoods.action',
	// 	type:'post',
	// 	contentType:'application/json',
	// 	dataType:'json',
	// 	data:'{}',
	// 	success:function(data){
	// 		console.log(data);
	// 	}
	// });
};

var showPopMenu = function(DivId){
	var $popDiv = $("#" + DivId);
	$(".shadow").css("display","block");
	$popDiv.css("display","block");

	setTimeout(function(){$popDiv.addClass('showMenuModal');},50);
	$popDiv.addClass("effect-fade");
};
var closePopMenu = function(DivId){
	var $popDiv = $("#" + DivId); 
	$(".shadow").css("display","none");
	$popDiv.removeClass('showMenuModal'); 
	setTimeout(function(){$popDiv.css("display","none");},200);
};