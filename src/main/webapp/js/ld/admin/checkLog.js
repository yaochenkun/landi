// 保存日志Map
var logMap = {};
// 保存日志名
var arrayKey = [];

// 获取系统日志
var getLogs = function() {
	$.ajax({
		type:'post',
		url:'/LD/HomeAdmin/getLogs.action',
        success:function(data){
        	console.log(data);
        	for (var item in data) {
        		// 暂时忽略 "rec\log"的文件
        		if(item!="rec.log"){
        			logMap[item] = data[item];
            		arrayKey.push(item);
        		}
        	}
        	// 对arrayKey进行排序
        	console.log(logMap);
        	arrayKey.sort(function(a,b){return b.substr(-10).replace(/-/g,"") - a.substr(-10).replace(/-/g,"");});
        	
        	// 1,2页
        	console.log(logMap[arrayKey[0]]);
        	console.log(logMap[arrayKey[1]]);
        	// 3,4页
        	console.log(logMap[arrayKey[2]]);
        	console.log(logMap[arrayKey[3]]);
        }
	});
}

// 下载指定的文件
var downloadLog = function(filePath){
	window.location.href = "http://localhost:8081/LD/download.action?fp=" + filePath;
}

//var filePath = data[item].replace(/\\/g,"/");
//var perlog = $("<div class='perlog'><div class='log-title'><span class='normal-log'>普通日志</span>"+
//    item +"</div><div class='btn btn-edit btndownload' onclick=\"downloadLog('"+ filePath +"')\">下载</div></div>");
//$(".log-detail").append(perlog);