(function(){
	$("#serviceRoomNumber").focus(function(){
		$(this).removeClass("border-red");
		$("#roomIdWarning").css("display","none");
	});

	// 事件冒泡（隐藏下拉菜单）
	$(document).on("click",function(e){
		$(".dropDownMenu").css("display","none");
		
	})

	// 显示问题分类下拉菜单
	$("#dropDownInput").click(function(e){
		$(".dropDownMenu").css("display","block");
		
		// 阻止事件冒泡
		e.stopPropagation();
	});
	// 选择问题分类
	$(".dropDownMenu li").click(function(){
		$("#dropDownInput").val($(this).text());
	});

    //表头固定 lyd
    var tableH = $("table thead tr").offset().top;
    console.log(tableH)
    $(window).scroll(function(){
        var scroH = $(this).scrollTop();

        if(scroH >= tableH){
            //$("table thead ").css({"position":"fixed","top":0});
            $("table thead tr").addClass("fixedThead");
            $("table thead tr th,table td").css({"width":"79px","height":"56px"});
            $("table thead tr th:nth-child(3),table td:nth-child(3)").css({"width":"108px"});
            $("table thead tr th:nth-child(4),table td:nth-child(4)").css({"width":"74px"});
            $("table thead tr th:nth-child(5),table td:nth-child(5)").css({"width":"83px"});
            $("table thead tr th:nth-child(6),table td:nth-child(6)").css({"width":"93px"});
            $("table thead tr th:nth-child(7),table td:nth-child(7)").css({"width":"93px"});
            $("table thead tr th:nth-child(8),table td:nth-child(8)").css({"width":"130px"});
            $("table thead tr th:nth-child(9),table td:nth-child(9)").css({"width":"134px"});
            $("table thead tr th:nth-child(10),table td:nth-child(10)").css({"width":"134px"});
            $("table thead tr th:nth-child(11),table td:nth-child(11)").css({"width":"91px"});


        }else if(scroH < tableH){
            $("table thead tr").removeClass("fixedThead");
        }
    })


})();





// 按房间号和日期查询接送机信息
var searchBusOther = function(pageNum){
	var roomNum = $("#searchRoomNum").val();
	var date = $("#date_demo3").val();

	console.log("查询房间号：" + roomNum + " 日期：" + date + "的车费信息");

	$.ajax({
		url:'/LD/userRoom/searchOtherFaresByPage.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		data:'{"roomNum":"'+ roomNum +'","occurTime":"'+ date +'","pageNum":'+ pageNum +'}',
		success:function(data){
			console.log(data);
			
			// 清空表格
			$("#busPlaneTbody").html("");
			$("#busPlaneBottom").html("");

			if (data.recordTotal == 0) {
				$("#busPlaneTbody").append("<tr><td colspan='11' style='color: #ff4d4d;'>没有相关信息！</td></tr>");
				//总计
				$("#total").html("0");
				return;
			} else {

				//总计
				var sum = data.totalPrice;
				$("#total").html(sum);

				for (var i = 0; i < data.pageList.length; i++) {
					var perRecord = data.pageList[i];
					var payMode = perRecord.pay_MODE == 0 ? "现金" : "月结";
					$("#busPlaneTbody").append("<tr>"
						+"<td>"+ perRecord.room_NUM +"</td><td>"+ perRecord.guest_NAME +"</td>"
						+"<td>"+ perRecord.usage_TYPE +"</td><td>"+ payMode +"</td>"
						+"<td>"+ perRecord.total_PRICE +"</td><td>"+ perRecord.comment +"</td>"
						+"<td>"+ perRecord.staff_NAME +"</td>"
						+"<td>"+ formatDateForm(new Date(perRecord.occur_TIME)) +"</td>"
						+"<td>"+ formatDate(new Date(perRecord.import_TIME)) +"</td>"
						+"<td>"+ formatDate(new Date(perRecord.edit_TIME)) +"</td>"
						+"<td><a id='editLink' href='serviceBusOtherEdit.jsp?id="+ perRecord.id +"'>编辑</a><a id='deleteLink' onclick='serviceBusOtherDelete("+ perRecord.id +")'>删除</a></td></tr>");
				}
				// 添加车费 底部页码
				$("#busPlaneBottom").append("<div class='bottom-page'>"+
		        	"<span class='page-before' onclick='requestBeforeBusOther();'>上一页&nbsp;&nbsp;</span>"+
		        	"<span><input id='fare_nowpage' value='"+ data.pageNow +"' type='text' class='input_num'></span>"+
		        	"<span>&nbsp;/&nbsp;</span>"+
		        	"<span id='fare_totalpage'>"+ data.pageTotal +"</span>"+
		            "<span class='page-next' onclick='requestNextBusOther();'>&nbsp;&nbsp;下一页</span>" +
		            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ data.recordTotal +"&nbsp;</span>条记录</div>");

                $(".bottom").wrap("<div class='fixedBottom'></div>");
			}
		}
	});
};
//拉取上一页 车费信息
var requestBeforeBusOther = function(){
	var nowpage = parseInt($("#fare_nowpage").val());
	if(nowpage == 1) return;
	searchBusOther(nowpage - 1);
};

