(function(){
    // // 搜索房间下拉菜单
	// $(".bill-table tr th:nth-child(1)").hover(function(){
	// 	$(".search-roomNo").css("height","100px");
	// },function(){
	// 	$(".search-roomNo").css("height","0");
	// });

   // 手风琴单击事件
   $(".index-list").hover(function(){
     if($(this).next().hasClass("active")){
       return;
     }
     $(this).next().stop().animate({"width":"390px"},500).parent().children(".active").stop().animate({"width":"0px"},500);
     $(this).parent().children(".active").removeClass("active")
     $(this).next().addClass("active");
   });

   //表头固定 lyd
   var tableH = $("table thead tr").offset().top;
   console.log(tableH)
   $(window).scroll(function(){
       var scroH = $(this).scrollTop();

       if(scroH >= tableH){
           //$("table thead ").css({"position":"fixed","top":0});
           $("table thead tr").addClass("fixedThead");
           $("table thead tr th,table td").css({"width":"110px","height":"56px"});
           $("table thead tr th:nth-child(3),table td:nth-child(3)").css({"width":"160px"});
           $("table thead tr th:nth-child(7),table td:nth-child(7)").css({"width":"134px"});
           $("table thead tr th:nth-child(8),table td:nth-child(8)").css({"width":"172px"});
           $("table thead tr th:nth-child(9),table td:nth-child(9)").css({"width":"84px"});


       }else if(scroH < tableH){
           $("table thead tr").removeClass("fixedThead");
       }
   })


})();

// $(function(){
// 	// 绑定客房服务管理划过菜单
// 	$(".plate-roomService,.plate-repair,.plate-resource,.plate-other").hover(function(){
// 		$(this).children(".plate-title").toggleClass("plate-title-active");
// 		$(this).children(".plate-content").css("display","block");
// 	},function(){
// 		$(this).children(".plate-title").toggleClass("plate-title-active");
// 		$(this).children(".plate-content").css("display","none");
// 	});

// 	// 绑定下拉菜单右端菜单
// 	$(".dropMenu").hover(function(){
// 		$(".index").css("display","block");
// 		$(this).children(".nav_title").toggleClass("nav-title-active");
// 	},function(){
// 		$(".index").css("display","none");
// 		$(this).children(".nav_title").toggleClass("nav-title-active");
// 	});
 
// });