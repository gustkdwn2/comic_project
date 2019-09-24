<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
	box-sizing: border-box;
}

/* Create three equal columns that floats next to each other */
.column {
	float: left;
	width: 27.33%;
	height: 30%;
	padding: 10px;
	margin-left: 30px;
	margin-bottom: 10px;
	/* height: 300px;  */ /* Should be removed. Only for demonstration */
}

/* Clear floats after the columns */
.row {
	margin-top:100px;

}

.row:after {
	content: "";
	display: table;
	clear: both;
}

.pill-nav {
	float: right;
}

/* .pill-nav a {
	display: inline-block;
	color: black;
	text-align: center;
	padding: 14px;
	text-decoration: none;
	font-size: 17px;
	border-radius: 5px;
} */
/* 
.pill-nav a:hover {
	background-color: #ddd;
	color: black;
}

.pill-nav a.active {
	background-color: dodgerblue;
	color: white;
} */

.header-right-yeonghak {
	float: right;
}
</style>
</head>
<body style="overflow: scroll">
	<!-- style="overflow:auto" -->


 	<!-- <div 
 	
 	data-text-content="true"
 	
		style="font-size: 16px; 
		color: rgb(255, 255, 255); 
		float: right;
		/* text-align: center;  */
		 line-height: 2.5em;  
		/* border-top-left-radius: 4px;  */
		/* border-top-right-radius: 4px;  */
		/* border-bottom-right-radius: 4px;  */
		/* border-bottom-left-radius: 4px; */ 
		background-color: rgb(52, 152, 219);"
		class="">수입 상세 검색</div> 
		
		<div  
 	
 	data-text-content="true"
 	
		style="font-size: 16px; 
		color: rgb(255, 255, 255); 
		float: right;
		text-align: center; 
		line-height: 2.5em; 
		border-top-left-radius: 4px; 
		border-top-right-radius: 4px; 
		border-bottom-right-radius: 4px; 
		border-bottom-left-radius: 4px; 
		background-color: rgb(52, 152, 219);"
		class="">수입 상세 검색</div>-->
		
	<!-- 	
		 <div 
		
		data-text-content="true"
		class=""
		style="position: absolute; top: 44px; left: 936px; 
		width: 100px; height: 40px;"
		data-link-to="page:1xgLk">
			<div data-text-content="true"
		style="font-size: 16px; color: rgb(255, 255, 255); 
		text-align: center; line-height: 2.5em; 
		border-top-left-radius: 4px; border-top-right-radius: 4px; 
		border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; 
		background-color: rgb(52, 152, 219);"
		class="">수입 상세 검색1</div>
	</div>  -->
		 
		<!-- <div class="pill-nav" > -->
	<div data-obj-id="ZM60G" data-obj-type="element"
		data-text-editable="true" class=""
		style="position: absolute; top: 80px; left: 1054px; width: 100px; height: 40px;"
		data-link-to="page:T1epN">
		
		<div data-text-content="true"
			style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 4em; border-top-left-radius: 4px; border-top-right-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; background-color: rgb(52, 152, 219);"
			class="">Home</div>
	</div>
	
	 <div onclick="#" data-obj-id="ygBpC" data-obj-type="element"
		data-text-editable="true" 
		data-text-content="true"
		class=""
		
		style="position: absolute; top: 80px; left: 936px; 
		width: 100px; height: 40px;"
		data-link-to="page:1xgLk">
		
			<div data-text-content="true"
		style="font-size: 16px; color: rgb(255, 255, 255); 
		text-align: center; line-height: 2em; 
		border-top-left-radius: 4px; border-top-right-radius: 4px; 
		border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; 
		background-color: rgb(52, 152, 219);"
		
		class="">수입 상세 검색1</div>
	</div> 
	
	
	
	<div data-obj-id="bu8l0" data-obj-type="element"
		data-text-editable="true" class=""
		style="position: absolute; top: 80px; left: 680px; width: 110px; height: 40px;"
		data-link-to="page:FOk2X">
		<div data-text-content="true"
			style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 4em; border-top-left-radius: 4px; border-top-right-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; background-color: rgb(52, 152, 219);"
			class="">Contact</div>
	</div>
	<div data-obj-id="bu8l0" data-obj-type="element"
		data-text-editable="true" class=""
		style="position: absolute; top: 80px; left: 807px; width: 110px; height: 40px;"
		data-link-to="page:FOk2X">
		<div data-text-content="true"
			style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 4em; border-top-left-radius: 4px; border-top-right-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; background-color: rgb(52, 152, 219);"
			class="">About</div>			
	</div>
	
	
<!--  
  <a class="active" href="#home">Home</a> 
  <a href="#home">Home</a>
  <a href="#news">News</a>
  <a href="#contact">Contact</a>
  <a href="#about">About</a> -->

<!-- </div> -->


	<div class="row">
		<div class="column" style="background-color: #aaa;">
			<h2>Column 1</h2>
			<p>Some text..</p>
		</div>
		<div class="column" style="background-color: #bbb;">
			<h2>Column 2</h2>
			<p>Some text..</p>
		</div>
		<div class="column" style="background-color: #ccc;">
			<h2>Column 3</h2>
			<p>Some text..</p>
		</div>
		<p>
		<div class="column" style="background-color: #aaa;">
			<h2>Column 1</h2>
			<p>Some text..</p>
		</div>
		<div class="column" style="background-color: #bbb;">
			<h2>Column 2</h2>
			<a><p>Some text...</p></a>
		
		<div class="column" style="background-color: #ccc;">
			<h2>Column 3</h2>
			<p>Some text..</p>
		</div>
	</div>

</body>
</html>