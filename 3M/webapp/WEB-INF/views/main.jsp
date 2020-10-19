<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건돼입구</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> 
<link href="${pageContext.request.contextPath}/resources/css/sidebar.css" type="text/css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/resources/css/menubar.css" type="text/css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/resources/css/feed.css" type="text/css" rel="stylesheet"/>

<style>
html, body, div, span, applet, object, iframe, table, caption, tbody, tfoot, thead, tr, th, td, 
del, dfn, em, font, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, 
h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, 
dl, dt, dd, ol, ul, li, fieldset, form, label, legend,button {
 vertical-align: baseline;
 font-family: inherit;
 font-weight: inherit;
 font-style: inherit;
 font-size: 100%;

 padding: 0;
 margin: 0;
 border: 0;
 }
</style>
</head>

<body onload="load()">

<!-- 탑배너 -->
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
<button onclick="location.href='report'" id="report">고객센터</button>
</div>

<!-- 로고 -->
<div id="logo">
<img alt="로고.png" src="resources/fileUpload/로고(임시).png" width="150px">
</div>


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

</div>

<div id="contents">

</div>
<div id="ContentsDiv">
<div id="Contents-first">
<div id="weather">날시 API가 들어갈 구역</div>
<div id="letter">문구 이미지가 png파일로 들어갑니다.</div>

</div>
<div id="ContentsSeconds">
<div id="trainer">트레이너 정보가 들어가야 하는 지역입니다. 한줄이 나올겁니다.</div>
<div id="Sales">상품정보가 출력되는 구간입니다. 한줄이 나올겁니다.</div>

</div>

</div>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<!-- footer  -->
<div id="footer">카피라이터 by 3M</div>
</body>
</html>