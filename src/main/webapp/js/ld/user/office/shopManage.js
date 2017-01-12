(function(){
	// 绑定按商品名查询商品列表事件
	$("#shop_id").keyup(function(element){
		if(element.keyCode == 13){
			requestShopListByName(1);
		}
	});
})();

// 查询商品信息
var requestShopList = function(pageNum){
	console.log("查询全部商品信息");
	$.ajax({
		url:'/LD/userItem/searchGoodsList.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		data:'{"pageNum":'+ pageNum +'}',
		success:function(data){
			console.log(data);
			// 清空列表
			$("#shopListTbody").html("");
			$("#shopListBottom").html("");

			for(var i = 0; i < data.dataList.length; i++){
				addPerGoods(data.dataList[i]);
			}

			// 添加商品列表 底部页码
			$("#shopListBottom").append("<div class='bottom-page'>"+
	        	"<span class='page-before' onclick='requestBeforeShop();'>上一页&nbsp;&nbsp;</span>"+
	        	"<span><input id='shop_nowpage' value='"+ data.pageNow +"' type='text' class='input_num'></span>"+
	        	"<span>&nbsp;/&nbsp;</span>"+
	        	"<span id='shop_totalpage'>"+ data.pageTotal +"</span>"+
	            "<span class='page-next' onclick='requestNextShop();'>&nbsp;&nbsp;下一页</span>" +
	            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ data.recordTotal +"&nbsp;</span>条记录</div>");
		}
	});
};
//拉取上一页 商品信息
var requestBeforeShop = function(){
	var nowpage = parseInt($("#shop_nowpage").val());
	if(nowpage == 1) return;
	requestShopList(nowpage - 1);
};

// 拉取下一页 商品信息
var requestNextShop = function(){
	var nowpage = parseInt($("#shop_nowpage").val());
	var totalpage = parseInt($("#shop_totalpage").text());
	if(nowpage == totalpage) return;
	requestShopList(nowpage + 1);
};
///////////////////////////////////////////////////////////根据商品名模糊查询商品信息
var requestShopListByName = function(pageNum){
	var GoodsName = $("#shop_id").val();
	console.log("模糊查询商品：" + GoodsName + "第" + pageNum + "页商品信息");
		$.ajax({
		url:'/LD/userItem/searchGoodsList.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		data:'{"pageNum":'+ pageNum +',"GoodsName":"'+ GoodsName +'"}',
		success:function(data){
			console.log(data);
			// 清空列表
			$("#shopListTbody").html("");
			$("#shopListBottom").html("");

			if(data.recordTotal == 0){
				$("#shopListTbody").append("<td class='emptyText' colspan='10'>没有相关信息！</td>");
				return;
			}

			for(var i = 0; i < data.dataList.length; i++){
				addPerGoods(data.dataList[i]);
			}

			// 添加商品列表 底部页码
			$("#shopListBottom").append("<div class='bottom-page'>"+
	        	"<span class='page-before' onclick='requestBeforeShopByName();'>上一页&nbsp;&nbsp;</span>"+
	        	"<span><input id='shop_nowpage' value='"+ data.pageNow +"' type='text' class='input_num'></span>"+
	        	"<span>&nbsp;/&nbsp;</span>"+
	        	"<span id='shop_totalpage'>"+ data.pageTotal +"</span>"+
	            "<span class='page-next' onclick='requestNextShopByName();'>&nbsp;&nbsp;下一页</span>" +
	            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ data.recordTotal +"&nbsp;</span>条记录</div>");
		}
	});
};
//拉取上一页 商品信息
var requestBeforeShopByName = function(){
	var nowpage = parseInt($("#shop_nowpage").val());
	if(nowpage == 1) return;
	requestShopList(nowpage - 1);
};
// 拉取下一页 商品信息
var requestNextShopByName = function(){
	var nowpage = parseInt($("#shop_nowpage").val());
	var totalpage = parseInt($("#shop_totalpage").text());
	if(nowpage == totalpage) return;
	requestShopList(nowpage + 1);
};

