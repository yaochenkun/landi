// 客房服务--擦鞋费

// 初始绑定搜索键盘事件
$(function(){
	$("#search-input").keydown(function(e){
		// 回车键
		if(e.keyCode==13){
			requestFirstShoeCleaningByRoomNum(this);
			return false;
		}
	})
});

var requestFirstPage = function(){
    $("#shoeCleaningTbody").append("<tr><td class='no-data' colspan='5' style='color: #ff4d4d'>"+
        "请输入查询信息！</td></tr>");
}

////////////////////////////////////////////////////////////////条件查询 start
//根据房间号 拉取第一页 擦鞋费信息
var requestFirstStatement = function(){
	var roomNum = $("#search-input").val();
    var result = associateGuestName();
    if(result == 0) return;

	var name = $("#guestName").val();
    requestStatement(roomNum,name,parseInt(1));
}


// 根据房间号查询系统擦鞋费信息
var requestStatement = function(roomNum,name,pageNum){

    var date = $("#date_demo3").val();

    console.log('{"pageNum":"'+ pageNum + '","name":"' + name + '","rNum":"'+ roomNum + '","date":"'+ date +'"}');
	
	$.ajax({
		url:'/LD/userRoom/statementByDay.action',
		type:'post',
		contentType:'application/json',
		data:'{"name":"' + name + '","rNum":"'+ roomNum + '","date":"'+ date +'"}',
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.State == "Invalid"){
				alert("您没有权限访问本页数据，请尝试升级权限或回退。");
				return;
			}
			else if(data.State == "Valid"){
				$("#shoeCleaningTbody").html("");
				$("#serviceShoeCleaningBottom").html("");

				var recordTotal = data.recordTotal;
				if (recordTotal == 0) {
					$("#shoeCleaningTbody").append("<tr><td class='no-data' colspan='5' style='color: #ff4d4d'>"+
						"没有相关数据！</td></tr>");
					return;
				}

                //总计
                var sum = new Number(data.Total).toFixed(2);
                $("#total").html(sum);

				for(var i=0; i<data.laundry.length; i++){
					var perRecord = data.laundry[i];
            		$("#shoeCleaningTbody").append("<tr><td>洗衣费</td><td>"+ formatDateForm(new Date(perRecord.date)) +"</td>"+
    						"<td>"+ perRecord.clothes +"</td>"+
    						'<td style="color:red;">'+ perRecord.total_PRICE +"元</td><td>"+ dealOther(perRecord.other) +"</td></tr>");
				}

                for(var i=0; i<data.meal.length; i++){
                    var perRecord = data.meal[i];
                    $("#shoeCleaningTbody").append("<tr><td>餐费</td><td>"+ formatDateForm(new Date(perRecord.occur_TIME)) +"</td>"+
                        "<td>"+ perRecord.restaurant_NAME +"</td>"+
                        '<td style="color:red;">'+ perRecord.total_PRICE +"元</td><td>"+ dealOther(perRecord.comment) +"</td></tr>");
                }

                for(var i=0; i<data.drinkingwater.length; i++){
                    var perRecord = data.drinkingwater[i];
                    $("#shoeCleaningTbody").append("<tr><td>饮水费</td><td>"+ formatDateForm(new Date(perRecord.occur_TIME)) +"</td>"+
                        "<td>桶装水：买进" + perRecord.barrel_COUNT + "剩余:" + perRecord.barrel_REMAINCOUNT + "限额：" + perRecord.barrel_LIMITCOUNT+
                        "矿泉水：买进" + perRecord.bottle_COUNT + "剩余:" + perRecord.bottle_REMAINCOUNT + "限额：" + perRecord.bottle_LIMITCOUNT + "</td>"+
                        '<td style="color:red;">'+ perRecord.excess_PRICE +"元</td><td>"+ dealOther(perRecord.comment) +"</td></tr>");
                }

                for(var i=0; i<data.shoespolishing.length; i++){
                    var perRecord = data.shoespolishing[i];
                    $("#shoeCleaningTbody").append("<tr><td>擦鞋费</td><td>"+ formatDateForm(new Date(perRecord.occur_TIME)) +"</td>"+
                        "<td>"+ perRecord.count +"</td>"+
                        '<td style="color:red;">'+ perRecord.total_PRICE +"元</td><td>"+ dealOther(perRecord.comment) +"</td></tr>");
                }

                for(var i=0; i<data.agentpurchase.length; i++){
                    var perRecord = data.agentpurchase[i];
                    $("#shoeCleaningTbody").append("<tr><td>代购费</td><td>"+ formatDateForm(new Date(perRecord.occur_TIME)) +"</td>"+
                        "<td>"+ perRecord.good_NAME +"</td>"+
                        '<td style="color:red;">费用：'+ perRecord.cover_PRICE + '元;代购费:' + perRecord.service_PRICE +"元</td><td>"+ dealOther(perRecord.comment) +"</td></tr>");
                }

                for(var i=0; i<data.shuttlebus.length; i++){
                    var perRecord = data.shuttlebus[i];
                    $("#shoeCleaningTbody").append("<tr><td>通勤车费</td><td>"+ formatDateForm(new Date(perRecord.occur_TIME)) +"</td>"+
                        "<td>"+ perRecord.other_PEOPLE +"</td>"+
                        '<td style="color:red;">'+ perRecord.total + "元</td><td>无</td></tr>");
                }

                for(var i=0; i<data.otherfare.length; i++){
                    var perRecord = data.otherfare[i];
                    $("#shoeCleaningTbody").append("<tr><td>其它车费</td><td>"+ formatDateForm(new Date(perRecord.occur_TIME)) +"</td>"+
                        "<td>"+ perRecord.usage_TYPE +"</td>"+
                        '<td style="color:red;">'+ perRecord.total_PRICE +"元</td><td>"+ dealOther(perRecord.comment) +"</td></tr>");
                }
                for(var i=0; i<data.watersource.length; i++){
                    var perRecord = data.watersource[i];
                    $("#shoeCleaningTbody").append("<tr><td>水费</td><td>"+ formatDateForm(new Date(perRecord.reading_TIME)) +"</td>"+
                        "<td>表号:"+ perRecord.meter + "当月值:" + perRecord.cur_MONTH_VAL + "</td>"+
                        '<td style="color:red;">'+ perRecord.money.toFixed(2) + "元</td><td>" + perRecord.log + "</td></tr>");
                }
                for(var i=0; i<data.elecsource.length; i++){
                    var perRecord = data.elecsource[i];
                    $("#shoeCleaningTbody").append("<tr><td>电费</td><td>"+ formatDateForm(new Date(perRecord.reading_TIME)) +"</td>"+
                        "<td>表号:"+ perRecord.meter + "当月值:" + perRecord.cur_MONTH_VAL +"</td>"+
                        '<td style="color:red;">'+ perRecord.money.toFixed(2) + "元</td><td>" + perRecord.log + "</td></tr>");
                }
                for(var i=0; i<data.gassource.length; i++){
                    var perRecord = data.gassource[i];
                    $("#shoeCleaningTbody").append("<tr><td>燃气费</td><td>"+ formatDateForm(new Date(perRecord.reading_TIME)) +"</td>"+
                        "<td>表号:"+ perRecord.meter + "当月值:" + perRecord.cur_MONTH_VAL + "</td>"+
                        '<td style="color:red;">'+ perRecord.money.toFixed(2) + "元</td><td>" + perRecord.log + "</td></tr>");
                }



                for(var i=0; i<data.costle.length; i++){
                    var perRecord = data.costle[i];
                    $("#shoeCleaningTbody").append("<tr><td>LE承担费用</td><td>"+ formatDateForm(new Date(perRecord.occur_TIME)) +"</td>"+
                        "<td>"+ deatLEType(perRecord.TYPE) + ":" + perRecord.project+"</td>"+
                        '<td style="color:red;">'+ perRecord.cost +"元</td><td>"+ dealOther(perRecord.reason) +"</td></tr>");
                }



				// 添加餐费 底部页码
				// $("#serviceShoeCleaningBottom").append("<div class='searchRoomNum' style='display:none;'>"+ roomNum +"</div>");
				// $("#serviceShoeCleaningBottom").append("<div class='bottom-page'>"+
			     //    	"<span class='page-before' onclick='requestBeforeShoeCleaningByRoomNum();'>上一页&nbsp;&nbsp;</span>"+
			     //    	"<span><input id='shoeCleaninglist_nowpage' value='" + pageNow +"' type='text' class='input_num'></span>"+
			     //    	"<span>&nbsp;/&nbsp;</span>"+
			     //    	"<span id='shoeCleaninglist_totalpage'>"+ pageTotal +"</span>"+
			     //        "<span class='page-next' onclick='requestNextShoeCleaningByRoomNum();'>&nbsp;&nbsp;下一页</span>" +
			     //        "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ recordTotal +"&nbsp;</span>条记录</div>");
			}
		}
	});
}
////////////////////////////////////////////////////////////////条件查询 擦鞋费信息 end

