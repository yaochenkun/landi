// 获取水、电、煤气费价格信息
var requestAjaxRate = function(){
	console.log("request ajax rate");
	$.ajax({
		type:"post",
		url:"/LD/HomeAdmin/getRate.action",
		success:function(data){
			//console.log(data);
			// 显示水费标准
			$(".water .body dl:nth-child(1)").children("dd").eq(0).text(data["wp1"]);
			$(".water .body dl:nth-child(1)").children("dd").eq(1).text(data["wc1"]);
			$(".water .body dl:nth-child(2)").children("dd").eq(0).text(data["wp2"]);
			$(".water .body dl:nth-child(2)").children("dd").eq(1).text(data["wc2"]);
			$(".water .body dl:nth-child(3)").children("dd").eq(0).text(data["wp3"]);
			$(".water .body dl:nth-child(3)").children("dd").eq(1).text(data["wc3"]);
			
			//显示电费标准
			$(".power .body dl:nth-child(1)").children("dd").eq(0).text(data["pp1"]);
			$(".power .body dl:nth-child(1)").children("dd").eq(1).text(data["pc1"]);
			$(".power .body dl:nth-child(2)").children("dd").eq(0).text(data["pp2"]);
			$(".power .body dl:nth-child(2)").children("dd").eq(1).text(data["pc2"]);
			$(".power .body dl:nth-child(3)").children("dd").eq(0).text(data["pp3"]);
			$(".power .body dl:nth-child(3)").children("dd").eq(1).text(data["pc3"]);
			
			//显示燃气费标准
			$(".gas .body dl:nth-child(1)").children("dd").eq(0).text(data["gp1"]);
			$(".gas .body dl:nth-child(1)").children("dd").eq(1).text(data["gc1"]);
			$(".gas .body dl:nth-child(2)").children("dd").eq(0).text(data["gp2"]);
			$(".gas .body dl:nth-child(2)").children("dd").eq(1).text(data["gc2"]);
			$(".gas .body dl:nth-child(3)").children("dd").eq(0).text(data["gp3"]);
			$(".gas .body dl:nth-child(3)").children("dd").eq(1).text(data["gc3"]);
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
			
			// 将电费变为可编辑状态
			$(".power .body dl:nth-child(1)").children("dd").eq(0).text("").append("<input type='text' value='"+ data["pp1"] +"'/>");
			$(".power .body dl:nth-child(1)").children("dd").eq(1).text("").append("<input type='text' value='"+ data["pc1"] +"'/>");
			$(".power .body dl:nth-child(2)").children("dd").eq(0).text("").append("<input type='text' value='"+ data["pp2"] +"'/>");
			$(".power .body dl:nth-child(2)").children("dd").eq(1).text("").append("<input type='text' value='"+ data["pc2"] +"'/>");
			$(".power .body dl:nth-child(3)").children("dd").eq(0).text("").append("<input type='text' value='"+ data["pp3"] +"'/>");
			$(".power .body dl:nth-child(3)").children("dd").eq(1).text("").append("<input type='text' value='"+ data["pc3"] +"'/>");
			
			// 将燃气费变为可编辑状态
			$(".gas .body dl:nth-child(1)").children("dd").eq(0).text("").append("<input type='text' value='"+ data["gp1"] +"'/>");
			$(".gas .body dl:nth-child(1)").children("dd").eq(1).text("").append("<input type='text' value='"+ data["gc1"] +"'/>");
			$(".gas .body dl:nth-child(2)").children("dd").eq(0).text("").append("<input type='text' value='"+ data["gp2"] +"'/>");
			$(".gas .body dl:nth-child(2)").children("dd").eq(1).text("").append("<input type='text' value='"+ data["gc2"] +"'/>");
			$(".gas .body dl:nth-child(3)").children("dd").eq(0).text("").append("<input type='text' value='"+ data["gp3"] +"'/>");
			$(".gas .body dl:nth-child(3)").children("dd").eq(1).text("").append("<input type='text' value='"+ data["gc3"] +"'/>");
			
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
	var wp1 = parseFloat($(".water .body dl:nth-child(1)").children("dd").eq(0).children("input").val());
	var wc1 = parseFloat($(".water .body dl:nth-child(1)").children("dd").eq(1).children("input").val());
	var wp2 = parseFloat($(".water .body dl:nth-child(2)").children("dd").eq(0).children("input").val());
	var wc2 = parseFloat($(".water .body dl:nth-child(2)").children("dd").eq(1).children("input").val());
	var wp3 = parseFloat($(".water .body dl:nth-child(3)").children("dd").eq(0).children("input").val());
	var wc3 = parseFloat($(".water .body dl:nth-child(3)").children("dd").eq(1).children("input").val());
	
	// 获取修改后电费的值
	var pp1 = parseFloat($(".power .body dl:nth-child(1)").children("dd").eq(0).children("input").val());
	var pc1 = parseFloat($(".power .body dl:nth-child(1)").children("dd").eq(1).children("input").val());
	var pp2 = parseFloat($(".power .body dl:nth-child(2)").children("dd").eq(0).children("input").val());
	var pc2 = parseFloat($(".power .body dl:nth-child(2)").children("dd").eq(1).children("input").val());
	var pp3 = parseFloat($(".power .body dl:nth-child(3)").children("dd").eq(0).children("input").val());
	var pc3 = parseFloat($(".power .body dl:nth-child(3)").children("dd").eq(1).children("input").val());
	
	// 获取修改后燃气费的值
	var gp1 = parseFloat($(".gas .body dl:nth-child(1)").children("dd").eq(0).children("input").val());
	var gc1 = parseFloat($(".gas .body dl:nth-child(1)").children("dd").eq(1).children("input").val());
	var gp2 = parseFloat($(".gas .body dl:nth-child(2)").children("dd").eq(0).children("input").val());
	var gc2 = parseFloat($(".gas .body dl:nth-child(2)").children("dd").eq(1).children("input").val());
	var gp3 = parseFloat($(".gas .body dl:nth-child(3)").children("dd").eq(0).children("input").val());
	var gc3 = parseFloat($(".gas .body dl:nth-child(3)").children("dd").eq(1).children("input").val());
	
	
	$.ajax({
		type:'post',
		url:'/LD/HomeAdmin/setRate.action',
	    contentType:'application/json',
		data:'{"wp1":'+ wp1 +',"wc1":'+ wc1 +',"wp2":'+ wp2 +','+'"wc2":'+ wc2 +',"wp3":'+ wp3 +',"wc3":'+ wc3 
		+',"pp1":'+ pp1 +',"pc1":'+ pc1 +',"pp2":'+ pp2 +','+'"pc2":'+ pc2 +',"pp3":'+ pp3 +',"pc3":'+ pc3 
		+',"gp1":'+ gp1 +',"gc1":'+ gc1 +',"gp2":'+ gp2 +','+'"gc2":'+ gc2 +',"gp3":'+ gp3 +',"gc3":'+ gc3 +'}',
		dataType:'json',
	    success:function(data){
	    	console.log(data);
	    	alert("收费标准变更成功！");
	    	window.location.href = "/LD/views/admin/rateList.jsp";
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
	    	console.log(data["LE管理费_E-1"]);
	    	
	    }
	});
}









