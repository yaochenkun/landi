(function(){
	// 显示选择物品种类菜单
	$(".itemType").hover(function(){
		$(".itemTypeMenu").css("display","block");
	},function(){
		$(".itemTypeMenu").css("display","none");
	});

	// 选择物品种类
	$(".itemTypeMenu li").click(function(){
		$(".itemTypeMenu").css("display","none");
		$(".itemType .span").text($(this).text());
		requestMaintainItem($(this).text(),1);
	});
})();

// 请求房间报修项目明细
var requestMaintainList = function(pageNum){
	console.log("请求第" + pageNum + "页房间报修明细");
	// $.ajax({
	// 	url:'/LD/',
	// 	type:'post',
	// 	dataType:'json',
	// 	contentType:'application/json',
	// 	data:'{}',
	// 	success:function(data){
	// 		console.log(data);
			for(var i=0; i<2; i++){
				$("#maintainManageTbody").append("<tr><td>1</td><td>1</td><td>1</td><td>1</td>"+
					"<td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>"+
					"<span class='trace'>追踪</span>"+
					"<span class='confirm' onclick='showConfirmDiv(this);'>确认修复</span></td></tr>");
			}
	// 	}
	// });
};

// 根据物品种类查询维修记录
var requestMaintainItem = function(itemType,pageNum){
	console.log("根据物品种类"+ itemType + "查询第" + pageNum + "页物品信息");
	// $.ajax({
	// 	url:'/LD',
	// 	type:'post',
	// 	dataType:'json',
	// 	contentType:'application/json',
	// 	data:'{}',
	// 	success:function(data){
	// 		console.log(data);
			for(var i=0; i<2; i++){
				$("#maintainManageTbody").append("<tr><td>1</td><td>1</td><td>1</td><td>1</td>"+
					"<td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>"+
					"<span class='trace'>追踪</span>"+
					"<span class='confirm' onclick='showConfirmDiv(this);'>确认修复</span></td></tr>");
			}
	// 	}
	// });
};

// 显示确认修复弹出框
var showConfirmDiv = function(element){
	showPopMenu("confirmMenu");
};
// 关闭确认修复弹出框
var closeConfirmDiv = function(){
	closePopMenu("confirmMenu");
};
// 请求确认修复
var requestConfirmMaintain = function(){
	var price = Number($("#confirmMenu input").val());
	console.log("维修费用：" + price);
	closeConfirmDiv();
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