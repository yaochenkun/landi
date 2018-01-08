$(function(){
    $(".bill-table").css("display","none");

});


var add = function(){
    $(".bill-table").css("display","block");

    var ids = $("#room").val();
    var content = ids.split(";");

    if(content.length == 0){
        $("#maintainCheckNewTbody").html("<tr><td colspan='9' style='color: #ff4d4d;'>房间输入为空！</td></tr>");
        return;
    }
    $("#maintainCheckNewTbody").html("");
    $("#maintainCheckNewTbody").append("<tr><td><span>全选</span><input type='checkbox'/></td></tr>");

    for(var i = 0;i<content.length ; i++){
        $("#maintainCheckNewTbody").append("<tr>"
            + "<td><input type='checkbox'/></td><td>"
            + content[i] + "</td><td><input type='text'/></td><td><select><option value='1'>一级</option><option value='2'>二级</option><option value='3'>三级</option></select></td><td>"
            + "<select><option>房屋问题</option><option>消耗品问题</option><option>能源问题</option></select></td><td><select><option>地板损坏</option><option>能源问题</option></select></td><td>"
            + "<input type='text' /></td><td><input type='text'/></td><td><a class='btn btn-edit btnDelete' onclick='delete();'>删除</a></td></tr>");
    }


    $("#maintainCheckNewBottom").html('<a class="btn btn-edit btnAdd" onclick="addAndReport();">确认添加并将选择部分报修</a>');
}




var addAndReport = function(){

}