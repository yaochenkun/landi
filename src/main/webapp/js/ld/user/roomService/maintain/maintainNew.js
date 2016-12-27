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
			problemLevel = $(this).text();
		}
	});
	// console.log(problemLevel);

	var problemExist = $("#problemExist").val();
	var problemSort = $("#problemSortInput").val();
	var problemReason = $("#problemReasonInput").val();

	$.ajax({
		url:'/LD/',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		data:'{}',
		success:function(data){
			console.log(data);
		}
	});
};