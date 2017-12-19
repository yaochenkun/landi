// type 类型对应关系
var map = {1:"买入",2:"卖出",3:"废弃"};

(function(){
	//表头固定
		var tableH = $("table thead tr").offset().top;
		$(window).scroll(function(){
			var scrollH = $(this).scrollTop();
			if(scrollH >= tableH){
				$("table thead  tr").addClass("fixedThead");
                $("table thead tr th,table td").css({"width":"206px","height":"51px"});
                $("table thead tr th:nth-child(1),table td:nth-child(1)").css({"width":"275px"});
			}else if(scrollH < tableH){
				$("table thead tr").removeClass("fixedThead");
			}
		})
	}
  )();

// 请求某商品销售记录
var requestGoodDetail = function(pageNum){
	var date = $("#date_demo3").text();
	var array = date.split(" 至 ");
	var startDate = array[0];
	var endDate = array[1];
	console.log("请求商品销售记录 开始时间：" + startDate + " 结束时间：" + endDate);
	$.ajax({
		url:'/LD/userItem/searchAnnualSale.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		data:'{"id":'+ $("#goodId").text() +',"pageNum":'+ pageNum +','
			+'"from":"'+ startDate +'","to":"'+ endDate +'"}',
		success:function(data){
			console.log(data);
			// 清空
			$("#shopDetailTbody").html("");
			$("#shopDetailBottom").html("");

			if(data.recordTotal == 0){
				$("#shopDetailTbody").append("<td colspan='5' class='emptyText'>没有相关信息！</td>");
				return;
			}
			
			for(var i = 0; i < data.dataList.length; i++){
				var perRecord = data.dataList[i];
				$("#shopDetailTbody").append("<tr><td>"+ formatDate(new Date(perRecord.ctime)) +"</td>"+
					"<td>"+ map[perRecord.type] +"</td><td>"+ perRecord.per_MONEY +"</td>"+
					"<td>"+ perRecord.total +"</td><td>"+ perRecord.all_MONEY +"</td></tr>");
			}

			// 添加商品详情列表 底部页码
			$("#shopDetailBottom").append("<div class='bottom-page'>"+
	        	"<span class='page-before' onclick='requestBeforeGoodDetail();'>上一页&nbsp;&nbsp;</span>"+
	        	"<span><input id='shopDetail_nowpage' value='"+ data.pageNow +"' type='text' class='input_num'></span>"+
	        	"<span>&nbsp;/&nbsp;</span>"+
	        	"<span id='shopDetail_totalpage'>"+ data.pageTotal +"</span>"+
	            "<span class='page-next' onclick='requestNextGoodDetail();'>&nbsp;&nbsp;下一页</span>" +
	            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ data.recordTotal +"&nbsp;</span>条记录</div>");

			$(".bottom").wrap("<div class='fixedBottom'></div>");
		}
	});
};
//拉取上一页 商品销售情况信息
var requestBeforeGoodDetail = function(){
	var nowpage = parseInt($("#shopDetail_nowpage").val());
	if(nowpage == 1) return;
	requestGoodDetail(nowpage - 1);
};

// 拉取下一页 商品销售情况信息
var requestNextGoodDetail = function(){
	var nowpage = parseInt($("#shopDetail_nowpage").val());
	var totalpage = parseInt($("#shopDetail_totalpage").text());
	if(nowpage == totalpage) return;
	requestGoodDetail(nowpage + 1);
};