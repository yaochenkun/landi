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
		
		var waterType = $(this).text();
		$("#dropDownInput").val(waterType);
		
		//若是矿泉水弹出单价编辑框
		if(waterType == "矿泉水")
			$("#unitPrice").show();
		else
			$("#unitPrice").hide();
	});

    //表头固定 lyd
    var tableH = $("table thead tr").offset().top;
    console.log(tableH)
    $(window).scroll(function(){
        var scroH = $(this).scrollTop();

        if(scroH >= tableH){
            //$("table thead ").css({"position":"fixed","top":0});
            $("table thead tr").addClass("fixedThead");
            // $("table thead tr th,table td").css({"width":"110px","height":"56px"});
            // $("table thead tr th:nth-child(3),table td:nth-child(3)").css({"width":"160px"});
            // $("table thead tr th:nth-child(7),table td:nth-child(7)").css({"width":"134px"});
            // $("table thead tr th:nth-child(8),table td:nth-child(8)").css({"width":"172px"});
            // $("table thead tr th:nth-child(9),table td:nth-child(9)").css({"width":"84px"});


        }else if(scroH < tableH){
            $("table thead tr").removeClass("fixedThead");
        }
    })

})();





// 按房间号和日期查询饮用水费信息
var searchWaterBill = function(pageNum){
	var roomNum = $("#searchRoomNum").val();
    var date = $("#date_demo3").val();

	console.log("查询房间号：" + roomNum + " 日期：" + date + "的饮用水费信息");

	$.ajax({
		url:'/LD/userRoom/searchWaterBillsByPage.action',
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
				$("#busPlaneTbody").append("<tr><td colspan='15' style='color: #ff4d4d;'>没有相关信息！</td></tr>");
				return;
			} else {
				for (var i = 0; i < data.pageList.length; i++) {
					var perRecord = data.pageList[i];
					var payMode = perRecord.pay_MODE == 0 ? "现金" : "月结";
					$("#busPlaneTbody").append("<tr>"
						+"<td>"+ perRecord.room_NUM +"</td><td>"+ perRecord.guest_NAME +"</td>"
						+"<td>"+ perRecord.barrel_COUNT +"</td>"
						+"<td>"+ perRecord.barrel_REMAINCOUNT +"</td>"
						+"<td>"+ perRecord.barrel_LIMITCOUNT +"</td>"
						+"<td>"+ perRecord.bottle_COUNT +"</td>"
						+"<td>"+ perRecord.bottle_REMAINCOUNT +"</td>"
						+"<td>"+ perRecord.bottle_LIMITCOUNT +"</td>"
						+"<td>"+ payMode +"</td>"
						+"<td>"+ perRecord.excess_PRICE +" 元</td>"
						+"<td>"+ perRecord.comment +"</td>"
						+"<td>"+ formatDateForm(new Date(perRecord.occur_TIME)) +"</td>"
						+"<td>"+ formatDate(new Date(perRecord.import_TIME)) +"</td>"
						+"<td>"+ formatDate(new Date(perRecord.edit_TIME)) +"</td>"
						+"<td><a id='editLink' href='serviceWaterBillEdit.jsp?id="+ perRecord.id +"'>编辑</a><a id='deleteLink' onclick='serviceWaterBillDelete("+ perRecord.id +")'>删除</a></td></tr>");
				}
				// 添加饮用水费 底部页码
				$("#busPlaneBottom").append("<div class='bottom-page'>"+
		        	"<span class='page-before' onclick='requestBeforeWaterBill();'>上一页&nbsp;&nbsp;</span>"+
		        	"<span><input id='fare_nowpage' value='"+ data.pageNow +"' type='text' class='input_num'></span>"+
		        	"<span>&nbsp;/&nbsp;</span>"+
		        	"<span id='fare_totalpage'>"+ data.pageTotal +"</span>"+
		            "<span class='page-next' onclick='requestNextWaterBill();'>&nbsp;&nbsp;下一页</span>" +
		            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ data.recordTotal +"&nbsp;</span>条记录</div>");

                $(".bottom").wrap("<div class='fixedBottom'></div>");
			}
		}
	});
};
//拉取上一页 饮用水费信息
var requestBeforeWaterBill = function(){
	var nowpage = parseInt($("#fare_nowpage").val());
	if(nowpage == 1) return;
	searchWaterBill(nowpage - 1);
};

