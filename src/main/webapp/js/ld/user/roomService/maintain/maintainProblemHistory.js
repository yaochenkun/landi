

var searchProblemHistory = function(ID){
    $.ajax({
        url:'/LD/problem/searchProblemReply.action',
        type:'post',
        dataType:'json',
        contentType:'application/json',
        data:'{"ID":'+ ID  + '}',
        success:function(data) {
            // 清空列表
            console.log(data)
            $("#problemHistoryTbody").html("");

            if (data.recordTotal == 0) {
                $("#problemHistoryTbody").append("<tr><td colspan='9' style='color: #ff4d4d;'>没有相关信息！</td></tr>");
                return;
            } else {
                for (var i = 0; i < data.list.length; i++) {
                    var perRecord = data.list[i];

                    $("#problemHistoryTbody").append("<tr>"
                        + "<td>" + dealDate(perRecord.last_REPLAY_DATE) + "</td>"
                        + "<td>" + perRecord.last_REPLAY_DESCRIPTION + "</td>"
                        + "<td>" + perRecord.info_SOURCE + "</td>"
                        + "<td>" + perRecord.department + "</td>"
                        + "<td>" + perRecord.problem_STATE + "</td>"
                        + "<td>" + perRecord.fare + "</td>"
                        + "<td>" + perRecord.fare_PAY + "</td>"
                        + "<td>" + perRecord.fare_DETAIL + "</td>"
                        + "<td><a style='background-color: #fe4e4e;border: 1px solid black;' onclick='deleteReply(" + perRecord.id + "," + ID + ")'>删除</a></td></tr>");
                }
            }
        }

    });
}

var dealDate = function(date){
    if(date == null){
        return "";
    }else{
        return formatDateForm(new Date(date));
    }
}

var deleteReply = function(id,ID){
    $.ajax({
        url:'/LD/problem/deleteCertainProblemReply.action',
        type:'post',
        dataType:'json',
        contentType:'application/json',
        data:'{"ID":'+ id  + '}',
        success:function(data) {
            if(data == 1){
                showModalBox('success','添加成功!');
                searchProblemHistory(ID);
            }else{
                showModalBox('error','添加失败！');
            }
        }
    })
}
