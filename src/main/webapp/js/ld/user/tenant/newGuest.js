var lastScrollTop = $(document).scrollTop();
var firstTabContent = $(".tab-content").eq(0).outerHeight() + 90 -32,
    secondTabContent = firstTabContent + $(".tab-content").eq(1).outerHeight() -32,
	thirdTabContent = secondTabContent + $(".tab-content").eq(2).outerHeight() -32,
	fourthTabContent = thirdTabContent + $(".tab-content").eq(3).outerHeight() -32,
	fifthTabContent = fourthTabContent + $(".tab-content").eq(4).outerHeight() -32;
var arrayTabContent = [90,firstTabContent+32,secondTabContent+32,thirdTabContent+32,fourthTabContent+32];
    
$(function(){
	$(window).scroll(function(){
			var nowScrollTop = $(document).scrollTop();
			//console.log(nowScrollTop);
			if(nowScrollTop<90){   //滚动小于90
				$(".icon-group .list-icon-link").css("display","none");
				$(".tab-content").children(".tab-content-title").children("span").css("visibility","visible");
			}
			if(nowScrollTop<firstTabContent && nowScrollTop>90){changeTabContent(0);}
			else if(nowScrollTop>firstTabContent&&nowScrollTop<secondTabContent){changeTabContent(1);}
			else if(nowScrollTop>secondTabContent&&nowScrollTop<thirdTabContent){changeTabContent(2);}
			else if(nowScrollTop>thirdTabContent&&nowScrollTop<fourthTabContent){changeTabContent(3);}
			else if(nowScrollTop>fourthTabContent&&nowScrollTop<fifthTabContent){changeTabContent(4);}

			// if(nowScrollTop < 200){
			// 	$(".navbar-ld").addClass("topNormal");
			// }
			// else{  				
			// 	if(nowScrollTop>lastScrollTop){
			// 		$(".navbar-ld").removeClass("topNormal").addClass("topNone");
			// 	}
			// 	else{
			// 		$(".navbar-ld").addClass("topNormal").removeClass("topNone");
			// 	}
			// 	lastScrollTop = nowScrollTop;
			// }
		}
	);
	// 点击珠串定位事件
	$(".list-icon-link").click(function(element){
		//console.log($(element.toElement).index()/2);
		$(document).scrollTop(arrayTabContent[$(element.toElement).index()/2]);
		changeTabContent($(element.toElement).index()/2);
	}).hover(function(){
		$(this).next(".list-icon-text").fadeIn(100);
	},function(){
		$(this).next(".list-icon-text").fadeOut(100);
	});

    // 服务表格滑过事件
	$("tbody tr").hover(function(){
		$(this).children("td").toggleClass("td-hover");
		$(this).children(".rowOne").toggleClass("td-hover");
	},function(){
		$(this).children("td").toggleClass("td-hover");
		$(this).children(".rowOne").toggleClass("td-hover");
	});

	// 选择饭店
	$(".thick-title span").click(function(){
		$(".thick-div").css("display","none");
		$(".thick-box").css("display","none");
	});
	$(".restaurant a").click(function(){
		if($(this).hasClass("a-active")){
			$(this).toggleClass("a-active");
		}
		else{
			if($(".restaurant .a-active").length >= 3){
				$(".warning").toggleClass("warning-animation");
				return;
			}
			$(this).toggleClass("a-active");
		}		
	});

	// 输入房间号
	$(".item-room input").keyup(function(){
		if($(this).val().length >= 4){
			// 请求户型
			//$.ajax({
				// url:'/LD',
				// type:'post',
				// success:function(data){
				// 	console.log(data);
				    // 修改户型
					$(".item-room .fl").eq(1).text("大户型");
					// 修改基本费用值
					$(".col-LE td").eq(2).text("12");
					$(".col-LE td").eq(3).text("12");
					$(".col-LE td").eq(4).text("12");
					$(".col-LE td").eq(5).text("12");
					$(".col-LE td").eq(6).text("12");
					$(".col-LE td").eq(7).text("12");
					$(".col-LE td").eq(8).children("input").removeAttr("checked");
					$(".col-LE td").eq(8).children("input").prop("checked",true);

					$(".col-wash td").eq(1).text("12");
					$(".col-wash td").eq(2).text("12");
					$(".col-wash td").eq(3).text("12");
				// }
			//});
		};
	});
});

