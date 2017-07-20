var count = new Array()
var rate = new Array()
var EXIST_GUEST = 0
var CORRECT_SUM = 0
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

var differentialPrice = function(element) {
	if($(element).val().charAt($(element).val().length -1) == '.' && $(element).val().length > 1) return;

	if(isNaN(parseFloat($(element).val()))) { //判断输入是否不是数字
        $(element).val("")
        $("#error").html("*&nbsp;数据错误");
        CORRECT_SUM = 0
    }else{
        $(element).val(parseFloat($(element).val()))

		if(parseFloat($(element).val()) < parseFloat($("#lastVal").val())){  // 输入数据小于上月数据，判断为错
            $("#error").html("*&nbsp;数据错误");
            CORRECT_SUM = 0
		}else{
            $("#error").html("");
            var total = parseFloat($(element).val()) - parseFloat($("#lastVal").val())
            var temp =new Array();
            if(total<=count[0]){
                temp[0] = total;
                temp[1] = 0;
                temp[2] = 0;
                temp[3] = 0;
            }else if(total > parseFloat(count[0]) && total <= (parseFloat(count[0]) + parseFloat(count[1]))){
                console.log(count[0] + count[1])
                temp[0] = count[0];
                temp[1] = total - parseFloat(count[0]);
                temp[2] = 0;
                temp[3] = 0;
            }else if(total > (parseFloat(count[0]) + parseFloat(count[1])) && total < (parseFloat(count[0]) + parseInt(count[1]) + parseInt(count[2]))){
                temp[0] = count[0];
                temp[1] = count[1];
                temp[2] = total - parseFloat(count[0]) - parseFloat(count[1]);
                temp[3] = 0;
            }else{
                temp[0] = count[0];
                temp[1] = count[1];
                temp[2] = count[2];
                temp[3] = total - parseFloat(count[0]) - parseFloat(count[1]) - parseFloat(count[2]);
            }

            var cost = temp[0] * rate[0] + temp[1] * rate[1] + temp[2] * rate[2] + temp[3] * rate[3];

            $("#first").val(temp[0] + "x" + rate[0] + "元/立方米" )
            $("#second").val(temp[1] + "x" + rate[1] + "元/立方米" )
            $("#third").val(temp[2] + "x" + rate[2] + "元/立方米" )
            $("#forth").val(temp[3] + "x" + rate[3] + "元/立方米" )

            $("#cost").val(parseFloat(cost).toFixed(2) + "元");//只保留小数点两位
            CORRECT_SUM = 1
		}

    }

}
// 添加能源费分类 
var addsource = function(type){

    // 判断房间号是否为空
	if($("#sourceRoomNumber").val() == ""){
		$("#roomIdWarning").css("display","block");
		$("#sourceRoomNumber").addClass("border-red");
		console.log("房间号为空！");
		return;
	}
    if(EXIST_GUEST == 0 || CORRECT_SUM == 0) {
		return;
	}else{

		var num = $("#sourceRoomNumber").val()
		var name = $("#guestName").val()
		var meter = $("#meter").val()
		var last = $("#lastVal").val()
		var cur = $("#curVal").val()
		var money = $("#cost").val().split("元")[0]


		$.ajax({
			type:'post',
			url:'/LD/userRoom/addSource.action',
			contentType:'application/json',
			dataType:'json',
			data:'{"type":"' + type + '","rNum":"' + num + '","name":"' + name + '","meter":"'
			+ meter + '","last":' + last + ',"cur":' + cur + ',"cost":' + money + '}',
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


var associateSource = function (element,type){
	//获得 上月表数
	var num = $(element).val();

	$.ajax({
		type:'post',
		url:'/LD/userRoom/getSourceInfo.action',
		contentType:'application/json',
		dataType:'json',
		data:'{"rNum":"' + num + '","type":"' + type + '"}',
		success:function(data){
			console.log(data)
			if(data.State == 'Invalid'){
				$("#lastVal").val("获取信息错误！");
                EXIST_GUEST = 0;
            }else{
				if(data.Source == null){
                    $("#lastVal").val(0);   //当source里没有第一次增加该房间信息时，上月表数设为0

                }else{
					$("#lastVal").val(data.Source.cur_MONTH_VAL);
				}
                EXIST_GUEST = 1;
			}
		}

	})
}


    //客户姓名联动
var associateGuestName = function(element,type){

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
                    $("#guestName").val(data.guest_NAME);
                    $("#meter").val(roomNum);
                    //获取表信息
                    associateSource(element,type);
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

// 获取一阶、二阶 信息
var requestAjaxRate = function(type){
    var key
    if(type == "water") key = "w"
    if(type == "elec") key = "p"
    console.log("request ajax rate");
    $.ajax({
        type:"post",
        url:"/LD/userRoom/getRate.action",
        success:function(data){
            console.log(data);
            // 显示水费标准
            $("#first").val("0 x" + data[key + "p1"] + "元/立方米");
            $("#second").val("0 x" + data[key + "p2"] + "元/立方米");
            $("#third").val("0 x" + data[key + "p3"] + "元/立方米");
            $("#forth").val("0 x" + data[key + "p4"] + "元/立方米");

            count[0] = data[key + 'c1']
            count[1] = data[key + 'c2']
            count[2] = data[key + 'c3']
            count[3] = data[key + 'c4']

            rate[0] = data[key + "p1"]
            rate[1] = data[key + "p2"]
            rate[2] = data[key + "p3"]
            rate[3] = data[key + "p4"]

        }
    });
}
