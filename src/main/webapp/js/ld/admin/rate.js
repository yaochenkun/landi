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

	    	WorE = ['W','W','E','E'];
	    	beginPos = [2,19,2,19];
	    	$('.bill-table table').each(function(tableIndex){
	    		
	    		$(this).find('.LE-'+ WorE[tableIndex] +' td:not(:first-child) input').each(function(tdIndex){
	    			$(this).val(data['LE管理费_'+ WorE[tableIndex] + '-' + (beginPos[tableIndex] + tdIndex)]);
	    		});

	    		$(this).find('.wash-'+ WorE[tableIndex] +' td:not(:first-child) input').each(function(tdIndex){
	    			$(this).val(data['布草洗涤费_'+ WorE[tableIndex] + '-' + (beginPos[tableIndex] + tdIndex)]);
	    		});

	    		$(this).find('.waste-'+ WorE[tableIndex] +' td:not(:first-child) input').each(function(tdIndex){
	    			$(this).val(data['布草消耗费_'+ WorE[tableIndex] + '-' + (beginPos[tableIndex] + tdIndex)]);
	    		});

	    		$(this).find('.car-'+ WorE[tableIndex] +' td:not(:first-child) input').each(function(tdIndex){
	    			$(this).val(data['车费_'+ WorE[tableIndex] + '-' + (beginPos[tableIndex] + tdIndex)]);
	    		});
	    		
	    		$(this).find('.light-'+ WorE[tableIndex] +' td:not(:first-child) input').each(function(tdIndex){
	    			$(this).val(data['灯泡费_'+ WorE[tableIndex] + '-' + (beginPos[tableIndex] + tdIndex)]);
	    		});
	    		
	    		$(this).find('.tax-'+ WorE[tableIndex] +' td:not(:first-child) input').each(function(tdIndex){
	    			$(this).val(data['税金_'+ WorE[tableIndex] + '-' + (beginPos[tableIndex] + tdIndex)]);
	    		});
	    		
	    		$(this).find('.car-'+ WorE[tableIndex] +' td:not(:first-child) input').each(function(tdIndex){
	    			$(this).val(data['车费_'+ WorE[tableIndex] + '-' + (beginPos[tableIndex] + tdIndex)]);
	    		});
	    		
	    		$(this).find('.int-'+ WorE[tableIndex] +' td:not(:first-child) input').each(function(tdIndex){
	    			$(this).val(data['网费_'+ WorE[tableIndex] + '-' + (beginPos[tableIndex] + tdIndex)]);
	    		});
	    		
	    		$(this).find('.resource-'+ WorE[tableIndex] +' td:not(:first-child) input').each(function(tdIndex){
	    			$(this).val(data['能源费_'+ WorE[tableIndex] + '-' + (beginPos[tableIndex] + tdIndex)]);
	    		});
	    	});
	    }
	});
}

// 变更其他收费标准
var setCharge = function(){
	console.log("set Charge!");

	var jsondata={};
	WorE = ['W','W','E','E'];
	beginPos = [2,19,2,19];
	$('.bill-table table').each(function(tableIndex){
		
		$(this).find('.LE-'+ WorE[tableIndex] +' td:not(:first-child) input').each(function(tdIndex){
			jsondata['LE管理费_'+ WorE[tableIndex] + '-' + (beginPos[tableIndex] + tdIndex)] = $(this).val();
		});

		$(this).find('.wash-'+ WorE[tableIndex] +' td:not(:first-child) input').each(function(tdIndex){
			jsondata['布草洗涤费_'+ WorE[tableIndex] + '-' + (beginPos[tableIndex] + tdIndex)] = $(this).val();
		});

		$(this).find('.waste-'+ WorE[tableIndex] +' td:not(:first-child) input').each(function(tdIndex){
			jsondata['布草消耗费_'+ WorE[tableIndex] + '-' + (beginPos[tableIndex] + tdIndex)] = $(this).val();
		});

		$(this).find('.car-'+ WorE[tableIndex] +' td:not(:first-child) input').each(function(tdIndex){
			jsondata['车费_'+ WorE[tableIndex] + '-' + (beginPos[tableIndex] + tdIndex)] = $(this).val();
		});
		
		$(this).find('.light-'+ WorE[tableIndex] +' td:not(:first-child) input').each(function(tdIndex){
			jsondata['灯泡费_'+ WorE[tableIndex] + '-' + (beginPos[tableIndex] + tdIndex)] = $(this).val();
		});
		
		$(this).find('.tax-'+ WorE[tableIndex] +' td:not(:first-child) input').each(function(tdIndex){
			jsondata['税金_'+ WorE[tableIndex] + '-' + (beginPos[tableIndex] + tdIndex)] = $(this).val();
		});
		
		$(this).find('.car-'+ WorE[tableIndex] +' td:not(:first-child) input').each(function(tdIndex){
			jsondata['车费_'+ WorE[tableIndex] + '-' + (beginPos[tableIndex] + tdIndex)] = $(this).val();
		});
		
		$(this).find('.int-'+ WorE[tableIndex] +' td:not(:first-child) input').each(function(tdIndex){
			jsondata['网费_'+ WorE[tableIndex] + '-' + (beginPos[tableIndex] + tdIndex)] = $(this).val();
		});
		
		$(this).find('.resource-'+ WorE[tableIndex] +' td:not(:first-child) input').each(function(tdIndex){
			jsondata['能源费_'+ WorE[tableIndex] + '-' + (beginPos[tableIndex] + tdIndex)] = $(this).val();
		});
	});
	
	$.ajax({
		type:'post',
		url:'/LD/HomeAdmin/setCharge.action',
	    contentType:'application/json',
		data:JSON.stringify(jsondata),
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








