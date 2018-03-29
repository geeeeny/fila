<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>title</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- font awesome -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js"
	integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l"
	crossorigin="anonymous"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js"
	integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c"
	crossorigin="anonymous"></script>

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.0/css/mdb.min.css" rel="stylesheet">
<!--  bootstrap stylesheet -->
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/main.css" />
</head>
<script src="js/FlickrApi.js"></script>
<script> 
$(function() { 
	var api = new FlickrApi(); 
	// api.getRecent(); 
	// api.search('superman'); 
	
	$('#search').click(function(){
		var keyword = $('#keyword').val();
		api.search(keyword);
	});
});	
</script>

<body>
	<%@ include file="menu.jsp"%>
	<div class="container">
		<h1>
			<i class="fa fa-images"></i> Flickr Gallery
		</h1>
		<!-- Search form -->
		<div class="active-cyan-3 active-cyan-4 mb-4">
			<input type="text" id="keyword" class="form-control" placeholder="Search" aria-label="Search">
			<button id="search" class="btn btn-primary"><i class="fa fa-search"></i></button>
		</div>
		
		<div class="row" id="panel">

		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>

<!-- material design bootstrap -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.5/js/mdb.min.js"></script>

