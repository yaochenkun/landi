(function(){
    //表头固定 lyd
    var tableH = $("table thead tr:nth-child(1)").offset().top;
    console.log(tableH)
    $(window).scroll(function(){
        var scroH = $(this).scrollTop();

        if(scroH >= tableH){
            $("table thead").addClass("fixedThead");

            var width = $("table thead tr:eq(0) th:eq(0)").width();
            $("table tbody tr:eq(0) td:eq(0)").css("width",width);

            width = $("table thead tr:eq(0) th:eq(1)").width();
            $("table tbody tr:eq(0) td:eq(1)").css("width",width);

            width = $("table thead tr:eq(1) th:eq(0)").width();
            $("table tbody tr:eq(0) td:eq(2)").css("width",width);

            width = $("table thead tr:eq(1) th:eq(1)").width();
            $("table tbody tr:eq(0) td:eq(3)").css("width",width);

            width = $("table thead tr:eq(1) th:eq(2)").width();
            $("table tbody tr:eq(0) td:eq(4)").css("width",width);

            width = $("table thead tr:eq(1) th:eq(3)").width();
            $("table tbody tr:eq(0) td:eq(5)").css("width",width);

            width = $("table thead tr:eq(1) th:eq(4)").width();
            $("table tbody tr:eq(0) td:eq(6)").css("width",width);

            width = $("table thead tr:eq(1) th:eq(5)").width();
            $("table tbody tr:eq(0) td:eq(7)").css("width",width);

            width = $("table thead tr:eq(1) th:eq(6)").width();
            $("table tbody tr:eq(0) td:eq(8)").css("width",width);

            width = $("table thead tr:eq(1) th:eq(7)").width();
            $("table tbody tr:eq(0) td:eq(9)").css("width",width);

            width = $("table thead tr:eq(1) th:eq(8)").width();
            $("table tbody tr:eq(0) td:eq(10)").css("width",width);

            width = $("table thead tr:eq(1) th:eq(9)").width();
            $("table tbody tr:eq(0) td:eq(11)").css("width",width);

            width = $("table thead tr:eq(1) th:eq(10)").width();
            $("table tbody tr:eq(0) td:eq(12)").css("width",width);

            width = $("table thead tr:eq(1) th:eq(11)").width();
            $("table tbody tr:eq(0) td:eq(13)").css("width",width);

            width = $("table thead tr:eq(1) th:eq(12)").width();
            $("table tbody tr:eq(0) td:eq(14)").css("width",width);

            width = $("table thead tr:eq(1) th:eq(13)").width();
            $("table tbody tr:eq(0) td:eq(15)").css("width",width);

            width = $("table thead tr:eq(1) th:eq(14)").width();
            $("table tbody tr:eq(0) td:eq(16)").css("width",width);

            width = $("table thead tr:eq(0) th:eq(5)").width();
            $("table tbody tr:eq(0) td:eq(17)").css("width",width);


        }else if(scroH < tableH){
            $("table thead").removeClass("fixedThead");

        }
    })


})();


$(function(){
    $(".search-input").keydown(function(e){
        // 回车键
        if(e.keyCode==13){
            requestSourceTotal(this);
        }
    })
});

// var requestBeforeAndAfter = function(num,page){
//     if(page<1) return;
//     var totalpage = parseInt($("#gaslist_totalpage").text());
//     if(page > totalpage) return;
//     requestSourceTotal(num,page);
// }
//


var requestSourceTotal = function(num){
    $.ajax({
        url:'/LD/userRoom/getSourceTotalMeters.action',
        type:'post',
        contentType:'application/json',
        data:'{"rNum":"' + num +'"}',
        dataType:'json',
        success:function(data){
            console.log(data);
            if(data.State == "Invalid"){
                $("#sourceTbody").append("<tr><td class='no-data' colspan='19' style='color: #ff4d4d'>"+
                    "您没有权限访问本页数据，请尝试升级权限或回退！</td></tr>");
                return;
            }
            else if(data.State == "Valid"){
                // 清空列表和页码
                $("#sourceTbody").html("");

                var recordTotal = data.recordTotal;

                if (recordTotal == 0) {
                    $("#sourceTbody").append("<tr><td class='no-data' colspan='19' style='color: #ff4d4d'>"+
                        "没有相关数据！</td></tr>");
                    return;
                }

                for(var i=0; i<data.pageList.length; i=i+1){
                    var perRecord = data.pageList[i];
                    var gas_money_1 = perRecord.gas_fare_1;
                    if(gas_money_1 == null) gas_money_1=0.0;
                    else gas_money_1 = gas_money_1.toFixed(2);

                    var gas_money_2 = perRecord.gas_fare_2;
                    if(gas_money_2 == null) gas_money_2=0.0;
                    else gas_money_2 = gas_money_2.toFixed(2);

                    var elec_fare = perRecord.elec_fare;
                    if(elec_fare == null) elec_fare=0.0;
                    else elec_fare = elec_fare.toFixed(2);

                    var water_fare = perRecord.water_fare;
                    if(water_fare == null) water_fare=0.0;
                    else water_fare = water_fare.toFixed(2);

                    var total = perRecord.total;
                    if(total == null) total=0.0;
                    else total = total.toFixed(2);

                    $("#sourceTbody").append("<tr><td rowspan='2' class='t1'>"+ perRecord.num +"</td><td rowspan='2'>"+ perRecord.guest +"</td>" +
                        "<td>"+ perRecord.gas_meter_1 +"</td>"+
                        "<td>"+ perRecord.gas_pre_meterVal_1 + "</td>" +
                        "<td>"+ perRecord.gas_month_1 +"</td>"+
                        "<td  style='color: red'>"+ gas_money_1+ "</td>" +
                        "<td>"+ perRecord.gas_step_1 + "</td>" +

                        "<td rowspan='2'>"+ perRecord.elec_meter + "</td>" +
                        "<td rowspan='2'>"+ perRecord.elec_pre_meterVal + "</td>" +
                        "<td rowspan='2'>"+ perRecord.elec_month + "</td>" +
                        "<td rowspan='2'  style='color: red'>"+ elec_fare+ "</td>" +
                        "<td rowspan='2'>"+ perRecord.elec_step + "</td>" +

                        "<td rowspan='2'>"+ perRecord.water_meter + "</td>" +
                        "<td rowspan='2'>"+ perRecord.water_pre_meterVal + "</td>" +
                        "<td rowspan='2'>"+ perRecord.water_month + "</td>" +
                        "<td rowspan='2'  style='color: red'>"+ water_fare+ "</td>" +
                        "<td rowspan='2'>"+ perRecord.water_step + "</td>" +

                        "<td rowspan='2'  style='color: red'>"+ total + "</td></tr><tr>" +

                        "<td>"+ perRecord.gas_meter_2 +"</td>"+
                        "<td>"+ perRecord.gas_pre_meterVal_2 + "</td>" +
                        "<td>"+ perRecord.gas_month_2 +"</td>"+
                        "<td  style='color: red'>"+ gas_money_2 + "</td>" +
                        "<td>"+ perRecord.gas_step_2 + "</td></tr>");
                }

            }
        }
    });
}
