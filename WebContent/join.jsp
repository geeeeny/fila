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
	$('#check-btn').click(function(e){
		e.preventDefault();
		//중복체크
		var userId = $('#userId').val();
		if(userId==''){
			alert('사용자 ID를 입력하세요');
			return;
		}
		 
		$.get('idcheck', {userId:userId}, function(data){
			//통신 성공했을 때 실행되는 함수
			console.log(typeof data); //content type이 json이므로 data는 boolean 형식(html이었다면 문자열이다.)
			console.log(data);
			if(!data){ //중복 아님 //data는 처리결과이며, json형식으로 응답받았기 때문에 boolean이다.
				$(':submit').prop('disabled', false);
				$('#check-message').removeClass('error')
				.html('사용 가능한 ID입니다.');
			}else{	//사용자 ID 중복
				$(':submit').prop('disabled', true);
				$('#check-message').addClass('error')
					.html('이미 사용중인 ID입니다.');
			}
		}); //AJAX-url(/idcheck 서블릿), 파라미터(userId프로퍼티를 가지는 객체), 콜백 함수를 지정
		
		
	});
	
	$('#join-form').submit(function(e){
		//비밀번호 일치 검사
		var password1 = $(':password').eq(0).val();
		var password2 = $(':password').eq(1).val();
		
		if(password1 != password2){
			alert('비밀번호가 일치하지 않습니다.');
			$(':password').eq(0).focus();
			e.preventDefault();
		}
	});
	
});
</script>

</head>
<body>
	<%@include file="menu.jsp"%>
	
	<div id="join-form" class="join-form">
		<h1 class="pb-4"><i class="fa fa-user-plus"></i> 회원가입</h1>
		<form method="post">
			<div class="md-form">
				<i class="fa fa-user prefix grey-text"></i>
				<label for="userId">사용자 ID</label>
				<input type="text" name="userId" id="userId" class="form-control" required value="${member.userId}"><br>
				
			</div>
			<div class="md-form">
				<a id="check-btn" class="btn-floating btn btn-primary btn-sm">중복체크</a>
				<span id="check-message" class="error"></span>
			</div>
			<div class="md-form">
				<i class="fa fa-id-badge prefix grey-text"></i>
				<label for="name">이름</label>
				<input type="text" name="name" id="name" class="form-control" required><br>
			</div>
			<div class="md-form">
				<i class="fa fa-lock prefix grey-text"></i>
				<label for="password">비밀번호</label>
				<input type="password" name="password" id="password" class="form-control" required><br>
			</div>
			<div class="md-form">
				<i class="fa fa-exclamation-triangle prefix grey-text"></i>
				<label for="password2">비밀번호 확인</label>
				<input type="password" name="password2" id="password2" class="form-control" required><br>
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
				<button type="submit" class="btn btn-primary" disabled>
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

