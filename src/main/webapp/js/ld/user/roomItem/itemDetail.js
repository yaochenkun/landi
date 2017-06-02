// 物品ID
var facID = Number($("#facID").text());

// 请求物品库存信息
var requestFacSta = function(){
	console.log("请求物品编号：" + facID + "的库存情况");

	$.ajax({
		url:'/LD/userItem/searchFacSta.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		data:'{"facID":'+ facID +'}',
		success:function(data){
			console.log(data);
			// 物品种类、子类、品牌、名称
			$(".fac-title .type").text(data.fac.type);
			$(".fac-title .cat").text(data.fac.cat);
			$(".fac-title .com").text(data.fac.brand);
			$(".fac-title .name").text(data.fac.name);
            $(".fac-title .owner").text(data.fac.owner);
			// 总量、可用、已分配、报废
			$(".fac-sta .count").eq(0).text(data.fac.total);
			$(".fac-sta .count").eq(1).text(data.fac.free);
			$(".fac-sta .count").eq(2).text(data.fac.total - data.fac.free);
			$(".fac-sta .count").eq(3).text(data.fac.working);
			$(".fac-sta .count").eq(4).text(data.fac.maintain);
			$(".fac-sta .count").eq(5).text(data.fac.bad);
		}
	});
};

// 请求物品分配信息
var requestRoomItem = function (pageNum) {
	console.log("请求物品编号：" + facID + "第" + pageNum +"页的房间分配情况");
	$.ajax({
		url:'/LD/userItem/searchFacDetail.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		data:'{"facID":'+ facID +',"pageNum":'+ pageNum +'}',
		success:function(data){
			console.log(data);

			// // 清空物品详细信息
			$("#facDetailTbody").html("");
			$("#roomItemBottom").html("");

			var pageNow = data.pageNow;
			var pageTotal = data.pageTotal;
			var recordTotal = data.recordTotal;

			if (recordTotal == 0) {
				$("#facDetailTbody").append("<tr><td colspan='9'>没有相关信息！</td></tr>");
			} else {
				for(var i = 0; i < data.pageList.length; i++){
					var perFac = data.pageList[i];

					var operateHtml = "<span class='blue' onclick='transferFac(this);''>转移</span>"+
                        "<span class='blue' onclick='showBackModal(this);'>回仓库</span>"+
                        "<span class='gray' onclick='showTurnfacRepairModal(this);'>维修</span>"+
                        "<span class='gray' onclick='requestFacBad(this);'>报废</span>";
					if(perFac.state == "维修中")
						operateHtml = "<span class='blue' onclick='finishRepair(this);''>维修完成</span>" +
                            "<span class='gray' onclick='requestFacRepairToBad(this);'>报废</span>";

					$("#facDetailTbody").append("<tr><td>"+ perFac.room_NUM +"</td>"+
						"<td>"+ perFac.tag +"</td><td>"+ perFac.allocate_TYPE +"</td>"+
                        "<td>"+ (perFac.borrow_DATE == null ? "-" : formatDateForm(new Date(perFac.borrow_DATE))) +"</td><td>"+ (perFac.return_DATE == null ? "-" : formatDateForm(new Date(perFac.return_DATE))) +"</td>"+
                        "<td>"+ perFac.state +"</td><td>"+ (perFac.maintain_DURATION == null ? "-" : perFac.maintain_DURATION + "&nbsp;天") +"</td>"+
                        "<td>"+ perFac.comm +"</td>"+
						"<td>"+ operateHtml +
						"<span class='recID' style='display:none;'>"+ perFac.id +"</span></td></tr>");
				}
				// 添加物品总览 底部页码
				$("#roomItemBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeRoomItem();'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='roomItem_nowpage' value='"+ pageNow +"' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='roomItem_totalpage'>"+ pageTotal +"</span>"+
			            "<span class='page-next' onclick='requestNextRoomItem();'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ recordTotal +"&nbsp;</span>条记录</div>");
			}
		}
	});
};
// 请求上一页房间物品分配信息
var requestBeforeRoomItem = function(){
	var nowpage = parseInt($("#roomItem_nowpage").val());
	if(nowpage == 1) return;

	requestRoomItem(nowpage-1);
};
// 请求下一页房间物品分配信息
var requestNextRoomItem = function(){
	var nowpage = parseInt($("#roomItem_nowpage").val());
	var totalpage = parseInt($("#roomItem_totalpage").text());
	if(nowpage == totalpage) return;

	requestRoomItem(nowpage+1);
};


// 显示转移物品弹出框
var transferFac = function(element){
	$(".shadow").css("display","block");
	$('#transferMenu').css("display","block");

 	setTimeout(function(){$('#transferMenu').addClass('showMenuModal');},50);
	$("#transferMenu").addClass("effect-fade");

	// 即将转移物品在数据库表中的id
	var recID = $(element).parent().children(".recID").text();
	$("#transferMenu .rec-id").text(recID);

	var roomNumber = $(element).parent().parent().children("td").eq(0).text();
	$("#transferMenu .roomNumber").text(roomNumber);

};
// 关闭转移物品弹出框
var closeTransferDiv = function(){
	$(".shadow").css("display","none");
	$("#transferMenu").removeClass('showMenuModal');
	setTimeout(function(){$("#transferMenu").css("display","none");},200);
};
// 请求转移物品
var requestTransferFac = function(){
	var recID = Number($("#transferMenu .rec-id").text());
	var rNum = $("#transferMenu input").eq(0).val();
	var allocateType = $("#transferMenu input").eq(1).prop("checked") == true ? "分配" : "借用";
	var borrowDate = allocateType == "分配" ? null : formatDateForm(new Date($("#transferMenu input").eq(3).val()));
    var returnDate = allocateType == "分配" ? null : formatDateForm(new Date($("#transferMenu input").eq(4).val()));

	$.ajax({
		url:'/LD/userItem/transferFac.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		data:JSON.stringify({"recID" : recID,
							"rNum" : rNum,
							"allocateType" : allocateType,
							"borrowDate" : borrowDate,
							"returnDate" : returnDate}),
		success:function(data){
			console.log(data);
			if(data == 1){
				closeTransferDiv();
				showModalBox("success","转移成功！");
				requestRoomItem(1);
			} else {
				showModalBox("error","转移失败 ！");
			}
		}
	});
};



