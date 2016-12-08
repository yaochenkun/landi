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
			// 清空列表和页码
			$("#guestListTbody").html("");
			$("#guestListBottom").html("");

			var pageNow = data.pageNow;
			var pageTotal = data.pageTotal;
			var recordTotal = data.recordTotal;

			if (recordTotal == 0) {
				$("#guestListTbody").append("<tr><td class='no-data' colspan='6'>"+
					"没有相关数据！</td></tr>");
				return;
			}
			
			for(var i=0; i<data.pageList.length; i++){
				var perRecord = data.pageList[i];

				var checkIn = formatDate(new Date(perRecord.timein));
				var checkOut = formatDate(new Date(perRecord.timeout));

				$("#guestListTbody").append("<tr><td>"+ perRecord.guest_NAME +"</td>"+
					"<td>"+ perRecord.room_NUMBER +"</td><td>"+ perRecord.company +"</td>"+
					"<td>"+ perRecord.title + "</td><td>"+ perRecord.tel +"</td>"+
					"<td>"+ perRecord.persons + "</td><td>"+ perRecord.parking +"</td>"+
					"<td>"+ perRecord.charge + "&nbsp;元</td><td>"+ checkIn +"</td>"+  
					"<td>"+ checkOut + "</td><td>"+ perRecord.comment +"</td>"+
					"<td><span class='detail'>详情</span></td></tr>");
			}	

			// 添加租客列表 底部页码
			$("#guestListBottom").append("<div class='bottom-page'>"+
		        	"<span class='page-before' onclick='requestBeforeGuestList();'>上一页&nbsp;&nbsp;</span>"+
		        	"<span><input id='guestList_nowpage' value='"+ pageNow +"' type='text' class='input_num'></span>"+
		        	"<span>&nbsp;/&nbsp;</span>"+
		        	"<span id='guestList_totalpage'>"+ pageTotal +"</span>"+
		            "<span class='page-next' onclick='requestNextGuestList();'>&nbsp;&nbsp;下一页</span>" +
		            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ recordTotal +"&nbsp;</span>条记录</div>");
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