// 显示选择饭店窗口
var showChooseRestaurant = function(){
	$(".thick-div").css("display","block");
	$(".thick-box").css("display","block");
}

//选择饭店
var chooseRestaurant = function(){
	var restaurantCount = $(".restaurant .a-active").length;
	$(".thick-div").css("display","none");
	$(".thick-box").css("display","none");
	if(restaurantCount == 0) return;

	// 清空餐券
	$(".col-lunch-choose").remove();
	$(".col-lunch").remove();
	$(".col-break").before("<tr class='col-lunch-choose'><td class='title' rowspan='"+ (restaurantCount + 1) +"'>餐券</td>"+
        "<td onclick='showChooseRestaurant();'>重新选择饭店</td><td></td>"+
        "<td></td><td></td><td></td><td></td><td></td><td></td></tr>");
	// 逐条添加饭店
	$(".restaurant .a-active").each(function(){
		$(".col-break").before("<tr class='col-lunch'><td>"+ $(this).text() +"</td>"+
				"<td><input type='text' value='1000'/></td>"+
	            "<td><input type='text' value='1'/></td><td><input type='text' value='1000'/></td>"+
	            "<td><input type='text' value='1'/></td><td><input type='text' value='1'/></td>"+
	            "<td><input type='text' value='无'/></td><td><input type='checkbox'></td></tr>");
	});

    // 其他费用列数增加
	$(".col-park td:nth-child(1)").attr("rowspan",restaurantCount+10);
}

// 增加其他费用项目
var addServiceTr = function(){
	var nowRow = $(".col-park td:nth-child(1)").attr("rowspan");
	$(".col-park td:nth-child(1)").attr("rowspan",nowRow+1);
	if($(".col-add").length==0){
		$(".col-daily").after("<tr class='col-add'><td colspan='2'><input type='text' value='费用项目'/></td>"+
				"<td><input type='text' value='1000'/></td>"+
	            "<td><input type='text' value='1'/></td><td><input type='text' value='1000'/></td>"+
	            "<td><input type='text' value='1'/></td><td><input type='text' value='1'/></td>"+
	            "<td><input type='text' value='无'/></td><td><input type='checkbox'></td></tr>");
	}
	else{
		$(".col-add:last").after("<tr class='col-add'><td colspan='2'><input type='text' value='费用项目'/></td>"+
				"<td><input type='text' value='1000'/></td>"+
	            "<td><input type='text' value='1'/></td><td><input type='text' value='1000'/></td>"+
	            "<td><input type='text' value='1'/></td><td><input type='text' value='1'/></td>"+
	            "<td><input type='text' value='无'/></td><td><input type='checkbox'></td></tr>");
	}
}


// 改变珠串样式
var changeTabContent = function(index){
	$(".tab-content").eq(index).children(".tab-content-title").children("span").css("visibility","hidden");
    $(".tab-content").eq(index).prevAll(".tab-content").children(".tab-content-title").children("span").css("visibility","hidden");
    $(".tab-content").eq(index).nextAll(".tab-content").children(".tab-content-title").children("span").css("visibility","visible");

	$(".icon-group .list-icon-link").eq(index).css("display","block").css("display","block").css("background","#ff4d4d");
	$(".icon-group .list-icon-link").eq(index).prevAll("a").css("display","block").css("background","#ccc");
	$(".icon-group .list-icon-link").eq(index).nextAll("a").css("display","none");
}

