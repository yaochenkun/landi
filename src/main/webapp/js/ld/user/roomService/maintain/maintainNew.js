(function(){
	// 事件冒泡（隐藏下拉菜单）
	$(document).on("click",function(e){
		$(".problemSortMenu").css("display","none");
		$(".problemReasonMenu").css("display","none");
	})
	// 选择问题等级
	$(".problemLevel").click(function(){
		$(".problemLevel").removeClass("levelActive");
		$(this).addClass("levelActive");
	});

	// 显示问题分类下拉菜单
	$("#problemSortInput").click(function(e){
		$(".problemSortMenu").css("display","block");
		$(".problemReasonMenu").css("display","none");
		// 阻止事件冒泡
		e.stopPropagation();
	});
	// 选择问题分类
	$(".problemSortMenu li").click(function(){
		$("#problemSortInput").val($(this).text());
	});

	// 显示问题原因下拉菜单
	$("#problemReasonInput").click(function(e){
		$(".problemReasonMenu").css("display","block");
		$(".problemSortMenu").css("display","none");
		e.stopPropagation();
	});

	// 选择问题原因
	$(".problemReasonMenu li").click(function(){
		$("#problemReasonInput").val($(this).text());
	});
})();

// 保存问题等级文字与整型数字对应关系
var map = {"一级":1,"二级":2,"三级":3,"四级":4}

// 添加一条维修报修记录
var addMaintain = function(){

	var roomNo = $("#roomNumber").val();
	var houseType = $("#houseType").val();
	var checkState = $("#checkStatus").val();

	var maintainTime = $(".pack_maintain").val();
	var maintainTimeSolve = $(".pack_maintainT").val();

	// 得到问题等级
	var problemLevel = "";
	$(".problemLevel").each(function(){
		if($(this).hasClass("levelActive")){
			problemLevel = map[$(this).text()];
		}
	});
	// console.log(problemLevel);

	var problemExist = $("#problemExist").val();         // 存在问题
	var problemSort = $("#problemSortInput").val();      // 问题分类
	var problemReason = $("#problemReasonInput").val();  // 问题原因
	var problemDetail = $("#problemDetail").val();       // 问题明细
	var price = $("#problemPrice").val();                 // 费用
	var comment = $("#problemComment").val();            // 备注
 
	$.ajax({
		url:'/LD/userRoom/addMaintain.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		data:'{"roomNum":"'+ roomNo +'","maintainTime":"'+ maintainTime +'","expTime":"'+ maintainTimeSolve+'",'
			+'"problemLevel":"'+ problemLevel +'","problemExist":"'+ problemExist +'",'
			+'"problemType":"'+ problemSort +'","problemReason":"'+ problemReason +'",'
			+'"problemDetail":"'+ problemDetail +'","price":'+ price +',"comment":"'+ comment +'"}',
		success:function(data){
			console.log(data);
			if(data == 1){
				showModalBox("success","添加成功！");
			}else if(data == 0){
				showModalBox("error","添加失败！");
			}
		}
	});
};