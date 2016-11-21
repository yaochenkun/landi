// 获取水、电、煤气费价格信息
var requestAjaxRate = function(){
	console.log("request ajax rate");
	$.ajax({
		type:"post",
		url:"/LD/HomeAdmin/getRate.action",
		success:function(data){
			console.log(data);
			// 显示水费标准
			$(".water .body dl:nth-child(1)").children("dd").eq(0).text(data["wp1"]);
			$(".water .body dl:nth-child(1)").children("dd").eq(1).text(data["wc1"]);
			$(".water .body dl:nth-child(2)").children("dd").eq(0).text(data["wp2"]);
			$(".water .body dl:nth-child(2)").children("dd").eq(1).text(data["wc2"]);
			$(".water .body dl:nth-child(3)").children("dd").eq(0).text(data["wp3"]);
			$(".water .body dl:nth-child(3)").children("dd").eq(1).text(data["wc3"]);
			$(".water .body dl:nth-child(4)").children("dd").eq(0).text(data["wp4"]);
			$(".water .body dl:nth-child(4)").children("dd").eq(1).text(data["wc4"]);
			
			//显示电费标准
			$(".power .body dl:nth-child(1)").children("dd").eq(0).text(data["pp1"]);
			$(".power .body dl:nth-child(1)").children("dd").eq(1).text(data["pc1"]);
			$(".power .body dl:nth-child(2)").children("dd").eq(0).text(data["pp2"]);
			$(".power .body dl:nth-child(2)").children("dd").eq(1).text(data["pc2"]);
			$(".power .body dl:nth-child(3)").children("dd").eq(0).text(data["pp3"]);
			$(".power .body dl:nth-child(3)").children("dd").eq(1).text(data["pc3"]);
			$(".power .body dl:nth-child(4)").children("dd").eq(0).text(data["pp4"]);
			$(".power .body dl:nth-child(4)").children("dd").eq(1).text(data["pc4"]);
			
			//显示燃气费标准
			$(".gas .body dl:nth-child(1)").children("dd").eq(0).text(data["gp1"]);
			$(".gas .body dl:nth-child(1)").children("dd").eq(1).text(data["gc1"]);
			$(".gas .body dl:nth-child(2)").children("dd").eq(0).text(data["gp2"]);
			$(".gas .body dl:nth-child(2)").children("dd").eq(1).text(data["gc2"]);
			$(".gas .body dl:nth-child(3)").children("dd").eq(0).text(data["gp3"]);
			$(".gas .body dl:nth-child(3)").children("dd").eq(1).text(data["gc3"]);
			$(".gas .body dl:nth-child(4)").children("dd").eq(0).text(data["gp4"]);
			$(".gas .body dl:nth-child(4)").children("dd").eq(1).text(data["gc4"]);
		}
	});
}

// 切换为编辑收费标准界面
var EditRatePage = function(){
	console.log("切换为编辑收费界面");
	$.ajax({
		type:"post",
		url:"/LD/HomeAdmin/getRate.action",
		success:function(data){
			// 将水费变为可编辑状态
			$(".water .body dl:nth-child(1)").children("dd").eq(0).text("").append("<input type='text' value='"+ data["wp1"] +"'/>");
			$(".water .body dl:nth-child(1)").children("dd").eq(1).text("").append("<input type='text' value='"+ data["wc1"] +"'/>");
			$(".water .body dl:nth-child(2)").children("dd").eq(0).text("").append("<input type='text' value='"+ data["wp2"] +"'/>");
			$(".water .body dl:nth-child(2)").children("dd").eq(1).text("").append("<input type='text' value='"+ data["wc2"] +"'/>");
			$(".water .body dl:nth-child(3)").children("dd").eq(0).text("").append("<input type='text' value='"+ data["wp3"] +"'/>");
			$(".water .body dl:nth-child(3)").children("dd").eq(1).text("").append("<input type='text' value='"+ data["wc3"] +"'/>");
			$(".water .body dl:nth-child(4)").children("dd").eq(0).text("").append("<input type='text' value='"+ data["wp4"] +"'/>");
			$(".water .body dl:nth-child(4)").children("dd").eq(1).text("").append("<input type='text' value='"+ data["wc4"] +"'/>");
			
			// 将电费变为可编辑状态
			$(".power .body dl:nth-child(1)").children("dd").eq(0).text("").append("<input type='text' value='"+ data["pp1"] +"'/>");
			$(".power .body dl:nth-child(1)").children("dd").eq(1).text("").append("<input type='text' value='"+ data["pc1"] +"'/>");
			$(".power .body dl:nth-child(2)").children("dd").eq(0).text("").append("<input type='text' value='"+ data["pp2"] +"'/>");
			$(".power .body dl:nth-child(2)").children("dd").eq(1).text("").append("<input type='text' value='"+ data["pc2"] +"'/>");
			$(".power .body dl:nth-child(3)").children("dd").eq(0).text("").append("<input type='text' value='"+ data["pp3"] +"'/>");
			$(".power .body dl:nth-child(3)").children("dd").eq(1).text("").append("<input type='text' value='"+ data["pc3"] +"'/>");
			$(".power .body dl:nth-child(4)").children("dd").eq(0).text("").append("<input type='text' value='"+ data["pp4"] +"'/>");
			$(".power .body dl:nth-child(4)").children("dd").eq(1).text("").append("<input type='text' value='"+ data["pc4"] +"'/>");
			
			// 将燃气费变为可编辑状态
			$(".gas .body dl:nth-child(1)").children("dd").eq(0).text("").append("<input type='text' value='"+ data["gp1"] +"'/>");
			$(".gas .body dl:nth-child(1)").children("dd").eq(1).text("").append("<input type='text' value='"+ data["gc1"] +"'/>");
			$(".gas .body dl:nth-child(2)").children("dd").eq(0).text("").append("<input type='text' value='"+ data["gp2"] +"'/>");
			$(".gas .body dl:nth-child(2)").children("dd").eq(1).text("").append("<input type='text' value='"+ data["gc2"] +"'/>");
			$(".gas .body dl:nth-child(3)").children("dd").eq(0).text("").append("<input type='text' value='"+ data["gp3"] +"'/>");
			$(".gas .body dl:nth-child(3)").children("dd").eq(1).text("").append("<input type='text' value='"+ data["gc3"] +"'/>");
			$(".gas .body dl:nth-child(4)").children("dd").eq(0).text("").append("<input type='text' value='"+ data["gp4"] +"'/>");
			$(".gas .body dl:nth-child(4)").children("dd").eq(1).text("").append("<input type='text' value='"+ data["gc4"] +"'/>");
			
			// 编辑变为确认编辑
			//$(".btnchange").text("").append("<a onclick='setRate();'>确认变更</a>");
            $("#editButton").html("<a class='btn btn-change btnchange' onclick='setRate();'>确认变更</a>");
			$("body").append("<a class='btn btn-goback btngoback' href='/LD/views/admin/rateList.jsp'>返&nbsp;&nbsp;回</a>");
		}
	});
}