// 添加租客
var addGuest = function(){
	// 获取租客信息
	var name = $(".tab-content-guest .item-name input").eq(0).val();
	var checkin = Number($(".tab-content-guest .item-name input[type='checkbox']").is(":checked"));
	var roomID = $(".tab-content-guest .item-room input").eq(0).val();
	var type = $(".tab-content-guest .item-room input").eq(1).val();
	var contractID = $(".tab-content-guest .item-tel input").eq(0).val();
	var tel = $(".tab-content-guest .item-tel input").eq(1).val();
	var company = $(".tab-content-guest .item-company input").eq(0).val();
	var position = $(".tab-content-guest .item-company input").eq(1).val();
	var guestNumber = $(".tab-content-guest .item-guestnumber input").eq(0).val();
	var timeIn = $(".tab-content-guest .item-time input").eq(0).val();
	var timeOut = $(".tab-content-guest .item-time input").eq(1).val();
	var rent = $(".tab-content-guest .item-car input").eq(0).val();
	var carport = $(".tab-content-guest .item-car input").eq(1).val();
	var remark = $(".tab-content-guest .item-remark input").eq(0).val();

	let guestData = '"guest":{"STR_Name":"'+ name +'","BOOL_Checkin":'+ checkin +',"STR_RommID":"'+ roomID +'","STR_Type":"'+ type +'",'
		    +'"STR_ContractID":"'+ contractID +'","STR_Tel":"'+ tel +'","STR_Company":"'+ company +'",'
		    +'"STR_Position":"'+ position +'","INT_GuestNumber":'+ guestNumber +','
		    +'"STR_TimeIn":"'+ timeIn +'","STR_TimeOut":"'+ timeOut +'","INT_Rent":'+ rent +',"STR_Carport":"'+ carport +'",'
		    +'"STR_Remark":"'+ remark +'"},';



	// 获取业主信息
	var Name = $(".tab-content-owner .item-name input").eq(0).val();
	var Rent = $(".tab-content-owner .item-rent input").eq(0).val();
	var Service = $(".tab-content-owner .item-rent input").eq(1).val();
	var Return = $(".tab-content-owner .item-other input").eq(0).val();
	var Other = $(".tab-content-owner .item-other input").eq(1).val();

	let hostData = '"host":{"STR_Name":"'+ Name +'","INT_Rent":'+ Rent +',"INT_Service":'+ Service +','
		    +'"INT_Return:":'+ Return +',"STR_Other":"'+ Other +'"},';


	// 获取中介信息
	var agentCompany = $(".tab-content-agency .item-company input").eq(0).val();
	var agentFirst = $(".tab-content-agency .item-first input").eq(0).val();
	var agentSecond = $(".tab-content-agency .item-second input").eq(0).val();
	var agentThird = $(".tab-content-agency .item-third input").eq(0).val();
	var agentFourth = $(".tab-content-agency .item-fourth input").eq(0).val();
	var LEFirst = $(".tab-content-agency .item-first input").eq(1).val();
	var LESecond = $(".tab-content-agency .item-second input").eq(1).val();
	var LEThird = $(".tab-content-agency .item-third input").eq(1).val();
	var LEFourth = $(".tab-content-agency .item-fourth input").eq(1).val();

	let internData = '"intern":{"STR_Company":"'+ agentCompany +'","DOU_AgentFirst":'+ agentFirst +',"DOU_AgentSecond":'+ agentSecond +','
		    +'"DOU_AgentThird":'+ agentThird +',"DOU_AgentFourth":'+ agentFourth +',"DOU_LEFirst":'+ LEFirst +','
		    +'"DOU_LESecond":'+ LESecond +',"DOU_LEThird":'+ LEThird +',"DOU_LEFourth":'+ LEFourth +'},';


	// 获取房款收付信息
	var RentNumber = $(".tab-content-housepay .item-rent .item-date input").eq(0).val();
	var RentCycle = $(".tab-content-housepay .item-rent .item-cycle input").eq(0).val();
	var RentWay = $(".tab-content-housepay .item-rent .item-cycle input").eq(1).val();
	var ReturnNumber = $(".tab-content-housepay .item-return .item-date input").eq(0).val();
	var ReturnCycle = $(".tab-content-housepay .item-return .item-cycle input").eq(0).val();
	var BillNumber = $(".tab-content-housepay .item-bill .item-date input").eq(0).val();
	var BillCycle = $(".tab-content-housepay .item-bill .item-cycle input").eq(0).val();
	var BillTime = $(".tab-content-housepay .item-bill .item-cycle input").eq(1).val();

	let rentData = '"balance":{"STR_RentNumber":"'+ RentNumber +'","STR_RentCycle":"'+ RentCycle +'","STR_RentWay":"'+ RentWay +'",'
            +'"STR_ReturnNumber":"'+ ReturnNumber +'","STR_ReturnCycle":"'+ ReturnCycle +'",'
		    +'"STR_BillNumber":"'+ BillNumber +'","STR_BillCycle":"'+ BillCycle +'","STR_BillTime":"'+ BillTime +'"},';	

	// 获取服务信息
	// 网费
	var serviceIntInput = $(".tab-content-service .col-Int input");
	var IntLECharge = serviceIntInput.eq(0).val();
	var IntLECount = serviceIntInput.eq(1).val();
	var IntSPCCharge = serviceIntInput.eq(2).val();
	var IntSPCCount = serviceIntInput.eq(3).val();
	var IntCycle = serviceIntInput.eq(4).val();
	var IntNote = serviceIntInput.eq(5).val();
	var IntGive = Number($(".tab-content-service .col-Int input[type='checkbox']").is(":checked"));

	let IntData = '"DOU_IntLECharge":'+ IntLECharge +',"INT_IntLECount":'+ IntLECount +','
		    +'"DOU_IntSPCCharge":'+ IntSPCCharge +',"INT_IntSPCCount":'+ IntSPCCount+','
		    +'"STR_IntCycle":"'+ IntCycle +'","STR_IntNote":"'+ IntNote +'","BOOL_IntGive":'+ IntGive +',';

    // 能源费
    var serviceResourceInput = $(".tab-content-service .col-resource input");
    var resourceSelfpay = Number(serviceResourceInput.eq(0).is(":checked"));
	var resourceLECharge = serviceResourceInput.eq(1).val();
	var resourceLECount = serviceResourceInput.eq(2).val();
	var resourceSPCCharge = serviceResourceInput.eq(3).val();
	var resourceSPCCount = serviceResourceInput.eq(4).val();
	var resourceCycle = serviceResourceInput.eq(5).val();
	var resourceNote = serviceResourceInput.eq(6).val();
	var resourceGive = Number(serviceResourceInput.eq(7).is(":checked"));

	let resourceData = '"BOOL_resourceSelfpay":'+ resourceSelfpay+','
			+'"DOU_resourceLECharge":'+ resourceLECharge +',"INT_resourceLECount":'+ resourceLECount +','
		    +'"DOU_resourceSPCCharge":'+ resourceSPCCharge +',"INT_resourceSPCCount":'+ resourceSPCCount+','
		    +'"STR_resourceCycle":"'+ resourceCycle +'","STR_resourceNote":"'+ resourceNote +'","BOOL_resourceGive":'+ resourceGive +',';

	// 早餐人数
	var serviceBFInput = $(".tab-content-service .col-breakfast input");
	var breakfastLECharge = serviceBFInput.eq(0).val();
	var breakfastLECount = serviceBFInput.eq(1).val();
	var breakfastSPCCharge = serviceBFInput.eq(2).val();
	var breakfastSPCCount = serviceBFInput.eq(3).val();
	var breakfastCycle = serviceBFInput.eq(4).val();
	var breakfastNote = serviceBFInput.eq(5).val();
	var breakfastGive = Number($(".tab-content-service .col-breakfast input[type='checkbox']").is(":checked"));

	let breakfastData = '"DOU_breakfastLECharge":'+ breakfastLECharge +',"INT_breakfastLECount":'+ breakfastLECount +','
		    +'"DOU_breakfastSPCCharge":'+ breakfastSPCCharge +',"INT_breakfastSPCCount":'+ breakfastSPCCount+','
		    +'"STR_breakfastCycle":"'+ breakfastCycle +'","STR_breakfastNote":"'+ breakfastNote +'","BOOL_breakfastGive":'+ breakfastGive +',';

	// 停车费
	var serviceParkInput = $(".tab-content-service .col-park input");
	var parkLECharge = serviceParkInput.eq(0).val();
	var parkLECount = serviceParkInput.eq(1).val();
	var parkSPCCharge = serviceParkInput.eq(2).val();
	var parkSPCCount = serviceParkInput.eq(3).val();
	var parkCycle = serviceParkInput.eq(4).val();
	var parkNote = serviceParkInput.eq(5).val();
	var parkGive = Number($(".tab-content-service .col-park input[type='checkbox']").is(":checked"));

	let parkData = '"DOU_parkLECharge":'+ parkLECharge +',"INT_parkLECount":'+ parkLECount +','
		    +'"DOU_parkSPCCharge":'+ parkSPCCharge +',"INT_parkSPCCount":'+ parkSPCCount+','
		    +'"STR_parkCycle":"'+ parkCycle +'","STR_parkNote":"'+ parkNote +'","BOOL_parkGive":'+ parkGive +',';

	// 电视费
	var serviceTVInput = $(".tab-content-service .col-tv input");
	var tvLECharge = serviceTVInput.eq(0).val();
	var tvLECount = serviceTVInput.eq(1).val();
	var tvSPCCharge = serviceTVInput.eq(2).val();
	var tvSPCCount = serviceTVInput.eq(3).val();
	var tvCycle = serviceTVInput.eq(4).val();
	var tvNote = serviceTVInput.eq(5).val();
	var tvGive = Number($(".tab-content-service .col-tv input[type='checkbox']").is(":checked"));

	let tvData = '"DOU_tvLECharge":'+ tvLECharge +',"INT_tvLECount":'+ tvLECount +','
		    +'"DOU_tvSPCCharge":'+ tvSPCCharge +',"INT_tvSPCCount":'+ tvSPCCount+','
		    +'"STR_tvCycle":"'+ tvCycle +'","STR_tvNote":"'+ tvNote +'","BOOL_tvGive":'+ tvGive +',';

	// 报刊杂志费
	var serviceNPInput = $(".tab-content-service .col-newspaper input");
	var newspaperLECharge = serviceNPInput.eq(0).val();
	var newspaperLECount = serviceNPInput.eq(1).val();
	var newspaperSPCCharge = serviceNPInput.eq(2).val();
	var newspaperSPCCount = serviceNPInput.eq(3).val();
	var newspaperCycle = serviceNPInput.eq(4).val();
	var newspaperNote = serviceNPInput.eq(5).val();
	var newspaperGive = Number($(".tab-content-service .col-newspaper input[type='checkbox']").is(":checked"));

	let newspaperData = '"DOU_newspaperLECharge":'+ newspaperLECharge +',"INT_newspaperLECount":'+ newspaperLECount +','
		    +'"DOU_newspaperSPCCharge":'+ newspaperSPCCharge +',"INT_newspaperSPCCount":'+ newspaperSPCCount+','
		    +'"STR_newspaperCycle":"'+ newspaperCycle +'","STR_newspaperNote":"'+ newspaperNote +'","BOOL_newspaperGive":'+ newspaperGive +',';

    // 洗衣费
	var clothLECharge = $(".tab-content-service .col-cloth input").eq(0).val();
	var clothLECount = $(".tab-content-service .col-cloth input").eq(1).val();
	var clothSPCCharge = $(".tab-content-service .col-cloth input").eq(2).val();
	var clothSPCCount = $(".tab-content-service .col-cloth input").eq(3).val();
	var clothCycle = $(".tab-content-service .col-cloth input").eq(4).val();
	var clothNote = $(".tab-content-service .col-cloth input").eq(5).val();
	var clothGive = Number($(".tab-content-service .col-cloth input[type='checkbox']").is(":checked"));

	let clothData = '"DOU_clothLECharge":'+ clothLECharge +',"cloth_clothLECount":'+ clothLECount +','
		    +'"DOU_clothSPCCharge":'+ clothSPCCharge +',"cloth_clothSPCCount":'+ clothSPCCount+','
		    +'"STR_clothCycle":"'+ clothCycle +'","STR_clothNote":"'+ clothNote +'","BOOL_clothGive":'+ clothGive +',';

	// 餐券
	var lunchData = "";
	for (var i = 1; i <= $(".tab-content-service .col-lunch").length; i++) {
		var R = $(".tab-content-service .col-lunch").eq(i-1).children("td").children("input");

		var perRestaurant = '"restaurantMap'+ i +'":'
		    +'{"STR_RName":"'+  $(".tab-content-service .col-lunch").eq(i-1).children("td").eq(0).text() +'",'
		    +'"DOU_LECharge":'+ R.eq(0).val() +',"INT_LECount":'+ R.eq(1).val() +','
		    +'"DOU_SPCCharge":' + R.eq(2).val() +',"INT_SPCCount":'+ R.eq(3).val() +','
		    +'"STR_Cycle":"'+ R.eq(4).val() +'","STR_Note":"'+ R.eq(5).val() +'",'
		    +'"BOOL_Give":'+ Number($(".tab-content-service .col-lunch:nth-child("+ i +") td input[type='checkbox']").is("checked")) +'},';
		lunchData += perRestaurant;
	}
	if(lunchData.length!=0) lunchData = lunchData.substring(0,lunchData.length-1);


	// 早餐费
	var breakLECharge = $(".tab-content-service .col-break input").eq(0).val();
	var breakLECount = $(".tab-content-service .col-break input").eq(1).val();
	var breakSPCCharge = $(".tab-content-service .col-break input").eq(2).val();
	var breakSPCCount = $(".tab-content-service .col-break input").eq(3).val();
	var breakCycle = $(".tab-content-service .col-break input").eq(4).val();
	var breakNote = $(".tab-content-service .col-break input").eq(5).val();
	var breakGive = Number($(".tab-content-service .col-break input[type='checkbox']").is(":checked"));
	// 购物卡
	var shoppingLECharge = $(".tab-content-service .col-shopping input").eq(0).val();
	var shoppingLECount = $(".tab-content-service .col-shopping input").eq(1).val();
	var shoppingSPCCharge = $(".tab-content-service .col-shopping input").eq(2).val();
	var shoppingSPCCount = $(".tab-content-service .col-shopping input").eq(3).val();
	var shoppingCycle = $(".tab-content-service .col-shopping input").eq(4).val();
	var shoppingNote = $(".tab-content-service .col-shopping input").eq(5).val();
	var shoppingGive = Number($(".tab-content-service .col-shopping input[type='checkbox']").is(":checked"));
	// 饮用水
	var waterLECharge = $(".tab-content-service .col-water input").eq(0).val();
	var waterLECount = $(".tab-content-service .col-water input").eq(1).val();
	var waterSPCCharge = $(".tab-content-service .col-water input").eq(2).val();
	var waterSPCCount = $(".tab-content-service .col-water input").eq(3).val();
	var waterCycle = $(".tab-content-service .col-water input").eq(4).val();
	var waterNote = $(".tab-content-service .col-water input").eq(5).val();
	var waterGive = Number($(".tab-content-service .col-water input[type='checkbox']").is(":checked"));
	// 日用品
	var dailyLECharge = $(".tab-content-service .col-daily input").eq(0).val();
	var dailyLECount = $(".tab-content-service .col-daily input").eq(1).val();
	var dailySPCCharge = $(".tab-content-service .col-daily input").eq(2).val();
	var dailySPCCount = $(".tab-content-service .col-daily input").eq(3).val();
	var dailyCycle = $(".tab-content-service .col-daily input").eq(4).val();
	var dailyNote = $(".tab-content-service .col-daily input").eq(5).val();
	var dailyGive = Number($(".tab-content-service .col-daily input[type='checkbox']").is(":checked"));


	// 新增加的项目
	let addData = "";
    if((".col-add").length!=0){
    	for(var i=1; i<=$(".col-add").length; i++){
    		var A = $(".col-add").eq(i-1).children("td").children("input");

    		var perAdd = '"OBJ_PERADD'+ i +'":{"STR_ADD_NAME":"'+ A.eq(0).val() +'",'
    		+'"DOU_LECharge":'+ A.eq(1).val() +',"INT_LECount":'+ A.eq(2).val() +','
		    +'"DOU_SPCCharge":' + A.eq(3).val() +',"INT_SPCCount":'+ A.eq(4).val() +','
		    +'"STR_Cycle":"'+ A.eq(5).val() +'","STR_Note":"'+ A.eq(6).val() +'",'
		    +'"BOOL_Give":'+ Number($(".tab-content-service .col-add:nth-child("+ i +") td input[type='checkbox']").is("checked")) +'},';
    	    
    	    addData += perAdd;
    	}
    }
    if(addData.length!=0) addData = addData.substring(0,addData.length-1);

	$.ajax({
		url:"/",
		type:"post",
		data:'{' + guestData + hostData + internData + rentData

		    +'"service":{' + IntData + resourceData + breakfastData + parkData + tvData + newspaperData + clothData 
		    //午餐
			+'"OBJ_lunchMap":{'+ lunchData +'},'

		    +'"DOU_breakLECharge":'+ breakLECharge +',"INT_breakLECount":'+ breakLECount +','
		    +'"DOU_breakSPCCharge":'+ breakSPCCharge +',"INT_breakSPCCount":'+ breakSPCCount+','
		    +'"STR_breakCycle":"'+ breakCycle +'","STR_breakNote":"'+ breakNote +'","BOOL_breakGive":'+ breakGive +','
		    // 购物卡
		    +'"DOU_shoppingLECharge":'+ shoppingLECharge +',"INT_shoppingLECount":'+ shoppingLECount +','
		    +'"DOU_shoppingSPCCharge":'+ shoppingSPCCharge +',"INT_shoppingSPCCount":'+ shoppingSPCCount+','
		    +'"STR_shoppingCycle":"'+ shoppingCycle +'","STR_shoppingNote":"'+ shoppingNote +'","BOOL_shoppingGive":'+ shoppingGive +','
		    // 饮用水
		    +'"DOU_waterLECharge":'+ waterLECharge +',"INT_waterLECount":'+ waterLECount +','
		    +'"DOU_waterSPCCharge":'+ waterSPCCharge +',"INT_waterSPCCount":'+ waterSPCCount+','
		    +'"STR_waterCycle":"'+ waterCycle +'","STR_waterNote":"'+ waterNote +'","BOOL_waterGive":'+ waterGive +','
		    //日用品
			+'"DOU_dailyLECharge":'+ dailyLECharge +',"INT_dailyLECount":'+ dailyLECount +','
		    +'"DOU_dailySPCCharge":'+ dailySPCCharge +',"INT_dailySPCCount":'+ dailySPCCount+','
		    +'"STR_dailyCycle":"'+ dailyCycle +'","STR_dailyNote":"'+ dailyNote +'","BOOL_dailyGive":'+ dailyGive +','
		    +'"OBJ_ADDLIST":{'+ addData +'}'
		    +'}'
		    
		    +'}',
        success:function(data){
        	console.log(data);
        }
	});
}
