var orderProductService = (function() {

	function getList(category, callback, error) {
		$.getJSON("/sangju/productRead/" + category + ".json", function(data) {
			if (callback) {
				callback(data);
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}
	
	function productCheck(productNameJSON, callback, err) {
		$.ajax({
			type : 'post',
			url : '/sangju/productCheck',
			data : JSON.stringify(productNameJSON),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		})
	}
	
	function productAdd(productNameJSON, callback, err) {
		$.ajax({
			type : 'post',
			url : '/sangju/productAdd',
			data : JSON.stringify(productNameJSON),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		})
	}
	
	function productDelete(number, callback, err) {
		$.ajax({
			type : 'post',
			url : '/sangju/productDelete',
			data : JSON.stringify(number),
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				if (callback) {
					callback(data);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		})
	}

	return {
		getList : getList,
		productCheck : productCheck,
		productAdd : productAdd,
		productDelete : productDelete
	};
})();