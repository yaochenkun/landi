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
		$(this).toggleClass("a-active");
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
	$(".col-park td:nth-child(1)").attr("rowspan",restaurantCount+9);
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
	var checkin = $(".tab-content-guest .item-name input[type='checkbox']").is(":checked");
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

	// 获取业主信息
	var ownerName = $(".tab-content-owner .item-name input").eq(0).val();
	var ownerRent = $(".tab-content-owner .item-rent input").eq(0).val();
	var ownerService = $(".tab-content-owner .item-rent input").eq(1).val();
	var ownerReturn = $(".tab-content-owner .item-other input").eq(0).val();
	var ownerOther = $(".tab-content-owner .item-other input").eq(1).val();

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

	// 获取房款收付信息
	var houseRentNumber = $(".tab-content-housepay .item-rent .item-date input").eq(0).val();
	var houseRentCycle = $(".tab-content-housepay .item-rent .item-cycle input").eq(0).val();
	var houseRentWay = $(".tab-content-housepay .item-rent .item-cycle input").eq(1).val();
	var houseReturnNumber = $(".tab-content-housepay .item-return .item-date input").eq(0).val();
	var houseReturnCycle = $(".tab-content-housepay .item-return .item-cycle input").eq(0).val();
	var houseBillNumber = $(".tab-content-housepay .item-bill .item-date input").eq(0).val();
	var houseBillCycle = $(".tab-content-housepay .item-bill .item-cycle input").eq(0).val();
	var houseBillTime = $(".tab-content-housepay .item-bill .item-cycle input").eq(1).val();

	// 获取服务信息
	// 网费
	var serviceIntLECharge = $(".tab-content-service .col-Int input").eq(0).val();
	var serviceIntLECount = $(".tab-content-service .col-Int input").eq(1).val();
	var serviceIntSPCCharge = $(".tab-content-service .col-Int input").eq(2).val();
	var serviceIntSPCCount = $(".tab-content-service .col-Int input").eq(3).val();
	var serviceIntCycle = $(".tab-content-service .col-Int input").eq(4).val();
	var serviceIntNote = $(".tab-content-service .col-Int input").eq(5).val();
	var serviceIntGive = $(".tab-content-service .col-Int input[type='checkbox']").is(":checked");
    // 能源费
    var serviceresourceSelfpay = $(".tab-content-service .col-resource input").eq(0).is(":checked");
	var serviceresourceLECharge = $(".tab-content-service .col-resource input").eq(1).val();
	var serviceresourceLECount = $(".tab-content-service .col-resource input").eq(2).val();
	var serviceresourceSPCCharge = $(".tab-content-service .col-resource input").eq(3).val();
	var serviceresourceSPCCount = $(".tab-content-service .col-resource input").eq(4).val();
	var serviceresourceCycle = $(".tab-content-service .col-resource input").eq(5).val();
	var serviceresourceNote = $(".tab-content-service .col-resource input").eq(6).val();
	var serviceresourceGive = $(".tab-content-service .col-resource input").eq(7).is(":checked");
	// 早餐人数
	var servicebreakfastLECharge = $(".tab-content-service .col-breakfast input").eq(0).val();
	var servicebreakfastLECount = $(".tab-content-service .col-breakfast input").eq(1).val();
	var servicebreakfastSPCCharge = $(".tab-content-service .col-breakfast input").eq(2).val();
	var servicebreakfastSPCCount = $(".tab-content-service .col-breakfast input").eq(3).val();
	var servicebreakfastCycle = $(".tab-content-service .col-breakfast input").eq(4).val();
	var servicebreakfastNote = $(".tab-content-service .col-breakfast input").eq(5).val();
	var servicebreakfastGive = $(".tab-content-service .col-breakfast input[type='checkbox']").is(":checked");
	// 停车费
	var serviceparkLECharge = $(".tab-content-service .col-park input").eq(0).val();
	var serviceparkLECount = $(".tab-content-service .col-park input").eq(1).val();
	var serviceparkSPCCharge = $(".tab-content-service .col-park input").eq(2).val();
	var serviceparkSPCCount = $(".tab-content-service .col-park input").eq(3).val();
	var serviceparkCycle = $(".tab-content-service .col-park input").eq(4).val();
	var serviceparkNote = $(".tab-content-service .col-park input").eq(5).val();
	var serviceparkGive = $(".tab-content-service .col-park input[type='checkbox']").is(":checked");
	// 电视费
	var servicetvLECharge = $(".tab-content-service .col-tv input").eq(0).val();
	var servicetvLECount = $(".tab-content-service .col-tv input").eq(1).val();
	var servicetvSPCCharge = $(".tab-content-service .col-tv input").eq(2).val();
	var servicetvSPCCount = $(".tab-content-service .col-tv input").eq(3).val();
	var servicetvCycle = $(".tab-content-service .col-tv input").eq(4).val();
	var servicetvNote = $(".tab-content-service .col-tv input").eq(5).val();
	var servicetvGive = $(".tab-content-service .col-tv input[type='checkbox']").is(":checked");
	// 报刊杂志费
	var servicenewspaperLECharge = $(".tab-content-service .col-newspaper input").eq(0).val();
	var servicenewspaperLECount = $(".tab-content-service .col-newspaper input").eq(1).val();
	var servicenewspaperSPCCharge = $(".tab-content-service .col-newspaper input").eq(2).val();
	var servicenewspaperSPCCount = $(".tab-content-service .col-newspaper input").eq(3).val();
	var servicenewspaperCycle = $(".tab-content-service .col-newspaper input").eq(4).val();
	var servicenewspaperNote = $(".tab-content-service .col-newspaper input").eq(5).val();
	var servicenewspaperGive = $(".tab-content-service .col-newspaper input[type='checkbox']").is(":checked");
    // 洗衣费
	var serviceclothLECharge = $(".tab-content-service .col-cloth input").eq(0).val();
	var serviceclothLECount = $(".tab-content-service .col-cloth input").eq(1).val();
	var serviceclothSPCCharge = $(".tab-content-service .col-cloth input").eq(2).val();
	var serviceclothSPCCount = $(".tab-content-service .col-cloth input").eq(3).val();
	var serviceclothCycle = $(".tab-content-service .col-cloth input").eq(4).val();
	var serviceclothNote = $(".tab-content-service .col-cloth input").eq(5).val();
	var serviceclothGive = $(".tab-content-service .col-cloth input[type='checkbox']").is(":checked");

	// 餐券
	var restaurantMap=[];
	var perRestaurant = {};
	
	// 遍历每家饭店的餐券
	$(".tab-content-service .col-lunch ").each(function(){
		//console.log($(this).children("td").eq(0).text());
		var perRestaurant = {};
		perRestaurant.servicelunchRestaurantName = $(this).children("td").eq(0).text();
		perRestaurant.servicelunchLECharge = $(this).children("td").children("input").eq(0).val();
		perRestaurant.servicelunchLECount = $(this).children("td").children("input").eq(1).val();
		perRestaurant.servicelunchSPCCharge = $(this).children("td").children("input").eq(2).val();
		perRestaurant.servicelunchSPCCount = $(this).children("td").children("input").eq(3).val();
		perRestaurant.servicelunchCycle = $(this).children("td").children("input").eq(4).val();
		perRestaurant.servicelunchNote = $(".tab-content-service .col-lunch input").eq(5).val();
		perRestaurant.servicelunchGive = $(".tab-content-service .col-lunch input[type='checkbox']").is(":checked");

		restaurantMap.push(perRestaurant);
	})

	console.log(restaurantMap);
	
	// 早餐费
	var servicebreakLECharge = $(".tab-content-service .col-break input").eq(0).val();
	var servicebreakLECount = $(".tab-content-service .col-break input").eq(1).val();
	var servicebreakSPCCharge = $(".tab-content-service .col-break input").eq(2).val();
	var servicebreakSPCCount = $(".tab-content-service .col-break input").eq(3).val();
	var servicebreakCycle = $(".tab-content-service .col-break input").eq(4).val();
	var servicebreakNote = $(".tab-content-service .col-break input").eq(5).val();
	var servicebreakGive = $(".tab-content-service .col-break input[type='checkbox']").is(":checked");
	// 购物卡
	var serviceshoppingLECharge = $(".tab-content-service .col-shopping input").eq(0).val();
	var serviceshoppingLECount = $(".tab-content-service .col-shopping input").eq(1).val();
	var serviceshoppingSPCCharge = $(".tab-content-service .col-shopping input").eq(2).val();
	var serviceshoppingSPCCount = $(".tab-content-service .col-shopping input").eq(3).val();
	var serviceshoppingCycle = $(".tab-content-service .col-shopping input").eq(4).val();
	var serviceshoppingNote = $(".tab-content-service .col-shopping input").eq(5).val();
	var serviceshoppingGive = $(".tab-content-service .col-shopping input[type='checkbox']").is(":checked");
	// 饮用水
	var servicewaterLECharge = $(".tab-content-service .col-water input").eq(0).val();
	var servicewaterLECount = $(".tab-content-service .col-water input").eq(1).val();
	var servicewaterSPCCharge = $(".tab-content-service .col-water input").eq(2).val();
	var servicewaterSPCCount = $(".tab-content-service .col-water input").eq(3).val();
	var servicewaterCycle = $(".tab-content-service .col-water input").eq(4).val();
	var servicewaterNote = $(".tab-content-service .col-water input").eq(5).val();
	var servicewaterGive = $(".tab-content-service .col-water input[type='checkbox']").is(":checked");
	// 日用品
	var servicedailyLECharge = $(".tab-content-service .col-daily input").eq(0).val();
	var servicedailyLECount = $(".tab-content-service .col-daily input").eq(1).val();
	var servicedailySPCCharge = $(".tab-content-service .col-daily input").eq(2).val();
	var servicedailySPCCount = $(".tab-content-service .col-daily input").eq(3).val();
	var servicedailyCycle = $(".tab-content-service .col-daily input").eq(4).val();
	var servicedailyNote = $(".tab-content-service .col-daily input").eq(5).val();
	var servicedailyGive = $(".tab-content-service .col-daily input[type='checkbox']").is(":checked");
	$.ajax({
		url:"/",
		type:"post",
		data:'{"name":"'+ name +'","checkin":"'+ checkin +'","rommID":"'+ roomID +'","type":"'+ type +'","contractID":"'+ contractID +'",'
		    +'"tel":"'+ tel +'","company":"'+ company +'","position":"'+ position +'","guestNumber":'+ guestNumber +','
		    +'"timeIn":"'+ timeIn +'","timeOut":"'+ timeOut +'","rent":'+ rent +',"carport":"'+ carport +'","remark":"'+ remark +'",'

		    +'"ownerName":"'+ ownerName +'","ownerRent":'+ ownerRent +',"ownerService":"'+ ownerService +'",'
		    +'"ownerReturn:":'+ ownerReturn +',"ownerOther":"'+ ownerOther +'",'

		    +'"agentCompany":"'+ agentCompany +'","agentFirst":'+ agentFirst +',"agentSecond":'+ agentSecond +','
		    +'"agentThird":'+ agentThird +',"agentFourth":'+ agentFourth +',"LEFirst":'+ LEFirst +','
		    +'"LESecond":'+ LESecond +',"LEThird":'+ LEThird +',"LEFourth":'+ LEFourth +','
            
            +'"houseRentNumber":"'+ houseRentNumber +'","houseRentCycle":"'+ houseRentCycle +'","houseRentWay":"'+ houseRentWay +'",'
            +'"houseReturnNumber":"'+ houseReturnNumber +'","houseReturnCycle":"'+ houseReturnCycle +'",'
		    +'"houseBillNumber":"'+ houseBillNumber +'","houseBillCycle":"'+ houseBillCycle +'","houseBillTime":"'+ houseBillTime +'",'
		    
		    // 服务信息
		    // 网费
		    +'"serviceIntLECharge":'+ serviceIntLECharge +',"serviceIntLECount":'+ serviceIntLECount +','
		    +'"serviceIntSPCCharge":'+ serviceIntSPCCharge +',"serviceIntSPCCount":'+ serviceIntSPCCount+','
		    +'"serviceIntCycle":'+ serviceIntCycle +',"serviceIntNote":"'+ serviceIntNote +'","serviceIntGive":"'+ serviceIntGive +'",'
		    // 能源费
		    +'"serviceresourceSelfpay":"'+ serviceresourceSelfpay+'",'
			+'"serviceresourceLECharge":'+ serviceresourceLECharge +',"serviceresourceLECount":'+ serviceresourceLECount +','
		    +'"serviceresourceSPCCharge":'+ serviceresourceSPCCharge +',"serviceresourceSPCCount":'+ serviceresourceSPCCount+','
		    +'"serviceresourceCycle":'+ serviceresourceCycle +',"serviceresourceNote":"'+ serviceresourceNote +'","serviceresourceGive":"'+ serviceresourceGive +'",'
		    // 早餐人数
		    +'"servicebreakfastLECharge":'+ servicebreakfastLECharge +',"servicebreakfastLECount":'+ servicebreakfastLECount +','
		    +'"servicebreakfastSPCCharge":'+ servicebreakfastSPCCharge +',"servicebreakfastSPCCount":'+ servicebreakfastSPCCount+','
		    +'"servicebreakfastCycle":"'+ servicebreakfastCycle +'","servicebreakfastNote":"'+ servicebreakfastNote +'","servicebreakfastGive":"'+ servicebreakfastGive +'",'
		    // 停车费
			+'"serviceparkLECharge":'+ serviceparkLECharge +',"serviceparkLECount":'+ serviceparkLECount +','
		    +'"serviceparkSPCCharge":'+ serviceparkSPCCharge +',"serviceparkSPCCount":'+ serviceparkSPCCount+','
		    +'"serviceparkCycle":'+ serviceparkCycle +',"serviceparkNote":"'+ serviceparkNote +'","serviceparkGive":"'+ serviceparkGive +'",'
		    // 电视费
		    +'"servicetvLECharge":'+ servicetvLECharge +',"servicetvLECount":'+ servicetvLECount +','
		    +'"servicetvSPCCharge":'+ servicetvSPCCharge +',"servicetvSPCCount":'+ servicetvSPCCount+','
		    +'"servicetvCycle":'+ servicetvCycle +',"servicetvNote":"'+ servicetvNote +'","servicetvGive":"'+ servicetvGive +'",'
		    // 报刊杂志费
			+'"servicenewspaperLECharge":'+ servicenewspaperLECharge +',"servicenewspaperLECount":'+ servicenewspaperLECount +','
		    +'"servicenewspaperSPCCharge":'+ servicenewspaperSPCCharge +',"servicenewspaperSPCCount":'+ servicenewspaperSPCCount+','
		    +'"servicenewspaperCycle":'+ servicenewspaperCycle +',"servicenewspaperNote":"'+ servicenewspaperNote +'","servicenewspaperGive":"'+ servicenewspaperGive +'",'
		    // 洗衣费
		    +'"serviceclothLECharge":'+ serviceclothLECharge +',"serviceclothLECount":'+ serviceclothLECount +','
		    +'"serviceclothSPCCharge":'+ serviceclothSPCCharge +',"serviceclothSPCCount":'+ serviceclothSPCCount+','
		    +'"serviceclothCycle":'+ serviceclothCycle +',"serviceclothNote":"'+ serviceclothNote +'","serviceclothGive":"'+ serviceclothGive +'",'
		    // 餐券
		    +'"servicelunchMap":"'+ restaurantMap +'",'
		    // 早餐费
		    +'"servicebreakLECharge":'+ servicebreakLECharge +',"servicebreakLECount":'+ servicebreakLECount +','
		    +'"servicebreakSPCCharge":'+ servicebreakSPCCharge +',"servicebreakSPCCount":'+ servicebreakSPCCount+','
		    +'"servicebreakCycle":'+ servicebreakCycle +',"servicebreakNote":"'+ servicebreakNote +'","servicebreakGive":"'+ servicebreakGive +'",'
		    // 购物卡
		    +'"serviceshoppingLECharge":'+ serviceshoppingLECharge +',"serviceshoppingLECount":'+ serviceshoppingLECount +','
		    +'"serviceshoppingSPCCharge":'+ serviceshoppingSPCCharge +',"serviceshoppingSPCCount":'+ serviceshoppingSPCCount+','
		    +'"serviceshoppingCycle":'+ serviceshoppingCycle +',"serviceshoppingNote":"'+ serviceshoppingNote +'","serviceshoppingGive":"'+ serviceshoppingGive +'",'
		    // 饮用水
		    +'"servicewaterLECharge":'+ servicewaterLECharge +',"servicewaterLECount":'+ servicewaterLECount +','
		    +'"servicewaterSPCCharge":'+ servicewaterSPCCharge +',"servicewaterSPCCount":'+ servicewaterSPCCount+','
		    +'"servicewaterCycle":'+ servicewaterCycle +',"servicewaterNote":"'+ servicewaterNote +'","servicewaterGive":"'+ servicewaterGive +'",'
		    // 日用品
			+'"servicedailyLECharge":'+ servicedailyLECharge +',"servicedailyLECount":'+ servicedailyLECount +','
		    +'"servicedailySPCCharge":'+ servicedailySPCCharge +',"servicedailySPCCount":'+ servicedailySPCCount+','
		    +'"servicedailyCycle":'+ servicedailyCycle +',"servicedailyNote":"'+ servicedailyNote +'","servicedailyGive":"'+ servicedailyGive +'"'
		    
		    +'}',
        success:function(data){
        	console.log(data);
        }
	});
}
