var lastScrollTop = $(document).scrollTop();
var firstTabContent = $(".tab-content").eq(0).outerHeight() + 90 -32,
    secondTabContent = firstTabContent + $(".tab-content").eq(1).outerHeight() -32,
	thirdTabContent = secondTabContent + $(".tab-content").eq(2).outerHeight() -32,
	fourthTabContent = thirdTabContent + $(".tab-content").eq(3).outerHeight() -32,
	fifthTabContent = fourthTabContent + $(".tab-content").eq(4).outerHeight() -32;
	sixthTabContent = fifthTabContent + $(".tab-content").eq(5).outerHeight() -32;
var arrayTabContent = [90,firstTabContent+32,secondTabContent+32,thirdTabContent+32,fourthTabContent+32,sixthTabContent+32];


//存储当前赠送复选框Input DOM元素
var giveInput;

//存储当前生日复选框Input DOM元素
var birthdayReminderInput;

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
            else if(nowScrollTop>fifthTabContent&&nowScrollTop<sixthTabContent){changeTabContent(5);}
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
    // 点击回到顶部底部事件
    $(".bar-top").click(function(){
    	$(window).scrollTop(0);
    })
    $(".bar-bottom").click(function(){
    	$(window).scrollTop($(document).height()-$(window).height());
    });

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
		if($(this).hasClass("col-add-add")||$(this).hasClass("col-lunch-choose")) return;
		$(this).children("td").toggleClass("td-hover");
		$(this).children(".rowOne").toggleClass("td-hover");
	},function(){
		if($(this).hasClass("col-add-add")||$(this).hasClass("col-lunch-choose"))	return;
		$(this).children("td").toggleClass("td-hover");
		$(this).children(".rowOne").toggleClass("td-hover");
	});

	// 关闭选择饭店弹出框
	$(".thick-title span").click(function(){
		$(".thick-div").css("display","none");
		$(".thick-box").removeClass('showMenuModal');
		setTimeout(function(){$(".thick-box").css("display","none");},200);
	});

	// 点击具体饭店
	$(".restaurant a").click(function(){

		if($(this).hasClass("a-active")){
			$(this).toggleClass("a-active");
		}
		else{
			if($(".restaurant .a-active").length >= 3){
				$(".warning").addClass("warning-animation");
				setTimeout(function(){$(".warning").removeClass("warning-animation");},1000);
				return;
			}
			$(this).toggleClass("a-active");
		}		
	});


	// 判断为空
    $("#guest_name,#guest_roomNumber,#guest_contractID,#guest_tel").focus(function(){
    	$(this).removeClass("border-red");
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


    // 选择上传文件 绑定事件
    $("#uploadLE").change(function(){
        var files = document.getElementById('uploadLE').files;
		$("#uploadLE").parent().children(".fileName").text(files[0].name);
    });

    $("#uploadSPC").change(function(){
        var files = document.getElementById('uploadSPC').files;
        $("#uploadSPC").parent().children(".fileName").text(files[0].name);
    });

    $("#uploadGuestID").change(function(){
        var files = document.getElementById('uploadGuestID').files;
        $("#uploadGuestID").parent().children(".fileName").text(files[0].name);

    });
});

// 显示选择饭店窗口
var showChooseRestaurant = function(){
	$(".thick-div").css("display","block");
	$(".thick-box").css("display","block");

 	setTimeout(function(){$('.thick-box').addClass('showMenuModal');},50);
	$(".thick-box").addClass("effect-fade");

};

// 确定选择饭店
var chooseRestaurant = function(){
	var restaurantCount = Number($(".restaurant .a-active").length);
	$(".thick-div").css("display","none");
	$(".thick-box").removeClass('showMenuModal');
	setTimeout(function(){$(".thick-box").css("display","none");},200);

	if(restaurantCount == 0) return;

	// 清空餐券
	$(".col-lunch-choose").remove();
	$(".col-lunch").remove();

	$(".col-break").before("<tr class='col-lunch-choose'><td class='title' rowspan='"+ (restaurantCount + 1) +"'>餐券</td>"+
        "<td onclick='showChooseRestaurant();'>重新选择饭店</td><td colspan='8'></td></tr>");
	// 逐条添加饭店
	$(".restaurant .a-active").each(function(){
		$(".col-break").before("<tr class='col-lunch'><td>"+ $(this).text() +"</td>"+
				"<td><input type='text' value='1000'/></td>"+
	            "<td><input type='text' value='1'/></td><td><input type='text' value='1000'/></td>"+
	            "<td><input type='text' value='1'/></td><td><input type='text' value='1'/></td>"+
	            "<td><input type='text' value='无'/></td><td><input type='checkbox' giveMoney='0' giveComment='' onclick='clickGive(this);'></td><td></td></tr>");
	});

    // 其他费用列数增加
    var nowRowSpan = Number($(".col-park td:nth-child(1)").attr("rowspan"));
	$(".col-park td:nth-child(1)").attr("rowspan",nowRowSpan + restaurantCount);
}

