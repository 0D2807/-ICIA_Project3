<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고</title>
</head>
<body>
<form action="sendMassage" method="POST" id="massageForm">
 보내는사람<input type="text" name="sendid" value="${sessionScope.member.id}" readonly />
 받는사람<input type="text" name="getid" placeholder="관리자" value="admin" readonly/>
 제목<input type="text" name="mtitle"/>
 내용<textarea name="mcontent"rows="20" cols="40"></textarea>
 </form>
 <button onclick="send()">보내기</button>
</body>
<script>
function send(){
	massageForm.submit();
}
</script>
</html>