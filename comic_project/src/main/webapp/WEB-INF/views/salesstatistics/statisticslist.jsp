<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출 통계</title>
</head>
<body>
	<div class="main-panel">
		<div class="content-wrapper">
			<div class="row">
				<div class="col-lg-6 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">2019년도 월 매출</h4>
							<canvas id="line"></canvas>
						</div>
					</div>
				</div>
				<div class="col-lg-6 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">x월 일 매출</h4>
							<canvas id="bar"></canvas>
						</div>
					</div>
				</div>
				<%-- 
					<c:forEach items="${chartdata}" var="data">
						${data.productsales_id }
						${data.productsales_qty }
						<input type="hidden" value="<fmt:formatDate value="${data.productsales_time }" pattern="yyyy-MM-dd"/>" name="productsales_time">
						<fmt:formatDate value="${data.productsales_time }" pattern="yyyy-MM-dd"/>
						${data.productsales_product }
						${data.productsales_order_price }
						${data.roomsales_num }
						${data.roomsales_totalprice }
						<input type="hidden" value="<fmt:formatDate value="${data.roomsales_time }" pattern="yyyy-MM-dd" />" name="roomsales_time">
						
					</c:forEach> --%>
			</div>
		</div>
	</div>
</body>

<script>
$(document).ready(function() {
	var chartdata = {};
	
	$.ajax({
	    async: false,
	    url: "/salesstatistics/getlist.json",
	    success: function(data) {
	    	 chartdata = {
						month: data.month,
						monthprice: data.monthprice,
						day: data.day
			  };
	    }
	});
	
	var bardata = {
		    labels: chartdata.day,
		    datasets: [{
		      label: '# of Votes',
		      data: [10, 19, 3, 5, 2, 3],
		      backgroundColor: [
		        'rgba(255, 99, 132, 0.2)',
		        'rgba(54, 162, 235, 0.2)',
		        'rgba(255, 206, 86, 0.2)',
		        'rgba(75, 192, 192, 0.2)',
		        'rgba(153, 102, 255, 0.2)',
		        'rgba(255, 159, 64, 0.2)'
		      ],
		      borderColor: [
		        'rgba(255,99,132,1)',
		        'rgba(54, 162, 235, 1)',
		        'rgba(255, 206, 86, 1)',
		        'rgba(75, 192, 192, 1)',
		        'rgba(153, 102, 255, 1)',
		        'rgba(255, 159, 64, 1)'
		      ],
		      borderWidth: 1,
		      fill: false
		    }]
	};
	
	var linedata = {
		    labels: chartdata.month,
		    datasets: [{
		      label: '# of Votes',
		      data: chartdata.monthprice,
		      backgroundColor: [
		        'rgba(255, 99, 132, 0.2)',
		        'rgba(54, 162, 235, 0.2)',
		        'rgba(255, 206, 86, 0.2)',
		        'rgba(75, 192, 192, 0.2)',
		        'rgba(153, 102, 255, 0.2)',
		        'rgba(255, 159, 64, 0.2)'
		      ],
		      borderColor: [
		        'rgba(255,99,132,1)',
		        'rgba(54, 162, 235, 1)',
		        'rgba(255, 206, 86, 1)',
		        'rgba(75, 192, 192, 1)',
		        'rgba(153, 102, 255, 1)',
		        'rgba(255, 159, 64, 1)'
		      ],
		      borderWidth: 1,
		      fill: false
		    }]
	};
	
	var options = {
		    scales: {
		      yAxes: [{
		        ticks: {
		          beginAtZero: true
		        }
		      }]
		    },
		    legend: {
		      display: false
		    },
		    elements: {
		      point: {
		        radius: 0
		      }
		    }

	};
		
	if ($("#bar").length) {
    	var barChartCanvas = $("#bar").get(0).getContext("2d");
    // This will get the first returned node in the jQuery collection.
	    var barChart = new Chart(barChartCanvas, {
	      type: 'bar',
	      data: bardata,
	      options: options
    	});
    }
	
	  if ($("#line").length) {
	   	var lineChartCanvas = $("#line").get(0).getContext("2d");
		    var lineChart = new Chart(lineChartCanvas, {
		      type: 'line',
		      data: linedata,
		      options: options
		    });
	  }	
});
 
</script>
</html>
