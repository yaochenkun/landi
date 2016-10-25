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
});

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
	var ownerReturn = $(".tab-content-owner .item-other input").eq(1).val();
	var ownerOther = $(".tab-content-owner .item-other input").eq(0).val();

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

	$.ajax({
		url:"/",
		type:"post",
		data:'{"name":"'+ name +'","rommID":"'+ roomID +'","type":"'+ type +'","contractID":"'+ contractID +'",'
		    +'"tel":"'+ tel +'","company":"'+ company +'","position":"'+ position +'","guestNumber":"'+ guestNumber +'",'
		    +'"timeIn":"'+ timeIn +'","timeOut":"'+ timeOut +'","rent":"'+ rent +'","carport":"'+ carport +'","remark":"'+ remark +'"}'

		    +'"ownerName":"'+ ownerName +'","ownerRent":"'+ ownerRent +'","ownerService":"'+ ownerService +'",'
		    +'"ownerReturn:":"'+ ownerReturn +'","ownerOther":"'+ ownerOther +'"'

		    +'"agentCompany":"'+ agentCompany +'","agentFirst":"'+ agentFirst +'","agentSecond":"'+ agentSecond +'"'
		    +'"agentThird":"'+ agentThird +'","agentFourth":"'+ agentFourth +'","LEFirst":"'+ LEFirst +'"'
		    +'"LESecond":"'+ LESecond +'","LEThird":"'+ LEThird +'","LEFourth":"'+ LEFourth +'"'
            
            +'"houseRentNumber":"'+ houseRentNumber +'","houseRentCycle":"'+ houseRentCycle +'","houseRentWay":"'+ houseRentWay +'"'
            +'"houseReturnNumber":"'+ houseReturnNumber +'","houseReturnCycle":"'+ houseReturnCycle +'"'
		    +'"houseBillNumber":"'+ houseBillNumber +'","houseBillCycle":"'+ houseBillCycle +'","houseBillTime":"'+ houseBillTime +'"',
        success:function(data){
        	console.log(data);
        }
	});
}
