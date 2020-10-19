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
<link href="${pageContext.request.contextPath}/resources/css/main.css" type="text/css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/resources/css/modalWindow.css" type="text/css" rel="stylesheet"/>
<meta name="Generator" content="EditPlus">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">

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
로고
</div>


<div id="loginCheck">
<c:choose>
	<c:when test="${sessionScope.member != null }">
	    <input type="checkbox" id="popup">
<label for="popup" class="getout"><img src="resources/fileUpload/${member.filename }" id="profile">${member.id }님</label>
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
<div id="checkboxDiv1">
<input type="checkbox" id="menuicon" onclick="check_action(this, 'loginCheck')" >
<label for="menuicon" id="login" class="getout">LOGIN</label>
<div class="sidebar">

<!-- 로그인 -->
<div class="login">
<form action="login" method="post" name="loginFormAction">
	<div id="loginform">
		<input type="text"  name="id" placeholder="아이디" id="idform">
		<input type="password" name="pw" placeholder="비밀번호" id="idform">
	</div>
	<div id="logbtn">
		<button onclick="joindForm()" id="loginbtn">로<br/>그<br/>인<br/></button>
	</div>
</form>
</div>

</div>
</div>
<div id="checkboxDiv2">
<input type="checkbox" id="menuicon2" onclick="check_action(this, 'loginCheck')" >
		<label for="menuicon2" id="signup" class="getout">SIGNUP</label>
<div class="sidebar2">
    <div id="insertDiv">
   <div id="xcondiv">
    <input type="checkbox" id="xcon" onclick="check_action(this, 'loginCheck')" >
    <label for="xcon">
        <span></span>
        <span></span>
        <span></span>
    </label>
	</div>
    <div id="signupposi">
	<form action="join" method="post" enctype="multipart/form-data">
	<p><input type="file" name="file"></p>

		<p><input type="text" name="id" placeholder="아이디" class="info_input" onkeyup="idOverlap()"></p>
		<p><span id="confirmId"></span></p>

		<p><input type="password" name="pw" class="info_input" placeholder="비밀번호"></p>

		<p><input type="text" name="cname" class="info_input" placeholder="이름"></p>
		
		<p><input type="email" name="email" class="info_input" placeholder="이메일"></p>
	
		<p><input type="date" name="birth" class="info_input" placeholder="생년월일"></p>
		<p>
			<span class="size">헬스</span>
			<span class="size2"><input type="radio" name="health" value="선호">선호</span>
			<input type="radio" name="health" value="비선호">비선호
		</p>
		<p>
			<span class="size">피트니스</span>
			<span class="size2"><input type="radio" name="fitness" value="선호">선호</span>
			<input type="radio" name="fitness" value="비선호">비선호
		</p>
		<p>
			<span class="size">성별</span>
			<span class="size2"><input type="radio" name="gender" value="남">남자</span>
			<span class="size3"><input type="radio" name="gender" value="여">여자</span>

		</p>
		<br/>
		<p>
			<input type="text" name="intro" class="info_input" placeholder="한줄소개"/>
		</p>
	<input type="submit" value="회원가입">
	
	</form>
	</div>
	</div>
</div>
</div>
</c:otherwise>
</c:choose>
</div>

</div>


<div id="Contents">
<div id="Contents-first">
<div id="weather">날시 API가 들어갈 구역</div>
<div id="letter">문구 이미지가 png파일로 들어갑니다.</div>

</div>
<div class="hrTag">
<hr size="2" color="#eaeaea"/>
</div>

<div id="trainer">트레이너 정보가 들어가야 하는 지역입니다. 한줄이 나올겁니다.</div>
<div class="hrTag">
<hr size="2" color="#eaeaea"/>
</div>
<div id="Sales">상품정보가 출력되는 구간입니다. 한줄이 나올겁니다.</div>


</div>
<!-- footer  -->
<div id="footer">ⓒ 3M</div>
</body>
<script type="text/javascript">
  /*  체크박스 컨트롤  */
      function check_action(obj, group) {

        var oBool      = obj.checked;  //선택한 체크박스 checked 값을 변수에 담는다.
        var oDiv      = document.getElementById(group);  //해당 그룹 div
        var oNodeList  = oDiv.getElementsByTagName("INPUT");  //div 안에 속해 있는 개체

        /*  해당 그룹에 있는 체크박스 모두 해제  */
        for (i = 0; i < oNodeList.length; i++)
        {
          if (oNodeList[i].type == "checkbox")
          {
            oNodeList[i].checked = false;
          }
        }
       
        /*  선택한 체크박스에 checked 적용  */
        obj.checked = oBool;

      }
function joindForm(){
	loginFormAction.submit();
}
</script>
</html>