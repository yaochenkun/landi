(function(){
	$(window).scroll(function(){
		var viewH = $(window).height();
		var contentH = $(document).height()
		var scrollH = $(window).scrollTop();
		// 滚动到底部加载执行计划
		// console.log(pageTotal);
		// console.log(progressPage);
		if(scrollH + viewH + 5 >= contentH && progressPage <= pageTotal){
			requestPlanProgress(progressPage);
			progressPage++;
		}
	});
})();

var progressPage = 2;
var pageTotal = 0;

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

			// 清空明细
			$("#facTbody").html("");

			if(data.pageList.length == 0){
				$("#facTbody").html("<tr><td colspan='18'>没有采购物品信息！</td></tr>");
			} else {
				for(var i=0; i<data.pageList.length; i++){
					var perFac = data.pageList[i];
					$("#facTbody").append("<tr><td>"+ perFac.fac_ID +"</td><td>"+ perFac.type +"</td><td>" + perFac.cat +"</td>"+
						"<td>"+ perFac.brand +"</td><td>"+ perFac.name +"</td>"+
                        "<td>"+ perFac.owner +"</td><td>"+ perFac.repo_NUM +"</td><td>"+ perFac.provider +"</td>"+
                        "<td>"+ perFac.already +"</td><td>"+ perFac.total +"</td>"+
                        "<td>"+ perFac.unitprice +"&nbsp;元</td><td>"+ perFac.all_MONEY +"&nbsp;元</td>"+
                        "<td>"+ perFac.invoice_TYPE +"</td><td>"+ perFac.received +"</td>"+
                        "<td>"+ formatDateForm(new Date(perFac.order_DATE)) +"</td>"+
                        "<td>"+ formatDateForm(new Date(perFac.arrival_DATE)) +"</td><td>"+ perFac.comment +"</td>"+
						"<td><span class='caigou' onclick='showCaigouFac(this);'>采购</span>"+
						"<span style='display:none' class='pdID'>"+ perFac.id +"</span></td></tr>");
				}
			}
		}
	});
};

var requestPlanProgress = function(pageNum,clear){
	var planID = Number($("#planID").text());
	console.log("请求计划"+ planID +"第"+ pageNum +"页执行情况");
	// 请求计划执行情况
	$.ajax({
		url:'/LD/userItem/searchPlanProgress.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		data:'{"planID":'+ planID +',"pageNum":'+ pageNum +'}',
		success:function(data){
			console.log(data);

			// 清空采购计划执行情况
			if(clear == 1){
				$("#planProgressBody").html("");
				progressPage = 2;
			}
			if(!data.pageList){
				$("#planProgressBody").html("<div style='text-align:center; color: #ff4d4d;'>没有计划执行记录！</div>");
				return;
			}
			pageTotal = data.pageTotal;
			for(var i=0; i<data.pageList.length; i++){
				var perProgress = data.pageList[i];

				var caigouDate = new Date(perProgress.time);
				var ddDate = formatDate(caigouDate);

				$("#planProgressBody").append("<div class='perProgress'>"+
					"<div class='user'><span>采购人员："+ perProgress.staff +"</span></div>"+
					"<div class='time'>"+ ddDate +"</div>"+
					"<dl class='progress_item'>"+
					"<dt>物品序号</dt><dd>"+ perProgress.fac_ID +"</dd>"+
					"<dt>物品种类</dt><dd>"+ perProgress.type +"</dd>"+
					"<dt>物品子类</dt><dd>"+ perProgress.cat +"</dd>"+
					"<dt>物品品牌</dt><dd>"+ perProgress.brand +"</dd>"+
					"<dt>物品名称</dt><dd>"+ perProgress.name +"</dd>"+
                    "<dt>物品归属权</dt><dd>"+ perProgress.owner +"</dd>"+
                    "<dt>存入库房号</dt><dd>"+ perProgress.repo_NUM +"</dd>"+
					"<dt>采购数量</dt><dd class='money'>"+ perProgress.total +"</dd>"+
					"<dt>采购总价</dt><dd class='money'><span class='moneyNum'>"+ perProgress.all_MONEY +"</span>&nbsp;元</dd>"+
					"<dt>备注</dt><dd>"+ perProgress.comment +"</dd></dl></div>");
			}
		}
	});
};

// 显示隐藏采购计划执行情况
var showCaigouFac = function(element){

	$(".shadow").css("display","block");
	$('.addItemDiv').css("display","block");

 	setTimeout(function(){$('.addItemDiv').addClass('showMenuModal');},50);
	$(".addItemDiv").addClass("effect-fade");


    $("#fac-total .item-content input").val(1);

	// 弹出框显示物品名称
	var facName = $(element).parent().parent().children("td").eq(3).text();
	$("#fac-name .item-content").html(facName);
	//弹出框隐藏显示物品ID
	var facID = $(element).parent().parent().children("td").eq(0).text();
	$("#fac-id").html(facID);
	// 弹出框隐藏显示每条采购明细ID
	var pdID = $(element).parent().children(".pdID").text();
	$("#pd-id").html(pdID);

	//获取单价
	var unitPriceStr = $(element).parent().parent().children("td").eq(10).text();
    $("#fac-unitprice .item-content").html(unitPriceStr);
    $("#fac-money .item-content").html(unitPriceStr);
};
var closeCaigouDiv = function(){
	$(".shadow").css("display","none");
	$(".addItemDiv").removeClass('showMenuModal');
	setTimeout(function(){$(".addItemDiv").css("display","none");},200);
};


var calCaigouTotalPrice = function (count) {

    var unitPriceStr = $("#fac-unitprice .item-content").text();
	var unitPrice = unitPriceStr.substring(0,unitPriceStr.indexOf("元") - 1);
    $("#fac-money .item-content").html(unitPrice * count + " 元");
};

// 添加一条采购计划执行记录
var addPlanProgress = function(){
	console.log("添加一条采购计划执行记录");
	var planID = Number($("#planID").text());
	var facID  = Number($("#fac-id").text());
	var pdID = Number($("#pd-id").text());
	var term = $("#fac-term .item-content input").val();
	var total = Number($("#fac-total .item-content input").val());
	var staff = $("#fac-staff .item-content input").val();
	var all_moneyStr = $("#fac-money .item-content").text();
	var all_money = Number(all_moneyStr.substring(0, all_moneyStr.indexOf("元") - 1));
	var comment = $("#fac-comment .item-content input").val();

	var nowDate = new Date();
	var time = formatDate(nowDate);

	$.ajax({
		url:'/LD/userItem/addPlanProgress.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:'{"planID":'+ planID +',"facID":'+ facID +',"term":"'+ term +'","total":'+ total +','+
			'"staff":"'+ staff +'","all_money":'+ all_money +',"comment":"'+ comment +'",'+
			'"time":"'+ time +'","pdID":'+ pdID +'}',
		success:function(data){
			console.log(data);
			if (data == 1) {
				closeCaigouDiv();
				showModalBox("success","采购成功！");
				requestPlanDetail();
				requestPlanProgress(1,1);
			} else if (data == 0){
				closeCaigouDiv();
				showModalBox("error","采购失败！请检查采购数量是否过多");
			}
		}
	});
};