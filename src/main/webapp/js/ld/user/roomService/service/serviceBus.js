// 请求车费信息（日期：2016-02）
var requestFare = function(pageNum,date){
	console.log("查询第" + pageNum +"页车费信息");
	$.ajax({
		url:'/LD/userRoom/searchFare.action',
		type:'post',
		dataType:'json',
		data:'{"pageNum":'+ pageNum +',"date":"'+ date +'"}',
		contentType:'application/json',
		success:function(data){
			console.log(data);
			$(".emptyText").remove();
			
			if(data.recordTotal == 0){
				$("#busTable").css("display","none");
				$("#serviceBusBottom").css("display","none");
				$(".bill-table").append("<div class='emptyText'>没有相关信息！</div>");
			}else{
				clearFareDiv();
				$("#busTable").css("display","table");
				$("#serviceBusBottom").css("display","block");
				for(var i = 0; i < data.dataList.length; i++){
					addPerFare(data.dataList[i]);
				}
				// 添加洗衣单收费 底部页码
				$("#serviceBusBottom").append("<div class='bottom-page'>"+
		        	"<span class='page-before' onclick='requestBeforeFare();'>上一页&nbsp;&nbsp;</span>"+
		        	"<span><input id='fare_nowpage' value='"+ data.pageNow +"' type='text' class='input_num'></span>"+
		        	"<span>&nbsp;/&nbsp;</span>"+
		        	"<span id='fare_totalpage'>"+ data.pageTotal +"</span>"+
		            "<span class='page-next' onclick='requestNextFare();'>&nbsp;&nbsp;下一页</span>" +
		            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ data.recordTotal +"&nbsp;</span>条记录</div>");
			}
		}
	});
};
//拉取上一页 车费信息
var requestBeforeFare = function(){
	var nowpage = parseInt($("#fare_nowpage").val());
	if(nowpage == 1) return;
	requestFare(nowpage - 1);
};

// 拉取下一页 车费信息
var requestNextFare = function(){
	var nowpage = parseInt($("#fare_nowpage").val());
	var totalpage = parseInt($("#fare_totalpage").text());
	if(nowpage == totalpage) return;
	requestFare(nowpage + 1);
};

