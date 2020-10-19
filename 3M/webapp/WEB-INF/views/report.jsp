<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> 
<link href="${pageContext.request.contextPath}/resources/css/sidebar.css" type="text/css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/resources/css/menubar.css" type="text/css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/resources/css/feed.css" type="text/css" rel="stylesheet"/>

<body>
<div id="topbanner">

<!-- 네비게이션  -->
<!-- 펼치기 버튼 -->
<input type="checkbox" id="menub">
<label for="menub">
	<span></span>
	<span></span>
	<span></span>
</label>
<div class="menubar">
<button onclick="location.href='feed'">피드</button>
<button onclick="location.href='board'">게시판</button>
<button onclick="location.href='report'">고객센터</button>
</div>

<!-- 로고 -->
<div id="logo"><a href="mainController">로고</a></div>


<div id="loginCheck">
<c:choose>
	<c:when test="${sessionScope.member != null }">
	    <input type="checkbox" id="popup">
<label for="popup"><img src="resources/fileUpload/${member.filename }" id="profile">${member.id }님</label>
<div>
	<div id="modify">
	<img src="resources/fileUpload/${member.filename }" id="img">
	<table id="table">
	<tr>
		<td>아이디</td>
		<td>${member.id }</td>
	</tr>
    <tr>
    	<td>이름</td>
    	<td>${member.cname }</td>
    </tr>
    <tr>
    	<td>생년월일</td>
    	<td>${member.birth }</td>
    </tr>
    <tr>
    	<td>성별</td>
		<td>${member.gender }</td>   	
    </tr>
    <tr>
    	<td>이메일</td>
    	<td>${member.email }</td>
    </tr>
    <tr>
    	<td>헬스(선호/비선호)</td>
    	<td>${member.health }</td>
    </tr>
    <tr>
    	<td>피트니스(선호/비선호)</td>
    	<td>${member.fitness }</td>
    </tr>
    <tr>
    	<td>트레이너(여부)</td>
    	<td>${member.trainer }</td>
    </tr> 
    <tr>
    	<td><button onclick="process()">수정하기</button></td>
    	<td><button onclick="delete()">삭제하기</button></td>
    </tr>
	</table>
	<button onclick="massageCheck()">쪽지목록</button>
	<div id="massageListDiv"></div>
	<div id="massageDiv"></div>
	</div>
	<div id="process">
	<form action="process" method="post" enctype="multipart/form-data">
	<input type="hidden" name="id" value="${member.id }">
	<img src="resources/fileUpload/${member.filename }" id="img">
	<input type="file" name="file">
	<table id="table">
    <tr>
    	<td>이름</td>
    	<td><input type="text" name="cname" value="${member.cname}" ></td>
    </tr>
    <tr>
    	<td>성별</td>   	
		<td><input type="radio" name="gender" value="남">남자
			<input type="radio" name="gender" value="여">여자
		</td>
    </tr>
    <tr>
    	<td>이메일</td>
    	<td><input type="email" name="email" value="${member.email }"></td>
    </tr>
    <tr>
    	<td>헬스(선호/비선호)</td>
    	<td>
    		<input type="radio" name="health" value="선호">선호
			<input type="radio" name="health" value="비선호">비선호
    	</td>
    </tr>
    <tr>
    	<td>피트니스(선호/비선호)</td>
    	<td>
    		<input type="radio" name="fitness" value="선호">선호
			<input type="radio" name="fitness" value="비선호">비선호
    	</td>
    </tr>
    <tr>
    	<td> <input type="submit" value="수정하기"></td>
    	<td></td>
    </tr>
	</table>
	</form>
	
	</div>
    <label for="popup"></label>
</div>
	<button onclick="location.href='logout'">로그아웃</button>
	</c:when>
<c:otherwise>
<input type="checkbox" id="menuicon">
<label for="menuicon" id="login">LOGIN</label>
<div class="sidebar">

<!-- 로그인 -->
<div class="login">
<form action="login" method="post">
	<input type="text"  name="id" placeholder="아이디" id="idform">
	<input type="password" name="pw" placeholder="비밀번호" id="idform">
	<input type="submit" value="로그인">
</form>
</div>

</div>

<input type="checkbox" id="menuicon2">
		<label for="menuicon2" id="signup">SIGNUP</label>