// 增加其他费用项目
var addServiceTr = function(){
	var nowRow = Number($(".col-park td:nth-child(1)").attr("rowspan"));
	$(".col-park td:nth-child(1)").attr("rowspan", nowRow + 1);
	if($(".col-add").length==0){
		$(".col-daily").after("<tr class='col-add'><td colspan='2'><input type='text' value='费用项目'/></td>"+
				"<td><input type='text' value='1000'/></td>"+
	            "<td><input type='text' value='1'/></td><td><input type='text' value='1000'/></td>"+
	            "<td><input type='text' value='1'/></td><td><input type='text' value='1'/></td>"+
	            "<td><input type='text' value='无'/></td><td><input type='checkbox' giveMoney='0' giveComment='' onclick='clickGive(this);'></td>"+
	            "<td class='operation' onclick='deleteServiceAdd(this)'>删除</td></tr>");
	}
	else{
		$(".col-add:last").after("<tr class='col-add'><td colspan='2'><input type='text' value='费用项目'/></td>"+
				"<td><input type='text' value='1000'/></td>"+
	            "<td><input type='text' value='1'/></td><td><input type='text' value='1000'/></td>"+
	            "<td><input type='text' value='1'/></td><td><input type='text' value='1'/></td>"+
	            "<td><input type='text' value='无'/></td><td><input type='checkbox' giveMoney='0' giveComment='' onclick='clickGive(this);'></td>"+
	            "<td class='operation' onclick='deleteServiceAdd(this)'>删除</td></tr>");
	}
}

// 删除添加的项目
var deleteServiceAdd = function(element){
	$(element).parent().remove();
}

// 改变珠串样式
var changeTabContent = function(index){
	$(".tab-content").eq(index).children(".tab-content-title").children("span").css("visibility","hidden");
    $(".tab-content").eq(index).prevAll(".tab-content").children(".tab-content-title").children("span").css("visibility","hidden");
    $(".tab-content").eq(index).nextAll(".tab-content").children(".tab-content-title").children("span").css("visibility","visible");

	$(".icon-group .list-icon-link").eq(index).css("display","block").css("display","block").css("background","#2277da");
	$(".icon-group .list-icon-link").eq(index).prevAll("a").css("display","block").css("background","#ccc");
	$(".icon-group .list-icon-link").eq(index).nextAll("a").css("display","none");
}