// 拉取下一页 车费信息
var requestNextBusOther = function(){
	var nowpage = parseInt($("#fare_nowpage").val());
	var totalpage = parseInt($("#fare_totalpage").text());
	if(nowpage == totalpage) return;
	searchBusOther(nowpage + 1);
};

/////////////////////////////////////////////////////// 添加接送机车费记录
var addBusOther = function(){
	// 判断房间号是否为空
	if($("#serviceRoomNumber").val() == ""){
		$("#roomIdWarning").css("display","block");
		$("#serviceRoomNumber").addClass("border-red");
		console.log("房间号为空！");
		return;
	}
	requestAddBusOther();
};
// 请求添加接送机记录
var requestAddBusOther = function(){
	console.log("添加其它车费记录");

	// 其他字段输入结果
	var roomNum = $("#serviceRoomNumber").val();
	var guestName = $(".body-content input").eq(1).val();

	var usage = $(".body-content input").eq(2).val();
	var occurTime = formatDateForm(new Date($(".pack_maintain").val()));
	var totalPrice = $(".body-content input").eq(4).val();
	var stuffName = $(".body-content input").eq(5).val();
	var comment = $(".body-content input").eq(6).val();
	var payMode = $("#eventType").prop("checked") == true ? 0 : 1;


	console.log(roomNum);

	$.ajax({
		url:'/LD/userRoom/addOtherFare.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify({"roomNum" : roomNum,
							 "guestName" : guestName,
							 "usageType" : usage,
							 "occurTime" : occurTime,
							 "totalPrice" : totalPrice,
							 "staffName" : stuffName,
							 "comment" : comment,
							 "payMode" : payMode}),
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

//根据id号查询其他车费记录
var searchBusOtherEdit = function(id){
	console.log("查询"+ id +"号其它车费记录");
	$.ajax({
		url:'/LD/userRoom/searchOtherFareById.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify({"id":id}),
		success:function(data){
			console.log(data);
			if(data.State == "Valid"){
				if(data.record != null){
					record = data.record;
					$("#serviceRoomNumber").val(record.room_NUM);
					$(".body-content input").eq(1).val(record.guest_NAME);

					$(".body-content input").eq(2).val(record.usage_TYPE);
					$(".pack_maintain").val(formatDateForm(new Date(record.occur_TIME)));
					$(".body-content input").eq(4).val(record.total_PRICE);
					$(".body-content input").eq(5).val(record.staff_NAME);
					$(".body-content input").eq(6).val(record.comment);
					if(record.pay_MODE == 0) {
						$("#eventType").prop("checked",true);
					} else {
						$("#eventType").next().next().prop("checked",true);
					}
				}
			} else {
				showModalBox("error","无操作权限");
			}
		}
	});
}

//根据id删除通勤车记录
var serviceBusOtherDelete = function(id){
	console.log("删除"+ id +"号其它车费记录");
	$.ajax({
		url:'/LD/userRoom/deleteOtherFareById.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify({"id":id}),
		success:function(data){
			console.log(data);
			if(data == 1){
				showModalBox("success","删除成功");
				searchBusOther(1); //重新查一遍
			}else if(data == 0){
				showModalBox("error","删除失败");
			}
		}
	});
};

var updateBusOther = function(id){
	
	console.log("请求更新"+id+"号其它车费记录");

	//获取字段
	var roomNum = $("#serviceRoomNumber").val();
	var usage = $(".body-content input").eq(2).val();
	var occurTime = formatDateForm(new Date($(".pack_maintain").val()));
	var totalPrice = $(".body-content input").eq(4).val();
	var staffName = $(".body-content input").eq(5).val();
	var comment = $(".body-content input").eq(6).val();
	var payMode = $("#eventType").prop("checked") == true ? 0 : 1;


	$.ajax({
		url:'/LD/userRoom/updateOtherFareById.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify({"id" : id,
							 "roomNum" : roomNum,
							 "usageType" : usage,
							 "occurTime" : occurTime,
							 "totalPrice" : totalPrice,
							 "staffName" : staffName,
							 "comment" : comment,
							 "payMode" : payMode}),
		success:function(data){
			console.log(data);
			if(data == 1){
				showModalBox("success","更新成功！");
			}else if(data == 0){
				showModalBox("error","更新失败！");
			}
		}
	});
};