//客户姓名联动
var associateGuestName = function(){

    var roomNum = $("#search-input").val(); //这里是需要根据页面元素变的
	var result = 0;

    $.ajax({
        url:'/LD/userRoom/searchGuestName.action',
        type:'post',
        dataType:'json',
        data:'{"roomNum":"'+ roomNum +'"}',
        contentType:'application/json',
		async:false ,
    }).done(function(data){
        console.log(data);

        if(data.State == "Valid") {
            if(data.guest_NAME != null) {
                $("#guestName").val(data.guest_NAME); //这里是需要根据页面元素变的
                result = 1;
            } else {
                $("#shoeCleaningTbody").html("");
                $("#shoeCleaningTbody").append("<tr><td class='no-data' colspan='5' style='color: #ff4d4d'>"+
                    "尚无客户，请重新填写房间号！</td></tr>")
                $("#guestName").val("");
            }
        } else {
            $("#shoeCleaningTbody").html("");
            $("#shoeCleaningTbody").append("<tr><td class='no-data' colspan='5' style='color: #ff4d4d'>"+
                "房间号无操作权限！</td></tr>");
            $("#guestName").val("");
        }
	});

    return result;

};

function dealOther(other){
	if(other == '[]'){
		return "无";
	}else{
		return other;
	}
}