// 添加租客
var addGuest = function(){

	// 获取租客信息
	var name = $(".tab-content-guest .item-name input").eq(0).val(),
        guestType = $(".tab-content-guest .item-name input[type='radio']:checked").val(),
        guestOthers = $(".tab-content-guest .item-guestothers input").eq(0).val(),
	    checkin = Number($(".tab-content-guest .item-guestothers input[type='checkbox']").is(":checked")),
	    roomID = $(".tab-content-guest .item-room input").eq(0).val(),
	    type = $(".tab-content-guest .item-room input").eq(1).val(),
	    contractID = $(".tab-content-guest .item-tel input").eq(0).val(),
	    tel = $(".tab-content-guest .item-tel input").eq(1).val();


	// 判断必填项不能为空
	if(name == "" || roomID == "" || contractID == "" || tel == ""){
		if(name == ""){
			//console.log("租客姓名为空！");
			$("#guest_name").addClass("border-red");
		}
		if(roomID == ""){
			//console.log("房间号为空！");
			$("#guest_roomNumber").addClass("border-red");
		}
		if(contractID == ""){
			//console.log("合同编号为空！");
			$("#guest_contractID").addClass("border-red");
		}
		if(tel == ""){
			//console.log("联系电话为空！");
			$("#guest_tel").addClass("border-red");
		}
		$(window).scrollTop(0);
		return;
	}

	var company = $(".tab-content-guest .item-company input").eq(0).val(),
		position = $(".tab-content-guest .item-company input").eq(1).val(),
	    guestNumber = $(".tab-content-guest .item-guestnumber input").eq(0).val(),
		timeIn = formatDateForm(new Date($(".tab-content-guest .item-time input").eq(0).val())),
		timeOut = formatDateForm(new Date($(".tab-content-guest .item-time input").eq(1).val())),
		rent = Number($(".tab-content-guest .item-car input").eq(0).val()),
		carport = $(".tab-content-guest .item-car input").eq(1).val(),
		remark = $(".tab-content-guest .item-remark input").eq(0).val(),


        birthday = formatDateForm(new Date($(".tab-content-guest .item-birthday input").eq(0).val())),
		isRemind = Number($("#birthday-reminder").is(":checked")),
        uid = Number($("#birthday-reminder").attr("uid")),
        remindTitle = $("#birthday-reminder").attr("title"),
        remindContent = $("#birthday-reminder").attr("content"),

        email = $(".tab-content-guest .item-birthday input").eq(1).val(),
		companyContactor = $(".tab-content-guest .item-companytel input").eq(0).val(),
        companyTel = $(".tab-content-guest .item-companytel input").eq(1).val(),
        companyAccount = $(".tab-content-guest .item-companyaccount input").eq(0).val(),
        companyInvoice = $(".tab-content-guest .item-companyaccount input").eq(1).val(),
        companyPayMode = $(".tab-content-guest .item-companypay input[type='radio']:checked").val();

	let guestData = '"guest":{"STR_Name":"'+ name +'","BOOL_Checkin":'+ checkin +',"STR_RommID":"'+ roomID +'","STR_Type":"'+ type +'",'
		    +'"STR_ContractID":"'+ contractID +'","STR_Tel":"'+ tel +'","STR_Company":"'+ company +'",'
		    +'"STR_Position":"'+ position +'","INT_GuestNumber":'+ guestNumber +','
		    +'"STR_TimeIn":"'+ timeIn +'","STR_TimeOut":"'+ timeOut +'","DOU_Rent":'+ rent +',"STR_Carport":"'+ carport +'",'
        	+'"STR_GuestType":"'+ guestType +'","STR_GuestOthers":"'+ guestOthers +'","STR_CompanyContactor":"'+ companyContactor +'",'
        	+'"STR_CompanyTel":"'+ companyTel +'","STR_CompanyAccount":"'+ companyAccount +'","STR_CompanyInvoice":"'+ companyInvoice +'",'
        	+'"STR_CompanyPayMode":"'+ companyPayMode +'",'
        	+'"BOOL_IsRemind":'+ isRemind +','
			+'"INT_Uid":'+ uid +','
        	+'"STR_RemindTitle":"'+ remindTitle +'",'
        	+'"STR_RemindContent":"'+ remindContent +'",'
       	 	+'"STR_Birthday":"'+ birthday +'",'
        	+'"STR_Email":"'+ email +'",'
			+'"STR_Remark":"'+ remark +'"},';


	// 获取业主信息
	var Name = $(".tab-content-owner .item-name input").eq(0).val(),
        Type = $(".tab-content-owner .item-type input[type='radio']:checked").val(),
        IDNumber = $(".tab-content-owner .item-type input").eq(2).val(),
		Rent = Number($(".tab-content-owner .item-rent input").eq(0).val()),
		Service = Number($(".tab-content-owner .item-rent input").eq(1).val()),
		signReturn = $(".tab-content-owner .item-signreturn input").eq(0).val(),
		taxes = $(".tab-content-owner .item-signreturn input").eq(1).val(),
		spc = $(".tab-content-owner .item-spc input").eq(0).val(),
		heating = $(".tab-content-owner .item-spc input").eq(1).val(),
		otherMoney = $(".tab-content-owner .item-othermoney input").eq(0).val(),
		actualReturn = $(".tab-content-owner .item-othermoney input").eq(1).val(),
        account = $(".tab-content-owner .item-account input").eq(0).val();

	let hostData = '"host":{"STR_Name":"'+ Name +'","DOU_Rent":'+ Rent +',"DOU_Service":'+ Service +','
        	+'"DOU_SignReturn":'+ signReturn +',"DOU_Taxes":'+ taxes +','
        	+'"DOU_SPC":'+ spc +',"DOU_Heating":'+ heating +','
        	+'"STR_Account":"'+ account +'","STR_IDNumber":"'+ IDNumber +'",'
        	+'"STR_Type":"'+ Type +'",'
		    +'"DOU_ActualReturn":'+ actualReturn +',"DOU_OtherMoney":'+ otherMoney +'},';
    console.log(hostData);

	// 获取中介信息
	var agentCompany = $(".tab-content-agency .item-company input").eq(0).val(),
		agentFirst = Number($(".tab-content-agency .item-first input").eq(0).val()),
		agentSecond = Number($(".tab-content-agency .item-second input").eq(0).val()),
		agentThird = Number($(".tab-content-agency .item-third input").eq(0).val()),
		agentFourth = Number($(".tab-content-agency .item-fourth input").eq(0).val()),
		LEFirst = Number($(".tab-content-agency .item-first input").eq(1).val()),
		LESecond = Number($(".tab-content-agency .item-second input").eq(1).val()),
		LEThird = Number($(".tab-content-agency .item-third input").eq(1).val()),
		LEFourth = Number($(".tab-content-agency .item-fourth input").eq(1).val());

	let internData = '"intern":{"STR_Company":"'+ agentCompany +'","DOU_AgentFirst":'+ agentFirst +',"DOU_AgentSecond":'+ agentSecond +','
		    +'"DOU_AgentThird":'+ agentThird +',"DOU_AgentFourth":'+ agentFourth +',"DOU_LEFirst":'+ LEFirst +','
		    +'"DOU_LESecond":'+ LESecond +',"DOU_LEThird":'+ LEThird +',"DOU_LEFourth":'+ LEFourth +'},';


	// 获取房款收付信息
	var RentNumber = formatDateForm(new Date($(".tab-content-housepay .item-rent .item-date input").eq(0).val())),
		RentCycle = Number($(".tab-content-housepay .item-rent .item-cycle input").eq(0).val()),
		RentWay = $(".tab-content-housepay .item-rent .item-cycle input").eq(1).val(),
		ReturnNumber = formatDateForm(new Date($(".tab-content-housepay .item-return .item-date input").eq(0).val())),
		ReturnCycle = Number($(".tab-content-housepay .item-return .item-cycle input").eq(0).val()),
		BillNumber = formatDateForm(new Date($(".tab-content-housepay .item-bill .item-date input").eq(0).val())),
		BillCycle = Number($(".tab-content-housepay .item-bill .item-cycle input").eq(0).val()),
		BillTime = Number($(".tab-content-housepay .item-bill .item-cycle input").eq(1).val()),
		BeginDate = formatDateForm(new Date($(".tab-content-housepay .item-beginenddate .item-begindate input").val())),
		EndDate = formatDateForm(new Date($(".tab-content-housepay .item-beginenddate .item-enddate input").val()));



	let rentData = '"balance":{"STR_RentNumber":"'+ RentNumber +'","INT_RentCycle":'+ RentCycle +',"STR_RentWay":"'+ RentWay +'",'
            +'"STR_ReturnNumber":"'+ ReturnNumber +'","INT_ReturnCycle":'+ ReturnCycle +','
        	+'"STR_BeginDate":"'+ BeginDate +'","STR_EndDate":"'+ EndDate +'",'
		    +'"STR_BillNumber":"'+ BillNumber +'","INT_BillCycle":'+ BillCycle +',"INT_BillTime":'+ BillTime +'},';

		console.log(rentData);

	// 获取服务信息
	// 网费
	var serviceIntInput = $(".tab-content-service .col-Int input"),
		IntLECharge = serviceIntInput.eq(0).val(),
		IntLECount = serviceIntInput.eq(1).val(),
		IntSPCCharge = serviceIntInput.eq(2).val(),
		IntSPCCount = serviceIntInput.eq(3).val(),
		IntCycle = Number(serviceIntInput.eq(4).val()),
		IntNote = serviceIntInput.eq(5).val(),
		IntGive = Number($(".tab-content-service .col-Int input[type='checkbox']").is(":checked")),
		IntGiveMoney = Number($(".tab-content-service .col-Int input[type='checkbox']").attr('giveMoney')),
		IntGiveComment = $(".tab-content-service .col-Int input[type='checkbox']").attr('giveComment');

	let IntData = '"DOU_LECharge":'+ IntLECharge +',"INT_LECount":'+ IntLECount +','
		    +'"DOU_SPCCharge":'+ IntSPCCharge +',"INT_SPCCount":'+ IntSPCCount+','
		    +'"INT_Cycle":'+ IntCycle +',"STR_Note":"'+ IntNote +'","BOOL_Give":'+ IntGive + ',"DOU_GiveMoney":'+ IntGiveMoney+ ',"STR_GiveComment":"'+ IntGiveComment +'"';


    // 能源费
    var serviceResourceInput = $(".tab-content-service .col-resource input"),
	    resourceSelfpay = Number(serviceResourceInput.eq(0).is(":checked")),
		resourceLECharge = serviceResourceInput.eq(1).val(),
		resourceLECount = serviceResourceInput.eq(2).val(),
		resourceSPCCharge = serviceResourceInput.eq(3).val(),
		resourceSPCCount = serviceResourceInput.eq(4).val(),
		resourceCycle = serviceResourceInput.eq(5).val(),
		resourceNote = serviceResourceInput.eq(6).val(),
		resourceGive = Number(serviceResourceInput.eq(7).is(":checked")),
        resourceGiveMoney = Number(serviceResourceInput.eq(7).attr('giveMoney')),
        resourceGiveComment = serviceResourceInput.eq(7).attr('giveComment');


	let resourceData = '"BOOL_Selfpay":'+ resourceSelfpay+','
			+'"DOU_LECharge":'+ resourceLECharge +',"INT_LECount":'+ resourceLECount +','
		    +'"DOU_SPCCharge":'+ resourceSPCCharge +',"INT_SPCCount":'+ resourceSPCCount+','
		    +'"INT_Cycle":'+ resourceCycle +',"STR_Note":"'+ resourceNote +'","BOOL_Give":'+ resourceGive + ',"DOU_GiveMoney":'+ resourceGiveMoney+ ',"STR_GiveComment":"'+ resourceGiveComment +'"';

	// 早餐人数
	var serviceBFInput = $(".tab-content-service .col-breakfast input"),
		breakfastLECharge = serviceBFInput.eq(0).val(),
		breakfastLECount = serviceBFInput.eq(1).val(),
		breakfastSPCCharge = serviceBFInput.eq(2).val(),
		breakfastSPCCount = serviceBFInput.eq(3).val(),
		breakfastCycle = serviceBFInput.eq(4).val(),
		breakfastNote = serviceBFInput.eq(5).val(),
		breakfastGive = Number($(".tab-content-service .col-breakfast input[type='checkbox']").is(":checked")),
		breakfastGiveMoney = Number($(".tab-content-service .col-breakfast input[type='checkbox']").attr('giveMoney')),
		breakfastGiveComment = $(".tab-content-service .col-breakfast input[type='checkbox']").attr('giveComment');

	let breakfastData = '"DOU_LECharge":'+ breakfastLECharge +',"INT_LECount":'+ breakfastLECount +','
		    +'"DOU_SPCCharge":'+ breakfastSPCCharge +',"INT_SPCCount":'+ breakfastSPCCount+','
		    +'"INT_Cycle":'+ breakfastCycle +',"STR_Note":"'+ breakfastNote +'","BOOL_Give":'+ breakfastGive + ',"DOU_GiveMoney":'+ breakfastGiveMoney+ ',"STR_GiveComment":"'+ breakfastGiveComment +'"';

	// 停车费
	var serviceParkInput = $(".tab-content-service .col-park input"),
		parkLECharge = serviceParkInput.eq(0).val(),
		parkLECount = serviceParkInput.eq(1).val(),
		parkSPCCharge = serviceParkInput.eq(2).val(),
		parkSPCCount = serviceParkInput.eq(3).val(),
		parkCycle = serviceParkInput.eq(4).val(),
		parkNote = serviceParkInput.eq(5).val(),
		parkGive = Number($(".tab-content-service .col-park input[type='checkbox']").is(":checked")),
		parkGiveMoney = Number($(".tab-content-service .col-park input[type='checkbox']").attr('giveMoney')),
		parkGiveComment = $(".tab-content-service .col-park input[type='checkbox']").attr('giveComment');

	let parkData = '"DOU_LECharge":'+ parkLECharge +',"INT_LECount":'+ parkLECount +','
		    +'"DOU_SPCCharge":'+ parkSPCCharge +',"INT_SPCCount":'+ parkSPCCount+','
		    +'"INT_Cycle":'+ parkCycle +',"STR_Note":"'+ parkNote +'","BOOL_Give":'+ parkGive + ',"DOU_GiveMoney":'+ parkGiveMoney+ ',"STR_GiveComment":"'+ parkGiveComment +'"';

	// 电视费
	var serviceTVInput = $(".tab-content-service .col-tv input"),
		tvLECharge = serviceTVInput.eq(0).val(),
		tvLECount = serviceTVInput.eq(1).val(),
		tvSPCCharge = serviceTVInput.eq(2).val(),
		tvSPCCount = serviceTVInput.eq(3).val(),
		tvCycle = serviceTVInput.eq(4).val(),
		tvNote = serviceTVInput.eq(5).val(),
		tvGive = Number($(".tab-content-service .col-tv input[type='checkbox']").is(":checked")),
		tvGiveMoney = Number($(".tab-content-service .col-tv input[type='checkbox']").attr('giveMoney')),
		tvGiveComment = $(".tab-content-service .col-tv input[type='checkbox']").attr('giveComment');

	let tvData = '"DOU_LECharge":'+ tvLECharge +',"INT_LECount":'+ tvLECount +','
		    +'"DOU_SPCCharge":'+ tvSPCCharge +',"INT_SPCCount":'+ tvSPCCount+','
		    +'"INT_Cycle":'+ tvCycle +',"STR_Note":"'+ tvNote +'","BOOL_Give":'+ tvGive + ',"DOU_GiveMoney":'+ tvGiveMoney+ ',"STR_GiveComment":"'+ tvGiveComment +'"';

	// 报刊杂志费
	var serviceNPInput = $(".tab-content-service .col-newspaper input"),
		newspaperLECharge = serviceNPInput.eq(0).val(),
		newspaperLECount = serviceNPInput.eq(1).val(),
		newspaperSPCCharge = serviceNPInput.eq(2).val(),
		newspaperSPCCount = serviceNPInput.eq(3).val(),
		newspaperCycle = serviceNPInput.eq(4).val(),
		newspaperNote = serviceNPInput.eq(5).val(),
		newspaperGive = Number($(".tab-content-service .col-newspaper input[type='checkbox']").is(":checked")),
		newspaperGiveMoney = Number($(".tab-content-service .col-newspaper input[type='checkbox']").attr('giveMoney')),
        newspaperGiveComment = $(".tab-content-service .col-newspaper input[type='checkbox']").attr('giveComment');



	let newspaperData = '"DOU_LECharge":'+ newspaperLECharge +',"INT_LECount":'+ newspaperLECount +','
		    +'"DOU_SPCCharge":'+ newspaperSPCCharge +',"INT_SPCCount":'+ newspaperSPCCount+','
		    +'"INT_Cycle":'+ newspaperCycle +',"STR_Note":"'+ newspaperNote +'","BOOL_Give":'+ newspaperGive + ',"DOU_GiveMoney":'+ newspaperGiveMoney+ ',"STR_GiveComment":"'+ newspaperGiveComment +'"';

    // 洗衣费
	var clothLECharge = $(".tab-content-service .col-cloth input").eq(0).val(),
		clothLECount = $(".tab-content-service .col-cloth input").eq(1).val(),
		clothSPCCharge = $(".tab-content-service .col-cloth input").eq(2).val(),
		clothSPCCount = $(".tab-content-service .col-cloth input").eq(3).val(),
		clothCycle = $(".tab-content-service .col-cloth input").eq(4).val(),
		clothNote = $(".tab-content-service .col-cloth input").eq(5).val(),
		clothGive = Number($(".tab-content-service .col-cloth input[type='checkbox']").is(":checked")),
        clothGiveMoney = Number($(".tab-content-service .col-cloth input[type='checkbox']").attr('giveMoney')),
        clothGiveComment = $(".tab-content-service .col-cloth input[type='checkbox']").attr('giveComment');

	let clothData = '"DOU_LECharge":'+ clothLECharge +',"INT_LECount":'+ clothLECount +','
		    +'"DOU_SPCCharge":'+ clothSPCCharge +',"INT_SPCCount":'+ clothSPCCount+','
		    +'"INT_Cycle":'+ clothCycle +',"STR_Note":"'+ clothNote +'","BOOL_Give":'+ clothGive + ',"DOU_GiveMoney":'+ clothGiveMoney+ ',"STR_GiveComment":"'+ clothGiveComment +'"';

	// 餐券
	var lunchData = "";
	for (var i = 1; i <= $(".tab-content-service .col-lunch").length; i++) {
		var R = $(".tab-content-service .col-lunch").eq(i-1).children("td").children("input");

		var perRestaurant = '"restaurantMap'+ i +'":'
		    +'{"STR_RName":"'+  $(".tab-content-service .col-lunch").eq(i-1).children("td").eq(0).text() +'",'
		    +'"DOU_LECharge":'+ R.eq(0).val() +',"INT_LECount":'+ R.eq(1).val() +','
		    +'"DOU_SPCCharge":' + R.eq(2).val() +',"INT_SPCCount":'+ R.eq(3).val() +','
		    +'"INT_Cycle":'+ R.eq(4).val() +',"STR_Note":"'+ R.eq(5).val() +'",'
		    +'"BOOL_Give":'+ Number(R.eq(6).is(":checked")) + ',"DOU_GiveMoney":'+ Number(R.eq(6).attr('giveMoney'))+ ',"STR_GiveComment":"'+ R.eq(6).attr('giveComment') +'"},';
		lunchData += perRestaurant;
	}
	if(lunchData.length!=0) lunchData = lunchData.substring(0,lunchData.length-1);


	// 早餐费
	var breakLECharge = $(".tab-content-service .col-break input").eq(0).val(),
		breakLECount = $(".tab-content-service .col-break input").eq(1).val(),
		breakSPCCharge = $(".tab-content-service .col-break input").eq(2).val(),
		breakSPCCount = $(".tab-content-service .col-break input").eq(3).val(),
		breakCycle = $(".tab-content-service .col-break input").eq(4).val(),
		breakNote = $(".tab-content-service .col-break input").eq(5).val(),
		breakGive = Number($(".tab-content-service .col-break input[type='checkbox']").is(":checked")),
        breakGiveMoney = Number($(".tab-content-service .col-break input[type='checkbox']").attr('giveMoney')),
        breakGiveComment = $(".tab-content-service .col-break input[type='checkbox']").attr('giveComment');

	// 购物卡
	var shoppingLECharge = $(".tab-content-service .col-shopping input").eq(0).val(),
		shoppingLECount = $(".tab-content-service .col-shopping input").eq(1).val(),
		shoppingSPCCharge = $(".tab-content-service .col-shopping input").eq(2).val(),
		shoppingSPCCount = $(".tab-content-service .col-shopping input").eq(3).val(),
		shoppingCycle = $(".tab-content-service .col-shopping input").eq(4).val(),
		shoppingNote = $(".tab-content-service .col-shopping input").eq(5).val(),
		shoppingGive = Number($(".tab-content-service .col-shopping input[type='checkbox']").is(":checked")),
        shoppingGiveMoney = Number($(".tab-content-service .col-shopping input[type='checkbox']").attr('giveMoney')),
        shoppingGiveComment = $(".tab-content-service .col-shopping input[type='checkbox']").attr('giveComment');

	// 饮用水
	var barrelwaterLECharge = $(".tab-content-service .col-barrelwater input").eq(0).val(),
		barrelwaterLECount = $(".tab-content-service .col-barrelwater input").eq(1).val(),
		barrelwaterSPCCharge = $(".tab-content-service .col-barrelwater input").eq(2).val(),
		barrelwaterSPCCount = $(".tab-content-service .col-barrelwater input").eq(3).val(),
		barrelwaterCycle = $(".tab-content-service .col-barrelwater input").eq(4).val(),
		barrelwaterNote = $(".tab-content-service .col-barrelwater input").eq(5).val(),
		barrelwaterGive = Number($(".tab-content-service .col-barrelwater input[type='checkbox']").is(":checked")),
        barrelwaterGiveMoney = Number($(".tab-content-service .col-barrelwater input[type='checkbox']").attr('giveMoney')),
        barrelwaterGiveComment = $(".tab-content-service .col-barrelwater input[type='checkbox']").attr('giveComment');

	// 饮用水
	var bottlewaterLECharge = $(".tab-content-service .col-bottlewater input").eq(0).val(),
		bottlewaterLECount = $(".tab-content-service .col-bottlewater input").eq(1).val(),
		bottlewaterSPCCharge = $(".tab-content-service .col-bottlewater input").eq(2).val(),
		bottlewaterSPCCount = $(".tab-content-service .col-bottlewater input").eq(3).val(),
		bottlewaterCycle = $(".tab-content-service .col-bottlewater input").eq(4).val(),
		bottlewaterNote = $(".tab-content-service .col-bottlewater input").eq(5).val(),
		bottlewaterGive = Number($(".tab-content-service .col-bottlewater input[type='checkbox']").is(":checked")),
        bottlewaterGiveMoney = Number($(".tab-content-service .col-bottlewater input[type='checkbox']").attr('giveMoney')),
        bottlewaterGiveComment = $(".tab-content-service .col-bottlewater input[type='checkbox']").attr('giveComment');

	// 日用品
	var dailyLECharge = $(".tab-content-service .col-daily input").eq(0).val(),
		dailyLECount = $(".tab-content-service .col-daily input").eq(1).val(),
		dailySPCCharge = $(".tab-content-service .col-daily input").eq(2).val(),
		dailySPCCount = $(".tab-content-service .col-daily input").eq(3).val(),
		dailyCycle = $(".tab-content-service .col-daily input").eq(4).val(),
		dailyNote = $(".tab-content-service .col-daily input").eq(5).val(),
		dailyGive = Number($(".tab-content-service .col-daily input[type='checkbox']").is(":checked")),
        dailyGiveMoney = Number($(".tab-content-service .col-daily input[type='checkbox']").attr('giveMoney')),
        dailyGiveComment = $(".tab-content-service .col-daily input[type='checkbox']").attr('giveComment');


	// 新增加的项目
	let addData = "";
    if((".col-add").length!=0){
    	for(var i=1; i<=$(".col-add").length; i++){
    		var A = $(".col-add").eq(i-1).children("td").children("input");

    		var perAdd = '"OBJ_PERADD'+ i +'":{"STR_ADD_NAME":"'+ A.eq(0).val() +'",'
    		+'"DOU_LECharge":'+ A.eq(1).val() +',"INT_LECount":'+ A.eq(2).val() +','
		    +'"DOU_SPCCharge":' + A.eq(3).val() +',"INT_SPCCount":'+ A.eq(4).val() +','
		    +'"INT_Cycle":'+ A.eq(5).val() +',"STR_Note":"'+ A.eq(6).val() +'",'
		    +'"BOOL_Give":'+ Number(A.eq(7).is(":checked")) + ',"DOU_GiveMoney":'+ Number(A.eq(7).attr("giveMoney")) + ',"STR_GiveComment":"'+ A.eq(7).attr("giveComment") +'"},';
    	    
    	    addData += perAdd;
    	}
    }
    if(addData.length!=0) addData = addData.substring(0,addData.length-1);

	$.ajax({
		url:"/LD/guest/addGuest.action",
		type:"post",
		dataType:'json',
		contentType:'application/json',
		data:'{' + guestData + hostData + internData + rentData

		    +'"service":{' 
            +'"Int":{'+ IntData +'},' + '"resource":{'+ resourceData +'},' + '"breakfast":{'+ breakfastData +'},' 
            +'"park":{'+ parkData +'},' + '"tv":{'+ tvData +'},' + '"newspaper":{'+ newspaperData +'},' 
            +'"cloth":{'+ clothData +'},'  
		    //午餐
			+'"OBJ_lunchMap":{'+ lunchData +'},'

		    +'"break":{"DOU_LECharge":'+ breakLECharge +',"INT_LECount":'+ breakLECount +','
		    +'"DOU_SPCCharge":'+ breakSPCCharge +',"INT_SPCCount":'+ breakSPCCount+','
		    +'"INT_Cycle":'+ breakCycle +',"STR_Note":"'+ breakNote +'","BOOL_Give":'+ breakGive + ',"DOU_GiveMoney":'+ breakGiveMoney+ ',"STR_GiveComment":"'+ breakGiveComment +'"},'
		    // 购物卡
		    +'"shopping":{"DOU_LECharge":'+ shoppingLECharge +',"INT_LECount":'+ shoppingLECount +','
		    +'"DOU_SPCCharge":'+ shoppingSPCCharge +',"INT_SPCCount":'+ shoppingSPCCount+','
		    +'"INT_Cycle":'+ shoppingCycle +',"STR_Note":"'+ shoppingNote +'","BOOL_Give":'+ shoppingGive + ',"DOU_GiveMoney":'+ shoppingGiveMoney+ ',"STR_GiveComment":"'+ shoppingGiveComment +'"},'
		    // 桶装水
		    +'"barrelwater":{"DOU_LECharge":'+ barrelwaterLECharge +',"INT_LECount":'+ barrelwaterLECount +','
		    +'"DOU_SPCCharge":'+ barrelwaterSPCCharge +',"INT_rSPCCount":'+ barrelwaterSPCCount+','
		    +'"INT_Cycle":'+ barrelwaterCycle +',"STR_Note":"'+ barrelwaterNote +'","BOOL_Give":'+ barrelwaterGive + ',"DOU_GiveMoney":'+ barrelwaterGiveMoney+ ',"STR_GiveComment":"'+ barrelwaterGiveComment +'"},'
		    // 矿泉水
		    +'"bottlewater":{"DOU_LECharge":'+ bottlewaterLECharge +',"INT_LECount":'+ bottlewaterLECount +','
		    +'"DOU_SPCCharge":'+ bottlewaterSPCCharge +',"INT_rSPCCount":'+ bottlewaterSPCCount+','
		    +'"INT_Cycle":'+ bottlewaterCycle +',"STR_Note":"'+ bottlewaterNote +'","BOOL_Give":'+ bottlewaterGive + ',"DOU_GiveMoney":'+ bottlewaterGiveMoney+ ',"STR_GiveComment":"'+ bottlewaterGiveComment +'"},'
		    //日用品
			+'"daily":{"DOU_LECharge":'+ dailyLECharge +',"INT_LECount":'+ dailyLECount +','
		    +'"DOU_SPCCharge":'+ dailySPCCharge +',"INT_SPCCount":'+ dailySPCCount+','
		    +'"INT_Cycle":'+ dailyCycle +',"STR_Note":"'+ dailyNote +'","BOOL_Give":'+ dailyGive + ',"DOU_GiveMoney":'+ dailyGiveMoney+ ',"STR_GiveComment":"'+ dailyGiveComment +'"},'
		    +'"OBJ_ADDLIST":{'+ addData +'}'
		    +'}'
		    
		    +'}',
        success:function(data){
        	console.log(data);
        	if(data.State == "Valid"){
        		showModalBox("success","添加成功！");
        	} else{
        		showModalBox("error","添加失败！");
        	}
        }
	});
}