// 变更收费标准
var setRate = function(){
	console.log("set Rate!");
	
	// 获取修改后水费的值
	var wp1 = parseFloat($(".water .body dl:nth-child(1)").children("dd").eq(0).children("input").val()),
		wc1 = parseFloat($(".water .body dl:nth-child(1)").children("dd").eq(1).children("input").val()),
		wp2 = parseFloat($(".water .body dl:nth-child(2)").children("dd").eq(0).children("input").val()),
		wc2 = parseFloat($(".water .body dl:nth-child(2)").children("dd").eq(1).children("input").val()),
		wp3 = parseFloat($(".water .body dl:nth-child(3)").children("dd").eq(0).children("input").val()),
		wc3 = parseFloat($(".water .body dl:nth-child(3)").children("dd").eq(1).children("input").val()),
		wp4 = parseFloat($(".water .body dl:nth-child(4)").children("dd").eq(0).children("input").val()),
		wc4 = parseFloat($(".water .body dl:nth-child(4)").children("dd").eq(1).children("input").val());
	
	// 获取修改后电费的值
	var pp1 = parseFloat($(".power .body dl:nth-child(1)").children("dd").eq(0).children("input").val()),
		pc1 = parseFloat($(".power .body dl:nth-child(1)").children("dd").eq(1).children("input").val()),
		pp2 = parseFloat($(".power .body dl:nth-child(2)").children("dd").eq(0).children("input").val()),
		pc2 = parseFloat($(".power .body dl:nth-child(2)").children("dd").eq(1).children("input").val()),
		pp3 = parseFloat($(".power .body dl:nth-child(3)").children("dd").eq(0).children("input").val()),
		pc3 = parseFloat($(".power .body dl:nth-child(3)").children("dd").eq(1).children("input").val()),
		pp4 = parseFloat($(".power .body dl:nth-child(4)").children("dd").eq(0).children("input").val()),
		pc4 = parseFloat($(".power .body dl:nth-child(4)").children("dd").eq(1).children("input").val());
	
	// 获取修改后燃气费的值
	var gp1 = parseFloat($(".gas .body dl:nth-child(1)").children("dd").eq(0).children("input").val()),
		gc1 = parseFloat($(".gas .body dl:nth-child(1)").children("dd").eq(1).children("input").val()),
		gp2 = parseFloat($(".gas .body dl:nth-child(2)").children("dd").eq(0).children("input").val()),
		gc2 = parseFloat($(".gas .body dl:nth-child(2)").children("dd").eq(1).children("input").val()),
		gp3 = parseFloat($(".gas .body dl:nth-child(3)").children("dd").eq(0).children("input").val()),
		gc3 = parseFloat($(".gas .body dl:nth-child(3)").children("dd").eq(1).children("input").val()),
		gp4 = parseFloat($(".gas .body dl:nth-child(4)").children("dd").eq(0).children("input").val()),
		gc4 = parseFloat($(".gas .body dl:nth-child(4)").children("dd").eq(1).children("input").val());
	
	
	$.ajax({
		url:'/LD/HomeAdmin/setRate.action',
		type:'post',
	    contentType:'application/json',
		data:'{"wp1":'+wp1+',"wc1":'+wc1+',"wp2":'+wp2+',"wc2":'+wc2+',"wp3":'+wp3+',"wc3":'+wc3+',"wp4":'+wp4+',"wc4":'+wc4+','
		+'"pp1":'+pp1+',"pc1":'+pc1+',"pp2":'+pp2+',"pc2":'+pc2+',"pp3":'+pp3+',"pc3":'+pc3+',"pp4":'+pp4+',"pc4":'+pc4+',' 
		+'"gp1":'+gp1+',"gc1":'+gc1+',"gp2":'+gp2+',"gc2":'+gc2+',"gp3":'+gp3+',"gc3":'+gc3+',"gp4":'+gp4+',"gc4":'+gc4+'}',
		dataType:'json',
	    success:function(data){
	    	//console.log(data);
	    	if(data == 1) {
				alert("收费标准变更成功！");
	    		window.location.href = "/LD/views/admin/rateList.jsp";
	    	} else if (data == 0){
	    		alert("收费标准变更失败！");
	    	}
	    }
	});
}

