<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function ajaxTest() {
		var n = document.getElementById("name").value
		var a = $("age").val()
		var addr = $("addr").val()
		var form = { name : n, age : a, addr : addr} //json 방식으로 저장하는 법입니다 그래서 디펜던시에 json을 넣어주었습니다.
		console.log(form) //콘솔에 어떻게 값이 들어오는지를 확인
		
		$.ajax({
			url : "ajax_result01", type : "POST",
			// data : 서버(컨트롤러)로 보내는 데이터
			data : JSON.stringify(form),
			dataType : 'json', //서버(컨트롤러)로 부터 돌아오는(return값)는 값
			contentType : "application/json; charset=utf-8",
			//contentType : 서버(컨트롤러)로 보내는 타입의 형태
			success : function(result) {
				$("#label").text(result.name + ", " +result.age+", " + result.addr)
			}, error : function(){
				alert("문제 발생 !!!!")
			}
		})
	}
</script>

</head>
<body>
	<input type="text" id="name" placeholder="name"> <br>
	<input type="text" id="age" placeholder="age"> <br>
	<input type="text" id="addr" placeholder="age"> <br>
	<!-- dto의 값이 없을때 map으로 받아주면됩니다. -->
	<input type="button"  onclick="ajaxTest()">
	<hr>
	결과 : <label id="label"></label>
</body>
</html>