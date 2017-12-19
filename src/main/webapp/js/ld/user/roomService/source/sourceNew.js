// var count = new Array()
// var rate = new Array()
// var EXIST_GUEST = 0
// var CORRECT_SUM = 0
// (function(){
// 	$("#sourceRoomNumber").on({
// 		focus: function(){
// 			$(this).removeClass("border-red");
// 			$("#roomIdWarning").css("display","none");
// 		},
// 		keyup: function(){
// 			var rNumber = $(this).val();
// 			var rid = 0;
// 			$.ajax({
// 				url:'/LD/userRoom/getRoomIDByNumber.action',
// 				type:'post',
// 				data:'roomNumber=' + rNumber ,
// 				success:function(data){
// 					//console.log(data);
// 					if(!data){
// 						$("#meter").html("不存在该房间！");
// 						return;
// 					}
// 					rid = data.id;
// 					var type = 1;
//
// 					switch($("#sourceType").text()){
// 						case "水费":
// 						    type = 1;
// 							break;
//
// 						case "电费":
// 							type = 2;
// 							break;
//
// 						default:
// 						    console.log("没有匹配的费用！");
// 							break;
// 					}
//
// 					$.ajax({
// 						url:'/LD/userRoom/getMeters.action',
// 						type:'post',
// 						data:'rid='+ rid +'&type='+ type,
// 						success:function(data){
// 							//console.log(data);
// 							var type = data.meters1 == null ? 2 : 1;
// 							console.log(type);
// 							// 房间水表表号
// 							if(type == 1){
// 								if(data.meters1.length == 0){
// 									return;
// 								}
// 								$("#meter").text(data.meters1[0].meter_NUMBER);
// 							}
// 							// 房间电表
// 							else if(type == 2){
// 								if(data.meters2.length == 0){
// 									return;
// 								}
// 								$("#meter").text(data.meters2[0].meter_NUMBER);
// 							}
// 						}
// 					});
// 				}
// 			});
// 		}
// 	});
// })();

// var differentialPrice = function(element) {
// 	if($(element).val().charAt($(element).val().length -1) == '.' && $(element).val().length > 1) return;
//
// 	if(isNaN(parseFloat($(element).val()))) { //判断输入是否不是数字
//         $(element).val("")
//         $("#error").html("*&nbsp;数据错误");
//         CORRECT_SUM = 0
//     }else{
//         $(element).val(parseFloat($(element).val()))
//
// 		if(parseFloat($(element).val()) < parseFloat($("#lastVal").val())){  // 输入数据小于上月数据，判断为错
//             $("#error").html("*&nbsp;数据错误");
//             CORRECT_SUM = 0
// 		}else{
//             $("#error").html("");
//             var total = parseFloat($(element).val()) - parseFloat($("#lastVal").val())
//             var temp =new Array();
//             if(total<=count[0]){
//                 temp[0] = total;
//                 temp[1] = 0;
//                 temp[2] = 0;
//                 temp[3] = 0;
//             }else if(total > parseFloat(count[0]) && total <= (parseFloat(count[0]) + parseFloat(count[1]))){
//                 console.log(count[0] + count[1])
//                 temp[0] = count[0];
//                 temp[1] = total - parseFloat(count[0]);
//                 temp[2] = 0;
//                 temp[3] = 0;
//             }else if(total > (parseFloat(count[0]) + parseFloat(count[1])) && total < (parseFloat(count[0]) + parseInt(count[1]) + parseInt(count[2]))){
//                 temp[0] = count[0];
//                 temp[1] = count[1];
//                 temp[2] = total - parseFloat(count[0]) - parseFloat(count[1]);
//                 temp[3] = 0;
//             }else{
//                 temp[0] = count[0];
//                 temp[1] = count[1];
//                 temp[2] = count[2];
//                 temp[3] = total - parseFloat(count[0]) - parseFloat(count[1]) - parseFloat(count[2]);
//             }
//
//             var cost = temp[0] * rate[0] + temp[1] * rate[1] + temp[2] * rate[2] + temp[3] * rate[3];
//
//             $("#first").val(temp[0] + "x" + rate[0] + "元/立方米" )
//             $("#second").val(temp[1] + "x" + rate[1] + "元/立方米" )
//             $("#third").val(temp[2] + "x" + rate[2] + "元/立方米" )
//             $("#forth").val(temp[3] + "x" + rate[3] + "元/立方米" )
//
//             $("#cost").val(parseFloat(cost).toFixed(2) + "元");//只保留小数点两位
//             CORRECT_SUM = 1
// 		}
//
//     }
//
// }
// 添加能源费分类 
var addsource = function(num,type,guest,meterNum){

    // 判断房间号是否为空
	if($("#curVal").val() == ""){
		$("#error").css("display","block");
		$("#error").addClass("border-red");
		console.log("房间号为空！");
		return;
	}


	var meter = $("#curVal").val()
	var readTime = $("#readtime").val()
	var month = $("#month").val()
	var readDate = $("#pack_maintain").val()

	// console.log('{"type":"' + type + '","rNum":"' + num +  '","meter":'
     //    + meter + ',"readTime":"' + readTime + '","month":' + month + ',"readDate":"' + readDate + '","guest":"' + guest + '"}')

	if(type != "gas"){
        $.ajax({
            type:'post',
            url:'/LD/userRoom/addSource.action',
            contentType:'application/json',
            dataType:'json',
            data:'{"type":"' + type + '","rNum":"' + num +  '","meter":'
            + meter + ',"readTime":"' + readTime + '","month":' + month + ',"readDate":"' + readDate + '","guest":"' + guest + '"}',
            success:function(data){
                if(data == 1){
                    showModalBox("success","添加成功！")
                }else{
                    showModalBox("error","添加失败！")
                }
            }
        })

	}else{
	    console.log(type)
        $.ajax({
            type:'post',
            url:'/LD/userRoom/addSourceGas.action',
            contentType:'application/json',
            dataType:'json',
            data:'{"type":"' + type + '","rNum":"' + num +  '","meter":'
            + meter + ',"readTime":"' + readTime + '","month":' + month + ',"readDate":"' + readDate + '","guest":"' + guest + '","meterNum":"' + meterNum +'"}',
            success:function(data){
                if(data == 1){
                    showModalBox("success","添加成功！")
                }else{
                    showModalBox("error","添加失败！")
                }
            }
        })
	}


}


var associateSource = function (type,num,meterNum){

	$.ajax({
		type:'post',
		url:'/LD/userRoom/getSourceInfo.action',
		contentType:'application/json',
		dataType:'json',
		data:'{"rNum":"' + num + '","type":"' + type + '","meterNum":"' + meterNum + '"}',
		success:function(data){
			console.log(data)
			if(data.State == 'Invalid'){
				$("#lastVal").val("获取信息错误！");
            }else{
				if(data.Source == null){
                    $("#curVal").val(0);   //当source里没有第一次增加该房间信息时，上月表数设为0
					var month = formatDateForm(new Date()).split("-")[1];
					var pre = prevMonth(month);

					$("#month").val(pre)

                    var nowDate = new Date();
                    $(".pack_maintain").val(formatDateForm(nowDate));
                    $('.pack_maintain').date_input();
                    $("#pack_maintain").val(formatDateForm(nowDate));

                }else{
					$("#curVal").val(data.Source.cur_MONTH_VAL);
                    $("#month").val(data.Source.month)

                    $("#readtime").val(formatDateForm(new Date(data.Source.reading_TIME)));
                    $('#readtime').date_input();

                    var nowDate = new Date();
                    $("#pack_maintain").val(formatDateForm(nowDate));

				}
			}
		}

	})
}


