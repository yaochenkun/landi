(function(){
	// 展开菜单
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

    // 收起菜单
    $(".menuOne").click(function(){
    	$(".main-nav").animate({width:"0"}, 100);
    });
})();