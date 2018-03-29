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
<script>
$(function(){

	
});
</script>

</head>
<body>
	<%@include file="menu.jsp"%>
	<div id="join-form" class="join-form">
		<h1 class="pb-4"><i class="fa fa-edit"></i> 
			${member.userId}(${member.name})회원정보 수정
		</h1>
		<form method="post">
			<div class="md-form">
				<input type="hidden" name="userId" id="userId" class="form-control" required value="${member.userId}"><br>		
			</div>
			<div class="md-form">
				<input type="hidden" name="name" id="name" class="form-control" value="${member.name}" required><br>
			</div>
			<div class="md-form">
				<i class="fa fa-lock prefix grey-text"></i>
				<label for="password">비밀번호</label>
				<input type="password" name="password" id="password" class="form-control" required><br>
			</div>
			<div class="md-form">
				<i class="fa fa-phone prefix grey-text"></i>
				<label for="cellPhone">전화번호</label>
				<input type="text" name="cellPhone" id="cellPhone" class="form-control" value="${member.cellPhone}" required><br>
			</div>
			<div class="md-form">
				<i class="fa fa-envelope prefix grey-text"></i>
				<label for="email">email</label>
				<input type="text" name="email" id="email" class="form-control" value="${member.email}" required><br>
			</div>
			<div class="md-form">
				<i class="fa fa-address-book prefix grey-text"></i>
				<label for="address">주소</label>
				<input type="text" name="address" id="address" class="form-control" value="${member.address}" required><br>
			</div>
			<c:if test="${not empty error}">
				<div class="error">
					${error}
				</div>
			</c:if>
			<div class="md-form text-center">
				<button type="submit" class="btn btn-primary">
					<i class="fa fa-check"></i>확인
				</button>
			</div>
		</form>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>

<!-- material design bootstrap -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.5/js/mdb.min.js"></script>

