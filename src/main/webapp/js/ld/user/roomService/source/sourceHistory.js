
var findHistory = function(type,rnum,guest,state){

    console.log('{"type":"' + type + '","rnum":"' + rnum + '","guest":"' + guest + '","state":"' + state +'"}')

    $.ajax({
        url:'/LD/userRoom/getSourceHistoryInfo.action',
        dataType:'json',
        contentType:'application/json',
        type:'post',
        data:'{"type":"' + type + '","rnum":"' + rnum + '","guest":"' + guest + '","state":"' + state +'"}',
        success: function(data){
            console.log(data)
            if(data.State == "Invalid"){
                $("#historyTbody").append("<tr><td class='no-data' colspan='13' style='color: #ff4d4d'>"+
                    "您没有权限访问本页数据，请尝试升级权限或回退！</td></tr>");
                return;
            }
            else if(data.State == "Valid"){
                var source = data.Source;
                if(source.length == 0){
                    $("#historyTbody").append("<tr><td class='no-data' colspan='13' style='color: #ff4d4d'>"+
                        "没有相关数据！</td></tr>");
                }else{
                    /**
                     * 异常处理 一个用户一年的记录应该不大于12条
                     * @未处理
                     */

                    $(".bill-table").html("");

                    var years = data.Years;
                    for(var i=0;i<years.length;i++){
                        var yearLabel= new Array();
                        var year = years[i];
                        $(".bill-table").append("<table><thead><tr><th><span>" + year +"年度</span></th>" +
                            "<th><span>1</span></th>" +
                            "<th><span>2</span></th>" +
                            "<th><span>3</span></th>" +
                            "<th><span>4</span></th>" +
                            "<th><span>5</span></th>" +
                            "<th><span>6</span></th>" +
                            "<th><span>7</span></th>" +
                            "<th><span>8</span></th>" +
                            "<th><span>9</span></th>" +
                            "<th><span>10</span></th>" +
                            "<th><span>11</span></th>" +
                            "<th><span>12</span></th>" +
                            "</tr></thead><tbody id='historyTbody_" +year + "'></tbody></table>");

                        
                        for(var j = 0 ;j < source.length;j++){
                            var sourceYear  = formatDateForm(new Date(source[j].readTime)).split("-")[0];

                            if(sourceYear === year){
                                yearLabel.push(j);
                            }
                        }

                        // console.log(yearLabel)
                        var str = "<tr><td>表数</td>";

                        for(var i1 = 0;i1<yearLabel.length;i1++){
                            str += "<td>" + source[yearLabel[i1]].meter_val + "</td>";
                        }

                        if(state == "all"){
                            str += "</tr><tr><td>租客姓名</td>";
                            for(var k = 0;k<yearLabel.length ; k++){
                                str += "<td>" + source[yearLabel[k]].guest + "</td>";
                            }
                        }

                        str += "</tr><tr><td>计费月份</td>";
                        for(var i2 = 0;i2<yearLabel.length;i2++){
                            str += "<td>" + source[yearLabel[i2]].month + "</td>";
                        }
                        str += "</tr><tr><td>抄表时间</td>";
                        for(var i3 = 0;i3<yearLabel.length;i3++){
                            str += "<td>" + formatDateForm(new Date(source[yearLabel[i3]].readTime)) + "</td>";
                        }
                        str += "</tr><tr><td>更新时间</td>";
                        for(var i4 = 0;i4<yearLabel.length;i4++){
                            str += "<td>" + formatDateForm(new Date(source[yearLabel[i4]].updateTime)) + "</td>";
                        }
                        str += "</tr><tr><td>产生费用</td>";
                        for(var i5 = 0;i5<yearLabel.length;i5++){
                            str += "<td>" + source[yearLabel[i5]].fare.toFixed(2) + "</td>";
                        }
                        str += "</tr>";
                        $("#historyTbody_" + year).append(str);


                    }

                }
            }
        }
    });
}