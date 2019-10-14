$(document).ready(function(){
	
	$('#memberListTable').DataTable({ // 페이징 처리, 검색, show entries
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
	    	url : "/member/Data.json",
	    	type : "get",
	    	dataSrc: '',
	    },
	    aoColumns: [
	    	{data: "MEMBER_ID"},
	    	{data: "MEMBER_NAME"},
	    	{data: "MEMBER_EMAIL"},
	    	{data: "MEMBER_PHONE_NUMBER"},
            {
                mData: "MEMBER_ID",
                mRender: function (data, type, row) {
                    return "<button name ='membermodifyBtn' value=" + data +" type='button' class='btn btn-info' onclick='javascript:membermodifyBtn(value)'>수정</button> ";
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

function membermodifyBtn(MEMBER_ID) {
    	
	$.ajax({
	    type: 'get',
	    url: "/member/MemberModify?MEMBER_ID="+MEMBER_ID,
	    dataType : "json",
	    success: function(data) {
	    	$('#MEMBER_ID_modify').attr('value',data.MEMBER_ID);
	    	$('#MEMBER_NAME_modify').attr('value',data.MEMBER_NAME);
	    	$('#MEMBER_EMAI_modifyL').attr('value',data.MEMBER_EAMIL);
	    	$('#MEMBER_PHONE_NUMBER_modify').attr('value',data.MEMBER_PHONE_NUMBER);
	    	$('#MemberModifyModal').show();
	    }
	});
	
	$('#modifyclose_modify').click(function(){
    	$('#MemberModifyModal').hide();
    });
}