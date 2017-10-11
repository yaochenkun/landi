// (function() {
//
// 	// 点击添加物品按钮(显示添加物品弹框)
// 	$(".addItem").click(function(){
// 		$.ajax({
// 			url:'/LD/userItem/getItemType.action',
// 			type:'post',
// 			async:false,
// 			success:function(data){
// 				//console.log(data);
// 				$("#item-type .item-content").html("");
// 				$("#item-cat .item-content").html("");
// 				$("#item-com .item-content").html("");
// 				if(data != null){
// 					for(var i=0; i<data.length; i++){
// 						$("#item-type .item-content").append("<a class='btn btn-item' onclick='chooseItemType(this);'>"+ data[i] +"</a>");
// 					}
// 				}
//
//                 $("#item-type .btn-item").eq(0).trigger("click");
// 			}
// 		});
//
//         $(".fac-title span").eq(0).html("添加采购计划中物品");
//         $("#addItemBtn").attr("onclick", "addOneItem();");
//
// 		$("#item-ownerManage").hide();
//         $(".btn-item").removeClass("item-active");
//         $("#item-type .btn-item").eq(0).addClass("item-active");
//         $("#item-cat .btn-item").eq(0).addClass("item-active");
//         $("#item-com .btn-item").eq(0).addClass("item-active");
//         $("#item-ownerType .btn-item").eq(0).addClass("item-active");
//         $("#item-ownerManage .btn-item").eq(0).addClass("item-active");
//         $("#item-invoiceInfo .btn-item").eq(0).addClass("item-active");
//         $("#item-ifReceived .btn-item").eq(0).addClass("item-active");
// 		$(".shadow").css("display","block");
// 		$("#addItemModal").css("display","block");
//
// 		setTimeout(function(){$('#addItemModal').addClass('showMenuModal');},50);
// 		$("#addItemModal").addClass("effect-fade");
// 	});
//
// 	// 改变必填项选中
// 	$(".li-num input").focus(function(){
// 		$(".li-num input").removeClass("border-red");
// 	});
//
// 	///////////////////// 添加物品弹出框
// 	// 1. 关闭弹出框
// 	$("#addItemModal .fac-title span").eq(1).click(function(){
// 		$(".shadow").css("display","none");
// 		$("#addItemModal").removeClass('showMenuModal');
// 		setTimeout(function(){$("#addItemModal").css("display","none");},200);
// 	});
// })();
//
// // 2. 选择物品种类
// var chooseItemType = function(element){
//
//     $("#item-type .btn-item").removeClass("item-active");
// 	$(element).addClass("item-active");
//
// 	$("#item-cat .item-content").html("");
// 	$("#item-com .item-content").html("");
//
// 	// 获取物品名称
// 	$.ajax({
// 		url:'/LD/userItem/getItemCat.action',
// 		type:'post',
// 		data:'{"type":"'+ $(element).text() +'"}',
// 		dataType:'json',
// 		contentType:'application/json',
//         async:false,
// 		success:function(data){
// 			//console.log(data);
// 			if(data != null){
// 				for(var i=0; i<data.length; i++){
// 					$("#item-cat .item-content").append("<a class='btn btn-item' onclick='changeItemCatState(this);'>"
// 						+ data[i] +"</a>");
// 				}
// 			}else{
// 				$("#item-cat .item-content").html("");
// 			}
// 		}
// 	});
//
// 	// 获取物品品牌
// 	$.ajax({
// 		url:'/LD/userItem/getItemCom.action',
// 		type:'post',
// 		data:'{"type":"'+ $(element).text() +'"}',
// 		dataType:'json',
// 		contentType:'application/json',
// 		async:false,
// 		success:function(data){
// 			//console.log(data);
// 			if(data != null){
// 				for(var i=0; i<data.length; i++){
// 					$("#item-com .item-content").append("<a class='btn btn-item' onclick='changeItemComState(this);'>"
// 						+ data[i] +"</a>");
// 				}
// 			}else{
// 				$("#item-com .item-content").html("");
// 			}
// 		}
// 	});
//
//     $("#item-cat .btn-item").eq(0).addClass("item-active");
//     $("#item-com .btn-item").eq(0).addClass("item-active");
// };
//
// // 3. 改变物品名称/品牌样式
// var changeItemCatState = function(element){
// 	$("#item-cat .btn-item").removeClass("item-active");
// 	$(element).addClass("item-active");
//
// 	var type = "", cat = "", com = "";
// 	var flag = 0;
// 	$("#item-com .btn-item").each(function(){
// 		if($(this).hasClass("item-active")){
// 			flag = 1;
// 			com = $(this).text();
// 		}
// 	});
// 	if(flag == 1){
// 		$("#item-type .btn-item").each(function(){
// 			if($(this).hasClass("item-active")){
// 				type = $(this).text();
// 			}
// 		});
// 		$("#item-cat .btn-item").each(function(){
// 			if($(this).hasClass("item-active")){
// 				cat = $(this).text();
// 			}
// 		});
// 	}
// };
// var changeItemComState = function(element){
// 	$("#item-com .btn-item").removeClass("item-active");
// 	$(element).addClass("item-active");
//
// 	var type = "", cat = "", com = "";
// 	var flag = 0;
// 	$("#item-cat .btn-item").each(function(){
// 		if($(this).hasClass("item-active")){
// 			flag = 1;
// 			cat = $(this).text();
// 		}
// 	});
// 	if(flag == 1){
// 		$("#item-type .btn-item").each(function(){
// 			if($(this).hasClass("item-active")){
// 				type = $(this).text();
// 			}
// 		});
// 		$("#item-com .btn-item").each(function(){
// 			if($(this).hasClass("item-active")){
// 				com = $(this).text();
// 			}
// 		});
// 	}
// };
// var changeItemNameState = function(element){
// 	$("#item-name .btn-item").removeClass("item-active");
// 	$(element).addClass("item-active");
// }
//
// // 4. 确认添加物品
// var addOneItem = function(){
// 	var FAC_TYPE = "",FAC_CAT="",FAC_BRAND="",FAC_NAME="", ownerType = "LE固定资产", ownerManage = "-",
// 		invoiceType = "含普票", received = "-";
//
// 	var	count = $("#item-count input").val(),
// 		FAC_NAME = $("#item-name input").val(),
// 		unitPrice = $("#item-unitPrice input").val(),
// 		totalPrice = $("#item-totalPrice input").val(),
// 		provider = $("#item-provider input").val(),
// 		orderDate = $("#item-orderDate input").val(),
//         arrivalDate = $("#item-arrivalDate input").val(),
// 		comment = $("#item-comment input").val(),
// 		repoNum = $("#item-repoNum input").val();
//
// 	$("#item-type .btn-item").each(function(){
// 		if($(this).hasClass("item-active")){
// 			FAC_TYPE = $(this).text();
// 		}
// 	});
// 	$("#item-cat .btn-item").each(function(){
// 		if($(this).hasClass("item-active")){
// 			FAC_CAT = $(this).text();
// 		}
// 	});
// 	$("#item-com .btn-item").each(function(){
// 		if($(this).hasClass("item-active")){
// 			FAC_BRAND = $(this).text();
// 		}
// 	});
// 	$("#item-ownerType .btn-item").each(function(){
//         if($(this).hasClass("item-active")){
//             ownerType = $(this).text();
//         }
//     });
//
// 	if(ownerType == "LE管理资产") {
//         $("#item-ownerManage .btn-item").each(function () {
//             if ($(this).hasClass("item-active")) {
//                 ownerManage = $(this).text();
//             }
//         });
//     }
//
//     $("#item-invoiceInfo .btn-item").each(function(){
//         if($(this).hasClass("item-active")){
//             invoiceType = $(this).text();
//         }
//     });
//
// 	if(invoiceType == "含普票" || invoiceType == "含增票"){
//         $("#item-ifReceived .btn-item").each(function(){
//             if($(this).hasClass("item-active")){
//                 received = $(this).text();
//             }
//         });
// 	}
//
//
//     // 新增序号
//     if($(".eachItem").length == 0){
//     	var no = 1;
//     }
//     else{
//     	var no = Number($(".eachItem:last .no").text()) + 1;
//     }
//
//     var ownerManageStr = (ownerType == "LE管理资产") ? "(" + ownerManage + ")" : "";
// 	$(".addItem").before("<tr class='eachItem'><td><span class='no'>"+ no +"</span></td>"+
// 		    "<td>"+ FAC_TYPE +"</td><td>"+ FAC_CAT +"</td>"+
// 			"<td>"+ FAC_BRAND +"</td><td>"+ FAC_NAME +"</td>"+
//         	"<td>"+ ownerType + ownerManageStr +"</td><td>"+ provider + "</td><td>"+ repoNum +"</td>"+
// 			"<td>"+ count +"</td><td>"+ unitPrice +"</td><td>"+ totalPrice +"</td><td>"+ invoiceType +"</td>"+
//         	"<td>"+ received +"</td><td>"+ orderDate +"</td><td>"+ arrivalDate +"</td>"+
// 			"<td>"+ comment +"</td>"+
// 			"<td><a class='edit-operation' onclick='editOneItem(this)'>编辑</a><a class='delete-operation' onclick='deleteOneItem(this)'>删除</a></td></tr>");
// 	$(".shadow").css("display","none");
// 	$(".addItemDiv").removeClass('showMenuModal');
// 	setTimeout(function(){$(".addItemDiv").css("display","none");},200);
// };
//
// //编辑一项物品
// var editOneItem = function(element){
//
//     $(".fac-title span").eq(0).html("编辑采购计划中物品");
//     $(".fac-foot a").attr("onclick", "certifyEditOneItem('"+ $(element).parent().parent().index() +"');")
//
//     //获取这一行的所有列内容
//     var row = $(element).parent().parent().children("td");
//
// 	var facType = row.eq(1).text();
//     var facCat = row.eq(2).text();
//     var facBrand = row.eq(3).text();
//     var facName = row.eq(4).text();
//     var count = row.eq(5).text();
//     var unitPrice = row.eq(6).text();
//     var totalPrice = row.eq(7).text();
//     var facRepoNum = row.eq(8).text();
//     var provider = row.eq(9).text();
//     var facOwner = row.eq(10).text();
//     var invoiceType = row.eq(11).text();
//     var received = row.eq(12).text();
//     var orderDate = row.eq(13).text();
//     var arrivalDate = row.eq(14).text();
//     var comment = row.eq(15).text();
//
//     // 显示编辑物品弹框
// 	$.ajax({
// 		url:'/LD/userItem/getItemType.action',
// 		type:'post',
// 		async:false,
// 		success:function(data){
// 			//console.log(data);
// 			$("#item-type .item-content").html("");
// 			$("#item-cat .item-content").html("");
// 			$("#item-com .item-content").html("");
// 			if(data != null) {
//                 for (var i = 0; i < data.length; i++) {
//                     $("#item-type .item-content").append("<a class='btn btn-item' onclick='chooseItemType(this);'>" + data[i] + "</a>");
//                 }
//             }
// 		}
// 	});
//
//     $("#item-ownerManage").hide();
//     $(".btn-item").removeClass("item-active");
//     $("#item-type .btn-item").eq(0).addClass("item-active");
//     $("#item-cat .btn-item").eq(0).addClass("item-active");
//     $("#item-com .btn-item").eq(0).addClass("item-active");
//     $("#item-ownerType .btn-item").eq(0).addClass("item-active");
//     $("#item-ownerManage .btn-item").eq(0).addClass("item-active");
//     $("#item-invoiceInfo .btn-item").eq(0).addClass("item-active");
//     $("#item-ifReceived .btn-item").eq(0).addClass("item-active");
//
//
//     //触发类别按钮选中
//     $("#item-type .btn-item").each(function(){
//         if($(this).text() == facType){
//             $(this).trigger("click");
//         }
//     });
//
//     //触发子类按钮选中
//     $("#item-cat .btn-item").each(function(){
//         if($(this).text() == facCat){
//             $(this).trigger("click");
//         }
//     });
//
//     //触发品牌按钮选中
//     $("#item-com .btn-item").each(function(){
//         if($(this).text() == facBrand){
//             $(this).trigger("click");
//         }
//     });
//
//     //输入框内容
//     $("#item-count input").val(count),
//     $("#item-name input").val(facName),
//     $("#item-unitPrice input").val(unitPrice),
//     $("#item-totalPrice input").val(totalPrice),
//     $("#item-provider input").val(provider),
//     $("#item-orderDate input").val(orderDate),
//     $("#item-arrivalDate input").val(arrivalDate),
//     $("#item-comment input").val(comment),
//     $("#item-repoNum input").val(facRepoNum);
//
//
//     //触发归属权
// 	var ownerType = facOwner.substring(0,6);
// 	var ownerManage = facOwner.substring(facOwner.indexOf("(") + 1, facOwner.indexOf(")"));
//     $("#item-ownerType .btn-item").each(function(){
//         if($(this).text() == ownerType){
//             $(this).trigger("click");
//             if(ownerType == "LE管理资产"){
//                 $("#item-ownerManage .btn-item").each(function(){
//                     if($(this).text() == ownerManage){
//                         $(this).trigger("click");
//                     }
//                 });
// 			}
//         }
//     });
//
//     //触发发票类型
//     $("#item-invoiceInfo .btn-item").each(function(){
//         if($(this).text() == invoiceType){
//             $(this).trigger("click");
//             if(invoiceType == "含增票" || invoiceType == "含普票"){
//                 $("#item-ifReceived .btn-item").each(function(){
//                     if($(this).text() == received){
//                         $(this).trigger("click");
//                     }
//                 });
//             }
//         }
//     });
//
//
//
//     //特效
// 	$(".shadow").css("display","block");
// 	$(".addItemDiv").css("display","block");
//
// 	setTimeout(function(){$('.addItemDiv').addClass('showMenuModal');},50);
// 	$(".addItemDiv").addClass("effect-fade");
//
//
//     // 改变必填项选中
//     $(".li-num input").focus(function(){
//         $(".li-num input").removeClass("border-red");
//     });
//
//     //关闭弹出框事件设置
//     $(".addItemDiv .fac-title span").eq(1).click(function(){
//         $(".shadow").css("display","none");
//         $(".addItemDiv").removeClass('showMenuModal');
//         setTimeout(function(){$(".addItemDiv").css("display","none");},200);
//     });
// };
//
// var certifyEditOneItem = function(index){
//
//     var FAC_TYPE = "",FAC_CAT="",FAC_BRAND="",FAC_NAME="", ownerType = "LE固定资产", ownerManage = "-",
//         invoiceType = "含普票", received = "-";
//
//     var	count = $("#item-count input").val(),
//         FAC_NAME = $("#item-name input").val(),
//         unitPrice = $("#item-unitPrice input").val(),
//         totalPrice = $("#item-totalPrice input").val(),
//         provider = $("#item-provider input").val(),
//         orderDate = $("#item-orderDate input").val(),
//         arrivalDate = $("#item-arrivalDate input").val(),
//         comment = $("#item-comment input").val(),
//         repoNum = $("#item-repoNum input").val();
//
//     $("#item-type .btn-item").each(function(){
//         if($(this).hasClass("item-active")){
//             FAC_TYPE = $(this).text();
//         }
//     });
//     $("#item-cat .btn-item").each(function(){
//         if($(this).hasClass("item-active")){
//             FAC_CAT = $(this).text();
//         }
//     });
//     $("#item-com .btn-item").each(function(){
//         if($(this).hasClass("item-active")){
//             FAC_BRAND = $(this).text();
//         }
//     });
//     $("#item-ownerType .btn-item").each(function(){
//         if($(this).hasClass("item-active")){
//             ownerType = $(this).text();
//         }
//     });
//
//     if(ownerType == "LE管理资产") {
//         $("#item-ownerManage .btn-item").each(function () {
//             if ($(this).hasClass("item-active")) {
//                 ownerManage = $(this).text();
//             }
//         });
//     }
//
//     $("#item-invoiceInfo .btn-item").each(function(){
//         if($(this).hasClass("item-active")){
//             invoiceType = $(this).text();
//         }
//     });
//
//     if(invoiceType == "含普票" || invoiceType == "含增票"){
//         $("#item-ifReceived .btn-item").each(function(){
//             if($(this).hasClass("item-active")){
//                 received = $(this).text();
//             }
//         });
//     }
//
//     var ownerManageStr = (ownerType == "LE管理资产") ? "(" + ownerManage + ")" : "";
//     var row = $(".eachItem").eq(index).children("td");
// 	row.eq(1).text(FAC_TYPE);
//     row.eq(2).text(FAC_CAT);
//     row.eq(3).text(FAC_BRAND);
//     row.eq(4).text(FAC_NAME);
//     row.eq(5).text(count);
//     row.eq(6).text(unitPrice);
//     row.eq(7).text(totalPrice);
//     row.eq(8).text(repoNum);
//     row.eq(9).text(provider);
//     row.eq(10).text(ownerType + ownerManageStr);
//     row.eq(11).text(invoiceType);
//     row.eq(12).text(received);
//     row.eq(13).text(orderDate);
//     row.eq(14).text(arrivalDate);
//     row.eq(15).text(comment);
//
//     //关闭对话框
//     $(".shadow").css("display","none");
//     $(".addItemDiv").removeClass('showMenuModal');
//     setTimeout(function(){$(".addItemDiv").css("display","none");},200);
// };
//
// // 删除一项物品
// var deleteOneItem = function(element){
// 	$(element).parent().parent().nextAll(".eachItem").each(function(){
// 		console.log($(this).children("td").children(".no").text);
// 		$(this).children("td").children(".no").text(Number($(this).children("td").children(".no").text())-1);
// 	});
// 	$(element).parent().parent().remove();
// };
//
//
// // 添加采购计划
// var addPlan = function(){
// 	var planName = $(".planTitle input").eq(0).val(),
// 	    planManager = $(".planTitle input").eq(1).val(),
// 	    note = $(".planTitle input").eq(2).val(),
// 	    money = 1000,
// 	    ctime = formatDateForm(new Date());
// 	console.log(planName);
//
// 	if($(".eachItem").length <= 0) {
//
//         showModalBox("error","计划不能为空，请添加物品！");
// 	}
//
//
// 	// 计划采购物品
// 	var itemList = "";
// 	for(var i=1; i<=$(".eachItem").length; i++){
// 		var I = $(".eachItem").eq(i-1).children("td");
// 		var perItem = '"item'+ i +'":{"FAC_TYPE":"'+ I.eq(1).text() +'","FAC_CAT":"'+ I.eq(2).text()+'","FAC_BRAND":"'+ I.eq(3).text() +'",'
//             +'"FAC_NAME":"'+ I.eq(4).text() +'","FAC_OWNER":"'+ I.eq(5).text() +'","provider":"'+ I.eq(6).text()+'","FAC_REPONUM":"'+ I.eq(7).text()+'",'
//             +'"count":'+ I.eq(8).text() +',"unitPrice":'+ I.eq(9).text() +',"totalPrice":'+ I.eq(10).text()+','
// 		    +'"invoiceType":"'+ I.eq(11).text() +'","received":"'+ I.eq(12).text() +'","orderDate":"'+ formatDateForm(new Date(I.eq(13).text()))+'",'
//             +'"arrivalDate":"'+ formatDateForm(new Date(I.eq(14).text())) +'","comment":"'+ I.eq(15).text() +'"},';
// 		itemList += perItem;
// 	};
//
// 	if(itemList.length !=0) itemList = itemList.substring(0,itemList.length-1);
//
// 	$.ajax({
// 		url:'/LD/userItem/newPlan.action',
// 		type:'post',
// 		data:'{"planManager":"'+ planManager +'","delivery":"'+ ctime +'",'
// 			+'"note":"'+ note +'","planName":"'+ planName +'","itemList":{'+ itemList +'}}',
// 		dataType:'json',
// 		contentType:'application/json',
// 		success:function(data){
// 			console.log(data);
// 			if(data == 1){
// 				showModalBox("success","添加成功！");
//
// 				//清空表格
// 				$(".eachItem").remove();
// 			}
// 			else if(data == 0){
// 				showModalBox("error","添加失败！");
// 			}
// 		}
// 	});
// };
//
// var changeSelection = function(element){
// 	$(element).siblings().each(function(){
// 		$(this).removeClass("item-active");
// 	});
// 	$(element).addClass("item-active");
// };
//
// var changeOwner = function(element){
// 	changeSelection(element)
//
// 	index = $(element).index();
// 	if(index == 1){
// 		$("#item-ownerManage").show();
// 	} else {
// 		$("#item-ownerManage").hide();
// 	}
// };
//
// var changeInvoiceInfo = function(element){
// 	changeSelection(element)
//
// 	index = $(element).index();
// 	if(index == 0 || index == 1){
// 		$("#item-ifReceived").show();
// 	} else {
// 		$("#item-ifReceived").hide();
// 	}
// };
//
// var calTotalPriceByCount = function(count){
//
//     var unitPrice = $("#item-unitPrice input").val();
//     $("#item-totalPrice input").val(unitPrice * count);
// };
//
// var calTotalPriceByUnitPrice = function(unitPrice){
//
//     var count = $("#item-count input").val();
//     $("#item-totalPrice input").val(unitPrice * count);
// };
//
//
// //新增种类、子类、品牌
// var showNewItemTypeModal = function(){
//
//     $(".shadow").css("display","block");
//     $('#newItemTypeMenu').css("display","block");
//
//     setTimeout(function(){$('#newItemTypeMenu').addClass('showMenuModal');},50);
//     $("#newItemTypeMenu").addClass("effect-fade");
// };
// // 关闭新分配物品弹出框
// var closeNewItemTypeDiv = function(){
//
//     $(".shadow").css("display","none");
//     $("#newItemTypeMenu").removeClass('showMenuModal');
//     setTimeout(function(){$("#newItemTypeMenu").css("display","none");},200);
// };
//
// var requestNewItemType = function() {
//
// 	//获取名称
// 	var name = $("#item-type-name input").val();
// 	if(name == "") {
//         showModalBox("error","名称不能为空！");
//         return;
// 	}
//
//     //请求添加种类
//     $.ajax({
//         url:'/LD/userItem/addItemType.action',
//         type:'post',
//         data: JSON.stringify({name: name}),
//         dataType:'json',
//         contentType:'application/json',
//         success:function(data){
//             console.log(data);
//             if(data == 1){
//                 showModalBox("success","添加成功！");
//
//                 //将新增的类别追加至界面尾部
//                 $("#item-type .item-content").append("<a class='btn btn-item' onclick='chooseItemType(this);'>"+ name +"</a>");
//
// 				//关闭对话框
//                 closeNewItemTypeDiv();
//             }
//             else if(data == 0){
//                 showModalBox("error","添加失败！");
//             }
//         }
//     });
// }
//
// var showNewItemSubTypeModal = function(){
//
//     $(".shadow").css("display","block");
//     $('#newItemSubTypeMenu').css("display","block");
//
//     setTimeout(function(){$('#newItemSubTypeMenu').addClass('showMenuModal');},50);
//     $("#newItemSubTypeMenu").addClass("effect-fade");
// };
// // 关闭新分配物品弹出框
// var closeNewItemSubTypeDiv = function(){
//
//     $(".shadow").css("display","none");
//     $("#newItemSubTypeMenu").removeClass('showMenuModal');
//     setTimeout(function(){$("#newItemSubTypeMenu").css("display","none");},200);
// };
//
// var requestNewItemSubType = function() {
//
//     //获取名称
//     var name = $("#item-subtype-name input").val();
//     if(name == "") {
//         showModalBox("error","名称不能为空！");
//         return;
//     }
//
//     //获取物品大类
//     var typeName = "";
//     $("#item-type .btn-item").each(function(){
//         if($(this).hasClass("item-active")){
//             typeName = $(this).text();
//         }
//     });
//
//
//     //请求添加种类
//     $.ajax({
//         url:'/LD/userItem/addItemSubType.action',
//         type:'post',
//         data: JSON.stringify({typeName: typeName, name: name}),
//         dataType:'json',
//         contentType:'application/json',
//         success:function(data){
//             console.log(data);
//             if(data == 1){
//                 showModalBox("success","添加成功！");
//
//                 //将新增的类别追加至界面尾部
//                 $("#item-cat .item-content").append("<a class='btn btn-item' onclick='changeItemCatState(this);'>" + name +"</a>");
//                 //关闭对话框
//                 closeNewItemSubTypeDiv();
//             }
//             else if(data == 0){
//                 showModalBox("error","添加失败！");
//             }
//         }
//     });
// }
//
//
// var showNewItemBrandModal = function(){
//
//     $(".shadow").css("display","block");
//     $('#newItemBrandMenu').css("display","block");
//
//     setTimeout(function(){$('#newItemBrandMenu').addClass('showMenuModal');},50);
//     $("#newItemBrandMenu").addClass("effect-fade");
// };
// // 关闭新分配物品弹出框
// var closeNewItemBrandDiv = function(){
//
//     $(".shadow").css("display","none");
//     $("#newItemBrandMenu").removeClass('showMenuModal');
//     setTimeout(function(){$("#newItemBrandMenu").css("display","none");},200);
// };
//
// var requestNewItemBrand = function() {
//
//     //获取名称
//     var name = $("#item-brand-name input").val();
//     if(name == "") {
//         showModalBox("error","名称不能为空！");
//         return;
//     }
//
//     //获取物品大类
//     var typeName = "";
//     $("#item-type .btn-item").each(function(){
//         if($(this).hasClass("item-active")){
//             typeName = $(this).text();
//         }
//     });
//
//     //请求添加种类
//     $.ajax({
//         url:'/LD/userItem/addItemBrand.action',
//         type:'post',
//         data: JSON.stringify({typeName: typeName, name: name}),
//         dataType:'json',
//         contentType:'application/json',
//         success:function(data){
//             console.log(data);
//             if(data == 1){
//                 showModalBox("success","添加成功！");
//
//                 //将新增的类别追加至界面尾部
//                 $("#item-com .item-content").append("<a class='btn btn-item' onclick='changeItemComState(this);'>" + name +"</a>");
//                 //关闭对话框
//                 closeNewItemBrandDiv();
//             }
//             else if(data == 0){
//                 showModalBox("error","添加失败！");
//             }
//         }
//     });
// }


