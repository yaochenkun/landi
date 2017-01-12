// 请求房间报修项目明细（state 1 : unfinish , 0 finish, null for all）
// 注意：不传 state 参数，state 为 null
var requestMaintainList = function(pageNum){
	var date = $("#date_demo3").text();
	var dateArray = date.split(" 至 ");
	var startDate = dateArray[0];
	var endDate = dateArray[1];

	console.log("请求第" + pageNum + "页房间报修明细，开始时间：" + startDate + " 结束时间：" + endDate);
	$.ajax({
		url:'/LD/userRoom/searchMaintainUnfinished.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		data:'{"pageNum":'+ pageNum +',"from":"'+ startDate +'","to":"'+ endDate +'","state":1}',
		success:function(data){
			console.log(data);

			// 清空列表
			$("#maintainManageTbody").html("");
			$("#maintainManageBottom").html("");

			if(data.recordTotal == 0){
				$("#maintainManageTbody").append("<td colspan='11' class='emptyText'>没有相关信息！</td>");
				return;
			}

			for(var i = 0; i < data.dataList.length; i++){
				addPerMaintain(data.dataList[i]);
			}

			// 添加维修管理 底部页码
			$("#maintainManageBottom").append("<div class='bottom-page'>"+
	        	"<span class='page-before' onclick='requestBeforeMaintain();'>上一页&nbsp;&nbsp;</span>"+
	        	"<span><input id='maintain_nowpage' value='"+ data.pageNow +"' type='text' class='input_num'></span>"+
	        	"<span>&nbsp;/&nbsp;</span>"+
	        	"<span id='maintain_totalpage'>"+ data.pageTotal +"</span>"+
	            "<span class='page-next' onclick='requestNextMaintain();'>&nbsp;&nbsp;下一页</span>" +
	            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ data.recordTotal +"&nbsp;</span>条记录</div>");
		}
	});
};
//拉取上一页 维修管理信息
var requestBeforeMaintain = function(){
	var nowpage = parseInt($("#maintain_nowpage").val());
	if(nowpage == 1) return;
	requestMaintainList(nowpage - 1);
};

// 拉取下一页 维修管理信息
var requestNextMaintain = function(){
	var nowpage = parseInt($("#maintain_nowpage").val());
	var totalpage = parseInt($("#maintain_totalpage").text());
	if(nowpage == totalpage) return;
	requestMaintainList(nowpage + 1);
};

//////////////////////////////////////////////////////
// 根据房间号和日期条件查询维修记录
var requestMaintainByDate = function(pageNum){
	var date = $("#date_demo3").text();
	var dateArray = date.split(" 至 ");
	var startDate = dateArray[0];
	var endDate = dateArray[1];
	var roomNum = $("#searchRoomNum").val();

	console.log("请求第" + pageNum + "页房间报修明细，开始时间：" + startDate + " 结束时间：" + endDate);
	$.ajax({
		url:'/LD/userRoom/searchMaintainUnfinished.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		data:'{"pageNum":'+ pageNum +',"from":"'+ startDate +'","to":"'+ endDate +'",'
			+'"state":1,"roomNum":"'+ roomNum +'"}',
		success:function(data){
			console.log(data);

			// 清空列表
			$("#maintainManageTbody").html("");
			$("#maintainManageBottom").html("");

			if(data.recordTotal == 0){
				$("#maintainManageTbody").append("<td colspan='11' class='emptyText'>没有相关信息！</td>");
				return;
			}

			for(var i = 0; i < data.dataList.length; i++){
				addPerMaintain(data.dataList[i]);
			}

			// 添加维修管理 底部页码
			$("#maintainManageBottom").append("<div class='bottom-page'>"+
	        	"<span class='page-before' onclick='requestBeforeMaintainByDate();'>上一页&nbsp;&nbsp;</span>"+
	        	"<span><input id='maintain_nowpage' value='"+ data.pageNow +"' type='text' class='input_num'></span>"+
	        	"<span>&nbsp;/&nbsp;</span>"+
	        	"<span id='maintain_totalpage'>"+ data.pageTotal +"</span>"+
	            "<span class='page-next' onclick='requestNextMaintainByDate();'>&nbsp;&nbsp;下一页</span>" +
	            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ data.recordTotal +"&nbsp;</span>条记录</div>");
		}
	});
};
//拉取上一页 维修管理信息
var requestBeforeMaintainByDate = function(){
	var nowpage = parseInt($("#maintain_nowpage").val());
	if(nowpage == 1) return;
	requestMaintainByDate(nowpage - 1);
};
// 拉取下一页 维修管理信息
var requestNextMaintainByDate = function(){
	var nowpage = parseInt($("#maintain_nowpage").val());
	var totalpage = parseInt($("#maintain_totalpage").text());
	if(nowpage == totalpage) return;
	requestMaintainByDate(nowpage + 1);
};

///////////////////////////////////////////////////////
// 保存问题等级文字与数字对应关系
var map = {1:"一级",2:"二级",3:"三级",4:"四级"};

// 逐条添加维修记录
var addPerMaintain = function(perRecord){
	$("#maintainManageTbody").append("<tr><td>"+ perRecord.room_NUMBER +"</td>"+
		"<td>"+ formatDateForm(new Date(perRecord.stime)) +"</td>"+
		"<td>"+ formatDateForm(new Date(perRecord.etime)) +"</td><td>"+ map[perRecord.level] +"</td>"+
		"<td>"+ perRecord.problem +"</td><td>"+ perRecord.pro_TYPE +"</td>"+
		"<td>"+ perRecord.pro_CAUSE +"</td><td>"+ perRecord.pro_DETAIL +"</td>"+
		"<td>"+ perRecord.charge +"</td><td>"+ perRecord.comment +"</td>"+
		"<td><span class='trace'>追踪</span>"+
		"<span class='confirm' onclick='showConfirmDiv(this);'>确认修复</span></td></tr>");
};

///////////////////////////////////////////////////
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