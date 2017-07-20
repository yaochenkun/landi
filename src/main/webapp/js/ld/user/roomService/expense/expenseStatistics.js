var previousReading = new Array();  // 0 water 1 elec 2 gas_1 3 gas_2
var currentReading = new Array();
var total_cost = new Array();
var guest = "";

$(function(){
    $(".btnsearch").keydown(function(e){
        if(e.keyCode == 13){
            searchExpense();
        }
    })
})

var searchExpense = function () {
    var num = $("#roomNumber").val()
    if(num == "") return ;

    $.ajax({
        type:'post',
        url:'/LD/userRoom/getAllStatistics.action',
        contentType:'application/json',
        dataType:'json',
        data:'{"rNum":"' + num + '"}',
        success:function(data) {
            console.log(data)
            if(data.State == 'Invalid'){

            }else{
                var waterTotal = data.waterTotal;
                var elecTotal = data.elecTotal;
                var gasTotal = data.gasTotal;

                var waterRecord = data.waterRecord;
                var elecRecord = data.elecsRecord;
                var gasRecord = data.gasRecord;

                var sum = 0.0;
                var init;
                //水费
                total_cost[0] = 0.0;
                for(var i=0;i<waterRecord.length;i++){
                    if(i == 0){
                        guest = waterRecord[i].guest_NAME;
                        init = waterRecord[i].year_INIT_VAL == null?"":waterRecord[i].year_INIT_VAL;

                        $("tbody").append('<tr><td rowspan="' + waterTotal + '">水费结算</td><td>' + waterRecord[i].meter + '</td><td>' + init + '</td><td>' + waterRecord[i].last_MONTH_VAL + '</td><td>'
                            + waterRecord[i].cur_MONTH_VAL + '</td><td class="price">' + waterRecord[i].money + '元</td><td>' + formatDateForm(new Date(waterRecord[i].cur_TIME)) + '</td></tr>');
                        sum += parseFloat(waterRecord[i].money);

                        previousReading[0] = waterRecord[i].last_MONTH_VAL;
                        total_cost[0] += parseFloat(waterRecord[i].money);

                    }else{
                        init = waterRecord[i].year_INIT_VAL == null?"":waterRecord[i].year_INIT_VAL;

                        $("tbody").append('<tr><td>' + waterRecord[i].meter + '</td><td>' + init + '</td><td>' + waterRecord[i].last_MONTH_VAL + '</td><td>'
                            + waterRecord[i].cur_MONTH_VAL + '</td><td class="price">' + waterRecord[i].money + '元</td><td>' + formatDateForm(new Date(waterRecord[i].cur_TIME))+ '</td></tr>');

                        sum += parseFloat(waterRecord[i].money);
                        total_cost[0] += parseFloat(waterRecord[i].money);

                        if(i == (waterRecord.length - 1)){
                            currentReading[0] = waterRecord[i].cur_MONTH_VAL;
                        }

                    }

                }


                //电费
                total_cost[1] = 0.0;
                for(var i=0;i<elecRecord.length;i++){
                    if(i == 0){
                        init = elecRecord[i].year_INIT_VAL == null?"":elecRecord[i].year_INIT_VAL;

                        $("tbody").append('<tr><td rowspan="' + elecTotal + '">电费结算</td><td>' + elecRecord[i].meter + '</td><td>' + init + '</td><td>' + elecRecord[i].last_MONTH_VAL + '</td><td>'
                            + elecRecord[i].cur_MONTH_VAL + '</td><td class="price">' + elecRecord[i].money + '元</td><td>' + formatDateForm(new Date(elecRecord[i].cur_TIME)) + '</td></tr>');
                        sum += parseFloat(elecRecord[i].money);
                        total_cost[1] += elecRecord[i].money;

                        previousReading[1] = elecRecord[i].last_MONTH_VAL;

                    }else{
                        init = elecRecord[i].year_INIT_VAL == null?"":elecRecord[i].year_INIT_VAL;

                        $("tbody").append('<tr><td>' + elecRecord[i].meter + '</td><td>' + init + '</td><td>' + elecRecord[i].last_MONTH_VAL + '</td><td>'
                            + elecRecord[i].cur_MONTH_VAL + '</td><td class="price">' + elecRecord[i].money + '元</td><td>' + formatDateForm(new Date(elecRecord[i].cur_TIME))+ '</td></tr>');

                        sum += parseFloat(elecRecord[i].money);
                        total_cost[1] += elecRecord[i].money;

                        if(i == (elecRecord.length-1)){
                            currentReading[1] = elecRecord[i].cur_MONTH_VAL;
                        }
                    }

                }

                //燃气费
                total_cost[2] = 0.0;
                total_cost[3] = 0.0;
                for(var i=0;i<gasRecord.length;i++){
                    if(i%2 == 0){
                        total_cost[2] += parseFloat(gasRecord[i].money);

                    }
                    if(i%2 == 1){
                        total_cost[3] += parseFloat(gasRecord[i].money);
                        if( i == 1){
                            previousReading[3] = gasRecord[i].last_MONTH_VAL;
                        }
                    }

                    if(i == 0){
                        init = gasRecord[i].year_INIT_VAL == null?"":gasRecord[i].year_INIT_VAL;

                        $("tbody").append('<tr><td rowspan="' + gasTotal + '">燃气费结算</td><td>' + gasRecord[i].meter + '</td><td>' + init + '</td><td>' + gasRecord[i].last_MONTH_VAL + '</td><td>'
                            + gasRecord[i].cur_MONTH_VAL + '</td><td class="price">' + gasRecord[i].money + '元</td><td>' + formatDateForm(new Date(gasRecord[i].cur_TIME)) + '</td></tr>');
                        sum += parseFloat(gasRecord[i].money);

                        previousReading[2] = gasRecord[i].last_MONTH_VAL;

                    }else{
                        init = gasRecord[i].year_INIT_VAL == null?"":gasRecord[i].year_INIT_VAL;

                        $("tbody").append('<tr><td>' + gasRecord[i].meter + '</td><td>' + init + '</td><td>' + gasRecord[i].last_MONTH_VAL + '</td><td>'
                            + gasRecord[i].cur_MONTH_VAL + '</td><td class="price">' + gasRecord[i].money + '元</td><td>' + formatDateForm(new Date(gasRecord[i].cur_TIME))+ '</td></tr>');

                        sum += parseFloat(gasRecord[i].money);

                        if(i == (gasRecord.length - 2)){
                            currentReading[2] = gasRecord[i].cur_MONTH_VAL;
                        }
                        if(i == (gasRecord.length - 1)) {
                            currentReading[3] = gasRecord[i].cur_MONTH_VAL;
                        }


                        }

                }
                

                $("span .price").text(sum.toFixed(2));

                $(".export").html('<a class="btn exportbtn" onclick="exportFunction()">导出</a>');
            }
        }

    })
}