//-----------客房服务页面公有的-------------------------------------

//客户姓名联动
var associateGuestName = function(element){

	var roomNum = $(element).val(); //这里是需要根据页面元素变的
	$.ajax({
		url:'/LD/userRoom/searchGuestName.action',
		type:'post',
		dataType:'json',
		data:'{"roomNum":"'+ roomNum +'"}',
		contentType:'application/json',
		success:function(data){
			console.log(data);

			if(data.State == "Valid") {
				if(data.guest_NAME != null) {
					$(".body-content input").eq(1).val(data.guest_NAME); //这里是需要根据页面元素变的
				} else {
					$(".body-content input").eq(1).val("尚无客户，请重新填写房间号");
				}
			} else {
				showModalBox("error", "无操作权限");
			}
		}
	});

};


//导出其它费用列表至 excel中
var exportList = function(){
    var BB = self.Blob;
    var fileName = "BusOtherList_" + formatDateDot(new Date()) + ".csv";
    var content = ",,,,,其它车费记录表\n房间号,客户姓名,用车种类,支付方式,金额,备注,操作人,发生时间,上传时间,最后编辑时间\n";
    
    //根据当前房间号与日期编辑框的查询内容，请求所有记录（不分页）
	var roomNum = $("#searchRoomNum").val();
	var date = $("#date_demo3").val();
	console.log("查询房间号：" + roomNum + " 日期：" + date + "的所有接送机信息");
	$.ajax({
		url:'/LD/userRoom/searchAllOtherFares.action',
		type:'post',
		dataType:'json',
		data:'{"date":"'+ date +'","roomNum":"'+ roomNum +'"}',
		contentType:'application/json',
		success:function(data){
			console.log(data);

			(data.dataList).map(function(record){
	
				content += record.room_NUM + "," + 
						   record.guest_NAME + "," + 
						   record.usage_TYPE + "," +
						   (record.pay_MODE == 0 ? "现金" : "月结") + "," + 
						   record.total_PRICE + "," +
						   record.comment + "," +
						   record.staff_NAME + "," + 
						   formatDateForm(new Date(record.occur_TIME)) + "," + 
						   formatDate(new Date(record.import_TIME)) + "," + 
						   formatDate(new Date(record.edit_TIME)) + "\n";
			});

			saveAs(new BB(["\ufeff" + content] , {type: "text/plain;charset=utf8"}), fileName);
		}
	});
};

//打印其它车费
var printList = function()  
{  
	printData = [];

	//根据当前房间号与日期编辑框的查询内容，请求所有记录（不分页）
	var roomNum = $("#searchRoomNum").val();
	var date = $("#date_demo3").val();
	console.log("查询房间号：" + roomNum + " 日期：" + date + "的所有其它费用信息");
	$.ajax({
		url:'/LD/userRoom/searchAllOtherFares.action',
		type:'post',
		dataType:'json',
		data:'{"date":"'+ date +'","roomNum":"'+ roomNum +'"}',
		contentType:'application/json',
		success:function(data){
			console.log(data);

			(data.dataList).map(function(record){
			

				curRow = {};
				curRow["房间号"] = record.room_NUM;
				curRow["客户姓名"] = record.guest_NAME;
				curRow["用车种类"] = record.usage_TYPE;
				curRow["支付方式"] = record.pay_MODE == 0 ? "现金" : "月结";
				curRow["金额"] = record.total_PRICE;
				curRow["备注"] = record.comment;
				curRow["操作人"] = record.staff_NAME;
				curRow["发生时间"] = formatDateForm(new Date(record.occur_TIME));
				curRow["上传时间"] = formatDate(new Date(record.import_TIME));
				curRow["最后编辑时间"] = formatDate(new Date(record.edit_TIME));

				printData.push(curRow);
			});

			//打印
 			printJS({printable: printData, 
 			 		 properties: ['房间号','客户姓名','用车种类','支付方式','金额','备注','操作人','发生时间','上传时间','最后编辑时间'], 
 			 		 type: 'json',
 		     	     font_size: '8pt'});
		}
	});
};