// 拉取下一页 饮用水费信息
var requestNextWaterBill = function(){
	var nowpage = parseInt($("#fare_nowpage").val());
	var totalpage = parseInt($("#fare_totalpage").text());
	if(nowpage == totalpage) return;
	searchWaterBill(nowpage + 1);
};

/////////////////////////////////////////////////////// 添加接送机饮用水费记录
var addWaterBill = function(){
	// 判断房间号是否为空
	if($("#serviceRoomNumber").val() == ""){
		$("#roomIdWarning").css("display","block");
		$("#serviceRoomNumber").addClass("border-red");
		console.log("房间号为空！");
		return;
	}
	requestAddWaterBill();
};
// 请求添加饮用水费记录
var requestAddWaterBill = function(){
	console.log("添加饮用水费费记录");

	// 其他字段输入结果
	var roomNum = $("#serviceRoomNumber").val();
	var waterType = $("#dropDownInput").val();
	var count = $(".body-content ul li").eq(7).children("input").val();
	var unitPrice = $("#unitPrice input").val();
	var occurTime = formatDateForm(new Date($(".pack_maintain").val()));
	var comment = $(".body-content ul li").eq(9).children("input").val();
	var payMode = $("#eventType").prop("checked") == true ? 0 : 1;


	$.ajax({
		url:'/LD/userRoom/addWaterBill.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify({"roomNum" : roomNum,
							 "waterType" : waterType,
							 "occurTime" : occurTime,
							 "count" : count,
							 "unitPrice" : unitPrice,
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

//根据id号查询其他饮用水费记录
var searchWaterBillEdit = function(id){
	console.log("查询"+ id +"号其它饮用水费记录");
	$.ajax({
		url:'/LD/userRoom/searchWaterBillById.action',
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
					$(".body-content ul li").eq(2).children("input").val(record.guest_NAME);
					$(".pack_maintain").val(formatDateForm(new Date(record.occur_TIME)));
					$(".body-content ul li").eq(9).children("input").val(record.comment);
					if(record.pay_MODE == 0) $("#eventType").prop("checked",true);
					else $("#eventType").next().next().prop("checked",true);

					//显示下拉列表、数量、单价
					waterType = record.barrel_COUNT == 0 ? "矿泉水" : "桶装水";
					$("#dropDownInput").val(waterType);
					if(waterType == "桶装水"){
						$(".body-content ul li").eq(7).children("input").val(record.barrel_COUNT);
						$("#unitPrice").hide();
					} else {
						$(".body-content ul li").eq(7).children("input").val(record.bottle_COUNT);
						$("#unitPrice").show();
						$("#unitPrice input").val(record.bottle_UNITPRICE);
					}
				}
			} else {
				showModalBox("error","无操作权限");
			}
		}
	});
}

//根据id删除饮用水费记录
var serviceWaterBillDelete = function(id){
	console.log("删除"+ id +"号其它饮用水费记录");
	$.ajax({
		url:'/LD/userRoom/deleteWaterBillById.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify({"id":id}),
		success:function(data){
			console.log(data);
			if(data == 1){
				showModalBox("success","删除成功");
				searchWaterBill(1); //重新查一遍
			}else if(data == 0){
				showModalBox("error","删除失败");
			}
		}
	});
};

