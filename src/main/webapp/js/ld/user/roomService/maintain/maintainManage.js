// 请求房间报修项目明细



var requestMaintainList = function(pageNum){
    var startDate = "";
    var endDate = "";
    var roomNum = "";


	console.log('{"pageNum":'+ pageNum +',"from":"'+ startDate +'","to":"'+ endDate +'","rnum":"' + roomNum + '"}');
	$.ajax({
		url:'/LD/problem/searchProblemsManage.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		data:'{"pageNum":'+ pageNum +',"from":"'+ startDate +'","to":"'+ endDate +'","rnum":"' + roomNum + '"}',
		success:function(data) {
            console.log(data);

            // 清空列表
            $("#maintainManageTbody").html("");
            $("#maintainManageBottom").html("");

            if (data.recordTotal == 0) {
                $("#maintainManageTbody").append("<tr><td colspan='13' style='color: #ff4d4d;'>没有相关信息！</td></tr>");
                return;
            } else {
                for (var i = 0; i < data.pageList.length; i++) {
                    var perRecord = data.pageList[i];
                    var description = perRecord.description == null ? '' : perRecord.description;

                    $("#maintainManageTbody").append("<tr class='trOne'>"
                        + "<td>" + perRecord.roomNum + "</td>"
                        + "<td>" + perRecord.des + "</td>"
                        + "<td>" + perRecord.problemState + "</td>"
                        + "<td colspan='2'>" + dealDate(perRecord.reportDate) + "</td>"
                        + "<td>" + dealDate(perRecord.solveDate) + "</td>"
                        + "<td>" + perRecord.unSolveDay + "</td>"
                        + "<td rowspan='2'>" + "添加图片" + "</td>"
                        + "<td colspan='2'>" + perRecord.last_reply_des + "</td>"
						+ "<td>" + perRecord.infoSource + "</td>"
						+ "<td rowspan='2'>" + perRecord.fare + "</td>"
						+ "<td><a class='detail' style='background-color: red;border: 1px solid black;' onclick='delayDeal(" + perRecord.problemID + ")'>搁置处理</a></td></tr><tr>"
						+ "<td>" + perRecord.roomState + "</td>"
						+ "<td>" + perRecord.comment + "</td>"
						+ "<td>" + perRecord.level + "</td>"
						+ "<td>" + perRecord.problemType + "</td>"
						+ "<td>" + perRecord.subType + "</td>"
						+ "<td>" + dealDate(perRecord.lase_reply_date) + "</td>"
						+ "<td>" + perRecord.reportState + "</td>"
                        + "<td><a class='detail' style='background-color: green;border: 1px solid black;' href='maintainNew.jsp?ID=" + perRecord.problemID +"'>" + "添加</a></td>"
                        + "<td><a class='detail' style='background-color: green;border: 1px solid black;' href='maintainProblemHistory.jsp?ID=" + perRecord.problemID + "&ROOM=" + perRecord.roomNum + "&DES=" + perRecord.des
						+ "&STATE=" + perRecord.problemState + "&DATE=" + dealDate(perRecord.reportDate) + "&ROOMSTATE=" +perRecord.roomState
						+ "&COMMENT=" + perRecord.comment + "&LEVEL=" + perRecord.level + "&TYPE=" + perRecord.problemType + "&SUBTYPE=" + perRecord.subType + "'>查看历史回复</a></td>"
						+ "<td>" + perRecord.department + "</td>"
						+ "<td><a class='detail' style='background-color: red;border: 1px solid black;' onclick='deleteProblem(" + perRecord.problemID + ")'>" + "删除" + "</a></td></tr>");
                }

                // 添加维修管理 底部页码
                $("#maintainManageBottom").append("<div class='bottom-page'>" +
                    "<span class='page-before' onclick='requestBeforeMaintain();'>上一页&nbsp;&nbsp;</span>" +
                    "<span><input id='maintain_nowpage' value='" + data.pageNow + "' type='text' class='input_num'></span>" +
                    "<span>&nbsp;/&nbsp;</span>" +
                    "<span id='maintain_totalpage'>" + data.pageTotal + "</span>" +
                    "<span class='page-next' onclick='requestNextMaintain();'>&nbsp;&nbsp;下一页</span>" +
                    "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;" + data.recordTotal + "&nbsp;</span>条记录</div>");

            }
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
	console.log(date)
	var dateArray = date.split(" 至 ");
	var startDate = dateArray[0];
	var endDate = dateArray[1];
	var roomNum = $("#searchRoomNum").val();

    console.log('{"pageNum":'+ pageNum +',"from":"'+ startDate +'","to":"'+ endDate +'","rnum":"' + roomNum + '"}');
    $.ajax({
        url:'/LD/problem/searchProblemsManage.action',
        type:'post',
        dataType:'json',
        contentType:'application/json',
        data:'{"pageNum":'+ pageNum +',"from":"'+ startDate +'","to":"'+ endDate +'","rnum":"' + roomNum + '"}',
        success:function(data) {
            console.log(data);

            // 清空列表
            $("#maintainManageTbody").html("");
            $("#maintainManageBottom").html("");

            if (data.recordTotal == 0) {
                $("#maintainManageTbody").append("<tr><td colspan='13' style='color: #ff4d4d;'>没有相关信息！</td></tr>");
                return;
            } else {
                for (var i = 0; i < data.pageList.length; i++) {
                    var perRecord = data.pageList[i];
                    var description = perRecord.description == null ? '' : perRecord.description;

                    $("#maintainManageTbody").append("<tr class='trOne'>"
                        + "<td>" + perRecord.roomNum + "</td>"
                        + "<td>" + perRecord.des + "</td>"
                        + "<td>" + perRecord.problemState + "</td>"
                        + "<td colspan='2'>" + dealDate(perRecord.reportDate) + "</td>"
                        + "<td>" + dealDate(perRecord.solveDate) + "</td>"
                        + "<td>" + perRecord.unSolveDay + "</td>"
                        + "<td rowspan='2'>" + "添加图片" + "</td>"
                        + "<td colspan='2'>" + perRecord.last_reply_des + "</td>"
                        + "<td>" + perRecord.infoSource + "</td>"
                        + "<td rowspan='2'>" + perRecord.fare + "</td>"
                        + "<td><a class='detail' style='background-color: red;border: 1px solid black;' onclick='delayDeal(" + perRecord.problemID + ")'>搁置处理</a></td></tr><tr>"
                        + "<td>" + perRecord.roomState + "</td>"
                        + "<td>" + perRecord.comment + "</td>"
                        + "<td>" + perRecord.level + "</td>"
                        + "<td>" + perRecord.problemType + "</td>"
                        + "<td>" + perRecord.subType + "</td>"
                        + "<td>" + dealDate(perRecord.lase_reply_date) + "</td>"
                        + "<td>" + perRecord.reportState + "</td>"
                        + "<td><a class='detail' style='background-color: green;border: 1px solid black;' href='maintainNew.jsp?ID=" + perRecord.problemID +"'>" + "添加</a></td>"
                        + "<td><a class='detail' style='background-color: green;border: 1px solid black;' href='maintainProblemHistory.jsp?ID=" + perRecord.problemID + "&ROOM=" + perRecord.roomNum + "&DES=" + perRecord.des
                        + "&STATE=" + perRecord.problemState + "&DATE=" + dealDate(perRecord.reportDate) + "&ROOMSTATE=" +perRecord.roomState
                        + "&COMMENT=" + perRecord.comment + "&LEVEL=" + perRecord.level + "&TYPE=" + perRecord.problemType + "&SUBTYPE=" + perRecord.subType + "'>查看历史回复</a></td>"
                        + "<td>" + perRecord.department + "</td>"
                        + "<td><a class='detail' style='background-color: red;border: 1px solid black;' onclick='deleteProblem(" + perRecord.problemID + ")'>" + "删除" + "</a></td></tr>");
                }

                // 添加维修管理 底部页码
                $("#maintainManageBottom").append("<div class='bottom-page'>" +
                    "<span class='page-before' onclick='requestBeforeMaintain();'>上一页&nbsp;&nbsp;</span>" +
                    "<span><input id='maintain_nowpage' value='" + data.pageNow + "' type='text' class='input_num'></span>" +
                    "<span>&nbsp;/&nbsp;</span>" +
                    "<span id='maintain_totalpage'>" + data.pageTotal + "</span>" +
                    "<span class='page-next' onclick='requestNextMaintain();'>&nbsp;&nbsp;下一页</span>" +
                    "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;" + data.recordTotal + "&nbsp;</span>条记录</div>");

            }
        }

    });
};

///////////////////////////////////////////////////
// // 显示确认修复弹出框
// var showConfirmDiv = function(element){
// 	showPopMenu("confirmMenu");
// };
// 关闭确认修复弹出框
var closeConfirmDiv = function(){
	closePopMenu("confirmMenu");
};
// // 请求确认修复
// var requestConfirmMaintain = function(){
// 	var price = Number($("#confirmMenu input").val());
// 	console.log("维修费用：" + price);
// 	closeConfirmDiv();
// 	// $.ajax({
// 	// 	url:'/LD/userRoom/buyGoods.action',
// 	// 	type:'post',
// 	// 	contentType:'application/json',
// 	// 	dataType:'json',
// 	// 	data:'{}',
// 	// 	success:function(data){
// 	// 		console.log(data);
// 	// 	}
// 	// });
// };


var dealDate = function(date){
	if(date == null){
		return "";
	}else{
		return formatDateForm(new Date(date));
	}
}


var deleteProblem = function(problemID) {
	// 删除操作删掉problem一条记录和problemreply对应的所有记录
	$.ajax({
        url:'/LD/problem/deleteInProblemManage.action',
            type:'post',
            dataType:'json',
            contentType:'application/json',
            data:'{"ID":'+ problemID  + '}',
            success:function(data) {
                console.log(data);
                if (data >= 1) {
                    requestMaintainList(1);
                } else {
					showModalBox("error","删除失败！");
                }
            }

	});
}


var delayDeal = function(problemID){
	//将problemdelay 中problemState状态加入搁置处理
    $.ajax({
        url:'/LD/problem/delayDealInProblemManage.action',
        type:'post',
        dataType:'json',
        contentType:'application/json',
        data:'{"ID":'+ problemID  + '}',
        success:function(data) {
            console.log(data);
            if (data == 1) {
                showModalBox("success","操作成功！");
            } else {
                showModalBox("error","操作失败！");

            }
        }

    });

}