var EXIST_GUEST = 0;

var check = function(rNum) {
    if(rNum =="" || EXIST_GUEST == 0) return 0;
    else return 1;
}

var addDate = function (type) {
    var rNum = $("#roomNumber").val()
    var guest = $("#guestName").val()
    var project = $("#project").val()
    var service = $("#service_staff").val()
    var operation = $("#operation_staff").val()
    var reason = $("#reason").val()
    var cost = $("#cost").val()
    if(check(rNum) == 0) return ;

    console.log('{"rNum":"' + rNum + '","guest":"' + guest + '","project":"' + project + '","service":"' + service
        + '","operation":"' + operation + '","reason":"' + reason + '","cost":' + cost + ',"type":"' + type +'"}')

    $.ajax({
        type:'post',
        url:'/LD/userRoom/addExpenseOfLE.action',
        contentType:'application/json',
        dataType:'json',
        data:'{"rNum":"' + rNum + '","guest":"' + guest + '","project":"' + project + '","service":"' + service
        + '","operation":"' + operation + '","reason":"' + reason + '","cost":' + cost + ',"type":"' + type +'"}',
        success:function(data){
            if(data == 0){
                showModalBox("error","添加失败！")
            }
            else{
                showModalBox("success","添加成功！")
            }
        }
    })
}


//客户姓名联动
var associateGuestName = function(element){

    var roomNum = $(element).val(); //这里是需要根据页面元素变的
    console.log(roomNum)
    $.ajax({
        url:'/LD/userRoom/searchGuestName.action',
        type:'post',
        dataType:'json',
        data:'{"roomNum":"'+ roomNum +'"}',
        contentType:'application/json',
        success:function(data){
            console.log(data);

            if(data.State == "Valid") {
                if(data.guest_NAME != null) {
                    $("#guestName").val(data.guest_NAME); //这里是需要根据页面元素变的
                    EXIST_GUEST = 1;
                } else {
                    $("#guestName").val("尚无客户，请重新填写房间号");
                    EXIST_GUEST = 0;
                }
            } else {
                $("#guestName").val("数据库异常");
                EXIST_GUEST = 0;
            }
        }
    });

};