var exportFunction = function () {
    console.log('{"guest":"' + guest + '","water_pre":' + previousReading[0] + ',"water_cur":' + currentReading[0] + ',"water_cost":' + total_cost[0] + ',"elec_pre":'
        + previousReading[1] + ',"elec_cur":' + currentReading[1] + ',"elec_cost":' + total_cost[1] + ',"gas_pre_1":' + previousReading[2] + ',"gas_cur_1":'
        + currentReading[2] + ',"gas_cost_1":' + total_cost[2] + ',"gas_pre_2":' + previousReading[3] + ',"gas_cur_2":' + currentReading[3] + ',"gas_cost_2":'
        + total_cost[3] + '}')

    $.ajax({
        type:'post',
        url:'/LD/userRoom/exportExpenseToModel.action',
        contentType:'application/json',
        dataType:'json',
        data:'{"guest":"' + guest + '","water_pre":' + previousReading[0] + ',"water_cur":' + currentReading[0] + ',"water_cost":' + total_cost[0].toFixed(2) + ',"elec_pre":'
             + previousReading[1] + ',"elec_cur":' + currentReading[1] + ',"elec_cost":' + total_cost[1].toFixed(2) + ',"gas_pre_1":' + previousReading[2] + ',"gas_cur_1":'
             + currentReading[2] + ',"gas_cost_1":' + total_cost[2].toFixed(2) + ',"gas_pre_2":' + previousReading[3] + ',"gas_cur_2":' + currentReading[3] + ',"gas_cost_2":'
             + total_cost[3].toFixed(2) + '}',
        success:function(data){
            if(data == 1){
                window.location.href = "http://" + window.location.host + '/LD/download.action?fp=excel/Consumption.xlsx';
            }else{
                showModalBox("error","导出失败！");
            }
        }
    })
}