function deatLEType(type){
	if(type == 'welfare'){
		return "福利费";
	}else{
		return "安抚费";
	}
}

		
//导出
var exportList = function(){
    var roomNum = $("#search-input").val();
    var result = associateGuestName();
    if(result == 0) return;

    var date = $("#date_demo3").val();
    var name = $("#guestName").val();

    //开始导出
	var BB = self.Blob;
    var fileName = "StatementList_" + formatDateDot(new Date()) + ".csv";
    var content = ",,,,费用结算记录表\n房间号,客户姓名,收费类型,日期,详情,费用,备注\n";
    
    //根据当前房间号查询内容，请求所有记录（不分页）
    console.log('{"date":"'+ date +'","roomNum":"'+ roomNum +'"}');
	
	$.ajax({
		url:'/LD/userRoom/statementByDay.action',
		type:'post',
		dataType:'json',
		data:'{"name":"' + name + '","rNum":"'+ roomNum + '","date":"'+ date +'"}',
		contentType:'application/json',
		success:function(data){

			if(data.State == "Valid"){
                for(var i=0; i<data.laundry.length; i++){
                    var perRecord = data.laundry[i];
                    content += roomNum + "," +
                        name + "," +
                        "洗衣费," +
                        formatDateForm(new Date(perRecord.date)) + "," +
                        perRecord.clothes.split(',').join('') + "," +
                        perRecord.total_PRICE +"元," +
                        dealOther(perRecord.other) + "\n";
                }
                for(var i=0; i<data.meal.length; i++){
                    var perRecord = data.meal[i];
                    content += roomNum + "," +
                        name + "," +
                        "餐费," +
                        formatDateForm(new Date(perRecord.occur_TIME)) + "," +
                        perRecord.restaurant_NAME.split(',').join(' ') + "," +
                        perRecord.total_PRICE +"元," +
                        dealOther(perRecord.comment) + "\n";
                }
                for(var i=0; i<data.drinkingwater.length; i++){
                    var perRecord = data.drinkingwater[i];
                    content += roomNum + "," +
                        name + "," +
                        "桶装水：买进" + perRecord.barrel_COUNT + "剩余:" + perRecord.barrel_REMAINCOUNT + "限额：" + perRecord.barrel_LIMITCOUNT+
                        "矿泉水：买进" + perRecord.bottle_COUNT + "剩余:" + perRecord.bottle_REMAINCOUNT + "限额：" + perRecord.bottle_LIMITCOUNT + "," +
                        formatDateForm(new Date(perRecord.occur_TIME)) + "," +
                        "饮用水," +
                        perRecord.excess_PRICE +"元," +
                        dealOther(perRecord.comment) + "\n";

                }
                for(var i=0; i<data.shoespolishing.length; i++){
                    var perRecord = data.shoespolishing[i];
                    content += roomNum + "," +
                        name + "," +
                        "擦鞋费," +
                        formatDateForm(new Date(perRecord.occur_TIME)) + "," +
                        perRecord.count + "," +
                        perRecord.total_PRICE +"元," +
                        dealOther(perRecord.comment) + "\n";

                }
                for(var i=0; i<data.agentpurchase.length; i++){
                    var perRecord = data.agentpurchase[i];
                    content += roomNum + "," +
                        name + "," +
                        "代购费," +
                        formatDateForm(new Date(perRecord.occur_TIME)) + "," +
                        perRecord.good_NAME + ",费用：" +
                        perRecord.cover_PRICE +"元;代购费:" + perRecord.service_PRICE + "元," +
                        dealOther(perRecord.comment) + "\n";

                }

                for(var i=0; i<data.shuttlebus.length; i++){
                    var perRecord = data.shuttlebus[i];
                    content += roomNum + "," +
                        name + "," +
                        "通勤车费," +
                        formatDateForm(new Date(perRecord.occur_TIME)) + "," +
                        perRecord.other_PEOPLE.split(',').join(' ') + "," +
                        perRecord.total +"元," +
                         " " + "\n";
                }

                for(var i=0; i<data.otherfare.length; i++){
                    var perRecord = data.otherfare[i];
                    content += roomNum + "," +
                        name + "," +
                        "其它车费," +
                        formatDateForm(new Date(perRecord.occur_TIME)) + "," +
                        perRecord.usage_TYPE.split(',').join(' ') + "," +
                        perRecord.total_PRICE +"元," +
                        dealOther(perRecord.comment) + "\n";
                }
                for(var i=0; i<data.watersource.length; i++){
                    var perRecord = data.watersource[i];
                    content += roomNum + "," +
                        name + "," +
                        "水费," +
                        formatDateForm(new Date(perRecord.reading_TIME)) + "," +
                        "表号:" + perRecord.meter + "当月值:" + perRecord.cur_MONTH_VAL + "," +
                        perRecord.money.toFixed(2) +"元," +
                        perRecord.log + "\n";
                }

                for(var i=0; i<data.elecsource.length; i++){
                    var perRecord = data.elecsource[i];
                    content += roomNum + "," +
                        name + "," +
                        "电费," +
                        formatDateForm(new Date(perRecord.reading_TIME)) + "," +
                        "表号:" + perRecord.meter + "当月值:" + perRecord.cur_MONTH_VAL + "," +
                        perRecord.money.toFixed(2) +"元," +
                        perRecord.log + "\n";
                }
                for(var i=0; i<data.gassource.length; i++){
                    var perRecord = data.gassource[i];
                    content += roomNum + "," +
                        name + "," +
                        "燃气费," +
                        formatDateForm(new Date(perRecord.reading_TIME)) + "," +
                        "表号:" + perRecord.meter + "当月值:" + perRecord.cur_MONTH_VAL + "," +
                        perRecord.money.toFixed(2) +"元," +
                        perRecord.log + "\n";
                }

                for(var i=0; i<data.costle.length; i++){
                    var perRecord = data.costle[i];
                    content += roomNum + "," +
                        name + "," +
                        "LE承担费用," +
                        formatDateForm(new Date(perRecord.occur_TIME)) + "," +
                        deatLEType(perRecord.TYPE) + ":" + perRecord.project.split(',').join(' ') + "," +
                        perRecord.cost +"元," +
                        dealOther(perRecord.reason) + "\n";
                }

                content += ",,,," +
                    "总计：," +
                    data.Total.toFixed(2) +"元\n";

				saveAs(new BB(["\ufeff" + content] , {type: "text/plain;charset=utf8"}), fileName);						
			}
			else{
				showModalBox("error","导出失败");
			}			
		}
	});
}

