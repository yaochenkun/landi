// 查询系统餐费信息(餐费信息 type为1)
var requestAjaxTakeaway = function(pageNum){
	var type = parseInt(1); 
	console.log("请求第"+ pageNum + "页餐费信息");
	$.ajax({
		url:'/LD/userRoom/roomSearchSource.action',
		type:'post',
		contentType:'application/json',
		data:'{"pageNum":"'+ pageNum +'","type":"'+ type +'"}',
		dataType:'json',
		success:function(data){
			console.log(data);
		}
	});
	$("#takeawayTbody").html("");
	$("#serviceTakeawayBottom").html("");
	for(var i=0; i<20; i++){
		$("#takeawayTbody").append("<tr><td><span>1</span></td><td>Ada</td><td>衣服</td><td>1</td>"+
				"<td>2016-3-30</td><td>2,000&nbsp;元</td><td>无</td></tr>");
	}	
	// 添加餐费 底部页码
	$("#serviceTakeawayBottom").append("<div class='bottom-page'>"+
        	"<span class='page-before' onclick='requestBeforeTakeaway();'>上一页&nbsp;&nbsp;</span>"+
        	"<span><input id='takeawaylist_nowpage' value='1' type='text' class='input_num'></span>"+
        	"<span>&nbsp;/&nbsp;</span>"+
        	"<span id='userlist_totalpage'>2</span>"+
            "<span class='page-next' onclick='requestNextTakeaway();'>&nbsp;&nbsp;下一页</span>" +
            "&nbsp;&nbsp;&nbsp;&nbsp;共83条记录</div>");
}