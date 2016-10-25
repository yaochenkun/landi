$(function(){
  for (var high = 34; high >= 30; high--) {
	  	let id1 = "W" + high + "-1";
	  	let id2 = "W" + high + "-2";
	  	let id3 = "W" + high + "-3";
	  	let id4 = "E" + high + "-3";
	  	let id5 = "E" + high + "-2";
	  	let id6 = "E" + high + "-1";
	  	var element = '<tr><td colspan="2"><a id="W'+high+'-1" href="./roomStatus.jsp?rid='+id1+'">姓名</a></td><td colspan="2"><a id="W'+high+'-2" href="./roomStatus.jsp?rid='+id2+'">姓名</a></td><td><a id="W'+high+'-3" href="./roomStatus.jsp?rid='+id3+'">姓名</a></td><td><a id="E'+high+'-3" href="./roomStatus.jsp?rid='+id4+'"></a></td><td colspan="2"><a id="E'+high+'-2" href="./roomStatus.jsp?rid='+id5+'"></a></td><td style="border-right:1px solid #dddddd;" colspan="2"><a id="E'+high+'-1" href="./roomStatus.jsp?rid='+id6+'"></a></td></tr><tr><td style="border-top:none;" colspan="2"><a href="./roomStatus.jsp?rid='+id1+'">W'+high+'-1</a></td><td style="border-top:none;" colspan="2"><a href="./roomStatus.jsp?rid='+id2+'">W'+high+'-2</a></td><td style="border-top:none;"><a href="./roomStatus.jsp?rid='+id3+'">W'+high+'-3</a></td><td style="border-top:none;"><a href="./roomStatus.jsp?rid='+id4+'">E'+high+'-3</a></td><td style="border-top:none;" colspan="2"><a href="./roomStatus.jsp?rid='+id5+'">E'+high+'-2</a></td><td style="border-right:1px solid #dddddd;border-top:none;" colspan="2"><a href="./roomStatus.jsp?rid='+id6+'">E'+high+'-1</a></td></tr>'; 
	  	$('#building').append(element);
      }
  for (var mid = 29; mid >= 25; mid--) {
	  	let id1 = "W" + mid + "-1";
	  	let id2 = "W" + mid + "-2";
	  	let id3 = "W" + mid + "-3";
	  	let id4 = "E" + mid + "-5";
	  	let id5 = "E" + mid + "-3";
	  	let id6 = "E" + mid + "-2";
	  	let id7 = "E" + mid + "-1";
	    var element = '<tr><td colspan="2"><a href="./roomStatus.jsp?rid='+id1+'" id="W'+mid+'-1">姓名</a></td><td colspan="2"><a id="W'+mid+'-2" href="./roomStatus.jsp?rid='+id2+'">姓名</a></td><td><a id="W'+mid+'-3" href="./roomStatus.jsp?rid='+id3+'">姓名</a></td><td><a id="E'+mid+'-5" href="./roomStatus.jsp?rid='+id4+'"></a></td><td colspan="2"><a id="E'+mid+'-3" href="./roomStatus.jsp?rid='+id5+'"></a></td><td><a id="E'+mid+'-2" href="./roomStatus.jsp?rid='+id6+'"></a></td><td style="border-right:1px solid #dddddd;"><a id="E'+mid+'-1" href="./roomStatus.jsp?rid='+id7+'"></a></td></tr><tr><td style="border-top:none;" colspan="2"><a href="./roomStatus.jsp?rid='+id1+'">W'+mid+'-1</a></td><td style="border-top:none;" colspan="2"><a href="./roomStatus.jsp?rid='+id2+'">W'+mid+'-2</a></td><td style="border-top:none;"><a href="./roomStatus.jsp?rid='+id3+'">W'+mid+'-3</a></td><td style="border-top:none;"><a href="./roomStatus.jsp?rid='+id4+'">E'+mid+'-5</a></td><td style="border-top:none;" colspan="2"><a href="./roomStatus.jsp?rid='+id5+'">E'+mid+'-3</a></td><td style="border-top:none;"><a href="./roomStatus.jsp?rid='+id6+'">E'+mid+'-2</a></td><td style="border-right:1px solid #dddddd;border-top:none;"><a href="./roomStatus.jsp?rid='+id7+'">E'+mid+'-1</a></td></tr>';
	  	$('#building').append(element);
  	}
  for (var floor = 24; floor>=3; floor--) {
	  	let id1 = "W" + floor + "-1";
	  	let id2 = "W" + floor + "-2";
	  	let id3 = "W" + floor + "-3";
	  	let id4 = "W" + floor + "-5";
	  	let id5 = "E" + floor + "-6";
	  	let id6 = "E" + floor + "-5";
	  	let id7 = "E" + floor + "-3";
	  	let id8 = "E" + floor + "-2";
	  	let id9 = "E" + floor + "-1";
	  	var element = '<tr><td colspan="2"><a href="./roomStatus.jsp?rid='+id1+'" id="W'+floor+'-1">姓名</a></td><td><a href="./roomStatus.jsp?rid='+id2+'" id="W'+floor+'-2">姓名</a></td><td><a id="W'+floor+'-3" href="./roomStatus.jsp?rid='+id3+'">姓名</a></td><td><a id="W'+floor+'-5" href="./roomStatus.jsp?rid='+id4+'">姓名</a></td><td class="free"><a id="E'+floor+'-6" href="./roomStatus.jsp?rid='+id5+'">姓名</a></td><td><a id="E'+floor+'-5" href="./roomStatus.jsp?rid='+id6+'">姓名</a></td><td><a id="E'+floor+'-3" href="./roomStatus.jsp?rid='+id7+'">姓名</a></td><td><a id="E'+floor+'-2" href="./roomStatus.jsp?rid='+id8+'">姓名</a></td><td style="border-right:1px solid #dddddd;"><a id="E'+floor+'-1" href="./roomStatus.jsp?rid='+id9+'">姓名</a></td></tr><tr><td style="border-top:none;" colspan="2"><a href="./roomStatus.jsp?rid='+id1+'">W'+ floor +'-1</td><td style="border-top:none;"><a href="./roomStatus.jsp?rid='+id2+'">W'+ floor +'-2</td><td style="border-top:none;"><a href="./roomStatus.jsp?rid='+id3+'">W'+ floor +'-3</a></td><td style="border-top:none;"><a href="./roomStatus.jsp?rid='+id4+'">W'+ floor +'-5</a></td><td style="border-top:none;" class="free"><a href="./roomStatus.jsp?rid='+id5+'">E'+ floor +'-6</a></td><td style="border-top:none;"><a href="./roomStatus.jsp?rid='+id6+'">E'+ floor +'-5</a></td><td style="border-top:none;"><a href="./roomStatus.jsp?rid='+id7+'">E'+ floor +'-3</a></td><td style="border-top:none;"><a href="./roomStatus.jsp?rid='+id8+'">E'+ floor +'-2</a></td><td style="border-right:1px solid #dddddd;border-top:none;"><a href="./roomStatus.jsp?rid='+id9+'">E'+ floor +'-1</a></td></tr>';
	  	$("#building").append(element);
  	}
  var last = '<tr><td colspan="2"><a id="W2-1" href="./roomStatus.jsp?rid=W2-1">姓名</a></td><td><a id="W2-2" href="./roomStatus.jsp?rid=W2-2">姓名</a></td><td><a id="W2-3" href="./roomStatus.jsp?rid=W2-3">姓名</a></td><td colspan="3" rowspan="2"></td><td><a id="E2-5" href="./roomStatus.jsp?rid=E2-5">姓名</a></td><td><a id="E2-3" href="./roomStatus.jsp?rid=E2-3">姓名</a></td><td><a id="E2-2" href="./roomStatus.jsp?rid=E2-2">姓名</a></td><td style="border-right:1px solid #dddddd;"><a id="E2-1" href="./roomStatus.jsp?rid=E2-1">姓名</a></td></tr><tr><td style="border-top:none;" colspan="2"><a href="./roomStatus.jsp?rid=W2-1">W2-1</a></td><td style="border-top:none;"><a href="./roomStatus.jsp?rid=W2-2">W2-2</a></td><td style="border-top:none;"><a href="./roomStatus.jsp?rid=W2-3">W2-3</a></td><td style="border-top:none;"><a href="./roomStatus.jsp?rid=E2-5">E2-5</a></td><td style="border-top:none;"><a href="./roomStatus.jsp?rid=E2-3">E2-3</a></td><td style="border-top:none;"><a href="./roomStatus.jsp?rid=E2-2">E2-2</a></td><td style="border-right:1px solid #dddddd;border-top:none;"><a href="./roomStatus.jsp?rid=E2-1">E2-1</a></td></tr>'; 
  $("#building").append(last);
});

var getRoomState = function () {
  $.ajax({
    type: 'GET',
    url: '/LD/userRoom/getAllRoomState.action',
    success: function(data) {
//      console.log(data.roomStateList, 'roomstate');
      let roomList = data.roomStateList;
      for (let item in roomList) {
        let roomNum = roomList[item].room_NUMBER;
        let userName = roomList[item].cus_NAME;
        console.log(roomNum);
        $("#" + roomNum).text(userName);
      }
//      let room_Id = "1";
//      console.log(roomList[parseInt(room_Id)].cus_NAME);
//      $("#" + room_Id).text(roomList[parseInt(room_Id)].cus_NAME);
      
    }
  });
}

var getRoomInfo = function () {
	$.ajax({
		type: 'POST',
		url: '/LD/userRoom/getRoomInfo.action',
		contentType: 'application/json',
		dataType:"json",
		data: '{"rid":1,"op": 1}',
		success: function (data) {
			console.log(data);
		}
	});
}