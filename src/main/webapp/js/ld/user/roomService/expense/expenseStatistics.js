
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

                var sum = 0;
                var init;
                //水费
                for(var i=0;i<waterRecord.length;i++){
                    if(i == 0){
                        init = waterRecord[i].year_INIT_VAL == null?"":waterRecord[i].year_INIT_VAL;

                        $("tbody").append('<tr><td rowspan="' + waterTotal + '">水费结算</td><td>' + waterRecord[i].meter + '</td><td>' + init + '</td><td>' + waterRecord[i].last_MONTH_VAL + '</td><td>'
                            + waterRecord[i].cur_MONTH_VAL + '</td><td class="price">' + waterRecord[i].money + '元</td><td>' + formatDateForm(new Date(waterRecord[i].cur_TIME)) + '</td></tr>');
                        sum += parseFloat(waterRecord[i].money);

                    }else{
                        init = waterRecord[i].year_INIT_VAL == null?"":waterRecord[i].year_INIT_VAL;

                        $("tbody").append('<tr><td>' + waterRecord[i].meter + '</td><td>' + init + '</td><td>' + waterRecord[i].last_MONTH_VAL + '</td><td>'
                            + waterRecord[i].cur_MONTH_VAL + '</td><td class="price">' + waterRecord[i].money + '元</td><td>' + formatDateForm(new Date(waterRecord[i].cur_TIME))+ '</td></tr>');
                        sum += parseFloat(waterRecord[i].money);

                    }

                }


                //电费
                for(var i=0;i<elecRecord.length;i++){
                    if(i == 0){
                        console.log(1)
                        init = elecRecord[i].year_INIT_VAL == null?"":elecRecord[i].year_INIT_VAL;

                        $("tbody").append('<tr><td rowspan="' + elecTotal + '">电费结算</td><td>' + elecRecord[i].meter + '</td><td>' + init + '</td><td>' + elecRecord[i].last_MONTH_VAL + '</td><td>'
                            + elecRecord[i].cur_MONTH_VAL + '</td><td class="price">' + elecRecord[i].money + '元</td><td>' + formatDateForm(new Date(elecRecord[i].cur_TIME)) + '</td></tr>');
                        sum += parseFloat(elecRecord[i].money);

                    }else{
                        console.log(2)
                        init = elecRecord[i].year_INIT_VAL == null?"":elecRecord[i].year_INIT_VAL;

                        $("tbody").append('<tr><td>' + elecRecord[i].meter + '</td><td>' + init + '</td><td>' + elecRecord[i].last_MONTH_VAL + '</td><td>'
                            + elecRecord[i].cur_MONTH_VAL + '</td><td class="price">' + elecRecord[i].money + '元</td><td>' + formatDateForm(new Date(elecRecord[i].cur_TIME))+ '</td></tr>');
                        sum += parseFloat(elecRecord[i].money);

                    }

                }

                //燃气费
                for(var i=0;i<gasRecord.length;i++){
                    if(i == 0){
                        init = gasRecord[i].year_INIT_VAL == null?"":gasRecord[i].year_INIT_VAL;

                        $("tbody").append('<tr><td rowspan="' + gasTotal + '">燃气费结算</td><td>' + gasRecord[i].meter + '</td><td>' + init + '</td><td>' + gasRecord[i].last_MONTH_VAL + '</td><td>'
                            + gasRecord[i].cur_MONTH_VAL + '</td><td class="price">' + gasRecord[i].money + '元</td><td>' + formatDateForm(new Date(gasRecord[i].cur_TIME)) + '</td></tr>');
                        sum += parseFloat(gasRecord[i].money);

                    }else{
                        init = gasRecord[i].year_INIT_VAL == null?"":gasRecord[i].year_INIT_VAL;

                        $("tbody").append('<tr><td>' + gasRecord[i].meter + '</td><td>' + init + '</td><td>' + gasRecord[i].last_MONTH_VAL + '</td><td>'
                            + gasRecord[i].cur_MONTH_VAL + '</td><td class="price">' + gasRecord[i].money + '元</td><td>' + formatDateForm(new Date(gasRecord[i].cur_TIME))+ '</td></tr>');
                        sum += parseFloat(gasRecord[i].money);

                    }

                }
                

                $("span .price").text(sum);
            }
        }

    })
}