// 请求物品回仓库
var requestToWarehouse = function(){


    var recID = Number($("#backMenu .rec-id").text());
	var repoNum = $("#backMenu #repo-number input").val();


	// 将物品回仓库
	$.ajax({
		url:'/LD/userItem/toWarehouse.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		data:JSON.stringify({"recID" : recID,
            "repoNum" : repoNum}),
		success:function(data){
			console.log(data);
			if(data == 1){
				showModalBox("success","回仓库成功！");
				requestFacSta();
				requestRoomItem(1);
				closeBackDiv();
			} else {
				showModalBox("error","回仓库失败！");
			}
		}
	});
};

// 显示新维修物品弹出框
var showTurnfacRepairModal = function(element){
    $(".shadow").css("display","block");
    $('#turnRepairMenu').css("display","block");

    var recID = $(element).parent().children(".recID").text();
    $("#turnRepairMenu .rec-id").text(recID);

    setTimeout(function(){$('#turnRepairMenu').addClass('showMenuModal');},50);
    $("#turnRepairMenu").addClass("effect-fade");
};
// 关闭新维修物品弹出框
var closeTurnRepairDiv = function(){
    $(".shadow").css("display","none");
    $("#turnRepairMenu").removeClass('showMenuModal');
    setTimeout(function(){$("#turnRepairMenu").css("display","none");},200);
};


// 请求物品维修
var requestFacRepair = function(){
    var recID = Number($("#turnRepairMenu .rec-id").text());
    var maintainDuration = Number($("#turnRepairMenu input").val());

    $.ajax({
        url:'/LD/userItem/facRepair.action',
        type:'post',
        dataType:'json',
        contentType:'application/json',
        data:JSON.stringify({"recID" : recID, "maintainDuration" : maintainDuration}),
        success:function(data){
            console.log(data);
            if(data == 1){
            	closeTurnRepairDiv();
                showModalBox("success","报修成功！");
                requestFacSta();
                requestRoomItem(1);
            } else {
                showModalBox("error","报修失败！");
            }
        }
    });
};

//请求维修完成
var finishRepair = function(element) {

    var recID = Number($(element).parent().children(".recID").text());

    //考察该物品是否不在任何房间
	var isIsolated = true;
	var roomNum = $(element).parent().parent().children("td").eq(0).text();

	if(roomNum != '-')
        isIsolated = false;

    //请求维修完成
    $.ajax({
        url:'/LD/userItem/facFinishRepair.action',
        type:'post',
        dataType:'json',
        contentType:'application/json',
        data:JSON.stringify({"recID" : recID, "isIsolated" : isIsolated}),
        success:function(data){
            console.log(data);
            if(data == 1){
                showModalBox("success","维修成功！");
                requestFacSta();
                requestRoomItem(1);
            } else {
                showModalBox("error","维修失败！");
            }
        }
    });
};


