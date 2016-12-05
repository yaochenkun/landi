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

    // 展开左栏菜单
    $(".homeMenu").click(function(){
        $(".main-nav").animate({width:"160px"}, 100);
        // 菜单箭头样式
        setInterval(function(){$("i:nth-child(3)").animate({"opacity":"0.1"},500).animate({"opacity":"1"},1000);},2500);
          setTimeout(function(){
              setInterval(function(){$("i:nth-child(2)").animate({"opacity":"0.1"},500).animate({"opacity":"1"},1000);},2500); 
              setTimeout(function(){
                 setInterval(function(){$("i:nth-child(1)").animate({"opacity":"0.1"},500).animate({"opacity":"1"},1000);
            },2500);},400);},200
        );
    });

    // 收起左栏菜单
    $(".menuOne").click(function(){
        $(".main-nav").animate({width:"0"}, 100);
    });
});

// 改变左边栏样式
var changeLeftMenu = function(index){
	$(".main-nav a").removeClass("a-active");
	$(".main-nav a").eq(index).addClass("a-active")
}

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
}