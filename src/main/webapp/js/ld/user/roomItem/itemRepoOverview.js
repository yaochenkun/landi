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

// 请求客房物品总览
var requestItemOverview = function(pageNum){
	console.log("请求第" + pageNum + "页物品总览信息");
	$.ajax({
		url:'/LD/userItem/searchItemRepoOverview.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify({"pageNum" : pageNum, "type" : "家电", "repoNum" : ""}),
		beforeSend:function(){
			// $("#itemOverviewTbody").append("<div class='loader'><div class='loader-inner line-scale'>"+
   //        		"<div></div><div></div><div></div><div></div><div></div></div></div>");
   			console.log("正在加载物品统计信息...");
		},
		success:function(data){
			console.log(data);

			if(data.State == "Invalid"){
				alert("您没有权限访问本页数据，请尝试升级权限或回退！");
				return;
			}
			else if(data.State == "Valid"){

		 		// 清空表格和页码
				$("#itemOverviewTbody").html("")
				$("#itemOverviewBottom").html("");

				var pageNow = data.pageNow;
				var pageTotal = data.pageTotal;
				var recordTotal = data.recordTotal;

				if (recordTotal == 0) {
					$("#itemOverviewTbody").append("<tr><td class='no-data' colspan='14' style='color: #ff4d4d'>"+
						"没有相关数据！</td></tr>");
					return;
				}

				for(var i=0; i<data.pageList.length; i++){
					var perRecord = data.pageList[i];
                    var notfree = Number(perRecord.total) - Number(perRecord.free);
					$("#itemOverviewTbody").append("<tr><td>"+ perRecord.repo_NUM +"</td>"+
						"<td>"+ perRecord.type +"</td><td>"+ perRecord.cat +"</td>"+
						"<td>"+ perRecord.brand +"</td><td>"+ perRecord.name +"</td>"+
            			"<td>"+ perRecord.owner +"</td>"+
						"<td>"+ perRecord.total +"</td><td>"+ perRecord.free +"</td>"+
                        "<td>"+ notfree +"</td>"+
						"<td>"+ perRecord.working +"</td><td>"+ perRecord.maintain +"</td>"+
                        "<td>"+ perRecord.bad +"</td><td>"+ perRecord.comment +"</td>"+
						"<td><span class='item_detail' onclick='showItemDetail(this, "+ perRecord.id +");'>分配信息</span></td>"+
						"</tr>");
				}
				// 添加物品总览 底部页码
				$("#itemOverviewBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeItemOverview();'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='itemOverview_nowpage' value='"+ pageNow +"' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='itemOverview_totalpage'>"+ pageTotal +"</span>"+
			            "<span class='page-next' onclick='requestNextitemOverview();'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ recordTotal +"&nbsp;</span>条记录</div>");
			}
		}
	});
};

// 显示物品详细信息
var showItemDetail = function(element, itemID){

	console.log("请求物品ID" + itemID + "的详细信息");
	window.location.href = "http://" + window.location.host
	 	+ "/LD/views/user/roomItem/itemDetail.jsp?itemID=" + itemID;
};

//根据房间号 拉取上一页 物品总览信息
var requestBeforeItemOverview = function(){
	var nowpage = parseInt($("#itemOverview_nowpage").val());
	if(nowpage == 1) return;

	requestItemOverview(nowpage-1);
};

//根据房间号 拉取下一页 物品总览信息（??当前处理，前端判断是否是最后一页）
var requestNextitemOverview = function(){
	var nowpage = parseInt($("#itemOverview_nowpage").val());
	var totalpage = parseInt($("#itemOverview_totalpage").text());
	if(nowpage == totalpage) return;

	requestItemOverview(nowpage+1);
};

////////////////////////////////////////////////////////////////////////////
// 根据物品种类筛选
var requestItemByItemType = function(pageNum){
	    // 请求的物品物品名称
	    var type = $("#itemTypeName").text();
		var repoNum = $("#repoNum").val();

		console.log("请求第" + pageNum + "页 type:"+ type + "库房物品总览信息");

	    $.ajax({
		url:'/LD/userItem/searchItemRepoOverview.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify({"pageNum" : pageNum, "type" : type, "repoNum" : repoNum}),
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
					$("#itemOverviewTbody").append("<tr><td class='no-data' colspan='14' style='color: #ff4d4d'>"+
						"没有相关数据！</td></tr>");
					return;
				}

				for(var i=0; i<data.pageList.length; i++){
					var perRecord = data.pageList[i];
					var notfree = Number(perRecord.total) - Number(perRecord.free);
					$("#itemOverviewTbody").append("<tr><td>"+ perRecord.repo_NUM +"</td>"+
						"<td>"+ perRecord.type +"</td><td>"+ perRecord.cat +"</td>"+
						"<td>"+ perRecord.brand +"</td><td>"+ perRecord.name +"</td>"+
            			"<td>"+ perRecord.owner +"</td>"+
						"<td>"+ perRecord.total +"</td><td>"+ perRecord.free +"</td>"+
                        "<td>"+ notfree +"</td>"+
                        "<td>"+ perRecord.working +"</td><td>"+ perRecord.maintain +"</td>"+
                        "<td>"+ perRecord.bad +"</td><td>"+ perRecord.comment +"</td>"+
						"<td><span class='item_detail' onclick='showItemDetail(this, "+ perRecord.id +");'>分配信息</span></td>"+
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
    var fileName = "RepoItemList_" + formatDateDot(new Date()) + ".csv";
    var content = ",,,,,,库房物品统计表\n库房号,种类,子类,品牌,名称,归属权,总量,待分配,已分配,可用,维修,报废,备注\n";

    //根据当前库房号与日期编辑框的查询内容，请求所有记录（不分页）
    var type = $("#itemTypeName").text();
    var repoNum = $("#repoNum").val();
    console.log("查询库房号为：" + repoNum + "中种类为：" + type + "物品信息");
    $.ajax({
        url:'/LD/userItem/searchAllItemRepoOverview.action',
        type:'post',
        dataType:'json',
        data:JSON.stringify({"type" : type, "repoNum" : repoNum}),
        contentType:'application/json',
        success:function(data){
            console.log(data);

            (data.dataList).map(function(record){

                content += record.repo_NUM + "," +
                    record.type + "," +
                    record.cat + "," +
                    record.brand + "," +
                    record.name + "," +
                    record.owner + "," +
                    record.total + "," +
                    record.free + "," +
					(Number(record.total) - Number(record.free)) + "," +
                    record.working + "," +
                    record.maintain + "," +
                    record.bad + "," +
                    record.comment + "\n";
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
    var repoNum = $("#repoNum").val();
    console.log("查询库房号为：" + repoNum + "中种类为：" + type + "物品信息");
    $.ajax({
        url:'/LD/userItem/searchAllItemRepoOverview.action',
        type:'post',
        dataType:'json',
        data:JSON.stringify({"type" : type, "repoNum" : repoNum}),
        contentType:'application/json',
        success:function(data){
            console.log(data);

            (data.dataList).map(function(record){


                curRow = {};
                curRow["库房号"] = record.repo_NUM;
                curRow["种类"] = record.type;
                curRow["子类"] = record.cat;
                curRow["品牌"] = record.brand;
                curRow["名称"] = record.name;
                curRow["归属权"] = record.owner;
                curRow["总量"] = record.total;
                curRow["待分配"] = record.free;
                curRow["已分配"] = (Number(record.total) - Number(record.free));
				curRow["可用"] = record.working;
				curRow["维修"] = record.maintain;
				curRow["报废"] = record.bad;
				curRow["备注"] = record.comment;



                printData.push(curRow);
            });

            //打印
            printJS({printable: printData,
                properties: ['库房号','种类','子类','品牌','名称','归属权','总量','待分配','已分配','可用','维修','报废','备注'],
                type: 'json',
                font_size: '9pt'});
        }
    });
};
