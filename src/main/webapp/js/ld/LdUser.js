$(function() {
  var speed=500;
  $("#business_box .business_li").hover(function() {
    //鼠标移动到元素上，改变元素宽度
    $(this).stop().animate({width:"500px"},speed).siblings().stop().animate({width:115},speed);
    $(".menu"+ $(this).index()).css("display","block");
  }, function() {
    //鼠标离开元素，复原
    $("#business_box .business_li").stop().animate({width:"181px"},speed);
    $(".menu"+ $(this).index()).css("display","none");
  });
});
