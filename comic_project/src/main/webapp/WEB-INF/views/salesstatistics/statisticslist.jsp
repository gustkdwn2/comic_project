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

							<select name="selectYear" id="selectYear">
								<option value="19">2019</option>
								<option value="20">2020</option>
								<option value="21">2021</option>
								<option value="22">2022</option>
								<option value="23">2023</option>
								<option value="24">2024</option>
								<option value="25">2025</option>
								<option value="26">2026</option>
								<option value="27">2027</option>
								<option value="28">2028</option>
								<option value="29">2029</option>
							</select>

							<h4 class="card-title">월 매출 </h4>
							<canvas id="line"></canvas>
						</div>
					</div>
				</div>
				<div class="col-lg-6 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<select name="selectYear2" id="selectYear2">
								<option value="19">2019</option>
								<option value="20">2020</option>
								<option value="21">2021</option>
								<option value="22">2022</option>
								<option value="23">2023</option>
								<option value="24">2024</option>
								<option value="25">2025</option>
								<option value="26">2026</option>
								<option value="27">2027</option>
								<option value="28">2028</option>
								<option value="29">2029</option>
							</select>
							<select name="selectMonth" id="selectMonth" >
								<option value="01">1월</option>
								<option value="02">2월</option>
								<option value="03">3월</option>
								<option value="04">4월</option>
								<option value="05">5월</option>
								<option value="06">6월</option>
								<option value="07">7월</option>
								<option value="08">8월</option>
								<option value="09">9월</option>
								<option value="10">10월</option>
								<option value="11">11월</option>
								<option value="12">12월</option>
							</select>
							
							<h4 class="card-title">일 매출</h4>
							<canvas id="bar"></canvas>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
$(document).ready(function() {
	var chartdata = {};
	var today = new Date();
	var yy = today.getFullYear().toString().substr(2,2);
	var mm = today.getMonth()+1;
	var sendData = { "year" : yy , "month" : mm};
	
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
	
	window.getYearList = function(sendData) {
		$.ajax({
		    async: false,
		    type: 'get',
		    data: sendData,
		    url: "/salesstatistics/getYearlist.json",
		    success: function(data) {
		    	 console.log(data);
		    	 chartdata = {
							month: data.month,
							monthprice: data.monthprice,
		  		}
		    }
		});
		
		
		
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
		
		  if ($("#line").length) {
		   	var lineChartCanvas = $("#line").get(0).getContext("2d");
			    var lineChart = new Chart(lineChartCanvas, {
			      type: 'line',
			      data: linedata,
			      options: options
			    });
		  }	
		
	}
	
	window.getMonthList = function(sendData) {
		$.ajax({
		    async: false,
		    type: 'get',
		    data: sendData,
		    url: "/salesstatistics/getMonthlist.json",
		    success: function(data) {
		    	 console.log(data);
		    	 chartdata = {
							day: data.day,
							dayprice: data.dayprice,
		  		}
		    }
		});
		
		
		
		var bardata = {
			    labels: chartdata.day,
			    datasets: [{
			      label: '# of Votes',
			      data: chartdata.dayprice,
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
		
		if ($("#bar").length) {
	    	var barChartCanvas = $("#bar").get(0).getContext("2d");
		    var barChart = new Chart(barChartCanvas, {
		      type: 'bar',
		      data: bardata,
		      options: options
	    	});
	    }
		
	}
	
	
	
	getYearList(sendData);
	getMonthList(sendData);
	
	$('#selectYear').change(function(){
		var changeYear = $('#selectYear option:selected').val();
		
		sendData = {
				"year" : changeYear
		}
		getYearList(sendData);
	});
	
	
	$('#selectMonth').change(function(){
		var changeYear2 = $('#selectYear2 option:selected').val();
		var changeMonth = $('#selectMonth option:selected').val();

		sendData = {
				"year" : changeYear2,
				"month" : changeMonth
		}
		getMonthList(sendData);
	});
	
	$('#selectYear2').change(function(){
		var changeYear2 = $('#selectYear2 option:selected').val();
		var changeMonth = $('#selectMonth option:selected').val();

		sendData = {
				"year" : changeYear2,
				"month" : changeMonth
		}
		getMonthList(sendData);
	});
});
</script>

<script type="text/javascript">


function selector(target,value){
var obj=document.getElementById(target);

	for(i=0;i<obj.length;i++){

		if(obj.options[i].value == value){
			obj.options[i].selected = true;
		}
	}
}


</script>

<script type="text/javascript">
	var today = new Date();	
	var mm = today.getMonth()+1;
	var yy = today.getFullYear().toString().substr(2,2);
	selector("selectMonth",mm);
	selector("selectYear", yy);
	selector("selectYear2", yy);
</script>
</html>
