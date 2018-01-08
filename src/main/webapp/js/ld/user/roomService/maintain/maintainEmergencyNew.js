
$(function(){
    $("#repairPart").addClass("showNone");
    $("#peopleDamagePart").addClass("showNone");
    $("#objectDamagePart").addClass("showNone");
    $("#witnessPart").addClass("showNone");

    $("#hide").hide();
    $("#testarea1").addClass("showNone");

    $("#hide1").hide();
    $("#hide2").hide();
    $("#hide3").hide();
    $("#only4").hide();

    $("#textarea2").addClass("showNone");


    $('#only1').find('input[type=checkbox]').bind('click',function(){
        $('#only1').find('input[type=checkbox]').not(this).attr("checked",false);
    })

    $('#only2').find('input[type=checkbox]').bind('click',function(){
        $('#only2').find('input[type=checkbox]').not(this).attr("checked",false);
    })

    $('#only3').find('input[type=checkbox]').bind('click',function(){
        $('#only3').find('input[type=checkbox]').not(this).attr("checked",false);
    })

    $('#only4').find('input[type=checkbox]').bind('click',function(){
        $('#only4').find('input[type=checkbox]').not(this).attr("checked",false);
    })

});

var damageType = function(){
    if($("#repair").is(':checked')){
        $("#repairPart").removeClass("showNone");
    }else{
        $("#repairPart").addClass("showNone");
    }
    if($("#people").is(':checked')){
        $("#peopleDamagePart").removeClass("showNone");
    }else{
        $("#peopleDamagePart").addClass("showNone");
    }
    if($("#object").is(':checked')){
        $("#objectDamagePart").removeClass("showNone");
    }else{
        $("#objectDamagePart").addClass("showNone");
    }
}


var haveWitness = function(){
    if($("#yes").is(':checked')){
        $("#witnessPart").removeClass("showNone");
    }else{
        $("#witnessPart").addClass("showNone");
    }
    if($("#no").is(':checked')){
        $("#witnessPart").addClass("showNone");
    }
}

var problemReasonCheck = function(){
    if($("#reasonYes").is(':checked')){
        $("#hide").show();
        $("#testarea1").removeClass("showNone");
    }else{
        $("#hide").hide();
        $("#testarea1").addClass("showNone");
    }
    if($("#reasonNo").is(':checked')){
        $("#hide").hide();
        $("#testarea1").addClass("showNone");
    }
}

var isHurtPeople = function(){
    if($("#hurtPeople").is(':checked')){
        $("#hide1").show();
        $("#hide2").show();
        $("#hide3").show();
        $("#only4").show();
        $("#textarea2").removeClass("showNone");
    }else{
        $("#hide1").hide();
        $("#hide2").hide();
        $("#hide3").hide();
        $("#only4").hide();
        $("#textarea2").addClass("showNone");
    }

    if($("#noHurtPeople").is(':checked')){
        $("#hide1").hide();
        $("#hide2").hide();
        $("#hide3").hide();
        $("#only4").hide();
        $("#textarea2").addClass("showNone");
    }
}
var addEmergencyProblem = function(){
    var rnum = $("#roomNum").val();
    var state = $(".body-content input").eq(1).val();
    var guest = $(".body-content input").eq(2).val();
    var occurTime = $("#occurTime").val();
    var arriveTime = $("#arriveTime").val();
    var shenbaoren = $("#shenbaoren").val();
    var dealing = $("#dealing").val();

    var repair = "";
    if($("#repair").is(':checked')){
        var s1 = $("#description1").val();
        var s2 = $("#reasonYes").is(':checked');
        var s3 = ""
        if(s2 == true){
            s3 = $("#testarea1").val();
        }
        repair = "报修:" + s1 + ";" + s2 + ";" + s3;
    }

    console.log(repair)
    var people = "";
    if($("#people").is(':checked')){
        var p1= $("#hurtPeople").is(':checked');
        var p2 = "";
        var p3 = false;
        var p4 = "";
        if(p1 == true){
            p2 = $("#hurtName").val() + ";" + $("#hurtTel").val() + ";" + $("#hurtSex").val() + ";" + $("#hurtCountry").val();
            if($("#sendHosp").is(':checked')){
                p3 = true;
            }
            p4 = $("#textarea2").val()
            people = "人员:" + "true" + ";" + p2 + ";" + p3 + ";" + p4 ;
        }else{
            people = "人员:" + "false" + ";";
        }

    }

    var object = "";
    if($("#object").is(':checked')){
        object = "财务:" + $("#damageObject").val() + ";" + $("#textarea3").val();
    }

    var witness = "";
    if($("#yes").is(':checked')) {
        witness = "目击人:" + $("#w1").val() + ";" + $("#t1").val() + ";" + $("#w2").val() + ";" + $("#t2").val() + ";" + $("#w3").val() + ";" + $("#t3").val();

    }// }else{
    //     witness = "目击人:" + false;
    // }

    var comment = "备注:" + $("#comment").val();

    var total = repair + "," + people + "," + object + "," + witness + "," + comment ;
    console.log(total)

    $.ajax({
        url:'/LD/problem/addEmergencyProblem.action',
        type:'post',
        dataType:'json',
        data:'{"roomNum":"'+ rnum + '","state":"' + state + '","guest":"' + guest + '","occurTime":"' +
        occurTime + '","arriveTime":"' + arriveTime + '","shenbaoren":"' + shenbaoren + '","dealing":"' +
        dealing + '","detail":"' + total +'"}',
        contentType:'application/json',
        success:function(data){
            console.log(data);
            if(data == "1") {
                showModalBox("success", "添加成功");

            } else {
                showModalBox("error", "添加失败");
            }
        }
    });

}


//客户姓名联动
var associateGuestName = function(element){

    var roomNum = $(element).val(); //这里是需要根据页面元素变的
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
                    $(".body-content input").eq(1).val(data.room_STATE);
                    $(".body-content input").eq(2).val(data.guest_NAME); //这里是需要根据页面元素变的
                } else {
                    $(".body-content input").eq(1).val("尚无客户，请重新填写房间号");
                    $(".body-content input").eq(2).val("尚无客户，请重新填写房间号");
                }
            } else {
                showModalBox("error", "无操作权限");
            }
        }
    });
};