///////////////////////////////////////////////////////条件查询车费信息
// 按房间号和日期查询车费信息
var serachFareByDate = function(pageNum){
	var roomNum = $("#searchRoomNum").val();
	var date = $("#month_picker").text();
	console.log("查询房间号：" + roomNum + " 日期：" + date + "的车费信息");
	$.ajax({
		url:'/LD/userRoom/searchFare.action',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		data:'{"roomNum":"'+ roomNum +'","date":"'+ date +'","pageNum":'+ pageNum +'}',
		success:function(data){
			console.log(data);
			$(".emptyText").remove();
			
			if(data.recordTotal == 0){
				$("#busTable").css("display","none");
				$("#serviceBusBottom").css("display","none");
				$(".bill-table").append("<div class='emptyText'>没有相关信息！</div>");
			}else{
				clearFareDiv();
				$("#busTable").css("display","table");
				$("#serviceBusBottom").css("display","block");
				for(var i = 0; i < data.dataList.length; i++){
					addPerFare(data.dataList[i]);
				}
				// 添加车费 底部页码
				$("#serviceBusBottom").append("<div class='bottom-page'>"+
		        	"<span class='page-before' onclick='requestBeforeFareByDate();'>上一页&nbsp;&nbsp;</span>"+
		        	"<span><input id='fare_nowpage' value='"+ data.pageNow +"' type='text' class='input_num'></span>"+
		        	"<span>&nbsp;/&nbsp;</span>"+
		        	"<span id='fare_totalpage'>"+ data.pageTotal +"</span>"+
		            "<span class='page-next' onclick='requestNextFareByDate();'>&nbsp;&nbsp;下一页</span>" +
		            "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ data.recordTotal +"&nbsp;</span>条记录</div>");
			}
		}
	});
};
//拉取上一页 车费信息
var requestBeforeFareByDate = function(){
	var nowpage = parseInt($("#fare_nowpage").val());
	if(nowpage == 1) return;
	serachFareByDate(nowpage - 1);
};

// 拉取下一页 车费信息
var requestNextFareByDate = function(){
	var nowpage = parseInt($("#fare_nowpage").val());
	var totalpage = parseInt($("#fare_totalpage").text());
	if(nowpage == totalpage) return;
	serachFareByDate(nowpage + 1);
};

////////////////////////////////////////////////////////////////////
// 清空车费表格
var clearFareDiv = function(){
	$(".date").html("<td>月份</td>");
	$(".roomNo").html("<td>房间号</td>");
	$(".name").html("<td>租客姓名</td>");
	$(".price").html("<td></td>");

	$(".one").html("<td>1日</td>");
	$(".two").html("<td>2日</td>");
	$(".three").html("<td>3日</td>");
	$(".four").html("<td>4日</td>");
	$(".five").html("<td>5日</td>");
	$(".six").html("<td>6日</td>");
	$(".seven").html("<td>7日</td>");
	$(".eight").html("<td>8日</td>");
	$(".nine").html("<td>9日</td>");
	$(".ten").html("<td>10日</td>");
	$(".eleven").html("<td>11日</td>");
	$(".twelve").html("<td>12日</td>");
	$(".thirteen").html("<td>13日</td>");
	$(".fourteen").html("<td>14日</td>");
	$(".fifteen").html("<td>15日</td>");
	$(".sixteen").html("<td>16日</td>");
	$(".seventeen").html("<td>17日</td>");
	$(".eighteen").html("<td>18日</td>");
	$(".nineteen").html("<td>19日</td>");
	$(".twenty").html("<td>20日</td>");
	$(".twentyOne").html("<td>21日</td>");
	$(".twentyTwo").html("<td>22日</td>");
	$(".twentyThree").html("<td>23日</td>");
	$(".twentyFour").html("<td>24日</td>");
	$(".twentyFive").html("<td>25日</td>");
	$(".twentySix").html("<td>26日</td>");
	$(".twentySeven").html("<td>27日</td>");
	$(".twentyEight").html("<td>28日</td>");
	$(".twentyNine").html("<td>29日</td>");
	$(".thirty").html("<td>30日</td>");
	$(".thirtyOne").html("<td>31日</td>");

	// 合计
	$(".days").html("<td>总天数</td>");
	$(".total").html("<td>合计</td>");

	$("#serviceBusBottom").html("");
};

// 添加每条车费信息
var addPerFare = function(perRecord){
	
	$(".date").append("<td>"+ perRecord.year + "-" + perRecord.month +"</td>");
	$(".roomNo").append("<td>"+ perRecord.room_NUM +"</td>");
	$(".name").append("<td>"+ perRecord.guest_NAME +"</td>");

	$(".price").append("<td>通勤记录</td>");

	var first = perRecord.first == 0 ? "" : perRecord.first;
	var second = perRecord.second == 0 ? "" : perRecord.second;
	var third = perRecord.third == 0 ? "" : perRecord.third;
	var fourth = perRecord.fourth == 0 ? "" : perRecord.fourth;
	var fifth = perRecord.fifth == 0 ? "" : perRecord.fifth;
	var sixth = perRecord.sixth == 0 ? "" : perRecord.sixth;
	var seventh = perRecord.seventh == 0 ? "" : perRecord.seventh;
	var eighth = perRecord.eighth == 0 ? "" : perRecord.eighth;
	var ninth = perRecord.ninth == 0 ? "" : perRecord.ninth;
	var tenth = perRecord.tenth == 0 ? "" : perRecord.tenth;
	var eleventh = perRecord.eleventh == 0 ? "" : perRecord.eleventh;
	var twelfth = perRecord.twelfth == 0 ? "" : perRecord.twelfth;
	var thirteenth = perRecord.thirteenth == 0 ? "" : perRecord.thirteenth;
	var fourteenth = perRecord.fourteenth == 0 ? "" : perRecord.fourteenth;
	var fifteenth = perRecord.fifteenth == 0 ? "" : perRecord.fifteenth;
	var sixteenth = perRecord.sixteenth == 0 ? "" : perRecord.sixteenth;
	var seventeenth = perRecord.seventeenth == 0 ? "" : perRecord.seventeenth;
	var eighteenth = perRecord.eighteenth == 0 ? "" : perRecord.eighteenth;
	var nineteenth = perRecord.nineteenth == 0 ? "" : perRecord.nineteenth;
	var twentieth = perRecord.twentieth == 0 ? "" : perRecord.twentieth;
	var twenty_FIRST = perRecord.twenty_FIRST == 0 ? "" : perRecord.twenty_FIRST;
	var twenty_SECOND = perRecord.twenty_SECOND == 0 ? "" : perRecord.twenty_SECOND;
	var twenty_THIRD = perRecord.twenty_THIRD == 0 ? "" : perRecord.twenty_THIRD;
	var twenty_FOURTH = perRecord.twenty_FOURTH == 0 ? "" : perRecord.twenty_FOURTH;
	var twenty_FIFTH = perRecord.twenty_FIFTH == 0 ? "" : perRecord.twenty_FIFTH;
	var twenty_SIXTH = perRecord.twenty_SIXTH == 0 ? "" : perRecord.twenty_SIXTH;
	var twenty_SEVENTH = perRecord.twenty_SEVENTH == 0 ? "" : perRecord.twenty_SEVENTH;
	var twenty_EIGHTH = perRecord.twenty_EIGHTH == 0 ? "" : perRecord.twenty_EIGHTH;
	var twenty_NINTH = perRecord.twenty_NINTH == 0 ? "" : perRecord.twenty_NINTH;
	var thirtieth = perRecord.thirtieth == 0 ? "" : perRecord.thirtieth;
	var thirty_FIRST = perRecord.thirty_FIRST == 0 ? "" : perRecord.thirty_FIRST;

	$(".one").append("<td>"+ first +"</td>");
	$(".two").append("<td>"+ second +"</td>");
	$(".three").append("<td>"+ third +"</td>");
	$(".four").append("<td>"+ fourth +"</td>");
	$(".five").append("<td>"+ fifth +"</td>");
	$(".six").append("<td>"+ sixth +"</td>");
	$(".seven").append("<td>"+ seventh +"</td>");
	$(".eight").append("<td>"+ eighth +"</td>");
	$(".nine").append("<td>"+ ninth +"</td>");
	$(".ten").append("<td>"+ tenth +"</td>");
	$(".eleven").append("<td>"+ eleventh +"</td>");
	$(".twelve").append("<td>"+ twelfth +"</td>");
	$(".thirteen").append("<td>"+ thirteenth +"</td>");
	$(".fourteen").append("<td>"+ fourteenth +"</td>");
	$(".fifteen").append("<td>"+ fifteenth +"</td>");
	$(".sixteen").append("<td>"+ sixteenth +"</td>");
	$(".seventeen").append("<td>"+ seventeenth +"</td>");
	$(".eighteen").append("<td>"+ eighteenth +"</td>");
	$(".nineteen").append("<td>"+ nineteenth +"</td>");
	$(".twenty").append("<td>"+ twentieth +"</td>");
	$(".twentyOne").append("<td>"+ twenty_FIRST +"</td>");
	$(".twentyTwo").append("<td>"+ twenty_SECOND +"</td>");
	$(".twentyThree").append("<td>"+ twenty_THIRD +"</td>");
	$(".twentyFour").append("<td>"+ twenty_FOURTH +"</td>");
	$(".twentyFive").append("<td>"+ twenty_FIFTH +"</td>");
	$(".twentySix").append("<td>"+ twenty_SIXTH +"</td>");
	$(".twentySeven").append("<td>"+ twenty_SEVENTH +"</td>");
	$(".twentyEight").append("<td>"+ twenty_EIGHTH +"</td>");
	$(".twentyNine").append("<td>"+ twenty_NINTH +"</td>");
	$(".thirty").append("<td>"+ thirtieth +"</td>");
	$(".thirtyOne").append("<td>"+ thirty_FIRST +"</td>");

	// 合计
	$(".days").append("<td>" + perRecord.days + "&nbsp;天</td>");
	$(".total").append("<td>" + perRecord.total + "&nbsp;元</td>");
};

/////////////////////////////////////////////////////// 添加车费记录
var addserviceBus = function(){
	// 判断房间号是否为空
	if($("#serviceRoomNumber").val() == ""){
		$("#roomIdWarning").css("display","block");
		$("#serviceRoomNumber").addClass("border-red");
		console.log("房间号为空！");
		return;
	}
	requestAddServiceBus();
};
// 请求添加车费记录
var requestAddServiceBus = function(){
	console.log("添加车费记录");
	var roomNum = $("#serviceRoomNumber").val();
	var date = $("#newBusDate").text();
	var name = $("#guestName").val();

	// 遍历日期
	var perRecord = "";
	for(var i = 0; i < 31; i++){
		var price = $("table input").eq(i).val();
		if(price != ""){
			perRecord += '{"day":'+ (i + 1) +',"price":'+ price +'},';
		}
	}
	if(perRecord != ""){
		perRecord = perRecord.substring(0, perRecord.length -1);
	}
	console.log(perRecord);

	$.ajax({
		url:'/LD/userRoom/addFare.action',
		type:'post',
		contentType:'application/json',
		dataType:'json',
		data:'{"date":"'+ date +'","roomNum":"'+ roomNum +'","name":"'+ name +'",'
			+'"perRecord":['+ perRecord +']}',
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
