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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.5/css/mdb.min.css" />
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
<style>
form span {
	display: none;
}
</style>
<script>
	$(function() {
		var base_url = 'text/category_data.html ';
		$('#category1_container').load(base_url + '#category1', function() {
			$(this).show();
		});

		//첫 번째 카테고리가 변경될 때 동작
		$('form').on('change', '#category1_container>select', function() {
			//두, 세 번째 카테고리 제거
			$('[name=category2]').empty().hide();
			$('[name=category3]').empty().hide();

			//선택된 값의 target 데이터(id)를 찾아서 로드시킴
			var target = $(this).find('option:selected').data('target');
			$('#category2_container').load(base_url + target, function() {
				$(this).show();
			});
		});
		
		//두 번째 카테고리가 변경될 때 동작
		$('form').on('change', '#category2_container>select', function() {
			//세 번째 카테고리 제거
			$('[name=category3]').empty().hide();

			//선택된 값의 target 데이터(id)를 찾아서 로드시킴
			var target = $(this).find('option:selected').data('target');
			$('#category3_container').load(base_url + target, function() {
				$(this).show();
			});
		});
		
		//세 번째 카테고리가 변경될 때 동작(최종 선택)
		$('form').on('change', '#category3_container>select', function() {
			//
			if($(this).find('option:selected').index()>0){
				var val1 = $('#category1_container option:selected').val();
				var val2 = $('#category2_container option:selected').val();
				var val3 = $('#category3_container option:selected').val();
				
				$('#console').text(val1+" > "+val2+" > "+val3);
			}
		});
	});
</script>

</head>
<body>
	<h1 class="title">동적 드롭다운</h1>
	<div>
		<form>
			<span id="category1_container"></span> 
			<span id="category2_container"></span>
			<span id="category3_container"></span>
		</form>
	</div>
	<div id="console"></div>
</body>
</html>

<!-- material design bootstrap -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.5/js/mdb.min.js"></script>