// 请求物品报废
var requestFacBad = function(element){
	var recID = Number($(element).parent().children(".recID").text());

	$.ajax({
		url:'/LD/userItem/facBad.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		data:'{"recID":'+ recID +'}',
		success:function(data){
			console.log(data);
			if(data == 1){
				showModalBox("success","报废成功！");
				requestFacSta();
				requestRoomItem(1);
			} else {
				showModalBox("error","报废失败！");
			}
		}
	});
};

// 请求物品报废（从维修中到报废）
var requestFacRepairToBad = function(element){
    var recID = Number($(element).parent().children(".recID").text());

    $.ajax({
        url:'/LD/userItem/facRepairToBad.action',
        type:'post',
        dataType:'json',
        contentType:'application/json',
        data:'{"recID":'+ recID +'}',
        success:function(data){
            console.log(data);
            if(data == 1){
                showModalBox("success","报废成功！");
                requestFacSta();
                requestRoomItem(1);
            } else {
                showModalBox("error","报废失败！");
            }
        }
    });
};

// 显示新分配物品弹出框
var showDistributeModal = function(){
	$(".shadow").css("display","block");
	$('#newDistributeMenu').css("display","block");

 	setTimeout(function(){$('#newDistributeMenu').addClass('showMenuModal');},50);
	$("#newDistributeMenu").addClass("effect-fade");
};
// 关闭新分配物品弹出框
var closeDistributeDiv = function(){
	$(".shadow").css("display","none");
	$("#newDistributeMenu").removeClass('showMenuModal');
	setTimeout(function(){$("#newDistributeMenu").css("display","none");},200);
};
// 请求新分配物品
var requestNewDistribute = function(){
	var rNum = $("#newDistributeMenu #room-number input").val();
	console.log("新分配物品"+ facID +"至房间："+rNum);
	var tag = $("#newDistributeMenu #tag-name input").val();
	var comment = $("#newDistributeMenu #fac-comment input").val();
	$.ajax({
		url:'/LD/userItem/newDistribute.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		data:'{"facID":'+ facID +',"rNum":"'+ rNum +'","tag":"'+ tag +'","comment":"'+ comment +'"}',
		success:function(data){
			if(data == 1){
				closeDistributeDiv();
				showModalBox("success","分配成功！");
				requestFacSta();
				requestRoomItem(1);
			} else if(data == 0){
				showModalBox("error","分配失败！请检查闲置数量是否足够");
			}
		}
	});
};

// 请求新借用物品
var requestNewBorrow = function(){
    var rNum = $("#newBorrowMenu #room-number input").val();
    console.log("新借用物品"+ facID +"至房间："+rNum);
    var tag = $("#newBorrowMenu #tag-name input").val();
    var comment = $("#newBorrowMenu #fac-comment input").val();
    var borrowDate = formatDateForm(new Date($("#newBorrowMenu #borrow-date input").val()));
    var returnDate = formatDateForm(new Date($("#newBorrowMenu #return-date input").val()));


    $.ajax({
        url:'/LD/userItem/newBorrow.action',
        type:'post',
        dataType:'json',
        contentType:'application/json',
		data:JSON.stringify({"facID" : facID,
							 "rNum" : rNum,
			                 "tag" : tag,
							 "comment" : comment,
							 "borrowDate" : borrowDate,
							 "returnDate" : returnDate}),

        success:function(data){
            if(data == 1){
                closeBorrowDiv();
                showModalBox("success","借用成功！");
                requestFacSta();
                requestRoomItem(1);
            } else if(data == 0){
                showModalBox("error","借用失败！请检查闲置数量是否足够");
            }
        }
    });
};


// 显示新借用物品弹出框
var showNewfacBorrowModal = function(){
	$(".shadow").css("display","block");
	$('#newBorrowMenu').css("display","block");

 	setTimeout(function(){$('#newBorrowMenu').addClass('showMenuModal');},50);
	$("#newBorrowMenu").addClass("effect-fade");
};
// 关闭新借用物品弹出框
var closeBorrowDiv = function(){
	$(".shadow").css("display","none");
	$("#newBorrowMenu").removeClass('showMenuModal');
	setTimeout(function(){$("#newBorrowMenu").css("display","none");},200);
};