// 获取其他费用管理信息
var requestAjaxCharge = function(){
	$.ajax({
		type:'post',
		url:'/LD/HomeAdmin/getCharge.action',
	    success:function(data){
	    	console.log(data);
	    	////////////////////////////////////////////////////////////////  W
	    	// LE管理费
	    	$(".LE-W td").eq(1).children("input").val(data["LE管理费_W-1"]);
	    	$(".LE-W td").eq(2).children("input").val(data["LE管理费_W-2"]);
	    	$(".LE-W td").eq(3).children("input").val(data["LE管理费_W-3"]);
	    	$(".LE-W td").eq(4).children("input").val(data["LE管理费_W-4"]);
	    	$(".LE-W td").eq(5).children("input").val(data["LE管理费_W-5"]);
	    	$(".LE-W td").eq(6).children("input").val(data["LE管理费_W-6"]);
	    	$(".LE-W td").eq(7).children("input").val(data["LE管理费_W-7"]);
	    	$(".LE-W td").eq(8).children("input").val(data["LE管理费_W-8"]);
	    	$(".LE-W td").eq(9).children("input").val(data["LE管理费_W-9"]);
	    	$(".LE-W td").eq(10).children("input").val(data["LE管理费_W-10"]);
	    	$(".LE-W td").eq(11).children("input").val(data["LE管理费_W-11"]);

	    	// 布草洗涤费
	    	$(".wash-W td").eq(1).children("input").val(data["布草洗涤费_W-1"]);
	    	$(".wash-W td").eq(2).children("input").val(data["布草洗涤费_W-2"]);
	    	$(".wash-W td").eq(3).children("input").val(data["布草洗涤费_W-3"]);
	    	$(".wash-W td").eq(4).children("input").val(data["布草洗涤费_W-4"]);
	    	$(".wash-W td").eq(5).children("input").val(data["布草洗涤费_W-5"]);
	    	$(".wash-W td").eq(6).children("input").val(data["布草洗涤费_W-6"]);
	    	$(".wash-W td").eq(7).children("input").val(data["布草洗涤费_W-7"]);
	    	$(".wash-W td").eq(8).children("input").val(data["布草洗涤费_W-8"]);
	    	$(".wash-W td").eq(9).children("input").val(data["布草洗涤费_W-9"]);
	    	$(".wash-W td").eq(10).children("input").val(data["布草洗涤费_W-10"]);
	    	$(".wash-W td").eq(11).children("input").val(data["布草洗涤费_W-11"]);

	    	// 布草消耗费
	    	$(".waste-W td").eq(1).children("input").val(data["布草消耗费_W-1"]);
	    	$(".waste-W td").eq(2).children("input").val(data["布草消耗费_W-2"]);
	    	$(".waste-W td").eq(3).children("input").val(data["布草消耗费_W-3"]);
	    	$(".waste-W td").eq(4).children("input").val(data["布草消耗费_W-4"]);
	    	$(".waste-W td").eq(5).children("input").val(data["布草消耗费_W-5"]);
	    	$(".waste-W td").eq(6).children("input").val(data["布草消耗费_W-6"]);
	    	$(".waste-W td").eq(7).children("input").val(data["布草消耗费_W-7"]);
	    	$(".waste-W td").eq(8).children("input").val(data["布草消耗费_W-8"]);
	    	$(".waste-W td").eq(9).children("input").val(data["布草消耗费_W-9"]);
	    	$(".waste-W td").eq(10).children("input").val(data["布草消耗费_W-10"]);
	    	$(".waste-W td").eq(11).children("input").val(data["布草消耗费_W-11"]);

	    	// 车费
	    	$(".car-W td").eq(1).children("input").val(data["车费_W-1"]);
	    	$(".car-W td").eq(2).children("input").val(data["车费_W-2"]);
	    	$(".car-W td").eq(3).children("input").val(data["车费_W-3"]);
	    	$(".car-W td").eq(4).children("input").val(data["车费_W-4"]);
	    	$(".car-W td").eq(5).children("input").val(data["车费_W-5"]);
	    	$(".car-W td").eq(6).children("input").val(data["车费_W-6"]);
	    	$(".car-W td").eq(7).children("input").val(data["车费_W-7"]);
	    	$(".car-W td").eq(8).children("input").val(data["车费_W-8"]);
	    	$(".car-W td").eq(9).children("input").val(data["车费_W-9"]);
	    	$(".car-W td").eq(10).children("input").val(data["车费_W-10"]);
	    	$(".car-W td").eq(11).children("input").val(data["车费_W-11"]);

	    	// 灯泡费
	    	$(".light-W td").eq(1).children("input").val(data["灯泡费_W-1"]);
	    	$(".light-W td").eq(2).children("input").val(data["灯泡费_W-2"]);
	    	$(".light-W td").eq(3).children("input").val(data["灯泡费_W-3"]);
	    	$(".light-W td").eq(4).children("input").val(data["灯泡费_W-4"]);
	    	$(".light-W td").eq(5).children("input").val(data["灯泡费_W-5"]);
	    	$(".light-W td").eq(6).children("input").val(data["灯泡费_W-6"]);
	    	$(".light-W td").eq(7).children("input").val(data["灯泡费_W-7"]);
	    	$(".light-W td").eq(8).children("input").val(data["灯泡费_W-8"]);
	    	$(".light-W td").eq(9).children("input").val(data["灯泡费_W-9"]);
	    	$(".light-W td").eq(10).children("input").val(data["灯泡费_W-10"]);
	    	$(".light-W td").eq(11).children("input").val(data["灯泡费_W-11"]);

	    	// 税金
	    	$(".tax-W td").eq(1).children("input").val(data["税金_W-1"]);
	    	$(".tax-W td").eq(2).children("input").val(data["税金_W-2"]);
	    	$(".tax-W td").eq(3).children("input").val(data["税金_W-3"]);
	    	$(".tax-W td").eq(4).children("input").val(data["税金_W-4"]);
	    	$(".tax-W td").eq(5).children("input").val(data["税金_W-5"]);
	    	$(".tax-W td").eq(6).children("input").val(data["税金_W-6"]);
	    	$(".tax-W td").eq(7).children("input").val(data["税金_W-7"]);
	    	$(".tax-W td").eq(8).children("input").val(data["税金_W-8"]);
	    	$(".tax-W td").eq(9).children("input").val(data["税金_W-9"]);
	    	$(".tax-W td").eq(10).children("input").val(data["税金_W-10"]);
	    	$(".tax-W td").eq(11).children("input").val(data["税金_W-11"]);

	    	// 网费
	    	$(".int-W td").eq(1).children("input").val(data["网费_W-1"]);
	    	$(".int-W td").eq(2).children("input").val(data["网费_W-2"]);
	    	$(".int-W td").eq(3).children("input").val(data["网费_W-3"]);
	    	$(".int-W td").eq(4).children("input").val(data["网费_W-4"]);
	    	$(".int-W td").eq(5).children("input").val(data["网费_W-5"]);
	    	$(".int-W td").eq(6).children("input").val(data["网费_W-6"]);
	    	$(".int-W td").eq(7).children("input").val(data["网费_W-7"]);
	    	$(".int-W td").eq(8).children("input").val(data["网费_W-8"]);
	    	$(".int-W td").eq(9).children("input").val(data["网费_W-9"]);
	    	$(".int-W td").eq(10).children("input").val(data["网费_W-10"]);
	    	$(".int-W td").eq(11).children("input").val(data["网费_W-11"]);

	    	// 能源费
	    	$(".resource-W td").eq(1).children("input").val(data["能源费_W-1"]);
	    	$(".resource-W td").eq(2).children("input").val(data["能源费_W-2"]);
	    	$(".resource-W td").eq(3).children("input").val(data["能源费_W-3"]);
	    	$(".resource-W td").eq(4).children("input").val(data["能源费_W-4"]);
	    	$(".resource-W td").eq(5).children("input").val(data["能源费_W-5"]);
	    	$(".resource-W td").eq(6).children("input").val(data["能源费_W-6"]);
	    	$(".resource-W td").eq(7).children("input").val(data["能源费_W-7"]);
	    	$(".resource-W td").eq(8).children("input").val(data["能源费_W-8"]);
	    	$(".resource-W td").eq(9).children("input").val(data["能源费_W-9"]);
	    	$(".resource-W td").eq(10).children("input").val(data["能源费_W-10"]);
	    	$(".resource-W td").eq(11).children("input").val(data["能源费_W-11"]);

	    	//////////////////////////////////////////////////////////////////////// E
	    	// LE管理费
	    	$(".LE-E td").eq(1).children("input").val(data["LE管理费_E-1"]);
	    	$(".LE-E td").eq(2).children("input").val(data["LE管理费_E-2"]);
	    	$(".LE-E td").eq(3).children("input").val(data["LE管理费_E-3"]);
	    	$(".LE-E td").eq(4).children("input").val(data["LE管理费_E-4"]);
	    	$(".LE-E td").eq(5).children("input").val(data["LE管理费_E-5"]);
	    	$(".LE-E td").eq(6).children("input").val(data["LE管理费_E-6"]);
	    	$(".LE-E td").eq(7).children("input").val(data["LE管理费_E-7"]);
	    	$(".LE-E td").eq(8).children("input").val(data["LE管理费_E-8"]);
	    	$(".LE-E td").eq(9).children("input").val(data["LE管理费_E-9"]);
	    	$(".LE-E td").eq(10).children("input").val(data["LE管理费_E-10"]);
	    	$(".LE-E td").eq(11).children("input").val(data["LE管理费_E-11"]);
	    	$(".LE-E td").eq(12).children("input").val(data["LE管理费_E-12"]);

	    	// 布草洗涤费
	    	$(".wash-E td").eq(1).children("input").val(data["布草洗涤费_E-1"]);
	    	$(".wash-E td").eq(2).children("input").val(data["布草洗涤费_E-2"]);
	    	$(".wash-E td").eq(3).children("input").val(data["布草洗涤费_E-3"]);
	    	$(".wash-E td").eq(4).children("input").val(data["布草洗涤费_E-4"]);
	    	$(".wash-E td").eq(5).children("input").val(data["布草洗涤费_E-5"]);
	    	$(".wash-E td").eq(6).children("input").val(data["布草洗涤费_E-6"]);
	    	$(".wash-E td").eq(7).children("input").val(data["布草洗涤费_E-7"]);
	    	$(".wash-E td").eq(8).children("input").val(data["布草洗涤费_E-8"]);
	    	$(".wash-E td").eq(9).children("input").val(data["布草洗涤费_E-9"]);
	    	$(".wash-E td").eq(10).children("input").val(data["布草洗涤费_E-10"]);
	    	$(".wash-E td").eq(11).children("input").val(data["布草洗涤费_E-11"]);
	    	$(".wash-E td").eq(12).children("input").val(data["布草洗涤费_E-12"]);

	    	// 布草消耗费
	    	$(".waste-E td").eq(1).children("input").val(data["布草消耗费_E-1"]);
	    	$(".waste-E td").eq(2).children("input").val(data["布草消耗费_E-2"]);
	    	$(".waste-E td").eq(3).children("input").val(data["布草消耗费_E-3"]);
	    	$(".waste-E td").eq(4).children("input").val(data["布草消耗费_E-4"]);
	    	$(".waste-E td").eq(5).children("input").val(data["布草消耗费_E-5"]);
	    	$(".waste-E td").eq(6).children("input").val(data["布草消耗费_E-6"]);
	    	$(".waste-E td").eq(7).children("input").val(data["布草消耗费_E-7"]);
	    	$(".waste-E td").eq(8).children("input").val(data["布草消耗费_E-8"]);
	    	$(".waste-E td").eq(9).children("input").val(data["布草消耗费_E-9"]);
	    	$(".waste-E td").eq(10).children("input").val(data["布草消耗费_E-10"]);
	    	$(".waste-E td").eq(11).children("input").val(data["布草消耗费_E-11"]);
	    	$(".waste-E td").eq(12).children("input").val(data["布草消耗费_E-12"]);

	    	// 车费
	    	$(".car-E td").eq(1).children("input").val(data["车费_E-1"]);
	    	$(".car-E td").eq(2).children("input").val(data["车费_E-2"]);
	    	$(".car-E td").eq(3).children("input").val(data["车费_E-3"]);
	    	$(".car-E td").eq(4).children("input").val(data["车费_E-4"]);
	    	$(".car-E td").eq(5).children("input").val(data["车费_E-5"]);
	    	$(".car-E td").eq(6).children("input").val(data["车费_E-6"]);
	    	$(".car-E td").eq(7).children("input").val(data["车费_E-7"]);
	    	$(".car-E td").eq(8).children("input").val(data["车费_E-8"]);
	    	$(".car-E td").eq(9).children("input").val(data["车费_E-9"]);
	    	$(".car-E td").eq(10).children("input").val(data["车费_E-10"]);
	    	$(".car-E td").eq(11).children("input").val(data["车费_E-11"]);
	    	$(".car-E td").eq(12).children("input").val(data["车费_E-12"]);

	    	// 灯泡费
	    	$(".light-E td").eq(1).children("input").val(data["灯泡费_E-1"]);
	    	$(".light-E td").eq(2).children("input").val(data["灯泡费_E-2"]);
	    	$(".light-E td").eq(3).children("input").val(data["灯泡费_E-3"]);
	    	$(".light-E td").eq(4).children("input").val(data["灯泡费_E-4"]);
	    	$(".light-E td").eq(5).children("input").val(data["灯泡费_E-5"]);
	    	$(".light-E td").eq(6).children("input").val(data["灯泡费_E-6"]);
	    	$(".light-E td").eq(7).children("input").val(data["灯泡费_E-7"]);
	    	$(".light-E td").eq(8).children("input").val(data["灯泡费_E-8"]);
	    	$(".light-E td").eq(9).children("input").val(data["灯泡费_E-9"]);
	    	$(".light-E td").eq(10).children("input").val(data["灯泡费_E-10"]);
	    	$(".light-E td").eq(11).children("input").val(data["灯泡费_E-11"]);
	    	$(".light-E td").eq(12).children("input").val(data["灯泡费_E-12"]);

	    	// 税金
	    	$(".tax-E td").eq(1).children("input").val(data["税金_E-1"]);
	    	$(".tax-E td").eq(2).children("input").val(data["税金_E-2"]);
	    	$(".tax-E td").eq(3).children("input").val(data["税金_E-3"]);
	    	$(".tax-E td").eq(4).children("input").val(data["税金_E-4"]);
	    	$(".tax-E td").eq(5).children("input").val(data["税金_E-5"]);
	    	$(".tax-E td").eq(6).children("input").val(data["税金_E-6"]);
	    	$(".tax-E td").eq(7).children("input").val(data["税金_E-7"]);
	    	$(".tax-E td").eq(8).children("input").val(data["税金_E-8"]);
	    	$(".tax-E td").eq(9).children("input").val(data["税金_E-9"]);
	    	$(".tax-E td").eq(10).children("input").val(data["税金_E-10"]);
	    	$(".tax-E td").eq(11).children("input").val(data["税金_E-11"]);
	    	$(".tax-E td").eq(12).children("input").val(data["税金_E-12"]);

	    	// 网费
	    	$(".int-E td").eq(1).children("input").val(data["网费_E-1"]);
	    	$(".int-E td").eq(2).children("input").val(data["网费_E-2"]);
	    	$(".int-E td").eq(3).children("input").val(data["网费_E-3"]);
	    	$(".int-E td").eq(4).children("input").val(data["网费_E-4"]);
	    	$(".int-E td").eq(5).children("input").val(data["网费_E-5"]);
	    	$(".int-E td").eq(6).children("input").val(data["网费_E-6"]);
	    	$(".int-E td").eq(7).children("input").val(data["网费_E-7"]);
	    	$(".int-E td").eq(8).children("input").val(data["网费_E-8"]);
	    	$(".int-E td").eq(9).children("input").val(data["网费_E-9"]);
	    	$(".int-E td").eq(10).children("input").val(data["网费_E-10"]);
	    	$(".int-E td").eq(11).children("input").val(data["网费_E-11"]);
	    	$(".int-E td").eq(12).children("input").val(data["网费_E-12"]);

	    	// 能源费
	    	$(".resource-E td").eq(1).children("input").val(data["能源费_E-1"]);
	    	$(".resource-E td").eq(2).children("input").val(data["能源费_E-2"]);
	    	$(".resource-E td").eq(3).children("input").val(data["能源费_E-3"]);
	    	$(".resource-E td").eq(4).children("input").val(data["能源费_E-4"]);
	    	$(".resource-E td").eq(5).children("input").val(data["能源费_E-5"]);
	    	$(".resource-E td").eq(6).children("input").val(data["能源费_E-6"]);
	    	$(".resource-E td").eq(7).children("input").val(data["能源费_E-7"]);
	    	$(".resource-E td").eq(8).children("input").val(data["能源费_E-8"]);
	    	$(".resource-E td").eq(9).children("input").val(data["能源费_E-9"]);
	    	$(".resource-E td").eq(10).children("input").val(data["能源费_E-10"]);
	    	$(".resource-E td").eq(11).children("input").val(data["能源费_E-11"]);
	    	$(".resource-E td").eq(12).children("input").val(data["能源费_E-12"]);
	    }
	});
}

