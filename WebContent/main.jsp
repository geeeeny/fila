<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>title</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--  material design bootstrap stylesheet -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.5/css/mdb.min.css" />
<!-- font awesome -->
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/main.css"/> 

<!--  bootstrap stylesheet -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>	
<link rel="stylesheet" href="css/main.css"/> 
<script>

$(function(){

	
});
</script>

</head>
<body>
	<%@include file="menu.jsp"%>

	<div class="container text-center">
	  <h3>THE BAND</h3>
	  <p><em>We love music!</em></p>
	  <p>We have created a fictional band website. Lorem ipsum..</p>
	  <br>
	  <div class="row">
	    <div class="col-sm-4">
	      <p class="text-center"><strong>Name</strong></p><br>
	      <a href="#demo" data-toggle="collapse">
	        <img src="http://placehold.it/150x200" alt="Random Name" width="255" height="255">
	      </a>
	      <div id="demo" class="collapse">
	        <p>Guitarist and Lead Vocalist</p>
	        <p>Loves long walks on the beach</p>
	        <p>Member since 1988</p>
	      </div>
	    </div>
	    <div class="col-sm-4">
	      <p class="text-center"><strong>Name</strong></p><br>
	      <a href="#demo2" data-toggle="collapse">
	        <img src="http://placehold.it/150x200" alt="Random Name" width="255" height="255">
	      </a>
	      <div id="demo2" class="collapse">
	        <p>Drummer</p>
	        <p>Loves drummin'</p>
	        <p>Member since 1988</p>
	      </div>
	    </div>
	    <div class="col-sm-4">
	      <p class="text-center"><strong>Name</strong></p><br>
	      <a href="#demo3" data-toggle="collapse">
	        <img src="http://placehold.it/150x200" alt="Random Name" width="255" height="255">
	      </a>
	      <div id="demo3" class="collapse">
	        <p>Bass player</p>
	        <p>Loves math</p>
	        <p>Member since 2005</p>
	      </div>
	    </div>
	  </div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>

<!-- material design bootstrap -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.5/js/mdb.min.js"></script>

