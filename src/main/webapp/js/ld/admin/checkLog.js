// 保存日志Map
var logMap = {};
// 保存日志名
var arrayKey = [];

var totalLogPage = 0;
var logPerPage = 5;
var lastPageLog = 0;

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
        	arrayKey.sort(function(a,b){return b.substr(-10).replace(/-/g,"") - a.substr(-10).replace(/-/g,"");});
        	//console.log(arrayKey);
            // 设置总页数
            totalLogPage = Math.ceil(arrayKey.length/logPerPage);
            // 最后一页日志
            lastPageLog = arrayKey.length - logPerPage*(totalLogPage-1);

            $(".log-detail").html("");
        	// 第一页日志
            for(var i=0; i<logPerPage; i++){
                var filePath = logMap[arrayKey[i]].replace(/\\/g,"/");
                var perlog = $("<div class='perlog'><div class='log-title'><span class='normal-log'>普通日志</span>"+
                   arrayKey[i] +"</div><div class='btn btn-edit btndownload' onclick=\"downloadLog('"+ filePath +"')\">下载</div></div>");
                $(".log-detail").append(perlog);

            }
            // 底部页码
            var bottomPage = $("<div class='bottom-page'>"+
                "<span class='page-before' onclick='requestBeforeLog();'>上一页&nbsp;&nbsp;</span>"+
                "<span><input id='log_nowpage' value='"+ 1 +"' type='text' class='input_num'></span>"+
                "<span>&nbsp;/&nbsp;</span>"+
                "<span id='log_totalpage'>"+ totalLogPage +"</span>"+
                "<span class='page-next' onclick='requestNextLog();'>&nbsp;&nbsp;下一页</span></div>");
            $("#log-bottom").append(bottomPage);
        }
	});
}

// 下载指定的文件
var downloadLog = function(filePath){
    console.log("filePath:"+filePath);
	window.location.href = "http://" + window.location.host + "/LD/download.action?fp=" + filePath;
}

// 获取上一页数据
var requestBeforeLog = function() {
    if($("#log_nowpage").val()==1) return;
    else{
        var beginIndex = (Number($("#log_nowpage").val()) - 2) * 5;
        // 清空
        $(".log-detail").html("");
        for(var i=beginIndex; i<beginIndex+5; i++){
            var filePath = logMap[arrayKey[i]].replace(/\\/g,"/");
            var perlog = $("<div class='perlog'><div class='log-title'><span class='normal-log'>普通日志</span>"+
               arrayKey[i] +"</div><div class='btn btn-edit btndownload' onclick=\"downloadLog('"+ filePath +"')\">下载</div></div>");
            $(".log-detail").append(perlog);
        }
        $("#log_nowpage").val(Number($("#log_nowpage").val())-1);
    }
}

// 获取下一页数据
var requestNextLog = function() {
    if(Number($("#log_nowpage").val()) == Number($("#log_totalpage").text())) return;
    else{
        var beginIndex = (Number($("#log_nowpage").val())) * 5;
        // 清空
        $(".log-detail").html("");
        if(Number($("#log_nowpage").val()) == Number($("#log_totalpage").text())-1){
            var logThisPage = lastPageLog;
        }
        else{
            var logThisPage = 5;
        }
        for(var i=beginIndex; i<beginIndex+logThisPage; i++){
            var filePath = logMap[arrayKey[i]].replace(/\\/g,"/");
            var perlog = $("<div class='perlog'><div class='log-title'><span class='normal-log'>普通日志</span>"+
               arrayKey[i] +"</div><div class='btn btn-edit btndownload' onclick=\"downloadLog('"+ filePath +"')\">下载</div></div>");
            $(".log-detail").append(perlog);
        }
        $("#log_nowpage").val(Number($("#log_nowpage").val())+1);
    }
}