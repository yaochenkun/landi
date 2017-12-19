// 客房服务--电费
(function(){

    //表头固定 lyd
    var tableH = $("table thead tr").offset().top;
    console.log(tableH)
    $(window).scroll(function(){
        var scroH = $(this).scrollTop();

        if(scroH >= tableH){
            $("table thead").addClass("fixedThead");
            $("table thead tr th").css("width","110px");
            for(var i = 0; i<11;i++){
                $("table tbody tr:eq(0) td:eq(" + i +")").css("width",$("table thead tr th:eq(" + i +")").width());
            }


        }else if(scroH < tableH){
            $("table thead").removeClass("fixedThead");
        }
    })


})();



// 初始绑定搜索键盘事件
$(function(){
	$(".search-input").keydown(function(e){
		// 回车键
		if(e.keyCode==13){
            requestElec($("#roomNumber").val(),parseInt(1));
		}
	})
});

var requestBeforeAndAfter = function(num,page){
    if(page<1) return;
    var totalpage = parseInt($("#eleclist_totalpage").text());
    if(page > totalpage) return;
    requestElec(num,page);
}

// 查询系统电费信息
var requestElec = function(num,pageNum){
	var type = 'elec';
	console.log("请求第"+ pageNum + "页电费信息");
	
	$.ajax({
		url:'/LD/userRoom/getRoomMeters.action',
		type:'post',
		contentType:'application/json',
		data:'{"pageNum":'+ pageNum +',"type":"'+ type + '","rNum":"' + num+ '"}',
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.State == "Invalid"){
                $("#elecTbody").append("<tr><td class='no-data' colspan='7' style='color: #ff4d4d'>"+
                    "您没有权限访问本页数据，请尝试升级权限或回退！</td></tr>");
				return;
			}
			else if(data.State == "Valid"){
				// 清空列表和页码
				$("#elecTbody").html("");
				$("#serviceElecBottom").html("");

				var pageNow = data.pageNow;
				var pageTotal = data.pageTotal;
				var recordTotal = data.recordTotal;

				if (recordTotal == 0) {
					$("#elecTbody").append("<tr><td class='no-data' colspan='7' style='color: #ff4d4d'>"+
						"没有相关数据！</td></tr>");
					return;
				}
				
				for(var i=0; i<data.pageList.length; i++){
					var perRecord = data.pageList[i];
                    var money = perRecord.money;
                    if(money == null) money=0.0;
                    else money = money.toFixed(2);

					$("#elecTbody").append("<tr><td>"+ data.number[perRecord.room_ID] +"</td>"+
                        "<td>"+ data.guest[perRecord.room_ID] +"</td><td>"+ perRecord.meter_NUMBER +"</td>"+
                        "<td>"+ perRecord.year_INIT_VAL + "</td>" +
                        "<td>"+ perRecord.cur_VAL +"</td>"+
                        "<td>"+ perRecord.month + "</td>" +
                        "<td style='color: red'>"+ money +"&nbsp;元</td>"+ "</td>"+
                        "<td>"+ perRecord.step +"</td>"+
                        "<td><a class='btn-green' href='sourceNew.jsp?type=elec&number=" + data.number[perRecord.room_ID] + "&guest=" + data.guest[perRecord.room_ID] + "&init=" + perRecord.year_INIT_VAL+"'>新增查表</a></td>" +
                        "<td><a class='btn-green' href='sourceHistory.jsp?type=elec&number=" + data.number[perRecord.room_ID]+ "&guest=" + data.guest[perRecord.room_ID] + "&init=" + perRecord.year_INIT_VAL+ "&state=one" + "'>查看</a></td>" +
                        "<td><a class='btn-blue' href='sourceHistory.jsp?type=elec&number=" + data.number[perRecord.room_ID]+ "&guest=" + data.guest[perRecord.room_ID] + "&init=" + perRecord.year_INIT_VAL+ "&state=all" + "'>历史查看</a></td></tr>");
				}	

				// 添加电费 底部页码
				$("#serviceElecBottom").append("<div class='bottom-page'>"+
			        	"<span class='page-before' onclick='requestBeforeAndAfter(\"" + num + "\"," + pageNum + "-1);'>上一页&nbsp;&nbsp;</span>"+
			        	"<span><input id='eleclist_nowpage' value='"+ pageNow +"' type='text' class='input_num'></span>"+
			        	"<span>&nbsp;/&nbsp;</span>"+
			        	"<span id='eleclist_totalpage'>"+ pageTotal +"</span>"+
			            "<span class='page-next' onclick='requestBeforeAndAfter(\"" + num + "\"," + pageNum + "+1);'>&nbsp;&nbsp;下一页</span>" +
			            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ recordTotal +"&nbsp;</span>条记录</div>");

                $(".bottom").wrap("<div class='fixedBottom'></div>");

            }
		}
	});
}






