var getMeters = function () {
	$.ajax({
		type: 'POST',
		url: '/LD/userRoom/getMeters.action',
		contentType: 'application/json',
		dataType: 'json',
		data: '{"rid": 1, "type": 2}',
		success: function (data) {
			console.log(data);
		}
		
	})
}

var getItem = function () {
	$.ajax({
		type: 'POST',
		url: '/LD/userRoom/getRoomItem.action',
		contentType: 'application/json',
		dataType: 'json',
		data: '{"rid": 1}',
		success: function (data) {
			console.log(data);
		}
	});
}