(function(){

    $("#serviceRoomNumber").focus(function(){
        $(this).removeClass("border-red");
        $("#roomIdWarning").css("display","none");
    });

    // 事件冒泡（隐藏下拉菜单）
    $(document).on("click",function(e){
        $(".dropDownMenu").css("display","none");

    })



    /**
	 * 问题分类
     */

    //拉取分类
    

    // 显示问题分类下拉菜单
    $("#problemTypeDropDownInput").click(function(e){
        $("#problemTypeDropDownList .dropDownMenu").css("display","block");

        // 阻止事件冒泡
        e.stopPropagation();
    });


    // 选择问题分类
    $("#problemTypeDropDownList .dropDownMenu li").click(function(){

        var waterType = $(this).text();
        $("#problemTypeDropDownInput").val(waterType);

    });


    /**
	 * 问题子类
     */

    //拉取子类

    // 显示问题分类下拉菜单
    $("#problemSubypeDropDownInput").click(function(e){
        $("#problemSubTypeDropDownList .dropDownMenu").css("display","block");

        // 阻止事件冒泡
        e.stopPropagation();
    });


    // 选择问题分类
    $("#problemSubTypeDropDownList .dropDownMenu li").click(function(){

        var waterType = $(this).text();
        $("#problemSubypeDropDownInput").val(waterType);

    });


    /**
	 * 问题等级
     */

    // 显示问题分类下拉菜单
    $("#dropDownInput").click(function(e){
        $("#dropDownList .dropDownMenu").css("display","block");

        // 阻止事件冒泡
        e.stopPropagation();
    });


    // 选择问题分类
    $("#dropDownList .dropDownMenu li").click(function(){

        var waterType = $(this).text();
        $("#dropDownInput").val(waterType);

    });

})();


var changeLEManageAsset = function() {

	var leManageAssetDiv = $("#le-manage-asset");

    if(leManageAssetDiv.is(':hidden')){　　//如果node是隐藏的则显示node元素，否则隐藏

        leManageAssetDiv.show();

    } else {

        leManageAssetDiv.hide();

    }
}


//客户姓名联动
var associateGuestName = function(element){

    var roomNum = $(element).val(); //这里是需要根据页面元素变的
    $.ajax({
        url:'/LD/userRoom/searchGuestName.action',
        type:'post',
        dataType:'json',
        data:'{"roomNum":"'+ roomNum +'"}',
        contentType:'application/json',
        success:function(data){
            console.log(data);

            if(data.State == "Valid") {
                if(data.guest_NAME != null) {
                    $(".body-content input").eq(1).val(data.room_STATE);
                    $(".body-content input").eq(2).val(data.guest_NAME); //这里是需要根据页面元素变的
                } else {
                    $(".body-content input").eq(1).val("尚无客户，请重新填写房间号");
                    $(".body-content input").eq(2).val("尚无客户，请重新填写房间号");
                }
            } else {
                showModalBox("error", "无操作权限");
            }
        }
    });

};