// 变更其他收费标准
var setCharge = function(){
	console.log("set Charge!");
	// //////////////////////////////////////////////////////////////////////// E
	// LE管理费
	var LEW1 = $(".LE-W td").eq(1).children("input").val(),
	    LEW2 = $(".LE-W td").eq(2).children("input").val(),
	    LEW3 = $(".LE-W td").eq(3).children("input").val(),
	    LEW4 = $(".LE-W td").eq(4).children("input").val(),
    	LEW5 = $(".LE-W td").eq(5).children("input").val(),
    	LEW6 = $(".LE-W td").eq(6).children("input").val(),
    	LEW7 = $(".LE-W td").eq(7).children("input").val(),
    	LEW8 = $(".LE-W td").eq(8).children("input").val(),
    	LEW9 = $(".LE-W td").eq(9).children("input").val(),
    	LEW10 = $(".LE-W td").eq(10).children("input").val(),
    	LEW11 = $(".LE-W td").eq(11).children("input").val();

    // 布草洗涤费
    var	washW1 = $(".wash-W td").eq(1).children("input").val(),
    	washW2 = $(".wash-W td").eq(2).children("input").val(),
    	washW3 = $(".wash-W td").eq(3).children("input").val(),
    	washW4 = $(".wash-W td").eq(4).children("input").val(),
    	washW5 = $(".wash-W td").eq(5).children("input").val(),
    	washW6 = $(".wash-W td").eq(6).children("input").val(),
    	washW7 = $(".wash-W td").eq(7).children("input").val(),
    	washW8 = $(".wash-W td").eq(8).children("input").val(),
    	washW9 = $(".wash-W td").eq(9).children("input").val(),
    	washW10 = $(".wash-W td").eq(10).children("input").val(),
    	washW11 = $(".wash-W td").eq(11).children("input").val();

    // 布草消耗费
    var	wasteW1 = $(".waste-W td").eq(1).children("input").val(),
    	wasteW2 = $(".waste-W td").eq(2).children("input").val(),
    	wasteW3 = $(".waste-W td").eq(3).children("input").val(),
    	wasteW4 = $(".waste-W td").eq(4).children("input").val(),
    	wasteW5 = $(".waste-W td").eq(5).children("input").val(),
    	wasteW6 = $(".waste-W td").eq(6).children("input").val(),
    	wasteW7 = $(".waste-W td").eq(7).children("input").val(),
    	wasteW8 = $(".waste-W td").eq(8).children("input").val(),
    	wasteW9 = $(".waste-W td").eq(9).children("input").val(),
    	wasteW10 = $(".waste-W td").eq(10).children("input").val(),
    	wasteW11 = $(".waste-W td").eq(11).children("input").val();

    // 车费
    var	carW1 = $(".car-W td").eq(1).children("input").val(),
    	carW2 = $(".car-W td").eq(2).children("input").val(),
    	carW3 = $(".car-W td").eq(3).children("input").val(),
    	carW4 = $(".car-W td").eq(4).children("input").val(),
    	carW5 = $(".car-W td").eq(5).children("input").val(),
    	carW6 = $(".car-W td").eq(6).children("input").val(),
    	carW7 = $(".car-W td").eq(7).children("input").val(),
    	carW8 = $(".car-W td").eq(8).children("input").val(),
    	carW9 = $(".car-W td").eq(9).children("input").val(),
    	carW10 = $(".car-W td").eq(10).children("input").val(),
    	carW11 = $(".car-W td").eq(11).children("input").val();

    // 灯泡费
    var	lightW1 = $(".light-W td").eq(1).children("input").val(),
    	lightW2 = $(".light-W td").eq(2).children("input").val(),
    	lightW3 = $(".light-W td").eq(3).children("input").val(),
    	lightW4 = $(".light-W td").eq(4).children("input").val(),
    	lightW5 = $(".light-W td").eq(5).children("input").val(),
    	lightW6 = $(".light-W td").eq(6).children("input").val(),
    	lightW7 = $(".light-W td").eq(7).children("input").val(),
    	lightW8 = $(".light-W td").eq(8).children("input").val(),
    	lightW9 = $(".light-W td").eq(9).children("input").val(),
    	lightW10 = $(".light-W td").eq(10).children("input").val(),
    	lightW11 = $(".light-W td").eq(11).children("input").val();

    // 税金
    var taxW1 =	$(".tax-W td").eq(1).children("input").val(),
    	taxW2 =	$(".tax-W td").eq(2).children("input").val(),
    	taxW3 =	$(".tax-W td").eq(3).children("input").val(),
    	taxW4 =	$(".tax-W td").eq(4).children("input").val(),
    	taxW5 =	$(".tax-W td").eq(5).children("input").val(),
    	taxW6 =	$(".tax-W td").eq(6).children("input").val(),
    	taxW7 =	$(".tax-W td").eq(7).children("input").val(),
    	taxW8 =	$(".tax-W td").eq(8).children("input").val(),
    	taxW9 =	$(".tax-W td").eq(9).children("input").val(),
    	taxW10 = $(".tax-W td").eq(10).children("input").val(),
    	taxW11 = $(".tax-W td").eq(11).children("input").val();

    // 网费
    var intW1 =	$(".int-W td").eq(1).children("input").val(),
    	intW2 =	$(".int-W td").eq(2).children("input").val(),
    	intW3 =	$(".int-W td").eq(3).children("input").val(),
    	intW4 =	$(".int-W td").eq(4).children("input").val(),
    	intW5 =	$(".int-W td").eq(5).children("input").val(),
    	intW6 =	$(".int-W td").eq(6).children("input").val(),
    	intW7 =	$(".int-W td").eq(7).children("input").val(),
    	intW8 =	$(".int-W td").eq(8).children("input").val(),
    	intW9 =	$(".int-W td").eq(9).children("input").val(),
    	intW10 = $(".int-W td").eq(10).children("input").val(),
    	intW11 = $(".int-W td").eq(11).children("input").val();

    // 能源费
    var resourceW1 = $(".resource-W td").eq(1).children("input").val(),
    	resourceW2 = $(".resource-W td").eq(2).children("input").val(),
    	resourceW3 = $(".resource-W td").eq(3).children("input").val(),
    	resourceW4 = $(".resource-W td").eq(4).children("input").val(),
    	resourceW5 = $(".resource-W td").eq(5).children("input").val(),
    	resourceW6 = $(".resource-W td").eq(6).children("input").val(),
    	resourceW7 = $(".resource-W td").eq(7).children("input").val(),
    	resourceW8 = $(".resource-W td").eq(8).children("input").val(),
    	resourceW9 = $(".resource-W td").eq(9).children("input").val(),
    	resourceW10 = $(".resource-W td").eq(10).children("input").val(),
    	resourceW11 = $(".resource-W td").eq(11).children("input").val();

    // //////////////////////////////////////////////////////////////////////// E
    // LE管理费
	var LEE1 = $(".LE-E td").eq(1).children("input").val(),
	    LEE2 = $(".LE-E td").eq(2).children("input").val(),
	    LEE3 = $(".LE-E td").eq(3).children("input").val(),
	    LEE4 = $(".LE-E td").eq(4).children("input").val(),
    	LEE5 = $(".LE-E td").eq(5).children("input").val(),
    	LEE6 = $(".LE-E td").eq(6).children("input").val(),
    	LEE7 = $(".LE-E td").eq(7).children("input").val(),
    	LEE8 = $(".LE-E td").eq(8).children("input").val(),
    	LEE9 = $(".LE-E td").eq(9).children("input").val(),
    	LEE10 = $(".LE-E td").eq(10).children("input").val(),
    	LEE11 = $(".LE-E td").eq(11).children("input").val(),
    	LEE12 = $(".LE-E td").eq(12).children("input").val();

    // 布草洗涤费
    var	washE1 = $(".wash-E td").eq(1).children("input").val(),
    	washE2 = $(".wash-E td").eq(2).children("input").val(),
    	washE3 = $(".wash-E td").eq(3).children("input").val(),
    	washE4 = $(".wash-E td").eq(4).children("input").val(),
    	washE5 = $(".wash-E td").eq(5).children("input").val(),
    	washE6 = $(".wash-E td").eq(6).children("input").val(),
    	washE7 = $(".wash-E td").eq(7).children("input").val(),
    	washE8 = $(".wash-E td").eq(8).children("input").val(),
    	washE9 = $(".wash-E td").eq(9).children("input").val(),
    	washE10 = $(".wash-E td").eq(10).children("input").val(),
    	washE11 = $(".wash-E td").eq(11).children("input").val(),
    	washE12 = $(".wash-E td").eq(12).children("input").val();

    // 布草消耗费
    var	wasteE1 = $(".waste-E td").eq(1).children("input").val(),
    	wasteE2 = $(".waste-E td").eq(2).children("input").val(),
    	wasteE3 = $(".waste-E td").eq(3).children("input").val(),
    	wasteE4 = $(".waste-E td").eq(4).children("input").val(),
    	wasteE5 = $(".waste-E td").eq(5).children("input").val(),
    	wasteE6 = $(".waste-E td").eq(6).children("input").val(),
    	wasteE7 = $(".waste-E td").eq(7).children("input").val(),
    	wasteE8 = $(".waste-E td").eq(8).children("input").val(),
    	wasteE9 = $(".waste-E td").eq(9).children("input").val(),
    	wasteE10 = $(".waste-E td").eq(10).children("input").val(),
    	wasteE11 = $(".waste-E td").eq(11).children("input").val(),
    	wasteE12 = $(".waste-E td").eq(12).children("input").val();

    // 车费
    var	carE1 = $(".car-E td").eq(1).children("input").val(),
    	carE2 = $(".car-E td").eq(2).children("input").val(),
    	carE3 = $(".car-E td").eq(3).children("input").val(),
    	carE4 = $(".car-E td").eq(4).children("input").val(),
    	carE5 = $(".car-E td").eq(5).children("input").val(),
    	carE6 = $(".car-E td").eq(6).children("input").val(),
    	carE7 = $(".car-E td").eq(7).children("input").val(),
    	carE8 = $(".car-E td").eq(8).children("input").val(),
    	carE9 = $(".car-E td").eq(9).children("input").val(),
    	carE10 = $(".car-E td").eq(10).children("input").val(),
    	carE11 = $(".car-E td").eq(11).children("input").val(),
    	carE12 = $(".car-E td").eq(12).children("input").val();

    // 灯泡费
    var	lightE1 = $(".light-E td").eq(1).children("input").val(),
    	lightE2 = $(".light-E td").eq(2).children("input").val(),
    	lightE3 = $(".light-E td").eq(3).children("input").val(),
    	lightE4 = $(".light-E td").eq(4).children("input").val(),
    	lightE5 = $(".light-E td").eq(5).children("input").val(),
    	lightE6 = $(".light-E td").eq(6).children("input").val(),
    	lightE7 = $(".light-E td").eq(7).children("input").val(),
    	lightE8 = $(".light-E td").eq(8).children("input").val(),
    	lightE9 = $(".light-E td").eq(9).children("input").val(),
    	lightE10 = $(".light-E td").eq(10).children("input").val(),
    	lightE11 = $(".light-E td").eq(11).children("input").val(),
    	lightE12 = $(".light-E td").eq(12).children("input").val();

    // 税金
    var taxE1 =	$(".tax-E td").eq(1).children("input").val(),
    	taxE2 =	$(".tax-E td").eq(2).children("input").val(),
    	taxE3 =	$(".tax-E td").eq(3).children("input").val(),
    	taxE4 =	$(".tax-E td").eq(4).children("input").val(),
    	taxE5 =	$(".tax-E td").eq(5).children("input").val(),
    	taxE6 =	$(".tax-E td").eq(6).children("input").val(),
    	taxE7 =	$(".tax-E td").eq(7).children("input").val(),
    	taxE8 =	$(".tax-E td").eq(8).children("input").val(),
    	taxE9 =	$(".tax-E td").eq(9).children("input").val(),
    	taxE10 = $(".tax-E td").eq(10).children("input").val(),
    	taxE11 = $(".tax-E td").eq(11).children("input").val(),
    	taxE12 = $(".tax-E td").eq(12).children("input").val();

    // 网费
    var intE1 =	$(".int-E td").eq(1).children("input").val(),
    	intE2 =	$(".int-E td").eq(2).children("input").val(),
    	intE3 =	$(".int-E td").eq(3).children("input").val(),
    	intE4 =	$(".int-E td").eq(4).children("input").val(),
    	intE5 =	$(".int-E td").eq(5).children("input").val(),
    	intE6 =	$(".int-E td").eq(6).children("input").val(),
    	intE7 =	$(".int-E td").eq(7).children("input").val(),
    	intE8 =	$(".int-E td").eq(8).children("input").val(),
    	intE9 =	$(".int-E td").eq(9).children("input").val(),
    	intE10 = $(".int-E td").eq(10).children("input").val(),
    	intE11 = $(".int-E td").eq(11).children("input").val(),
    	intE12 = $(".int-E td").eq(12).children("input").val();

    // 能源费
    var resourceE1 = $(".resource-E td").eq(1).children("input").val(),
    	resourceE2 = $(".resource-E td").eq(2).children("input").val(),
    	resourceE3 = $(".resource-E td").eq(3).children("input").val(),
    	resourceE4 = $(".resource-E td").eq(4).children("input").val(),
    	resourceE5 = $(".resource-E td").eq(5).children("input").val(),
    	resourceE6 = $(".resource-E td").eq(6).children("input").val(),
    	resourceE7 = $(".resource-E td").eq(7).children("input").val(),
    	resourceE8 = $(".resource-E td").eq(8).children("input").val(),
    	resourceE9 = $(".resource-E td").eq(9).children("input").val(),
    	resourceE10 = $(".resource-E td").eq(10).children("input").val(),
    	resourceE11 = $(".resource-E td").eq(11).children("input").val(),
		resourceE12 = $(".resource-E td").eq(12).children("input").val();

	
	$.ajax({
		type:'post',
		url:'/LD/HomeAdmin/setCharge.action',
	    contentType:'application/json',
		data:'{"LE管理费_W-1":'+ LEW1 +',"LE管理费_W-2":'+ LEW2 +',"LE管理费_W-3":'+ LEW3 +','
		     +'"LE管理费_W-4":'+ LEW4 +',"LE管理费_W-5":'+ LEW5 +',"LE管理费_W-6":'+ LEW6 +','
		     +'"LE管理费_W-7":'+ LEW7 +',"LE管理费_W-8":'+ LEW8 +',"LE管理费_W-9":'+ LEW9 +','
		     +'"LE管理费_W-10":'+ LEW10 +',"LE管理费_W-11":'+ LEW11 +','

		     +'"布草洗涤费_W-1":'+ washW1 +',"布草洗涤费_W-2":'+ washW2 +',"布草洗涤费_W-3":'+ washW3 +','
		     +'"布草洗涤费_W-4":'+ washW4 +',"布草洗涤费_W-5":'+ washW5 +',"布草洗涤费_W-6":'+ washW6 +','
		     +'"布草洗涤费_W-7":'+ washW7 +',"布草洗涤费_W-8":'+ washW8 +',"布草洗涤费_W-9":'+ washW9 +','
		     +'"布草洗涤费_W-10":'+ washW10 +',"布草洗涤费_W-11":'+ washW11 +','

		     +'"布草消耗费_W-1":'+ wasteW1 +',"布草消耗费_W-2":'+ wasteW2 +',"布草消耗费_W-3":'+ wasteW3 +','
		     +'"布草消耗费_W-4":'+ wasteW4 +',"布草消耗费_W-5":'+ wasteW5 +',"布草消耗费_W-6":'+ wasteW6 +','
		     +'"布草消耗费_W-7":'+ wasteW7 +',"布草消耗费_W-8":'+ wasteW8 +',"布草消耗费_W-9":'+ wasteW9 +','
		     +'"布草消耗费_W-10":'+ wasteW10 +',"布草消耗费_W-11":'+ wasteW11 +','

		     +'"车费_W-1":'+ carW1 +',"车费_W-2":'+ carW2 +',"车费_W-3":'+ carW3 +','
		     +'"车费_W-4":'+ carW4 +',"车费_W-5":'+ carW5 +',"车费_W-6":'+ carW6 +','
		     +'"车费_W-7":'+ carW7 +',"车费_W-8":'+ carW8 +',"车费_W-9":'+ carW9 +','
		     +'"车费_W-10":'+ carW10 +',"车费_W-11":'+ carW11 +','

		     +'"灯泡费_W-1":'+ lightW1 +',"灯泡费_W-2":'+ lightW2 +',"灯泡费_W-3":'+ lightW3 +','
		     +'"灯泡费_W-4":'+ lightW4 +',"灯泡费_W-5":'+ lightW5 +',"灯泡费_W-6":'+ lightW6 +','
		     +'"灯泡费_W-7":'+ lightW7 +',"灯泡费_W-8":'+ lightW8 +',"灯泡费_W-9":'+ lightW9 +','
		     +'"灯泡费_W-10":'+ lightW10 +',"灯泡费_W-11":'+ lightW11 +','

		     +'"税金_W-1":'+ taxW1 +',"税金_W-2":'+ taxW2 +',"税金_W-3":'+ taxW3 +','
		     +'"税金_W-4":'+ taxW4 +',"税金_W-5":'+ taxW5 +',"税金_W-6":'+ taxW6 +','
		     +'"税金_W-7":'+ taxW7 +',"税金_W-8":'+ taxW8 +',"税金_W-9":'+ taxW9 +','
		     +'"税金_W-10":'+ taxW10 +',"税金_W-11":'+ taxW11 +','

		     +'"网费_W-1":'+ intW1 +',"网费_W-2":'+ intW2 +',"网费_W-3":'+ intW3 +','
		     +'"网费_W-4":'+ intW4 +',"网费_W-5":'+ intW5 +',"网费_W-6":'+ intW6 +','
		     +'"网费_W-7":'+ intW7 +',"网费_W-8":'+ intW8 +',"网费_W-9":'+ intW9 +','
		     +'"网费_W-10":'+ intW10 +',"网费_W-11":'+ intW11 +','

		     +'"能源费_W-1":'+ resourceW1 +',"能源费_W-2":'+ resourceW2 +',"能源费_W-3":'+ resourceW3 +','
		     +'"能源费_W-4":'+ resourceW4 +',"能源费_W-5":'+ resourceW5 +',"能源费_W-6":'+ resourceW6 +','
		     +'"能源费_W-7":'+ resourceW7 +',"能源费_W-8":'+ resourceW8 +',"能源费_W-9":'+ resourceW9 +','
		     +'"能源费_W-10":'+ resourceW10 +',"能源费_W-11":'+ resourceW11 +','

		     +'"LE管理费_E-1":'+ LEE1 +',"LE管理费_E-2":'+ LEE2 +',"LE管理费_E-3":'+ LEE3 +','
		     +'"LE管理费_E-4":'+ LEE4 +',"LE管理费_E-5":'+ LEE5 +',"LE管理费_E-6":'+ LEE6 +','
		     +'"LE管理费_E-7":'+ LEE7 +',"LE管理费_E-8":'+ LEE8 +',"LE管理费_E-9":'+ LEE9 +','
		     +'"LE管理费_E-10":'+ LEE10 +',"LE管理费_E-11":'+ LEE11 +',"LE管理费_E-12":'+ LEE12 +','

		     +'"布草洗涤费_E-1":'+ washE1 +',"布草洗涤费_E-2":'+ washE2 +',"布草洗涤费_E-3":'+ washE3 +','
		     +'"布草洗涤费_E-4":'+ washE4 +',"布草洗涤费_E-5":'+ washE5 +',"布草洗涤费_E-6":'+ washE6 +','
		     +'"布草洗涤费_E-7":'+ washE7 +',"布草洗涤费_E-8":'+ washE8 +',"布草洗涤费_E-9":'+ washE9 +','
		     +'"布草洗涤费_E-10":'+ washE10 +',"布草洗涤费_E-11":'+ washE11 +',"布草洗涤费_E-12":'+ washE12 +','

		     +'"布草消耗费_E-1":'+ wasteE1 +',"布草消耗费_E-2":'+ wasteE2 +',"布草消耗费_E-3":'+ wasteE3 +','
		     +'"布草消耗费_E-4":'+ wasteE4 +',"布草消耗费_E-5":'+ wasteE5 +',"布草消耗费_E-6":'+ wasteE6 +','
		     +'"布草消耗费_E-7":'+ wasteE7 +',"布草消耗费_E-8":'+ wasteE8 +',"布草消耗费_E-9":'+ wasteE9 +','
		     +'"布草消耗费_E-10":'+ wasteE10 +',"布草消耗费_E-11":'+ wasteE11 +',"布草消耗费_E-12":'+ wasteE12 +','

		     +'"车费_E-1":'+ carE1 +',"车费_E-2":'+ carE2 +',"车费_E-3":'+ carE3 +','
		     +'"车费_E-4":'+ carE4 +',"车费_E-5":'+ carE5 +',"车费_E-6":'+ carE6 +','
		     +'"车费_E-7":'+ carE7 +',"车费_E-8":'+ carE8 +',"车费_E-9":'+ carE9 +','
		     +'"车费_E-10":'+ carE10 +',"车费_E-11":'+ carE11 +',"车费_E-12":'+ carE12 +','

		     +'"灯泡费_E-1":'+ lightE1 +',"灯泡费_E-2":'+ lightE2 +',"灯泡费_E-3":'+ lightE3 +','
		     +'"灯泡费_E-4":'+ lightE4 +',"灯泡费_E-5":'+ lightE5 +',"灯泡费_E-6":'+ lightE6 +','
		     +'"灯泡费_E-7":'+ lightE7 +',"灯泡费_E-8":'+ lightE8 +',"灯泡费_E-9":'+ lightE9 +','
		     +'"灯泡费_E-10":'+ lightE10 +',"灯泡费_E-11":'+ lightE11 +',"灯泡费_E-12":'+ lightE12 +','

		     +'"税金_E-1":'+ taxE1 +',"税金_E-2":'+ taxE2 +',"税金_E-3":'+ taxE3 +','
		     +'"税金_E-4":'+ taxE4 +',"税金_E-5":'+ taxE5 +',"税金_E-6":'+ taxE6 +','
		     +'"税金_E-7":'+ taxE7 +',"税金_E-8":'+ taxE8 +',"税金_E-9":'+ taxE9 +','
		     +'"税金_E-10":'+ taxE10 +',"税金_E-11":'+ taxE11 +',"税金_E-12":'+ taxE12 +','

		     +'"网费_E-1":'+ intE1 +',"网费_E-2":'+ intE2 +',"网费_E-3":'+ intE3 +','
		     +'"网费_E-4":'+ intE4 +',"网费_E-5":'+ intE5 +',"网费_E-6":'+ intE6 +','
		     +'"网费_E-7":'+ intE7 +',"网费_E-8":'+ intE8 +',"网费_E-9":'+ intE9 +','
		     +'"网费_E-10":'+ intE10 +',"网费_E-11":'+ intE11 +',"网费_E-12":'+ intE12 +','

		     +'"能源费_E-1":'+ resourceE1 +',"能源费_E-2":'+ resourceE2 +',"能源费_E-3":'+ resourceE3 +','
		     +'"能源费_E-4":'+ resourceE4 +',"能源费_E-5":'+ resourceE5 +',"能源费_E-6":'+ resourceE6 +','
		     +'"能源费_E-7":'+ resourceE7 +',"能源费_E-8":'+ resourceE8 +',"能源费_E-9":'+ resourceE9 +','
		     +'"能源费_E-10":'+ resourceE10 +',"能源费_E-11":'+ resourceE11+',"能源费_E-12":'+ resourceE12

		     +'}',
		dataType:'json',
	    success:function(data){
	    	console.log(data);
	    	if (data == 1) {
	    		alert("收费标准变更成功！");
	    		window.location.href = "/LD/views/admin/rateOther.jsp";
	    	} else if (data == 0){
	    		alert("收费标准变更失败！");
	    	}
	    }
	});
}








