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
<link href="bower_components/lightbox2/dist/css/lightbox.css" rel="stylesheet"/>
<!-- font awesome -->
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="bower_components/lightbox2/dist/js/lightbox.js"></script>

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
	<div class="container">
		<h1><i class="fa fa-images"></i> Gallery</h1>
		<a href="gallery?mode=carousel" class="btn btn-primary btn-sm">carousel</a>
		<hr>
		<div class="row">
			<c:forEach var="image" items="${list}" varStatus="status">
				<div class="col-md-3 col-sm-4"> <!-- ImageServlet에 get방식으로 전달 -->
					<a href="image?id=${image.imageId}&mode=image"
						data-lightbox="roadtrip">
						<img src="image?id=${image.imageId}&mode=thumb" alt="${image.title}">
					</a>
					<p>
						<a href="image?id=${image.imageId}&mode=download">
							<i class="fa fa-download"></i>
						</a>
					</p>
				</div>
			</c:forEach>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>

<!-- material design bootstrap -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.5/js/mdb.min.js"></script>

