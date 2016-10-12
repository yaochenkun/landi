// 获取系统日志
var getLogs = function() {
	$.ajax({
		type:'post',
		url:'/LD/HomeAdmin/getLogs.action',
        success:function(data){
        	console.log(data);
        	for (var item in data) {
        		var filePath = data[item].replace(/\\/g,"/");
        		var perlog = $("<div class='perlog'><div class='log-title'><span class='normal-log'>普通日志</span>"+
        		    item +"</div><div class='btn btn-edit btndownload' onclick=\"downloadLog('"+ filePath +"')\">下载</div></div>");
        		$(".log-detail").append(perlog);
        	}
        }
	});
}

// 下载指定的文件
var downloadLog = function(filePath){
	window.location.href = "http://localhost:8081/LD/download.action?fp=" + filePath;
}
