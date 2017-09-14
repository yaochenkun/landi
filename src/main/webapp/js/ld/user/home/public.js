// 初始化操作和页面基础事件绑定
$(function(){
	// 搜索框的焦点事件
	$(".search-input").bind("focus blur",function(){
	    $(this).parent().parent().parent().parent().toggleClass("navbar-form-active");
	    $(this).parent().parent().parent().parent().toggleClass("navbar-form-normal");
	}).bind("keydown",function(e){
	    //搜索文本改变事件
	    //console.log(e);
	});

	// 设置左边栏的高度为文档的高度
	$(".main-nav").css('height',parseInt($(document).height()));

    // // 展开左栏菜单
    // $(".homeMenu").click(function(){
    //     $(".main-nav").animate({width:"160px"}, 100);
    //     // 菜单箭头样式
    //     setInterval(function(){$(".i3").animate({"opacity":"0.1"},500).animate({"opacity":"1"},1000);},2500);
    //       setTimeout(function(){
    //           setInterval(function(){$(".i2").animate({"opacity":"0.1"},500).animate({"opacity":"1"},1000);},2500);
    //           setTimeout(function(){
    //              setInterval(function(){$(".i1").animate({"opacity":"0.1"},500).animate({"opacity":"1"},1000);
    //         },2500);},400);},200
    //     );
    // });

    // 收起左栏菜单
    $(".menuOne").click(function(){
        $(".main-nav").animate({width:"0"}, 100);
    });
});

// 改变左边栏样式
var changeLeftMenu = function(index){
	$(".main-nav a").removeClass("a-active");
	$(".main-nav a").eq(index).addClass("a-active")
};

// 将时间转换为 YYYY-mm-dd hh:mm:ss 形式
function formatDate(date) {
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + date.getHours() + seperator2 + date.getMinutes()
            + seperator2 + date.getSeconds();
    return currentdate;
};

// 将时间转换为 YYYY-mm-dd hh.mm.ss 形式
function formatDateDot(date) {
    var seperator1 = "-";
    var seperator2 = ".";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + date.getHours() + seperator2 + date.getMinutes()
            + seperator2 + date.getSeconds();
    return currentdate;
};

// 将时间转换为 YYYY-mm-dd形式
function formatDateForm(date) {
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate;
    return currentdate;
};

//将时间转换为 YYYY-mm形式
function formatYearMonth(date) {
	var dd = formatDateForm(date);
    return dd.substring(0, 7);
};


// 显示关闭弹出框
var showPopMenu = function(DivId){
    var $popDiv = $("#" + DivId);
    $(".shadow").css("display","block");
    $popDiv.css("display","block");

    setTimeout(function(){$popDiv.addClass('showMenuModal');},50);
    $popDiv.addClass("effect-fade");
};
var closePopMenu = function(DivId){
    var $popDiv = $("#" + DivId);
    $(".shadow").css("display","none");
    $popDiv.removeClass('showMenuModal');
    setTimeout(function(){$popDiv.css("display","none");},200);
};

// 显示操作成功或失败弹出框
var showModalBox = function(type,content){
    $(".shadow").css("display","block");
    if ( type == "success"){
        $successModal = $('.successModal');
        $successModal.css("display","block");
        $successModal.children(".text").text(content);
        setTimeout(function(){$successModal.addClass('showMenuModal');},50);
        $successModal.addClass("effect-fade");

        setTimeout(function(){
            $(".shadow").css("display","none");
            $successModal.removeClass('showMenuModal');
            setTimeout(function(){$successModal.css("display","none");},200);},2000);
    } else if ( type == "error"){
        $errorModal = $('.errorModal');
        $errorModal.css("display","block");
        $errorModal.children(".text").text(content);
        setTimeout(function(){$errorModal.addClass('showMenuModal');},50);
        $errorModal.addClass("effect-fade");
        setTimeout(function(){
            $(".shadow").css("display","none");
            $errorModal.removeClass('showMenuModal');
            setTimeout(function(){$errorModal.css("display","none");},200);},2000);
    }
};

/**
 * 正则表达式对输入进行差错检测
 */

//检验房间号
var validateRoomNum = function(roomNum){

	//分成2+25-29层，3-24层，30-34层，35层
	var validateRN=/^[WE](2[5-9]?|3[0-4])-[1-3]$|E(2[5-9]?)-5|^[WE]([3-9]|1[0-9]|2[0-4])-[1-35]$|E([3-9]|1[0-9]|2[0-4])-6|^[WE]35-[12]$/g;

	if(res=validateRN.exec(roomNum)){
		return true;
	}
	else{
		return false;
	}
};

//检验客户姓名
var validateName = function(guestName){

	//10个字符以内，中英文，数字
	var validateN=/^[0-9A-Za-z\u4e00-\u9fa5]{1,10}$/g;

	if(res=validateN.exec(guestName)){
		return true;
	}
	else{
		return false;
	}
};

//检验日期
var validateDate = function(maintainTime){

	//先不检查2月29,最后2月29号分几种情况写
	var validateD=/^([0-9]+)-((0?[13578])|(1[02]))-(0?[1-9]|[12][0-9]|3[01])$|^([0-9]+)-((0?[469])|11)-(0?[1-9]|[12][0-9]|30)$|^([0-9]+)-(0?2)-(0?[1-9]|1[0-9]|2[0-8])$|^(([0-9]*((0[48])|([13579][26])|([2468][048])))|(([48]|([13579][26])|([2468][048]))0(0+)))-(0?2)-29/g;
	if(res=validateD.exec(maintainTime)){
		return true;
	}
	else{
		return false;
	}
};
