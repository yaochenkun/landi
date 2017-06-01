(function(){
    // 根据采购计划编号查询采购计划
    $("#plan_id").keyup(function(e){
    	if(e.keyCode == 13){
    		if(isNaN($("#plan_id").val())){
    			return false;
    		}
    		requestItemByItemType();
    		return false;
    	}
    });
})();

// 请求采购计划列表
var requestPlanList = function(pageNum){
	console.log("请求第" + pageNum + "页采购计划信息");
	$.ajax({
		url:'/LD/userItem/searchPlanList.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:'{"pageNum":'+ pageNum + '}',
		success:function(data){
			console.log(data);

			if(data.State == "Invalid"){
				alert("您没有权限访问本页数据，请尝试升级权限或回退！");
				return;
			}
			else if(data.State == "Valid"){

		 		// 清空表格和页码
				$("#planListTbody").html("")
				$("#planListBottom").html("");

				var pageNow = data.pageNow;
				var pageTotal = data.pageTotal;
				var recordTotal = data.recordTotal;

				if (recordTotal == 0) {
					$("#planListTbody").append("<tr><td class='no-data' colspan='7' style='color: #ff4d4d'>"+
						"没有相关数据！</td></tr>");
					return;
				}

				for(var i=0; i<data.pageList.length; i++){
					var perRecord = data.pageList[i];

					var cDate = new Date(perRecord.ctime);
            		var ccDate = cDate.toLocaleDateString().replace(/\//g,"-");

					$("#planListTbody").append("<tr><td>"+ perRecord.id +"</td>"+
						"<td>"+ perRecord.name +"</td><td>"+ perRecord.staff +"</td>"+
						"<td>"+ ccDate +"</td><td>"+ perRecord.money +"&nbsp;元</td>"+
						"<td>"+ perRecord.comment +"</td>"+
						"<td><span class='plan_detail' onclick='requestPlanDetail(this);'>计划执行信息</span></td></tr>");
				}

				// 添加采购计划 底部页码
				$("#planListBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforePlanList();'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='planList_nowpage' value='"+ pageNow +"' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='planList_totalpage'>"+ pageTotal +"</span>"+
			            "<span class='page-next' onclick='requestNextplanList();'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ recordTotal +"&nbsp;</span>条记录</div>");
			}
		}
	});
}

//根据房间号 拉取上一页 采购计划信息
var requestBeforePlanList = function(){
	var nowpage = parseInt($("#planList_nowpage").val());
	if(nowpage == 1) return;
	
	requestPlanList(nowpage-1);
}

//根据房间号 拉取下一页 采购计划信息
var requestNextplanList = function(){
	var nowpage = parseInt($("#planList_nowpage").val());
	var totalpage = parseInt($("#planList_totalpage").text());
	if(nowpage == totalpage) return;
	
	requestPlanList(nowpage+1);
}

// 点击详细，显示计划详情
var requestPlanDetail = function(element){
	var planID = $(element).parent().parent().children("td").eq(0).text();
	var planName = $(element).parent().parent().children("td").eq(1).text();
	console.log("显示计划：" + planID + planName + "的详细信息");
	window.location.href = "http://" + window.location.host 
		 + "/LD/views/user/roomItem/planDetail.jsp?planID=" + planID + "&planName=" + planName;
}

////////////////////////////////////////////////////////////////////////////
// 根据采购计划编号查询采购计划
var requestItemByItemType = function(){

    var plan_id = $("#plan_id").val();
    if(isNaN(plan_id)){
        return false;
    }

	$.ajax({
		url:'/LD/userItem/searchPlanByPlanId.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:'{"PlanId":"'+ plan_id +'"}',
		success:function(data){
			console.log(data);

			// 清空表格和页码
			$("#planListTbody").html("")
			$("#planListBottom").html("");

			if(data.plan == null){
				$("#planListTbody").append("<tr><td class='no-data' colspan='7' style='color: #ff4d4d'>"+
						"没有相关数据！</td></tr>");
					return;
			}

			var cDate = new Date(data.plan.ctime);
            var ccDate = cDate.toLocaleDateString().replace(/\//g,"-");

			$("#planListTbody").append("<tr><td>"+ data.plan.id +"</td>"+
						"<td>"+ data.plan.name +"</td><td>"+ data.plan.staff +"</td>"+
						"<td>"+ ccDate +"</td><td>"+ data.plan.money +"&nbsp;元</td>"+
						"<td>"+ data.plan.comment +"</td><td><a>计划执行信息</a></td></tr>");
		}
	});
}

//根据物品种类拉取
var requestBeforeItemByType = function(){
	var nowpage = parseInt($("#planList_nowpage").val());
	if(nowpage == 1) return;
	
	requestItemByItemType(1,nowpage-1);
}

//根据房间号 拉取下一页 采购计划信息（??当前处理，前端判断是否是最后一页）
var requestNextItemByType = function(){
	var nowpage = parseInt($("#planList_nowpage").val());
	var totalpage = parseInt($("#planList_totalpage").text());
	if(nowpage == totalpage) return;
	
	requestItemByItemType(1,nowpage+1);
}