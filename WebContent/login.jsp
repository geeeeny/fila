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
	<div class="login-form">
		<h1 class="pb-4"><i class="fa fa-sign-in-alt"></i> 로그인</h1>
		<form method="post">
			<input type="hidden" name="url" value="${url}"> <!-- 로그인시 가고자했던 url저장하기 위함 -->
			<div class="md-form">
				<i class="fa fa-user prefix grey-text"></i>
				<label for="userId">사용자 ID</label>
				<input type="text" name="userId" id="userId" class="form-control" required value="${member.userId}"><br>
			</div>
			<div class="md-form">
				<i class="fa fa-lock prefix grey-text"></i>
				<label for="password">비밀번호</label>
				<input type="password" name="password" id="password" class="form-control" required><br>
			</div>
			<c:if test="${not empty error}">
				<div class="error">
					${error}
				</div>
			</c:if>
			<div class="md-form text-center">
				<button type="submit" class="btn btn-primary">
					<i class="fa fa-check"></i>로그인
				</button>
			</div>
		</form>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>

<!-- material design bootstrap -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.5/js/mdb.min.js"></script>