//计算实际返还
var calActualReturn = function() {

	//获取签约返还、税金、物业费、采暖费、其它费用
	var signReturn = $(".tab-content-owner .item-signreturn input").eq(0).val();
    var taxes = $(".tab-content-owner .item-signreturn input").eq(1).val();
    var spc = $(".tab-content-owner .item-spc input").eq(0).val();
    var heating = $(".tab-content-owner .item-spc input").eq(1).val();
    var otherMoney = $(".tab-content-owner .item-othermoney input").eq(0).val();


	//计算实际返还
	var actualReturn = signReturn - taxes - spc - heating - otherMoney;

	//更新实际返还输入框内容
	$(".tab-content-owner .item-othermoney input").eq(1).val(actualReturn.toFixed(2));

}


var clickXiaoYeZhu = function() {
	$("#xiaoyezhuName").show();
}

var clickSPC = function() {
    $("#xiaoyezhuName").hide();
}


//勾选/去掉 赠送复选框
var clickGive = function(element) {

	//根据当前复选框状态
	if($(element).is(":checked")) {

		//打开对话框
        $(".shadow").css("display","block");
        $('#newGiveMenu').css("display","block");

        setTimeout(function(){$('#newGiveMenu').addClass('showMenuModal');},50);
        $("#newGiveMenu").addClass("effect-fade");


        //获取原有的赠送金额、赠送原因，显示到对话框中
		var giveMoney = $(element).attr("giveMoney");
        var giveComment = $(element).attr("giveComment");

		$("#give-money input").val(giveMoney);
        $("#give-comment input").val(giveComment);


        //把当前这个复选框元素存进全局变量中
        giveInput = element;

	} else {

		if(window.confirm("您确定要取消赠送?这将清空赠送金额与备注!")) {
            $(element).attr("giveMoney", "0");
            $(element).attr("giveComment", "");
        } else {
			//置为选中
            $(element).attr("checked","checked");
		}
	}
}


