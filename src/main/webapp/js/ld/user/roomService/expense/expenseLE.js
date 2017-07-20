//
// $(function(){
//     $(".btnSearch").keydowm(function(e){
//         if(e.keyCode == 13){
//             getExpenseInfo($("#roomNumber").val(),parseInt(1),);
//         }
//     })
// })

var getExpenseInfo = function(number , pageNow , type) {

    $.ajax({
        type:'post',
        url:'/LD/userRoom/getExpenseInfo.action',
        contentType:'application/json',
        dataType:'json',
        data:'{"rNum":"' + number + '","rType":"' + type + '","pageNow":' +pageNow + '}',
        success:function(data){
            if(data.State == 'Invalid'){
                $("#Tbody").html('<tr><td class="no-data" colspan="7" style="color: #ff4d4d">无相关数据!</td></tr>');
            }else {
                var pageNow = data.pageNow;
                var pageTotal = data.pageTotal;
                var recordTotal = data.recordTotal;
                if(recordTotal == 0){
                    $("#Tbody").html('<tr><td class="no-data" colspan="7" style="color: #ff4d4d">无相关数据!</td></tr>');
                }else{
                    $("#Tbody").html("");
                    var costs = data.pageList;
                    for(var i=0;i<costs.length;i++){
                        var type = costs[i].type == null? "":costs[i].type;
                        var guest = costs[i].guest_NAME;
                        var project = costs[i].project == null? "":costs[i].project;
                        var server = costs[i].customer_SERVICE_STAFF == null? "":costs[i].customer_SERVICE_STAFF;
                        var op = costs[i].operation_STAFF == null? "":costs[i].operation_STAFF;
                        var reason = costs[i].reason == null? "":costs[i].reason;
                        var expense = costs[i].cost == null? "":costs[i].cost;
                        var num = costs[i].room_NUM;
                        $("#Tbody").append('<tr><td>'+num +'</td><td>'+ guest +
                            '</td><td>'+ project +'</td><td>'+ server +'</td><td>'+ op +'</td><td>'+ reason +'</td><td>' +
                            expense+'元</td>');
                    }
                    $("#Bottom").html("<div class='bottom-page'>"+
                        "<span class='page-before' onclick='requestBeforeAndAfter(\"" + number + "\",\"" + type + "\"," + pageNow +"-1);'>上一页&nbsp;&nbsp;</span>"+
                        "<span><input id='shoppinglist_nowpage' value='" + pageNow +"' type='text' class='input_num'></span>"+
                        "<span>&nbsp;/&nbsp;</span>"+
                        "<span id='shoppinglist_totalpage'>"+ pageTotal +"</span>"+
                        "<span class='page-next' onclick='requestBeforeAndAfter(\"" + number + "\",\"" + type + "\"," + pageNow + "+1);'>&nbsp;&nbsp;下一页</span>" +
                        "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ recordTotal +"&nbsp;</span>条记录</div>");

                }
            }
        }
    })
}

function requestBeforeAndAfter (number , type ,pageNow) {
    if(pageNow<1) return;
    else {
        getExpenseInfo(number , pageNow ,type);
    }
}



//打印
var printList = function (type) {
    printData = [];
    var roomNum = $("#roomNumber").val();

    $.ajax({
        url:'/LD/userRoom/getAllExpenseInfo.action',
        type:'post',
        dataType:'json',
        data:'{"type":"'+ type +'","rNum":"'+ roomNum +'"}',
        contentType:'application/json',
        success:function(data){
            console.log(data);

            records = data.dataList;

            if(data.State == "Valid" ){
                for(var i=0;i<records.length;i++){
                    var record = records[i];

                    curRow = {};
                    curRow["房间号"] = record.room_NUM;
                    curRow["租客"] = record.guest_NAME;
                    curRow["项目"] = record.project;
                    curRow["客服人员"] = record.customer_SERVICE_STAFF;
                    curRow["操作人员"] = record.operation_STAFF;
                    curRow["原因"]= record.reason;
                    curRow["金额"] = record.cost + '元';
                    curRow["费用类型"] = type == 'welfare'?'福利费':'安抚费';
                    printData.push(curRow);
                }

                //打印
                printJS({printable: printData,
                    properties: ['房间号', '租客', '项目', '客服人员', '操作人员', '原因', '金额','费用类型'],
                    type: 'json',
                    font_size: '9pt'});
            }else{
                showModalBox("error","打印失败");
            }
        }
    });
}

//导出
var exportList = function (type) {
    var BB = self.Blob;
    var fileName = "RoomManageList_" + formatDateDot(new Date()) + ".csv";
    var content = ",,LE承担费用记录表\n房间号,租客,项目,客服人员,操作人员,原因,金额,费用类型\n";

    //根据当前房间号查询内容，请求所有记录（不分页）
    var roomNum = $("#roomNumber").val();
    $.ajax({
        url:'/LD/userRoom/getAllExpenseInfo.action',
        type:'post',
        dataType:'json',
        data:'{"type":"'+ type +'","rNum":"'+ roomNum +'"}',
        contentType:'application/json',
        success:function(data){

            records = data.dataList;

            if(data.State == "Valid"){
                for(var i=0;i<records.length;i++){
                    var record = records[i];
                    content += record.room_NUM + "," +
                        record.guest_NAME + "," +
                        record.project + "," +
                        record.customer_SERVICE_STAFF + "," +
                        record.operation_STAFF + "," +
                        record.reason + "," +
                        record.cost + "元," +
                        type == 'welfare'?'福利费':'安抚费' + "\n";
                }
                saveAs(new BB(["\ufeff" + content] , {type: "text/plain;charset=utf8"}), fileName);
            }
            else{
                showModalBox("error","导出失败");
            }
        }
    });
}