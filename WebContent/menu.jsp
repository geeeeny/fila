<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Ubuntu:700" rel="stylesheet">
<script>
$(function(){

});
</script>

</head>
<body>
<c:url value="/" var="home"/> <!-- 컨텍스트 패스를 자동으로 붙여줌 -->
<div class="menu">
	<div class="left-menu">
		<a href="${home}"><i class="fa fa-home"></i> Fila</a>
		<a href="gallery"><i class="fa fa-images"></i> Gallery</a>
		<a href="flickr"><i class="fa fa-images"></i> Flickr</a>
	</div>
	<div class="right-menu">
		<c:choose>
			<c:when test="${empty USER}">
				<a href="login"><i class="fa fa-sign-in-alt"></i> 로그인</a>
				<a href="join"><i class="fa fa-user-plus"></i> 회원가입</a>
			</c:when>
			<c:otherwise>
				<i class="fa fa-user"></i> ${USER.userId}
				<a href="logout"><i class="fa fa-sign-in-alt"></i> 로그아웃</a>
				<a href="profile"><i class="fa fa-edit"></i> 정보수정</a>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<div class="jumbotron text-center">
	<a href="${home}"><h1>FILA ;D</h1></a>
	<p>lightbox / carousel / flickr</p>
</div>
</body>
</html>

<!-- material design bootstrap -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.5/js/mdb.min.js"></script>

