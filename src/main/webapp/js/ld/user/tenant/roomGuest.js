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

var checkNull = function (obj) {
	Object.keys(obj).map(i => {if (obj[i]==null){
		delete obj[i];
		return obj;
		}});
	
}

var getFurniture = function (rid) {
	$.ajax({
		type: 'POST',
		url: '/LD/userRoom/getRoomInfo.action',
		contentType: 'application/json',
		dataType: 'json',
		data: '{"rid": '+rid+', "op": 1}',
		success: function (data) {
			console.log(data, 'Furniture==');
			if (data.item_funiture) {
				let items = data.item_funiture;
				console.log(items, 'items');
				$("#item_furniture tr").length;
				for (let index in items) {
					let obj = {}
					let name = items[index].name;
					let company = items[index].company;
					let tag = items[index].tag;
					let catagory = items[index].cat;
					let comment = items[index].comm;
					let itemId = items[index].item_ID;
					obj['name'] = name;
					obj['company'] = company;
					obj['tag'] = tag;
					obj['catagory'] = catagory;
					obj['comment'] = comment;
					obj['itemId'] = itemId;
					var res = checkNull(obj);
					console.log(res, 'result');
					$("#item_furniture").append("<tr><td>"+itemId+"</td><td>"+name+"</td><td>"+company+"</td><td>"+catagory+"</td><td>"+tag+"</td><td>"+comment+"</td><tr>")
				}
			}
			
		}
	});
}

var getElectric = function (rid) {
	$.ajax({
		type: 'POST',
		url: '/LD/userRoom/getRoomInfo.action',
		contentType: 'application/json',
		dataType: 'json',
		data: '{"rid": '+rid+', "op": 2}',
		success: function (data) {
			console.log(data, 'Electric==');
		}
	});
}

var getLight = function (rid) {
	$.ajax({
		type: 'POST',
		url: '/LD/userRoom/getRoomInfo.action',
		contentType: 'application/json',
		dataType: 'json',
		data: '{"rid": '+rid+', "op": 3}',
		success: function (data) {
			console.log(data, 'Light');
		}
	});
}

var getCurtain = function (rid) {
	$.ajax({
		type: 'POST',
		url: '/LD/userRoom/getRoomInfo.action',
		contentType: 'application/json',
		dataType: 'json',
		data: '{"rid": '+rid+', "op": 4}',
		success: function (data) {
//			console.log(data, 'Curtain');
		}
	});
}

var getLittle = function (rid) {
	$.ajax({
		type: 'POST',
		url: '/LD/userRoom/getRoomInfo.action',
		contentType: 'application/json',
		dataType: 'json',
		data: '{"rid": '+rid+', "op": 5}',
		success: function (data) {
//			console.log(data, 'Little');
		}
	});
}