//request请求数据


// 显示新维修物品弹出框
var showNewfacRepairModal = function(){
	$(".shadow").css("display","block");
	$('#newRepairMenu').css("display","block");

 	setTimeout(function(){$('#newRepairMenu').addClass('showMenuModal');},50);
	$("#newRepairMenu").addClass("effect-fade");
};
// 关闭新维修物品弹出框
var closeRepairDiv = function(){
	$(".shadow").css("display","none");
	$("#newRepairMenu").removeClass('showMenuModal');
	setTimeout(function(){$("#newRepairMenu").css("display","none");},200);
};

// 显示放回物品弹出框
var showBackModal = function(element){

    $(".shadow").css("display","block");
    $('#backMenu').css("display","block");

    setTimeout(function(){$('#backMenu').addClass('showMenuModal');},50);
    $("#backMenu").addClass("effect-fade");

    // 即将放回的物品在数据库表中的id
    var recID = $(element).parent().children(".recID").text();
    $("#backMenu .rec-id").text(recID);


    //查询该物品当前所在的仓库号
    $.ajax({
        url:'/LD/userItem/getFacRepoNum.action',
        type:'post',
        dataType:'json',
        contentType:'application/json',
        data:JSON.stringify({"recID" : recID}),
        success:function(data){
        	console.log(data);
            if(data != null){

            	//将仓库号输入框默认设置为该值
				$("#backMenu #repo-number input").val(data);
            }
        }
    });
};
// 关闭放回物品弹出框
var closeBackDiv = function(){
    $(".shadow").css("display","none");
    $("#backMenu").removeClass('showMenuModal');
    setTimeout(function(){$("#backMenu").css("display","none");},200);
};


//request请求















// 显示新报废弹出框
var showNewfacBadModal = function(){
	$(".shadow").css("display","block");
	$('#facBadMenu').css("display","block");

 	setTimeout(function(){$('#facBadMenu').addClass('showMenuModal');},50);
	$("#facBadMenu").addClass("effect-fade");
};
// 关闭报废弹出框
var closeFacBadDiv = function(){
	$(".shadow").css("display","none");
	$("#facBadMenu").removeClass('showMenuModal');
	setTimeout(function(){$("#facBadMenu").css("display","none");},200);
};


// 请求新借用物品
var requestNewFacBorrow = function(){
    var count = Number($("#facBadMenu input").val());
    $.ajax({
        url:'/LD/userItem/newFacBorrow.action',
        type:'post',
        dataType:'json',
        contentType:'application/json',
        data:'{"facID":'+ facID +',"count":'+ count +'}',
        success:function(data){
            if(data == 1){
                closeFacBorrowDiv();
                showModalBox("success","借用成功！");
                requestFacSta();
                requestRoomItem(1);
            } else if(data == 0){
                showModalBox("error","借用失败！请检查是否有可借用物品");
            }
        }
    });
};



// 请求新维修物品
var requestNewFacRepair = function(){
    var maintainDuration = Number($("#newRepairMenu input").val());

    $.ajax({
        url:'/LD/userItem/newFacRepair.action',
        type:'post',
        dataType:'json',
        contentType:'application/json',
        data:JSON.stringify({"facID" : facID, "maintainDuration" : maintainDuration}),
        success:function(data){
            if(data == 1){
                closeRepairDiv();
                showModalBox("success","报修成功！");
                requestFacSta();
                requestRoomItem(1);
            } else if(data == 0){
                showModalBox("error","报修失败！请检查是否有可报修物品");
            }
        }
    });
};

// 请求新报废物品
var requestNewFacBad = function(){
	var count = Number($("#facBadMenu input").val());
	$.ajax({
		url:'/LD/userItem/newFacBad.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		data:'{"facID":'+ facID +',"count":'+ count +'}',
		success:function(data){
			if(data == 1){
				closeFacBadDiv();
				showModalBox("success","报废成功！");
				requestFacSta();
				requestRoomItem(1);
			} else if(data == 0){
				showModalBox("error","报废失败！请检查是否有可报废物品");
			}
		}
	});
};

//点击分配单选按钮
var checkAllocateRadio = function(){

    $("#transfer-borrow-date").hide();
    $("#transfer-return-date").hide();

};

//点击借用单选按钮
var checkBorrowRadio = function(){

    $("#transfer-borrow-date").show();
    $("#transfer-return-date").show();
};
