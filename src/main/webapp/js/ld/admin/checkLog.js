// 获取系统日志
var getLogs = function() {
	$.ajax({
		type:'post',
		url:'/LD/HomeAdmin/getLogs.action',
        success:function(data){
        	console.log(data);
        	for (var item in data) {
        		var perlog = $("<div class='perlog'><div class='log-title'><span class='normal-log'>普通日志</span>"+
        		    item +"</div><div class='btn btn-edit btndownload' id='"+item+"' data-hehe='"+ data[item]+"' onclick=\"downloadLog('"+ item +"')\">下载</div></div>");
        		$(".log-detail").append(perlog);
        	}
        }
	});
}

// 下载指定文件
var downloadLog = function(fileName){
	var filePath = $(document.getElementById(fileName)).attr("data-hehe").replace(/\\/g,"\\\\");
	console.log("下载文件路径："+filePath);
	$.ajax({
		type:'post',
		url:'/LD/download.action',
		data:'{"fp":"'+ filePath +'"}',
		dataType:'json',
		contentType:'application/json',
		success:function(data){
			console.log(data);
		}
	});
}