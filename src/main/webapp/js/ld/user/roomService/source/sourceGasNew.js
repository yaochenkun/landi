var CORRECT_SUM = 0
var CORRECT_SUM_TWO = 0
var EXIST_VAL = 0
var count = new Array();
var rate = new Array();


var differentialPriceOne = function(element) {
    if($(element).val().charAt($(element).val().length -1) == '.' && $(element).val().length > 1) return;

    if(isNaN(parseFloat($(element).val()))) { //判断输入是否不是数字
        $(element).val("")
        $("#error_1").html("*&nbsp;数据错误");
        CORRECT_SUM = 0
    }else{
        $(element).val(parseFloat($(element).val()))

        if(parseFloat($(element).val()) < parseFloat($("#lastVal_1").val())){  // 输入数据小于上月数据，判断为错
            $("#error_1").html("*&nbsp;数据错误");
            CORRECT_SUM = 0
        }else{
            $("#error").html("");
            var total = parseFloat($(element).val()) - parseFloat($("#lastVal_1").val())
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

            $("#first_1").val(temp[0] + "x" + rate[0] + "元/立方米" )
            $("#second_1").val(temp[1] + "x" + rate[1] + "元/立方米" )
            $("#third_1").val(temp[2] + "x" + rate[2] + "元/立方米" )
            $("#forth_1").val(temp[3] + "x" + rate[3] + "元/立方米" )

            $("#cost_1").val(parseFloat(cost).toFixed(2) + "元");//只保留小数点两位
            CORRECT_SUM = 1
        }

    }

}

var differentialPriceTwo = function(element) {
    if($(element).val().charAt($(element).val().length -1) == '.' && $(element).val().length > 1) return;

    if(isNaN(parseFloat($(element).val()))) { //判断输入是否不是数字
        $(element).val("")
        $("#error_2").html("*&nbsp;数据错误");
        CORRECT_SUM_TWO = 0
    }else{
        $(element).val(parseFloat($(element).val()))

        if(parseFloat($(element).val()) < parseFloat($("#lastVal_2").val())){  // 输入数据小于上月数据，判断为错
            $("#error_2").html("*&nbsp;数据错误");
            CORRECT_SUM_TWO = 0
        }else{
            $("#error_2").html("");
            var total = parseFloat($(element).val()) - parseFloat($("#lastVal_2").val())
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

            $("#first_2").val(temp[0] + "x" + rate[0] + "元/立方米" )
            $("#second_2").val(temp[1] + "x" + rate[1] + "元/立方米" )
            $("#third_2").val(temp[2] + "x" + rate[2] + "元/立方米" )
            $("#forth_2").val(temp[3] + "x" + rate[3] + "元/立方米" )

            $("#cost_2").val(parseFloat(cost).toFixed(2) + "元");//只保留小数点两位
            CORRECT_SUM_TWO = 1
        }

    }

}


// 添加燃气费 
var addSourceGas = function(){

	 // 判断房间号是否为空
	if($("#sourceRoomNumber").val() == ""){
		$("#roomIdWarning").css("display","block");
		$("#sourceRoomNumber").addClass("border-red");
		console.log("房间号为空！");
		return;
	}
	if(EXIST_VAL == 0 || CORRECT_SUM_TWO == 0 || CORRECT_SUM == 0) {
		console.log("信息错误，无法添加！")
		return;
    }
	var num = $("#sourceRoomNumber").val();
	var name = $("#guestName").val();

	var firstLast = $("#lastVal_1").val();
	var firstVal = $("#firstVal").val();
	var firstCharge = $("#cost_1").val().split("元")[0];

	var secondLast = $("#lastVal_2").val();
	var secondVal = $("#secondVal").val();
	var secondCharge = $("#cost_2").val().split("元")[0];

	// 表号
	var firstMeterNo = $("#meterOne").val();
	var secondMeterNo = $("#meterTwo").val();

	$.ajax({
		url:'/LD/userRoom/addSourceGas.action',
		type:'post',
		contentType:'application/json',
		data:'{"rNum":"' + num + '","name":"' + name + '","meterOne":"'
        + firstMeterNo + '","meterTwo":"' + secondMeterNo + '","firstLast":' + firstLast
		+ ',"secondLast":' + secondLast + ',"firstVal":' + firstVal + ',"secondVal":' + secondVal
		+ ',"firstCharge":' + firstCharge + ',"secondCharge":' + secondCharge + '}',
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data == 1){
				showModalBox("success","添加成功！")
				// window.location.href = "http://" + window.location.host +
				// 	    	"/LD/views/user/roomService/source/sourceGas.jsp";
			} else if (data == 0){
                showModalBox("error","添加失败！")

            }
		}
	});
}


var associateSource = function (element){
    //获得 上月表数
    var num = $(element).val();

    $.ajax({
        type:'post',
        url:'/LD/userRoom/getGasSourcesInfo.action',
        contentType:'application/json',
        dataType:'json',
        data:'{"rNum":"' + num + '"}',
        success:function(data){
            console.log(data)
            if(data.State == 'Invalid'){
                $("#lastVal_1").val("获取信息错误！");
                $("#lastVal_2").val("获取信息错误！");
                EXIST_VAL = 0;
            }else{
            	console.log(data)
                if(data.Source[0] == null && data.Source[1] == null){
                    $("#lastVal_2").val(0);
                    $("#lastVal_1").val(0);   //当source里没有第一次增加该房间信息时，上月表数设为0

                }else{
                    $("#lastVal_1").val(data.Source[0].cur_MONTH_VAL);
                    $("#lastVal_2").val(data.Source[1].cur_MONTH_VAL);

                }
                EXIST_VAL = 1;
            }
        }

    })
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
                    $("#guestName").val(data.guest_NAME);
                    $("#meterOne").val(roomNum + "_1");
                    $("#meterTwo").val(roomNum + "_2");

                    //获取表信息
                    associateSource(element);
                } else {
                    $("#guestName").val("尚无客户，请重新填写房间号");
                    EXIST_VAL = 0;
                }
            } else {
                $("#guestName").val("数据库异常");
                EXIST_VAL = 0;
            }
        }
    });

};

// 获取一阶、二阶 信息
var requestAjaxRate = function(){

    $.ajax({
        type:"post",
        url:"/LD/userRoom/getRate.action",
        success:function(data){
            console.log(data);
            // 显示水费标准
            $("#first_1").val("0 x" + data["gp1"] + "元/立方米");
            $("#second_1").val("0 x" + data["gp2"] + "元/立方米");
            $("#third_1").val("0 x" + data["gp3"] + "元/立方米");
            $("#forth_1").val("0 x" + data["gp4"] + "元/立方米");

            $("#first_2").val("0 x" + data["gp1"] + "元/立方米");
            $("#second_2").val("0 x" + data["gp2"] + "元/立方米");
            $("#third_2").val("0 x" + data["gp3"] + "元/立方米");
            $("#forth_2").val("0 x" + data["gp4"] + "元/立方米");

            count[0] = data['gc1']
            count[1] = data['gc2']
            count[2] = data['gc3']
            count[3] = data['gc4']

            rate[0] = data["gp1"]
            rate[1] = data["gp2"]
            rate[2] = data["gp3"]
            rate[3] = data["gp4"]

        }
    });
}
