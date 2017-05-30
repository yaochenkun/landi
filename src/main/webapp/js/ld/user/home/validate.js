//检验房间号
var validateRoomNum = function(roomNum){
	
	//分成2+25-29层，3-24层，30-34层，35层
	var validateRN=/^[WE](2[5-9]?|3[0-4])-[1-3]$|E(2[5-9]?)-5|^[WE]([3-9]|1[0-9]|2[0-4])-[1-35]$|E([3-9]|1[0-9]|2[0-4])-6|^[WE]35-[12]$/g;
	
	if(res=validateRN.exec(roomNum)){
		return 1;
	}
	else{
		return 0;
	}
};

//检验客户姓名
var validateName = function(guestName){
	
	//10个字符以内，中英文，数字
	var validateN=/^[0-9A-Za-z\u4e00-\u9fa5]{1,10}$/g;
	
	if(res=validateN.exec(guestName)){
		return 1;
	}
	else{
		return 0;
	}
};

//检验日期
var validateDate = function(maintainTime){
	
	//先不检查2月29,最后2月29号分几种情况写
	var validateD=/^([0-9]+)-((0?[13578])|(1[02]))-(0?[1-9]|[12][0-9]|3[01])$|^([0-9]+)-((0?[469])|11)-(0?[1-9]|[12][0-9]|30)$|^([0-9]+)-(0?2)-(0?[1-9]|1[0-9]|2[0-8])$|^(([0-9]*((0[48])|([13579][26])|([2468][048])))|(([48]|([13579][26])|([2468][048]))0(0+)))-(0?2)-29/g;
	if(res=validateD.exec(maintainTime)){
		return 1;
	}
	else{
		return 0;
	}
};
