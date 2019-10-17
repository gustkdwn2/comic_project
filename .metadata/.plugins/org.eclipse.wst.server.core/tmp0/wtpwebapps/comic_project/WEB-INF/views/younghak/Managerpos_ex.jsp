<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>  
 
<link rel="stylesheet" href="/resources/css/younghak.css">

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
   box-sizing: border-box; 
	}

body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

/* The grid: Three equal columns that floats next to each other */
.column {
   float: left; 
  width: 430px;
  height: 150px;
  padding: 100px;
  text-align: center;
  font-size: 25px;
  cursor: pointer;
  color: white;
  margin-left:30px;
  margin-bottom:30px;
}

.containerTab {
  padding: 20px;
  color: white;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  padding: 20px;
  display: table;
  clear: both; 
}

/* Closable button inside the container tab */
.closebtn {
  float: right;
  color: white;
  font-size: 35px;
  cursor: pointer;
}

.pill-nav a {
  display: inline-block;
  color: black;
  text-align: center;
  padding: 14px;
  text-decoration: none;
  font-size: 17px;
  border-radius: 5px;
}

.pill-nav a:hover {
  background-color: #ddd;
  color: black;
}

.pill-nav a.active {
  background-color: dodgerblue;
  color: white;
}
.header-right {
  float: right;
}
</style>
</head>
<body>

<div class="pill-nav">
<div class="header-right">
  <a class="active" href="#home">Home</a>
  <a href="#news">News</a>
  <a href="#contact">Contact</a>
  <a href="#about">About</a>
</div></div>


  <!-- <h2>Expanding Grid</h2>
  <p>Click on the boxes below:</p> -->




<!-- Three columns -->
<div class="row">

  <div class="column" onclick="openTab('b1');" style="background:green;">
    Box 1
  </div>
  <div class="column" onclick="openTab('b2');" style="background:blue;">
    Box 2
  </div>
  <div class="column" onclick="openTab('b3');" style="background:red;">
    Box 3
  </div>  
   <div class="column" onclick="openTab('b1');" style="background:green;">
    Box 4
  </div>
  <div class="column" onclick="openTab('b2');" style="background:blue;">
    Box 5
  </div>
  <div class="column" onclick="openTab('b3');" style="background:red;">
    Box 6
  </div>
  
</div>


<!-- Full-width columns: (hidden by default) -->
<!-- <div id="b1" class="containerTab" style="display:none;background:green">
  <span onclick="this.parentElement.style.display='none'" class="closebtn">&times;</span>
  <h2>Box 1</h2>
  <p>Lorem ipsum dolor sit amet, te quo doctus abhorreant, et pri deleniti intellegat, te sanctus inermis ullamcorper nam. Ius error diceret deseruisse ad</p>
</div>

<div id="b2" class="containerTab" style="display:none;background:blue">
  <span onclick="this.parentElement.style.display='none'" class="closebtn">&times;</span>
  <h2>Box 2</h2>
  <p>Lorem ipsum dolor sit amet, te quo doctus abhorreant, et pri deleniti intellegat, te sanctus inermis ullamcorper nam. Ius error diceret deseruisse ad</p>
</div>

<div id="b3" class="containerTab" style="display:none;background:red">
  <span onclick="this.parentElement.style.display='none'" class="closebtn">&times;</span>
  <h2>Box 3</h2>
  <p>Lorem ipsum dolor sit amet, te quo doctus abhorreant, et pri deleniti intellegat, te sanctus inermis ullamcorper nam. Ius error diceret deseruisse ad</p>
</div> -->

<script>
/* function openTab(tabName) {
  var i, x;
  x = document.getElementsByClassName("containerTab");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  document.getElementById(tabName).style.display = "block";
} */
</script>

</body>
</html> 