<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script type="text/javascript">
	function getUser() {
		$.ajax({
			url : "users", type : "get", dataType : "json",
			success : function(list){
				console.log(list)
				var html = ""
				$.each(list, function(index, item){
					html += "<b>이름 : </b>" + item.name + "<br>"
					html += "<b>나이 : </b>" + item.age + "<hr>"
				})
				
				/*
				for(var i=0; i<list.length; i++) {
					html += "<b>이름 : </b>" + list[i].name + "<br>"
					html += "<b>나이 : </b>" + list[i].age + "<hr>"
				}
				*/
				
				
				//$("#users").text(html)
				//$("#users").html(html)
				$("#users").append(html) //더보기 같이 하단에 계속 데이터들을 붙여줍니다.
				
			}
		})	
		
	}
	function userInfo() {
		var userId = $("#userId").val()
		$.ajax({
			//url : "user?id="+userId, 
			url : "user/" + userId, //user/홍길동[index]
			type : "get", dataType : "json",
			success : function(dto) {
				var html = ""
				html += "<b>이름 : </b>" + dto.name + "<br>"
				html += "<b>나이 : </b>" + dto.age + "<hr>"
				$("#users").html(html)
			}
		})
	}
	function modfiy() {
		let name = $("#userId").val()
		let age = $("#userAge").val()
		let form = { name:name , age:age } 
		$.ajax({
			url : "modify", type : "put", dataType : "json",
			data : JSON.stringify(form)
			contentType : "application/json; charset=utf-8",
			success : function(dto) {
				var html = ""
				html += "<b>이름 : </b>" + dto.name + "<br>"
				html += "<b>나이 : </b>" + dto.age + "<hr>"
				$("#users").html(html)
			}
		})
	}
	function membership() {
		/*
		let uId = $("#uId").val()
		let uName = $("#uName").val()
		let uAge = $("#uAge").val()
		let uAddr = $("#uAddr").val()
		let uPhone = $("#uPhone").val()
		let form = {uId:uId, uName:uName, uAge:uAge, uAddr:uAddr, uPhone:uPhone}
		*/
		let form = {}
		let arr = $(#fo).serializeArray() /*배열을 사용해서 값을 넣어주는 코드입니다.*/
		console.log(arr)
		
		for(i=0; i<arr.length; i++) {
			form[arr[i].name] = arr[i].value
		}//그리고 반복문을 이용해 배열에 저장되있던 데이터를 form 에 저장을 시켜주는 의미입니다.
		
		$.ajax({
			url : "membership", type="post", dataType : "json",
			data : JSON,stringify(form),
			contentType : "application/json; charset=urf-8",
			success : function(data) {
				if(data.result == true) {
					alert('저장 되었습니다!!!')
				}
			}
})
		
		
	}
</script>

</head>
<body>
	<span id="users"></span>
	<button type="button" onclick="getUser()">사용자 목록 보기</button>
	<hr>
	<input type="text" id="userId"> <br>
	<button type="button" onclick="userInfo()">특정 사용자 보기</button>
	
	<hr>
	<input type="text" id="userId" placeholder="수정할 이름 입력"> <br>
	<input type="text" id="userAge" placeholder="수정할 나이 입력"> <br>
	<button type="button" onclick="modify()">사용자 수정</button>
	
	<h3>회원가입</h3>
	<form id="fo">
		<input type="text" name="uId" placeholder="id"> <br>
		<input type="text" name="uName" placeholder="uName"><br>
		<input type="text" name="uAge" placeholder="uAge"><br>
		<input type="text" name="uAddr" placeholder="uAddr"><br>
		<input type="text" name="uPhone" placeholder="uPhone"><br>
		<input type="button" id="membership()" value="회원가입"> 
	</form>
	
	 
	
</body>
</html>