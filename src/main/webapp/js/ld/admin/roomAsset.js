$(function () {  
    var count = 0;  

    $(".big_pic").mousemove(function (e) {  
        //console.log("mousemove");
        var smalldiv = $("#smalldiv");  
        var ZoomSizeWidth = $("#bigimg img").width() / $(".big_pic img").width(); //宽放大的倍数  
        var ZoomSizeHeight = $("#bigimg img").height() / $(".big_pic img").height();//高放大的倍数  
        $("#bigimg").show();  
        smalldiv.show();  

        // console.log(e.pageX);
        // console.log(e.pageY);               

        if (e.pageX < $(this).offset().left + smalldiv.width() / 2) {
            divX = 0;  
        }  
        else if (e.pageX > $(this).offset().left + smalldiv.width() / 2 && e.pageX < $(this).offset().left + $(this).width() - smalldiv.width() / 2) {//鼠标的X坐标在图片内部并且小于图片最右边的X坐标  
            divX = e.pageX - $(this).offset().left - smalldiv.width() / 2;  
        }  
        else if (e.pageX > $(this).offset().left + $(this).width() - smalldiv.width() / 2) {
            divX = $(this).width() - smalldiv.width();  
        }  

        if (e.pageY < $(this).offset().top + smalldiv.height() / 2) {  
            divY = 0;  
        }  
        else if (e.pageY > $(this).offset().top + smalldiv.height() / 2 && e.pageY < $(this).offset().top + $(this).height() - smalldiv.height() / 2) {  
            divY = e.pageY - $(this).offset().top - smalldiv.height() / 2;  
        }  
        else if (e.pageY > $(this).offset().top - smalldiv.height()) {  
            divY = $(this).height() - smalldiv.height();  
        }   
        //console.log(divX); console.log(divY);
        smalldiv.css("top", divY).css("left", divX);  
        smalldiv.appendTo(".big_pic");  
 
        var tempX = smalldiv.offset().left - $(this).offset().left;
        var tempY = smalldiv.offset().top - $(this).offset().top;  

        // console.log(tempX); console.log(tempY);
        //console.log(ZoomSizeHeight); console.log(ZoomSizeWidth);

        $("#bigimg img").css("top", -tempY * ZoomSizeHeight).css("left", -tempX * ZoomSizeWidth);  
    });  

    $(".big_pic").mouseleave(function(){  
        //console.log("mouseleave");
        $("#smalldiv").hide();  
        $("#bigimg").hide();  
    });  
})  

var minPicNum = 0,
    nowFirstPic = 0,
    nowPic = 0;

// 查询某房间的图片信息
var requestRoomPic = function(room_id){
	$.ajax({
		url:'/LD/userRoom/getRoomPic.action',
		data:'id=' + room_id,
		success:function(data){
			//console.log(data);
			for(var i=0; i<data.length; i++){
				//console.log(data[i]);
				perImgPath = data[i].path;
				$(".big_pic ul").append("<li><img src= '"+window.document.location.origin +"/LD" + data[i].path +"' /></li>");
			    $(".num ul").append("<li class='linormal' onclick='changeMinPic(this);'><img src= '"+window.document.location.origin +"/LD" + data[i].path +"' /></li>");
			}
			minPicNum = $(".num li").length;
			// 初始化显示第一张图
            $(".num ul li:first-child").toggleClass("liactive").toggleClass("linormal");
            $("#bigimg").html("").append($(".num li").eq(0).html());
            //$(".num li").mouseover
		}
	})
}

// 点击小图切换
var changeMinPic = function(element){
	//console.log($(element).index());
	changeNow($(element).index())
}

// 左右切换小图
$(".prev_btn").click(function(){
	if(nowPic!=0){
       changeNow(nowPic-1);
	}
})

$(".next_btn").click(function(){
	if(nowPic!=minPicNum-1){		
       changeNow(nowPic+1);	
	}
})

// 改变当前显示大图
var changeNow = function(index){
    //console.log("changeNow:"+index);
    $(".big_pic li").hide().eq(index).fadeIn(1000);
    // 总照片数小于4张
    if(minPicNum <= 4){}
    else{
	    if(index>-1 && index<=1){
	        setPicUL(0);
	    }
	    // 中间（张数小于等于4张）
	    else if(index>1 && index<=minPicNum-3){
			setPicUL(index-2);
	    }
	    // 最后两张
	    else if(index>minPicNum-3 && index<minPicNum-1){
	       setPicUL(minPicNum-4);
	    }
    }

    // 改变小图透明度样式
    $(".num li").eq(nowPic).toggleClass("liactive").toggleClass("linormal");
    $(".num li").eq(index).toggleClass("liactive").toggleClass("linormal");
    $("#bigimg").html("").append($(".num li").eq(index).html());
    nowPic = index;
}

// 轮播小图图片
var setPicUL = function(index){
	//console.log("picUL:"+index);
    $(".num ul").css("left", -(index*107)+"px");
    nowFirstPic = index;
}