var updateWaterBill = function(id) {
	
	console.log("请求更新"+id+"号其它饮用水费记录");

	// 其他字段输入结果
	var waterType = $("#dropDownInput").val();
	var count = $(".body-content ul li").eq(7).children("input").val();
	var unitPrice = $("#unitPrice input").val();
	var comment = $(".body-content ul li").eq(9).children("input").val();
	var payMode = $("#eventType").prop("checked") == true ? 0 : 1;


	$.ajax({
		url:'/LD/userRoom/updateWaterBillById.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify({"id" : id,
							 "waterType" : waterType,
							 "count" : count,
							 "unitPrice" : unitPrice,
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


//导出饮用水费列表至 excel中
var exportList = function(){
    var BB = self.Blob;
    var fileName = "WaterBillList_" + formatDateDot(new Date()) + ".csv";
    var content = ",,,,,饮用水费记录表\n房间号,客户姓名,桶装水（桶）（买进|剩余|限额）,矿泉水（提）（买进|剩余|限额）,支付方式,超出金额,备注,发生时间,上传时间,最后编辑时间\n";
    
    //根据当前房间号与日期编辑框的查询内容，请求所有记录（不分页）
	var roomNum = $("#searchRoomNum").val();
    var date = $("#date_demo3").val();
	console.log("查询房间号：" + roomNum + " 日期：" + date + "的所有饮用水费信息");
	$.ajax({
		url:'/LD/userRoom/searchAllWaterBills.action',
		type:'post',
		dataType:'json',
		data:'{"date":"'+ date +'","roomNum":"'+ roomNum +'"}',
		contentType:'application/json',
		success:function(data){
			console.log(data);

			(data.dataList).map(function(record){

				content += record.room_NUM + "," + 
						   record.guest_NAME + "," + 
						   record.barrel_COUNT + "|" + record.barrel_REMAINCOUNT + "|" + record.barrel_LIMITCOUNT + "," +
						   record.bottle_COUNT + "|" + record.bottle_REMAINCOUNT + "|" + record.bottle_LIMITCOUNT + "," +
						   (record.pay_MODE == 0 ? "现金" : "月结") + "," + 
						   record.excess_PRICE + " 元," +
						   record.comment + "," +
						   formatDateForm(new Date(record.occur_TIME)) + "," + 
						   formatDate(new Date(record.import_TIME)) + "," + 
						   formatDate(new Date(record.edit_TIME)) + "\n";
			});

			saveAs(new BB(["\ufeff" + content] , {type: "text/plain;charset=utf8"}), fileName);
		}
	});
};

//打印饮用水费
var printList = function()  
{  
	printData = [];

	//根据当前房间号与日期编辑框的查询内容，请求所有记录（不分页）
	var roomNum = $("#searchRoomNum").val();
    var date = $("#date_demo3").val();
	console.log("查询房间号：" + roomNum + " 日期：" + date + "的所有饮用水费信息");
	$.ajax({
		url:'/LD/userRoom/searchAllWaterBills.action',
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
				curRow["桶装水（桶）（买进/剩余/限额）"] = record.barrel_COUNT + "/" + record.barrel_REMAINCOUNT + "/" + record.barrel_LIMITCOUNT;
				curRow["矿泉水（提）（买进/剩余/限额）"] = record.bottle_COUNT + "/" + record.bottle_REMAINCOUNT + "/" + record.bottle_LIMITCOUNT;
				curRow["支付方式"] = record.pay_MODE == 0 ? "现金" : "月结";
				curRow["超出金额"] = record.excess_PRICE;
				curRow["备注"] = record.comment;
				curRow["发生时间"] = formatDateForm(new Date(record.occur_TIME));
				curRow["上传时间"] = formatDate(new Date(record.import_TIME));
				curRow["最后编辑时间"] = formatDate(new Date(record.edit_TIME));

				printData.push(curRow);
			});

			//打印
 			printJS({printable: printData, 
 			 		 properties: ['房间号','客户姓名','桶装水（桶）（买进/剩余/限额）','矿泉水（提）（买进/剩余/限额）','支付方式','超出金额','备注','发生时间','上传时间','最后编辑时间'], 
 			 		 type: 'json',
 		     	     font_size: '8pt'});
		}
	});
};