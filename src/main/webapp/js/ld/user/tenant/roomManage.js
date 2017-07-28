
//获取房间信息
var getRoomManageInfo = function (number , type ,pageNow) {

    console.log('{"rNum":"' + number + '","rType":"' + type + '","pageNow":' +pageNow + '}');
    $.ajax({
        type:'post',
        url:'/LD/userRoom/getRoomManageInfo.action',
        contentType:'application/json',
        dataType:'json',
        data:'{"rNum":"' + number + '","rType":"' + type + '","pageNow":' +pageNow + '}',
        success:function(data) {
            if(data.State == 'Invalid'){
                $("#roomManageTbody").html('<tr><td class="no-data" colspan="7" style="color: #ff4d4d">无相关数据!</td></tr>');
            }else {
                var pageNow = data.pageNow;
                var pageTotal = data.pageTotal;
                var recordTotal = data.recordTotal;
                if(recordTotal == 0){
                    $("#roomManageTbody").html('<tr><td class="no-data" colspan="7" style="color: #ff4d4d">无相关数据!</td></tr>');
                }else{
                    $("#roomManageTbody").html("");
                    var rooms = data.pageList;
                    for(var i=0;i<rooms.length;i++){
                        var roomtype = rooms[i].type == null? "":rooms[i].type;
                        var owner = rooms[i].owner_NAME == null? "":rooms[i].owner_NAME;
                        var receipt = rooms[i].receipt_TIME == null? "":formatDateForm(new Date(rooms[i].receipt_TIME));
                        var refund = rooms[i].refund_TIME == null? "":formatDateForm(new Date(rooms[i].refund_TIME));
                        var comm = rooms[i].comm == null? "":rooms[i].comm;
                        var replace = rooms[i].replace_ROOM == null? "":rooms[i].replace_ROOM;

                        $("#roomManageTbody").append('<tr><td>'+rooms[i].room_NUMBER+'</td><td>'+roomtype+
                            '</td><td>'+ owner +'</td><td>'+ receipt +'</td><td>'+ refund +'</td><td>'+ replace +'</td><td>' +
                            comm+'</td>');
                    }
                    $("#roomManageBottom").html("<div class='bottom-page'>"+
                        "<span class='page-before' onclick='requestBeforeAndAfter(\"" + number + "\",\"" + type + "\"," + pageNow +"-1);'>上一页&nbsp;&nbsp;</span>"+
                        "<span><input id='shoppinglist_nowpage' value='" + pageNow +"' type='text' class='input_num'></span>"+
                        "<span>&nbsp;/&nbsp;</span>"+
                        "<span id='shoppinglist_totalpage'>"+ pageTotal +"</span>"+
                        "<span class='page-next' onclick='requestBeforeAndAfter(\"" + number + "\",\"" + type + "\"," + pageNow + "+1);'>&nbsp;&nbsp;下一页</span>" +
                        "&nbsp;&nbsp;&nbsp;&nbsp;共<span class='recordTotal'>&nbsp;"+ recordTotal +"&nbsp;</span>条记录</div>");

                }
            }

        }
    });
}

function requestBeforeAndAfter (number , type ,pageNow) {
    if(pageNow<1) return;
    else {
        getRoomManageInfo(number , type ,pageNow);
    }
}




//打印
var printList = function () {
    printData = [];
    var roomNum = $("#roomNumber").val();
    var type = $("#roomType").val();
    console.log('{"type":"'+ type +'","rNum":"'+ roomNum +'"}');

    $.ajax({
        url:'/LD/userRoom/getAllRoomManageInfo.action',
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
                    receipt = record.receipt_TIME == null? "":formatDateForm(new Date(record.receipt_TIME));
                    refund = record.refund_TIME == null? "":formatDateForm(new Date(record.refund_TIME));

                    curRow = {};
                    curRow["房间号"] = record.room_NUMBER;
                    curRow["房源类型"] = record.type;
                    curRow["业主姓名"] = record.owner_NAME;
                    curRow["接收时间"] = receipt;
                    curRow["退还日期"] = refund;
                    curRow["替换房间"]= record.replace_ROOM;
                    curRow["备注"] = record.comm;

                    printData.push(curRow);
                }

                //打印
                printJS({printable: printData,
                    properties: ['房间号', '房源类型', '业主姓名', '接收时间', '退还日期', '替换房间', '备注'],
                    type: 'json',
                    font_size: '9pt'});
            }else{
                showModalBox("error","打印失败");
            }
        }
    });
}


//导出
var exportList = function () {
    var BB = self.Blob;
    var fileName = "RoomManageList_" + formatDateDot(new Date()) + ".csv";
    var content = ",,房源管理记录表\n房间号,房源类型,业主姓名,接收时间,退还日期,替换房间,备注\n";

    //根据当前房间号查询内容，请求所有记录（不分页）
    var roomNum = $("#roomNumber").val();
    var type = $("#roomType").val();
    $.ajax({
        url:'/LD/userRoom/getAllRoomManageInfo.action',
        type:'post',
        dataType:'json',
        data:'{"type":"'+ type +'","rNum":"'+ roomNum +'"}',
        contentType:'application/json',
        success:function(data){

            records = data.dataList;
            console.log(records)

            if(data.State == "Valid"){
                for(var i=0;i<records.length;i++){
                    var record = records[i];

                    receipt = record.receipt_TIME == null? "":formatDateForm(new Date(record.receipt_TIME));
                    refund = record.refund_TIME == null? "":formatDateForm(new Date(record.refund_TIME));
                    content += record.room_NUMBER + "," +
                        record.type + "," +
                        record.owner_NAME + "," +
                        receipt + "," +
                        refund + "," +
                        record.replace_ROOM + "," +
                        record.comm + "\n";
                }
                 saveAs(new BB(["\ufeff" + content] , {type: "text/plain;charset=utf8"}), fileName);
            }
            else{
                showModalBox("error","导出失败");
            }
        }
    });
}
