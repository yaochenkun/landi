(function(){
	// 事件冒泡（隐藏下拉菜单）
	$(document).on("click",function(e){
		$(".problemSortMenu").css("display","none");
		$(".problemReasonMenu").css("display","none");
        $(".problemAffordMenu").css("display","none");
	})

	// 显示信息来源下拉菜单
	$("#infoSource").click(function(e){
		$(".problemSortMenu").css("display","block");
		$(".problemReasonMenu").css("display","none");
        $(".problemAffordMenu").css("display","none");

        // 阻止事件冒泡
		e.stopPropagation();
	});
	// 选择问题分类
	$(".problemSortMenu li").click(function(){
		$("#infoSourceInput").val($(this).text());
	});

	// 显示分配部门下拉菜单
	$("#department").click(function(e){
		$(".problemReasonMenu").css("display","block");
		$(".problemSortMenu").css("display","none");
        $(".problemAffordMenu").css("display","none");

        e.stopPropagation();
	});

    // 显示承担费用下拉菜单
    $("#fareAfford").click(function(e){
        $(".problemAffordMenu").css("display","block");
        $(".problemReasonMenu").css("display","none");
        $(".problemSortMenu").css("display","none");
        e.stopPropagation();
    });

	// 选择问题原因
	$(".problemReasonMenu li").click(function(){
		$("#departmentInput").val($(this).text());
	});

    // 选择问题原因
    $(".problemAffordMenu li").click(function(){
        $("#fareAffordInput").val($(this).text());
    });

	$("#forFare").css("display","none");
})();

var maintainFare = function(){
	if($("#checkFare").is(':checked')){
		$("#forFare").css("display","block");
	}else{
        $("#forFare").css("display","none");
    }
}
// 添加一条维修报修记录
var addMaintain = function(ID){

	var replyDate = $("#replyDate").val();
	var description = $("#description").val();
	var infoSourceInput = $("#infoSourceInput").val();
	var department = $("#departmentInput").val();
	var state = "";
    var fare = 0.0;
    var fareDetail = "";
    var fareAfford = "";
	var thisMonthPay = false;
	var aleardyPay = false;

    if($("#complete").is(':checked')){
    	state = "确认完成";
	}else{
    	state = "跟踪中";
	}

    if($("#checkFare").is(':checked')){
        fare = $("#fare").val();
        fareDetail = $("#fareDetail").val();
        fareAfford = $("#fareAffordInput").val();
    }

    if($("#monthGet").is(':checked')){
        thisMonthPay = true;
    }
    if($("#alreadyGet").is(':checked')){
        aleardyPay = true;
    }

    console.log('{"ID":'+ ID +',"replyDate":"'+ replyDate +'","description":"'+ description+'",'
        +'"infoSourceInput":"'+ infoSourceInput + '","department":"' + department + '","state":"'+ state +'",'
        +'"fare":'+ fare +',"fareDetail":"'+ fareDetail +'",'
        +'"fareAfford":"'+ fareAfford +'","thisMonthPay":"'+ thisMonthPay +'","aleardyPay":"'+ aleardyPay +'"}')

	$.ajax({
		url:'/LD/problem/addProblemReply.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		data:'{"ID":'+ ID +',"replyDate":"'+ replyDate +'","description":"'+ description+'",'
			+'"infoSourceInput":"'+ infoSourceInput +'","state":"'+ state +'",'
			+'"fare":'+ fare +',"fareDetail":"'+ fareDetail +'",'
			+'"fareAfford":"'+ fareAfford +'","thisMonthPay":"'+ thisMonthPay +'","aleardyPay":"'+ aleardyPay +'"}',
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