// 关闭赠送详情弹出框
var closeGiveDiv = function(){
    $(".shadow").css("display","none");
    $("#newGiveMenu").removeClass('showMenuModal');
    setTimeout(function(){$("#newGiveMenu").css("display","none");},200);
};


//确定添加赠送信息
var addGive = function() {


	//获取用户填写的赠送信息
	var giveMoney = $("#give-money input").val();
	var giveComment = $("#give-comment input").val();


	//将这两个值存于giveInput的两个属性中去
    $(giveInput).attr("giveMoney", giveMoney);
	$(giveInput).attr("giveComment", giveComment);

    closeGiveDiv();
}


//生日提醒


var clickBirthdayReminder = function(element) {

    //根据当前复选框状态
    if($(element).is(":checked")) {

        //打开对话框
        $(".shadow").css("display","block");
        $('#newBirthdayReminderMenu').css("display","block");

        setTimeout(function(){$('#newBirthdayReminderMenu').addClass('showMenuModal');},50);
        $("#newBirthdayReminderMenu").addClass("effect-fade");


        //获取原有的赠送金额、赠送原因，显示到对话框中
		var uid = $(element).attr("uid");
        var username = $(element).attr("username");
        var title = $(element).attr("title");
        var content = $(element).attr("content");

        $("#dropDownInput").attr("uid", uid);
        $("#dropDownInput").val(username);
        $("#reminder-title input").val(title);
        $("#reminderContent").val(content);


        //把当前这个复选框元素存进全局变量中
        birthdayReminderInput = element;

    } else {

        if(window.confirm("您确定要取消生日提醒?这将清空之前的信息!")) {
            $(element).attr("uid", "-1");
            $(element).attr("username", "");
            $(element).attr("title", "");
            $(element).attr("content", "");
        } else {
            //置为选中
            $(element).attr("checked","checked");
        }
    }

}