//打印
var printList = function() {
    var roomNum = $("#search-input").val();
    var result = associateGuestName();
    if(result == 0) return;

    var date = $("#date_demo3").val();
    var name = $("#guestName").val();

    //开始打印
    printData = [];

    $.ajax({
        url: '/LD/userRoom/statementByDay.action',
        type: 'post',
        dataType: 'json',
        data: '{"name":"' + name + '","rNum":"'+ roomNum + '","date":"'+ date +'"}',
        contentType: 'application/json',
        success: function (data) {

            if (data.State == "Valid") {
                for(var i=0; i<data.laundry.length; i++){
                    var perRecord = data.laundry[i];
                    curRow = {};
                    curRow["房间号"] = roomNum;
                    curRow["客户姓名"] = name;
                    curRow["收费类型"] = "洗衣费";
                    curRow["日期"] = formatDateForm(new Date(perRecord.date));
                    curRow["详情"] = perRecord.clothes;
                    curRow["费用"] = perRecord.total_PRICE+ "元";
                    curRow["备注"] = dealOther(perRecord.other);

                    printData.push(curRow);
                }

                for(var i=0; i<data.meal.length; i++){
                    var perRecord = data.meal[i];
                    curRow = {};
                    curRow["房间号"] = roomNum;
                    curRow["客户姓名"] = name;
                    curRow["收费类型"] = "餐费";
                    curRow["日期"] = formatDateForm(new Date(perRecord.occur_TIME));
                    curRow["详情"] = perRecord.restaurant_NAME;
                    curRow["费用"] = perRecord.total_PRICE+ "元";
                    curRow["备注"] = dealOther(perRecord.comment);

                    printData.push(curRow);
                }
                for(var i=0; i<data.drinkingwater.length; i++){
                    var perRecord = data.drinkingwater[i];
                    curRow = {};
                    curRow["房间号"] = roomNum;
                    curRow["客户姓名"] = name;
                    curRow["收费类型"] = "饮水费";
                    curRow["日期"] = formatDateForm(new Date(perRecord.occur_TIME));
                    curRow["详情"] = "桶装水：买进" + perRecord.barrel_COUNT + "剩余:" + perRecord.barrel_REMAINCOUNT + "限额：" + perRecord.barrel_LIMITCOUNT+
                        "矿泉水：买进" + perRecord.bottle_COUNT + "剩余:" + perRecord.bottle_REMAINCOUNT + "限额：" + perRecord.bottle_LIMITCOUNT;
                    curRow["费用"] = perRecord.excess_PRICE+ "元";
                    curRow["备注"] = dealOther(perRecord.comment);

                    printData.push(curRow);

                }
                for(var i=0; i<data.shoespolishing.length; i++){
                    var perRecord = data.shoespolishing[i];
                    curRow = {};
                    curRow["房间号"] = roomNum;
                    curRow["客户姓名"] = name;
                    curRow["收费类型"] = "擦鞋费";
                    curRow["日期"] = formatDateForm(new Date(perRecord.occur_TIME));
                    curRow["详情"] = perRecord.count;
                    curRow["费用"] = perRecord.total_PRICE+ "元";
                    curRow["备注"] = dealOther(perRecord.comment);

                    printData.push(curRow);

                }
                for(var i=0; i<data.agentpurchase.length; i++){
                    var perRecord = data.agentpurchase[i];
                    curRow = {};
                    curRow["房间号"] = roomNum;
                    curRow["客户姓名"] = name;
                    curRow["收费类型"] = "代购费";
                    curRow["日期"] = formatDateForm(new Date(perRecord.occur_TIME));
                    curRow["详情"] = perRecord.good_NAME;
                    curRow["费用"] = "费用：" + perRecord.cover_PRICE +"元;代购费:" + perRecord.service_PRICE + "元";
                    curRow["备注"] = dealOther(perRecord.comment);

                    printData.push(curRow);

                }
                for(var i=0; i<data.shuttlebus.length; i++){
                    var perRecord = data.shuttlebus[i];
                    curRow = {};
                    curRow["房间号"] = roomNum;
                    curRow["客户姓名"] = name;
                    curRow["收费类型"] = "通勤车费";
                    curRow["日期"] = formatDateForm(new Date(perRecord.occur_TIME));
                    curRow["详情"] = perRecord.other_PEOPLE;
                    curRow["费用"] = perRecord.total+ "元";
                    curRow["备注"] = "";

                    printData.push(curRow);
                }
                for(var i=0; i<data.otherfare.length; i++){
                    var perRecord = data.otherfare[i];
                    curRow = {};
                    curRow["房间号"] = roomNum;
                    curRow["客户姓名"] = name;
                    curRow["收费类型"] = "其它车费";
                    curRow["日期"] = formatDateForm(new Date(perRecord.occur_TIME));
                    curRow["详情"] = perRecord.usage_TYPE;
                    curRow["费用"] = perRecord.total_PRICE+ "元";
                    curRow["备注"] = dealOther(perRecord.comment);

                    printData.push(curRow);
                }
                for(var i=0; i<data.watersource.length; i++){
                    var perRecord = data.watersource[i];
                    curRow = {};
                    curRow["房间号"] = roomNum;
                    curRow["客户姓名"] = name;
                    curRow["收费类型"] = "水费";
                    curRow["日期"] = formatDateForm(new Date(perRecord.reading_TIME));
                    curRow["详情"] = "表号:" + perRecord.meter + "当月值:" + perRecord.cur_MONTH_VAL;
                    curRow["费用"] = perRecord.money.toFixed(2)+ "元";
                    curRow["备注"] = perRecord.log;

                    printData.push(curRow);
                }
                for(var i=0; i<data.elecsource.length; i++){
                    var perRecord = data.elecsource[i];
                    curRow = {};
                    curRow["房间号"] = roomNum;
                    curRow["客户姓名"] = name;
                    curRow["收费类型"] = "电费";
                    curRow["日期"] = formatDateForm(new Date(perRecord.reading_TIME));
                    curRow["详情"] = "表号:" + perRecord.meter + "当月值:" + perRecord.cur_MONTH_VAL;
                    curRow["费用"] = perRecord.money.toFixed(2)+ "元";
                    curRow["备注"] = perRecord.log;

                    printData.push(curRow);
                }
                for(var i=0; i<data.gassource.length; i++){
                    var perRecord = data.gassource[i];
                    curRow = {};
                    curRow["房间号"] = roomNum;
                    curRow["客户姓名"] = name;
                    curRow["收费类型"] = "燃气费";
                    curRow["日期"] = formatDateForm(new Date(perRecord.reading_TIME));
                    curRow["详情"] = "表号:" + perRecord.meter + "当月值:" + perRecord.cur_MONTH_VAL;
                    curRow["费用"] = perRecord.money.toFixed(2)+ "元";
                    curRow["备注"] = perRecord.log;

                    printData.push(curRow);
                }
                for(var i=0; i<data.costle.length; i++){
                    var perRecord = data.costle[i];
                    curRow = {};
                    curRow["房间号"] = roomNum;
                    curRow["客户姓名"] = name;
                    curRow["收费类型"] = "LE承担费用";
                    curRow["日期"] = formatDateForm(new Date(perRecord.occur_TIME));
                    curRow["详情"] = deatLEType(perRecord.TYPE) + "项目:" + perRecord.project;
                    curRow["费用"] = perRecord.cost+ "元";
                    curRow["备注"] = dealOther(perRecord.reason);

                    printData.push(curRow);
                }

                //打印
                printJS({
                    printable: printData,
                    properties: ['房间号', '客户姓名', '收费类型', '日期', '详情', '费用', '备注'],
                    type: 'json',
                    font_size: '9pt'
                });
            } else {
                showModalBox("error", "打印失败");
            }
        }
    });
}
