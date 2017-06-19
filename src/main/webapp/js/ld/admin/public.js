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
	$(".main-nav").css('height',parseInt($(document).height())-50);
});

// 改变左边栏样式
var changeLeftMenu = function(index){
	$(".main-nav a").removeClass("a-active");
	$(".main-nav a").eq(index).addClass("a-active")
}

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