var addBirthdayReminder = function() {

    //获取用户填写的赠送信息
    var uid = $("#dropDownInput").attr("uid");
    var username = $("#dropDownInput").val();
    var title = $("#reminder-title input").val();
    var content = $("#reminderContent").val();

    //将这两个值存于giveInput的两个属性中去
    $(birthdayReminderInput).attr("uid", uid);
    $(birthdayReminderInput).attr("username", username);
    $(birthdayReminderInput).attr("title", title);
    $(birthdayReminderInput).attr("content", content);

    closeBirthdayReminderMenu();

}

// 关闭生日提醒弹出框
var closeBirthdayReminderMenu = function(){
    $(".shadow").css("display","none");
    $("#newBirthdayReminderMenu").removeClass('showMenuModal');
    setTimeout(function(){$("#newBirthdayReminderMenu").css("display","none");},200);
};

//拉取所有用户存入下拉菜单
var searchAllUsers = function() {

    $.ajax({
        url:'/LD/HomeUser/searchAllUsers.action',
        type:'get',
        dataType:'json',
        success:function(data){

            console.log(data);
            if(data.record != null) {

                //放入下拉列表
                for(var i = 0; i < data.record.length; i++)
                    $(".dropDownMenu ul").append("<li style='height:30px;' rid='"+ data.record[i].id +"'>"+ data.record[i].username +"</li>");

                // 选择问题分类
                $(".dropDownMenu ul li").click(function(){
                    var id = Number($(this).attr('rid'));
                    var username = $(this).text();
                    $("#dropDownInput").val(username);
                    $("#dropDownInput").attr("uid", id);
                });

            }
        }
    });
};
