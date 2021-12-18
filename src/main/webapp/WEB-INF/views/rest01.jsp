<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function ajaxGet() {
		$.ajax({
			url : "rest", type : "get", dataType : "json",
			success : function(data) {
				console.log(data)
				$("#label").text(data.execute)
			}
		})
	}
	function ajaxPost() {
		$.ajax({
			url : "rest", type : "post", dataType : "json",
			success : function(data) {
				$("#label").text(data.execute)
			}
		})
	}
	function ajaxPut() {
		$.ajax({
			url : "rest", type : "put", dataType : "json",
			success : function(data) {
				$("#label").text(data.execute)
			}
		})
	}
	function ajaxDelete() {
		$.ajax({
			url : "rest", type : "delete", dataType : "json",
			success : function(data) {
				$("#label").text(data.execute)
			}
		})
	}
</script>
</head>
<body>
	<label id="label"></label> <hr>
	<button onclick="ajaxGet()">get 호출</button>
	<button onclick="ajaxPost()">post 호출</button>
	<button onclick="ajaxPut()">put 호출</button>
	<button onclick="ajaxDelete()">delete 호출</button>

</body>
</html>