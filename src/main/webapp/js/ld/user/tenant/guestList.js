// 请求租客列表
var requestGuestList = function (pageNum) {
	console.log("请求第" + pageNum + "页租客信息");
	$.ajax({
		url:'/LD/guest/searchGuestList.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		data:'{"pageNum":'+ pageNum +'}',
		success:function(data){
			console.log(data);
			// 将租客信息添加到表格中
			addGuestTable(data.recordTotal, data.pageList);

			// 添加租客列表 底部页码
			$("#guestListBottom").append("<div class='bottom-page'>"+
        		"<span class='page-before' onclick='requestBeforeGuestList();'>上一页&nbsp;&nbsp;</span>"+
        		"<span><input id='guestList_nowpage' value='"+ data.pageNow +"' type='text' class='input_num'></span>"+
        		"<span>&nbsp;/&nbsp;</span>"+
        		"<span id='guestList_totalpage'>"+ data.pageTotal +"</span>"+
            	"<span class='page-next' onclick='requestNextGuestList();'>&nbsp;&nbsp;下一页</span>" +
            	"&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ data.recordTotal +"&nbsp;</span>条记录</div>");
		}
	});
};
var requestBeforeGuestList = function(){
	var nowpage = parseInt($("#guestList_nowpage").val());
	if(nowpage == 1) return;
	
	requestGuestList(nowpage-1);
};
var requestNextGuestList = function(){
	var nowpage = parseInt($("#guestList_nowpage").val());
	var totalpage = parseInt($("#guestList_totalpage").text());
	if(nowpage == totalpage) return;
	
	requestGuestList(nowpage+1);
};

//导出租客列表至 excel中
// var exportGuestList = function(){
//     var BB = self.Blob;
//     var fileName = "guestList.csv";
//     var content = ",,,,,租客信息表\n姓名,房间号,公司,职务,电话,入住人数,车位,租金,入住时间,到期时间,备注\n";
//     $(".bill-table tr").each(function(i){
//     	   if (i != 0) {
//     		   content += $(this).children("td").eq(0).text() + "," + $(this).children("td").eq(1).text() + "," +
//     		              $(this).children("td").eq(2).text() + "," + $(this).children("td").eq(3).text() + "," +
//     		              $(this).children("td").eq(4).text() + "," + $(this).children("td").eq(5).text() + "," +
//     		              $(this).children("td").eq(6).text() + "," + $(this).children("td").eq(7).text() + "," +
//     		              $(this).children("td").eq(8).text() + "," + $(this).children("td").eq(9).text() + "," +
//     		              $(this).children("td").eq(10).text() + "\n";
//     	   }
//         }
//     );
//
//     saveAs(
//           new BB(
//               // ["\ufeff" + document.getElementById("content").value] //\ufeff防止utf8 bom防止中文乱码
//               ["\ufeff" + content] //\ufeff防止utf8 bom防止中文乱码
//             , {type: "text/plain;charset=utf8"}
//         )
//         , fileName
//     );
// };



//导出其它费用列表至 excel中
var exportList = function(){
    var BB = self.Blob;
    var fileName = "GuestList_" + formatDateDot(new Date()) + ".csv";
    var content = ",,,,,租客信息表\n姓名,房间号,公司,职务,电话,入住人数,车位,租金,入住时间,到期时间,备注\n";

    //获取筛选项中的用户名、房间号
	var name = $(".main-title input").eq(0).val();
	var roomId = $(".main-title input").eq(1).val();

    $.ajax({
        url:'/LD/guest/searchAllGuestByName.action',
        type:'post',
        dataType:'json',
        data:'{"name":"'+ name +'","roomId":"'+ roomId +'"}',
        contentType:'application/json',
        success:function(data){
            console.log(data);

            (data.dataList).map(function(record){

                content += record.guest_NAME + "," +
                    record.room_NUMBER + "," +
                    record.company + "," +
                    record.title + "," +
                    record.tel + "," +
                    record.persons + "," +
                    record.parking + "," +
                    record.charge + "," +
                    formatDateForm(new Date(record.timein)) + "," +
                    formatDateForm(new Date(record.timeout)) + "," +
                    record.comment + "\n";
            });

            saveAs(new BB(["\ufeff" + content] , {type: "text/plain;charset=utf8"}), fileName);
        }
    });
};

//打印其它车费
var printList = function()
{
    printData = [];

    //获取筛选项中的用户名、房间号
    var name = $(".main-title input").eq(0).val();
    var roomId = $(".main-title input").eq(1).val();

    $.ajax({
        url:'/LD/guest/searchAllGuestByName.action',
        type:'post',
        dataType:'json',
        data:'{"name":"'+ name +'","roomId":"'+ roomId +'"}',
        contentType:'application/json',
        success:function(data){
            console.log(data);

            (data.dataList).map(function(record){

                curRow = {};
                curRow["姓名"] = record.guest_NAME;
                curRow["房间号"] = record.room_NUMBER;
                curRow["公司"] = record.company;
                curRow["职务"] = record.title;
                curRow["电话"] = record.tel;
                curRow["入住人数"] = record.persons;
                curRow["车位"] = record.parking;
                curRow["租金"] = record.charge;
                curRow["入住时间"] = formatDateForm(new Date(record.timein));
                curRow["到期时间"] = formatDateForm(new Date(record.timeout));
                curRow["备注"] = record.comment;

                printData.push(curRow);
            });

            //打印
            printJS({printable: printData,
                properties: ['姓名','房间号','公司','职务','电话','入住人数','车位','租金','入住时间','到期时间','备注'],
                type: 'json',
                font_size: '8pt'});
        }
    });
};



// 根据房间号或姓名搜索用户
$(".btnSearch").bind("click", function(){
	var roomId = $(".main-title input").eq(0).val();
	var guestName = $(".main-title input").eq(1).val();

	searchGuestByName(roomId, guestName, 1);
});
var searchGuestByName = function(roomId, guestName, pageNum){
	$.ajax({
		url:'/LD/guest/searchGuestByName.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		data:'{"name":"'+ guestName +'","roomId":"'+ roomId +'","pageNum":'+ pageNum +'}',
		success:function(data){
			console.log(data);
			// 添加租客信息至页面中
			addGuestTable(data.recordTotal, data.pageList);

			$("#guestListBottom").append("<div class='bottom-page'>"+
        		"<span class='page-before' onclick='searchBeforeGuestByName();'>上一页&nbsp;&nbsp;</span>"+
        		"<span><input id='guestList_nowpage' value='"+ data.pageNow +"' type='text' class='input_num'></span>"+
        		"<span>&nbsp;/&nbsp;</span>"+
        		"<span id='guestList_totalpage'>"+ data.pageTotal +"</span>"+
            	"<span class='page-next' onclick='searchNextGuestByName();'>&nbsp;&nbsp;下一页</span>" +
            	"&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ data.recordTotal +"&nbsp;</span>条记录</div>");
		}
	});
}
var searchBeforeGuestByName = function(){
	var nowpage = parseInt($("#guestList_nowpage").val());
	if(nowpage == 1) return;
	
	searchGuestByName(nowpage-1);
};
var searchNextGuestByName = function(){
	var nowpage = parseInt($("#guestList_nowpage").val());
	var totalpage = parseInt($("#guestList_totalpage").text());
	if(nowpage == totalpage) return;
	
	searchGuestByName(nowpage+1);
};


// 向页面中添加租客信息
var addGuestTable = function(recordTotal, pageList){
	// 清空列表和页码
	$("#guestListTbody").html("");
	$("#guestListBottom").html("");	

	if (recordTotal == 0) {
		$("#guestListTbody").append("<tr><td class='no-data' colspan='6'>"+
			"没有相关数据！</td></tr>");
		return;
	}
	
	for(var i = 0; i < pageList.length; i++){
		var perRecord = pageList[i];

		var checkIn = formatDateForm(new Date(perRecord.timein));
		var checkOut = formatDateForm(new Date(perRecord.timeout));

		$("#guestListTbody").append("<tr><td>"+ perRecord.guest_NAME +"</td>"+
			"<td>"+ perRecord.room_NUMBER +"</td><td>"+ perRecord.company +"</td>"+
			"<td>"+ perRecord.title + "</td><td>"+ perRecord.tel +"</td>"+
			"<td>"+ perRecord.persons + "</td><td>"+ perRecord.parking +"</td>"+
			"<td>"+ perRecord.charge + "&nbsp;元</td><td>"+ checkIn +"</td>"+  
			"<td>"+ checkOut + "</td><td>"+ perRecord.comment +"</td>"+
			"<td><span class='detail'>详情</span></td></tr>");
	}	
}