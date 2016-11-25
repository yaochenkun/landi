$(function(){
	// 绑定客房服务管理划过菜单
	$(".plate-roomService,.plate-repair,.plate-resource,.plate-other").hover(function(){
		$(this).children(".plate-title").toggleClass("plate-title-active");
		$(this).children(".plate-content").css("display","block");
	},function(){
		$(this).children(".plate-title").toggleClass("plate-title-active");
		$(this).children(".plate-content").css("display","none");
	});

	// 绑定下拉菜单右端菜单
	$(".dropMenu").hover(function(){
		$(".index").css("display","block");
		$(this).children(".nav_title").toggleClass("nav-title-active");
	},function(){
		$(".index").css("display","none");
		$(this).children(".nav_title").toggleClass("nav-title-active");
	});
 
    // 搜索房间下拉菜单
	$(".bill-table tr th:nth-child(1)").hover(function(){
		$(".search-roomNo").css("height","100px");
	},function(){
		$(".search-roomNo").css("height","0");
	});

	// 手风琴单击事件
	$(".index-list").hover(function(){
		if($(this).next().hasClass("active")){
			return;
		}
		$(this).next().stop().animate({"width":"350px"},500).parent().children(".active").stop().animate({"width":"0px"},500);
		$(this).parent().children(".active").removeClass("active")
		$(this).next().addClass("active");
	});

});