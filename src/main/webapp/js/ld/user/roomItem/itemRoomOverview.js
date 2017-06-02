(function(){
    // 选择物品种类
    $(".itemTypeMenu li").click(function(){
    	$(".itemType .span").html($(this).text());
    	$(".itemTypeMenu").fadeOut(300);
    	var type = "";
    	switch($(this).index()){
    		case 0:
    			typeName = "家电";
    		 	break;
    		case 1:
    			typeName = "家具";
    		 	break;
    		case 2:
    			typeName = "软装";
    		 	break;
    		case 3:
    			typeName = "备品";
    		 	break;
    		case 4:
    			typeName = "其它";
    		 	break;
    		default:
    		 	break;
    	};
    	$("#itemTypeName").text(typeName);
    	requestItemByItemType(1);
    });

    // 物品种类
    $(".itemType").hover(function(){
    	$(".itemTypeMenu").fadeIn(300);
    },function(){
    	$(".itemTypeMenu").fadeOut(300);
    });
})();

// 根据物品种类筛选
var requestItemByItemType = function(pageNum){
	    // 请求的物品物品名称
	    var type = $("#itemTypeName").text();
    	var roomNum = $("#roomNum").val();
		console.log("请求第" + pageNum + "页 type:"+ type + "房间物品总览信息");

	    $.ajax({
		url:'/LD/userItem/searchItemRoomOverview.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify({"pageNum" : pageNum, "type" : type, "roomNum" : roomNum}),
		success:function(data){
			console.log(data);

			if(data.State == "Invalid"){
				alert("您没有权限访问本页数据，请尝试升级权限或回退！");
				return;
			}
			else if(data.State == "Valid"){

		 		//清空表格和页码
				$("#itemOverviewTbody").html("")
				$("#itemOverviewBottom").html("");

				var pageNow = data.pageNow;
				var pageTotal = data.pageTotal;
				var recordTotal = data.recordTotal;
				if (recordTotal == 0) {
					$("#itemOverviewTbody").append("<tr><td class='no-data' colspan='13' style='color: #ff4d4d'>"+
						"没有相关数据！</td></tr>");
					return;
				}

				for(var i=0; i<data.pageList.length; i++){
					var perRecord = data.pageList[i];
					var maintainDurationStr = (perRecord.maintain_DURATION == null) ? "-" : (perRecord.maintain_DURATION + "&nbsp;天");
					$("#itemOverviewTbody").append("<tr><td>"+ perRecord.room_NUM +"</td>"+
						"<td>"+ perRecord.type +"</td><td>"+ perRecord.cat +"</td>"+
						"<td>"+ perRecord.brand +"</td><td>"+ perRecord.name +"</td>"+
            			"<td>"+ perRecord.owner +"</td>"+
						"<td>"+ perRecord.tag +"</td><td>"+ perRecord.allocate_TYPE +"</td>"+
                        "<td>"+ (perRecord.borrow_DATE == null ? "-" : formatDateForm(new Date(perRecord.borrow_DATE))) +"</td>"+
                        "<td>"+ (perRecord.return_DATE == null ? "-" : formatDateForm(new Date(perRecord.return_DATE))) +"</td><td>"+ perRecord.state +"</td>"+
                        "<td>"+ maintainDurationStr +"</td><td>"+ perRecord.comm +"</td>"+
						"</tr>");
				}
				// 添加物品总览 底部页码
				$("#itemOverviewBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeItemByType();'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='itemOverview_nowpage' value='"+ pageNow +"' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='itemOverview_totalpage'>"+ pageTotal +"</span>"+
			            "<span class='page-next' onclick='requestNextItemByType();'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ recordTotal +"&nbsp;</span>条记录</div>");
			}
		}
	});
};

//根据物品种类拉取
var requestBeforeItemByType = function(){
	var nowpage = parseInt($("#itemOverview_nowpage").val());
	if(nowpage == 1) return;

	requestItemByItemType(nowpage-1);
};

//根据房间号 拉取下一页 物品总览信息（??当前处理，前端判断是否是最后一页）
var requestNextItemByType = function(){
	var nowpage = parseInt($("#itemOverview_nowpage").val());
	var totalpage = parseInt($("#itemOverview_totalpage").text());
	if(nowpage == totalpage) return;

	requestItemByItemType(nowpage+1);
};

//导出通勤车列表至 excel中
var exportList = function(){
    var BB = self.Blob;
    var fileName = "RoomItemList_" + formatDateDot(new Date()) + ".csv";
    var content = ",,,,,,房间物品统计表\n房间号,种类,子类,品牌,名称,归属权,标签,分配类型,借用时间,归还时间,状态,维修时长,备注\n";

    //根据当前库房号与日期编辑框的查询内容，请求所有记录（不分页）
    var type = $("#itemTypeName").text();
    var roomNum = $("#roomNum").val();
    console.log("查询房间号为：" + roomNum + "中种类为：" + type + "物品信息");
    $.ajax({
        url:'/LD/userItem/searchAllItemRoomOverview.action',
        type:'post',
        dataType:'json',
        data:JSON.stringify({"type" : type, "roomNum" : roomNum}),
        contentType:'application/json',
        success:function(data){
            console.log(data);

            (data.dataList).map(function(record){

            	var borrowDate = (record.borrow_DATE == null ? "-" : formatDateForm(new Date(record.borrow_DATE)));
            	var returnDate = (record.return_DATE == null ? "-" : formatDateForm(new Date(record.return_DATE)))
            	var maintainDuration = (record.maintain_DURATION == null) ? "-" : (record.maintain_DURATION + " 天");

                content += record.room_NUM + "," +
                    record.type + "," +
                    record.cat + "," +
                    record.brand + "," +
                    record.name + "," +
                    record.owner + "," +
                    record.tag + "," +
                    record.allocate_TYPE + "," +
                	borrowDate + "," +
                    returnDate + "," +
                    record.state + "," +
                    maintainDuration + "," +
                    record.comm + "\n";
            });

            saveAs(new BB(["\ufeff" + content] , {type: "text/plain;charset=utf8"}), fileName);
        }
    });
};

//打印通勤车费
var printList = function()
{
    printData = [];

    //根据当前库房号与日期编辑框的查询内容，请求所有记录（不分页）
    var type = $("#itemTypeName").text();
    var roomNum = $("#roomNum").val();
    console.log("查询房间号为：" + roomNum + "中种类为：" + type + "物品信息");
    $.ajax({
        url:'/LD/userItem/searchAllItemRoomOverview.action',
        type:'post',
        dataType:'json',
        data:JSON.stringify({"type" : type, "roomNum" : roomNum}),
        contentType:'application/json',
        success:function(data){
            console.log(data);

            (data.dataList).map(function(record){


                var borrowDate = (record.borrow_DATE == null ? "-" : formatDateForm(new Date(record.borrow_DATE)));
                var returnDate = (record.return_DATE == null ? "-" : formatDateForm(new Date(record.return_DATE)))
                var maintainDuration = (record.maintain_DURATION == null) ? "-" : (record.maintain_DURATION + " 天");

                curRow = {};
                curRow["房间号"] = record.room_NUM;
                curRow["种类"] = record.type;
                curRow["子类"] = record.cat;
                curRow["品牌"] = record.brand;
                curRow["名称"] = record.name;
                curRow["归属权"] = record.owner;
                curRow["标签"] = record.tag;
                curRow["分配类型"] = record.allocate_TYPE;
                curRow["借用时间"] = borrowDate;
                curRow["归还时间"] = returnDate;
                curRow["状态"] = record.state;
                curRow["维修时长"] = maintainDuration;
                curRow["备注"] = record.comm;


                printData.push(curRow);
            });

            //打印
            printJS({printable: printData,
                properties: ['房间号','种类','子类','品牌','名称','归属权','标签','分配类型','借用时间','归还时间','状态','维修时长','备注'],
                type: 'json',
                font_size: '9pt'});
        }
    });
};