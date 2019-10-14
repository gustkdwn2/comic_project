$(document).ready(function(){
	
	$('#bookTable').DataTable({ // 페이징 처리, 검색, show entries
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
	    	url : "/book/bookData.json",
	    	type : "get",
	    	dataSrc: '',
	    },
	    aoColumns: [
	    	{data: "book_name"},
	    	{data: "book_loc"},
	    	{data: "book_publisher"},
	    	{data: "book_writer"},
	    	{data: "book_content"},
	    	{data: "book_category"},
	    	{data: "book_lastbook"},
	    	{data: "book_status"},
            {
                mData: "book_name",
                mRender: function (data, type, row) {
                    return "<button name ='getBtn' value=" + data +" type='button' class='btn btn-info' onclick='javascript:bookModify(value)'>수정</button> " +
                    	   "<button name ='removeBtn' value=" + data +" type='submit' class='btn btn-danger' onclick='javascript:bookRemove(value)'>삭제</button>";
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

function bookRemove(book_name){
	
	if(!confirm("삭제 하시겠습니까?")){
		return false;
	}
	
	var form = document.createElement("form"); // form을 만듬
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post");
	form.setAttribute("action", "bookRemove");
	document.body.appendChild(form);

	var hiddenInput = document.createElement("input");
	hiddenInput.setAttribute("type", "hidden");
	hiddenInput.setAttribute("name", "book_name");
	hiddenInput.setAttribute("value", book_name);

	form.appendChild(hiddenInput);

	form.submit();
}

function bookModify(book_name) {
	
	$.ajax({
	    type: 'get',
	    url: "/book/bookGet?book_name="+book_name,
	    dataType : "json",
	    success: function(data) {
    	    
	    	$('#book_name').attr('value',data.book_name);
	    	$('#book_loc').attr('value',data.book_loc);
	    	$('#book_publisher').attr('value',data.book_publisher);
	    	$('#book_writer').attr('value',data.book_writer);
	    	$('#book_content').attr('value',data.book_content);
	    	$('#book_category').attr('value',data.book_category);
	    	$('#book_lastbook').attr('value',data.book_lastbook);
	    	$('#book_status').attr('value',data.book_status);
	    	$('#productGet').show();
	    	
	    }
	});

}