/////////////////////////////////////////////////////////////////////
// 逐条添加商品信息列表
var addPerGoods = function(perRecord){
	$("#shopListTbody").append("<tr><td>"+ perRecord.name +"</td>"+
		"<td><span id='buy_MONEY'>"+ perRecord.buy_MONEY +"</span>&nbsp;元</td>"+
		"<td><span id='sell_MONEY'>"+ perRecord.sell_MONEY +"</span>&nbsp;元</td>"+
		"<td>"+ perRecord.total +"</td><td>"+ perRecord.avaliable +"</td>"+
		"<td>"+ perRecord.total_SOLD +"</td><td>"+ perRecord.total_LOSS +"</td>"+
		"<td>"+ perRecord.total_BENIFIT +"</td>"+
		"<td><span class='buy' onclick='showBuyGoodsDiv(this);'>买</span>"+
		"<span class='sale' onclick='showSaleGoodsDiv(this);'>卖</span>"+
		"<span class='use' onclick='showUseGoodsDiv(this);'>废弃</span>"+
		"<span id='goods_id' style='display:none;'>"+ perRecord.id +"</span></td>"+
		"<td><a href='shopDetail.jsp?goodId="+ perRecord.id +"' class='annualSale'>查看记录</a></td></tr>");
};

//////////////////////////////////////////////////////////////
// 显示买入商品弹出框
var showBuyGoodsDiv = function(element){
	showPopMenu("buyGoodsMenu");
	$("#buyGoodsMenu .goodsName").text($(element).parent().parent().children("td").eq(0).text());
	$("#buyGoodsId").text($(element).parent().children('#goods_id').text());
	$("#buyMoney").text($(element).parent().parent().children().children("#buy_MONEY").text());
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

	// 买入商品时间为当前时间
	var date = new Date();
	var per = $("#buyMoney").text();
	var total = per * count;
	$.ajax({
		url:'/LD/userItem/buyGoods.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:'{"ID":'+ $("#buyGoodsId").text() +',"count":'+ count +','
			+'"date":"'+ formatDate(date) +'","per":'+ per +',"total":'+ total +'}',
		success:function(data){
			console.log(data);
			if(data == 1){
				showModalBox("success","买入成功！");
			}else if(data == 0){
				showModalBox("error","买入失败！");
			}
		}
	});
};

// 显示卖出商品弹出框
var showSaleGoodsDiv = function(element){
	showPopMenu("saleGoodsMenu");
	$("#saleGoodsMenu .goodsName").text($(element).parent().parent().children("td").eq(0).text());
	$("#saleGoodsId").text($(element).parent().children('#goods_id').text());
	$("#saleMoney").text($(element).parent().parent().children().children("#sell_MONEY").text());
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

	var date = formatDate(new Date());
	var per = $("#saleMoney").text();
	var total = per * count;
	$.ajax({
		url:'/LD/userItem/sellGoods.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:'{"date":"'+ date +'","ID":'+ $("#saleGoodsId").text() +',"count":'+ count +','
			+'"per":'+ per +',"total":'+ total +'}',
		success:function(data){
			console.log(data);
			if(data == 1){
				showModalBox("success","卖出成功！");
			}else if(data == 0){
				showModalBox("error","卖出失败！");
			}
		}
	});
};

// 显示自用商品弹出框
var showUseGoodsDiv = function(element){
	showPopMenu("useGoodsMenu");
	$("#useGoodsMenu .goodsName").text($(element).parent().parent().children("td").eq(0).text());
	$("#useGoodsId").text($(element).parent().children('#goods_id').text());
	$("#useMoney").text($(element).parent().parent().children().children("#buy_MONEY").text());
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

	var date = formatDate(new Date());
	var per = $("#useMoney").text();
	var total = per * count;
	$.ajax({
		url:'/LD/userItem/wasteGoods.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:'{"ID":'+ $("#useGoodsId").text() +',"date":"'+ date +'",'
			+'"count":'+ count +',"per":'+ per +',"total":'+ total +'}',
		success:function(data){
			console.log(data);
			if(data == 1){
				showModalBox("success","废弃成功！");
			}else if(data == 0){
				showModalBox("error","废弃失败！");
			}
		}
	});
};

///////////////////////////////////////////////////////////////////////