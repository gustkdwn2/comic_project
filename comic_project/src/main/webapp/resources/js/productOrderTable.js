$(document).ready(function(){
	$('#productOrderTable').DataTable({ // 페이징 처리, 검색, show entries
		pageLength: 10, //처음 페이지에 처리 개수
	    bPaginate: true, // 페이징 기능
	    bLengthChange: true,
	    lengthMenu : [ [ 10, 20, 30, -1 ], [ 10, 20, 30, "All" ] ], //show entries
	    bAutoWidth: false,
	    processing: true,
	    ordering: true,
	    serverSide: false,
	    searching: true, // 검색 기능
	    ajax : {
	    	url : "/productOrder/productOrderData.json",
	    	type : "get",
	    	dataSrc: '',
	    },
	    aoColumns: [
	    	{data: "productOrder_num"},
	    	{data: "productOrder_product_name"},
	    	{data: "productOrder_cost"},
	    	{data: "productOrder_qty"},
	    	{ data: "product_date", 
	    		"render": function (data) {
	    			var date = new Date(data); var month = date.getMonth() + 1; 
	    			return  date.getFullYear() + "-" + (month.toString().length > 1 ? month : "0" + month) + "-" + date.getDate(); }
	    	},
            {
                mData: "productOrder_num",
                mRender: function (data, type, row) {
                    return "<button name ='getBtn' value=" + data +" type='button' class='btn btn-info' onclick='javascript:productOrderModify(value)'>수정</button> " +
                    	   "<button name ='removeBtn' value=" + data +" type='submit' class='btn btn-danger' onclick='javascript:productOrderRemove(value)'>삭제</button>";
                }
            }
        ],
	    
	    bStateSave: true,
	    "iDisplayLength": 10,
	    "language": {
	      search: "Search :"
	    },
	    "columnDefs": [{
	        targets: 'no-sort',
	        orderable: false
	    }],
	    
	    order: [[0, 'desc']]
	});
	
});

function productOrderRemove(productOrder_num){
	
	if(!confirm("삭제 하시겠습니까?")){
		return false;
	}
	
	var form = document.createElement("form"); // form을 만듬
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post");
	form.setAttribute("action", "productOrderRemove");
	document.body.appendChild(form);

	var hiddenInput = document.createElement("input");
	hiddenInput.setAttribute("type", "hidden");
	hiddenInput.setAttribute("name", "productOrder_num");
	hiddenInput.setAttribute("value", productOrder_num);

	form.appendChild(hiddenInput);

	form.submit();
}

function productOrderModify(productOrder_num) {
    	
    	$.ajax({
    	    type: 'get',
    	    url: "/productOrder/productOrderGet?productOrder_num="+productOrder_num,
    	    dataType : "json",
    	    success: function(data) {
	    	    
    	    	$('#productOrder_num').attr('value',data.productOrder_num);
    	    	$('#productOrder_product_name').attr('value',data.productOrder_product_name);
    	    	$('#productOrder_cost').attr('value',data.productOrder_cost);
    	    	$('#productOrder_qty').attr('value',data.productOrder_qty);
    	    	$('#product_date').attr('value',data.product_date);
    	    	$('#productOrderGet').show();
    	    	
    	    }
    	});
	
}