<div class="sidebar2">
    <div id="insertDiv">
	<form action="join" method="post" enctype="multipart/form-data">
	<table>
	<tr>
		<td><input type="file" name="file"></td>
	</tr>
	<tr>
		<td>
		<input type="text" name="id" placeholder="아이디" onkeyup="idOverlap()">
		<span id="confirmId"></span>
		</td>
	</tr>
	<tr>
		<td><input type="password" name="pw" placeholder="비밀번호"></td>
	</tr>
	<tr>
		<td><input type="text" name="cname" placeholder="이름"></td>
	</tr>
	<tr>
		<td><input type="email" name="email" placeholder="이메일"></td>
	</tr>
	<tr>
		<td><input type="date" name="birth" placeholder="생년월일"></td>
	</tr>
	 <tr>
		<td>
			헬스
			<input type="radio" name="health" value="선호">선호
			<input type="radio" name="health" value="비선호">비선호
		</td>
	</tr>
	<tr>
		<td>
			피트니스
			<input type="radio" name="fitness" value="선호">선호
			<input type="radio" name="fitness" value="비선호">비선호
		</td>
	</tr>
	<tr>
		<td>
			성별
			<input type="radio" name="gender" value="남">남자
			<input type="radio" name="gender" value="여">여자
		</td>
	</tr>
		<tr>
		<td>
			<input type="text" name="intro" placeholder="한줄소개"/>
		</td>
	</tr>
	</table>
	<input type="submit" value="회원가입">
	</form>
	</div>
</div>
</c:otherwise>
</c:choose>
</div>
<div id="Contents">

<div id="reportBoard">
	<div class="contents" id="question">
	
	<ul>
		<li class="menu" id="">
		<a class="qs">1번 질문</a>
		<ul class="hide">
		<li>답변</li>
		</ul>
		</li>
		<li class="menu" id="">
		<a class="qs">2번 질문</a>
		<ul class="hide">
			<li>답변</li>
		</ul>
		</li>
		<li class="menu" id="">
		<a class="qs">3번 질문</a>
		<ul class="hide">
			<li>답변</li>
		</ul>
		</li>
	</ul>
	
	<button onclick="Inquiry()">1:1문의하기</button>
	</div>
	<div id="reportList">
	</div>
</div>
</div>
</body>
<script>
// 펼치기 기능

	window.onload =function(){
		var submenu = $(".menu>a").next("ul");
		  submenu.slideUp();
		}

$(document).ready(function(){
    $(".menu>a").click(function(){
        var submenu = $(this).next("ul");
        if( submenu.is(":visible") ){
            submenu.slideUp();
        }else{
            submenu.slideDown();
        }
    });
});
</script>
<script>

//고객센터 
$(function(){
	$('#report').click(function(){
		var reportDiv = document.getElementById('reportBoard');
		reportDiv.style.display="block";
		var board = document.getElementById("board");
		board.style.display="none";
		var feedArea = document.getElementById("feedArea");
		feedArea.style.display="none";
		var ContentsDiv = document.getElementById("ContentsDiv");
		ContentsDiv.style.display="none";
	$.ajax({
		type : "POST",
		url : "board/reportList",
		success : function(result){
				getReport(result);
			},
			error : function(){
				alert("신고내역이 없습니다.");
				}
		});
		});
		});
function getReport(result){
	var output ="";
	output += "<table><tr>";
	output += "<th>작성자</th>";
	output += "<th>제목</th>";
	output += "<th>작성일</th>";
	output += "<th></th></tr>";
	$('#reportList').html(output);
//신고 리스트가 들어갈 부분
}

//1:1문의하기
function Inquiry(){
	window.open("reportWrite","신고",'width=500px,height=1000px');
}

//쪽지관련 기능들
//쪽지목록가져오기
function massageCheck(){
	var id = "${sessionScope.loginId}"
	$.ajax({
		type : "POST",
		url : "massage/getMassage",
		data : {"getid":id},
		dataType : "json",
		success : function(result){
				massageList(result);
			},
			error : function(){
				alert("쪽지함이 비어있습니다.");
				}
		});
}
//쪽지목록 출력
function massageList(result){
	var output = "";
	 output +="<table><tr><th>보낸사람</th><th>제목</th><th>날짜</th><th></th></tr>";

		for(i in result){
				output += "<tr><td><"+result[i].sendid+"></td><td><"+result[i].mtitle+"></td><td><"+result[i].mdate+"></td><td><button onclick='viewMassage("+result[i].mnum+")'>펼치기</button></td></tr>";
			}
	output+="</table>";
	$('#massageListDiv').html(output);
}
//쪽지 상세보기
function massageWrite(){
	window.open("massageWrite","쪽지",'width=500px,height=1000px');
}

</script> 
</html>