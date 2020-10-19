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

</head>

<body onload="load()">
<!-- 탑배너 -->
<div id="topbanner">

<!-- 네비게이션  -->
<!-- 펼치기 버튼 -->
<div id="menu">
	<ul class="contents">
		<li class="menu" id=""><a>메뉴</a>
		<ul class="hide">
			<li class="navbar"><button id="feed">피드</button></li>
			<li class="navbar"><button id="viewBoard">게시판</button></li>
			<li class="navbar"><button onclick="report()" id="report">고객센터</button></li>
		</ul>
		</li>
	</ul>
</div>

<!-- 로고 -->
<div id="logo">
<img alt="메인로고" src="resources/fileUpload/로고임시.png" width="30%">
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
	</table>
	<input type="submit" value="회원가입">
	</form>
	</div>
</div>
</c:otherwise>
</c:choose>
</div>

</div>

<!-- 컨텐츠div -->
<div>

<div id="contents">
<div id="feedArea"></div>
<div id ="board">
<div id="boardNav">
	<button onclick="viewAll()">전체보기</button>
	<button onclick="viewHealth()">헬스게시판보기</button>
	<button onclick="viewFitness()">피트니스게시판보기</button>
</div>

<!-- 게시판이 나오는 div -->
<div id="boardArea"></div>
<!-- 글작성을 위한 div -->
<button id="write" onclick="Bwrite()">글작성</button>
<div id="boardWriteArea"></div>
<!-- 글수정을 위한 div -->
<div id="boardModifyArea"></div>
<input type='hidden' id='deleteInputTag' value='작성하기'/>
</div>
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

<script>
//게시판이 실행되는 부분
function load(){
	viewBoardFunction();
}

function process(){
	var modify = document.getElementById("modify");
	var procs = document.getElementById("process");
	modify.style.display="none";
	procs.style.display="block";
}
</script>
<script>
// 펼치기 기능
$(function(){
	$("#report").click(function(){
		var submenu = $(".menu>a").next("ul");
		  submenu.slideUp();
		});
});
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
//피드 이동기능
$(function(){
$('#feed').click(function(){

	//이부분에 모든 div가 지워지는 기능 넣어주어야함
	var board = document.getElementById("board");
	board.style.display="none";
	var board = document.getElementById("reportBoard");
	reportBoard.style.display="none";
	var feedArea = document.getElementById("feedArea");
	feedArea.style.display="block";

	// 피드 상세내용 출력
	viewFeed();
});
});
function viewFeed(){
	var output="";
	output+="<div id='lastFeed'>최근피드</div>";
	output+="<div id='myFeed'>내 피드목록</div>";
	output+="<div id='myTrainer'>트레이너정보<div>";

	$('#feedArea').html(output);

	var id = '${member.id }';
	$.ajax({
		type : "POST",
		url : "feed/lastFeed",
		data : {"id":id},
		dataType : "json",
		success : function(lastFeed){
			getLastFeed(lastFeed);
			},
			error : function(){
				alert("피드를 찾지 못했습니다.");
				}
		});

	$.ajax ({
	type : "POST",
	url : "feed/myFeed",
	data : {"id":id},
	dataType : "json",
	success : function(myFeed){
			getMyFeed(myFeed);
		},
		error : function(){
			alert('피드 목록을 불러올 수 없다');
			}
		});



	
}

//최근피드 가져오기
function getLastFeed(lastFeed){
	var output="";
	output+="<p>작성자 : <span>"+lastFeed[0].fid+"</span></p><br>";
	output+="<p>작성일 : <span>"+lastFeed[0].fdate+"</span></p><br>";
	output+="<p>제목 : <span>"+lastFeed[0].title+"</span></p><br>";
	output+="<p>내용 : <image src='/resources/fileUpload/'"+lastFeed[0].filename+" alt='첨부파일'/><span>"+lastFeed[0].conten+"</span></p><br>";
	output+="<p>조회수 : <span>"+lastFeed[0].hit+"</span></p>";
		

	$('#lastFeed').html(output);
}
// 나의 피드 목록 가져오기
function getMyFeed(myFeed){
	var output="";
	output+="<table>";
	output+="<tr><th>글제목</th><th>작성자</th><th>조회수</th><th>작성일</th></tr>";
	for(var i in myFeed){
	output+="<tr><td>"+myFeed[i].title+"</td><td>"+myFeed[i].write+"</td><td>"+myFeed[i].hit+"</td><td>"+myFeed[i].fdate+"</td></tr>";

	}
	
	output+="</table>";
	$('#myFeed').html(output);
}

//작성창 생기는 기능
	function Bwrite(){
	var output="";
	output+="<form action='boardWrite' method='POST' id='boardWriteForm' enctype='multipart/form-data'>";
	output+="<table><tr><td>카테고리</td><td><select name='rq'><option value='H' selected>헬스</option><option value='F'>피트니스</option></select></td></tr><tr><td>작성자</td><td><input type='text' name='fid' size='39' value='${member.id}' readonly></td></tr><tr>	<td>제목</td>	<td><input type='text' name='title' size='39'></td></tr><tr><td>내용</td><td><textarea rows='20' cols='40' name='content'></textarea></td></tr><tr><td>첨부파일</td><td><input type='file' name='file'></td></tr></table></form>";
	
	$("#boardWriteArea").html(output);

	$('#deleteInputTag').prop('type', 'button');
	}
	//작성창 지워지는 기능
	$(function() {
		$('#deleteInputTag').click(function(){deleteWrite()});

	});
	function deleteWrite() {
		var output = "";
	    $('#boardWriteForm').submit();
		$('#boardWriteArea').html(output);
		$('#deleteInputTag').prop('type', 'hidden');
	}
</script>
<script>

//게시판 보이는 기능
$(function(){
$('#viewBoard').click(function(){
	var feedArea = document.getElementById("feedArea");
	feedArea.style.display="none";
	var board = document.getElementById("reportBoard");
	reportBoard.style.display="none";
	//이부분에 모든 div가 지워지는 기능 넣어주어야함
	viewBoardFunction();
	
});
});
function viewBoardFunction(){
	var board = document.getElementById('board');
	board.style.display="block";
			
	$.ajax({
		type : "POST",
		url : "board/boardList",
		success : function(result){
				boardList(result);
			},
			error : function(){
				alert("게시글이 없습니다.");
				}
		});
}
//게시판
	function boardList(result){
		var output ="";
		output += "<table><tr>";
		output += "<th>작성자</th>";
		output += "<th>제목</th>";
		output += "<th>작성일</th>";
		output += "<th></th></tr>";

		for(var i in result){
			output += "<tr>";
			output += "<td>" + result[i].fid + "</td>";
			output += "<td>" + result[i].title + "</td>";
			output += "<td>" + result[i].fdate+ "</td>";
			output += "<td><button onclick='boardView("+ result[i].num + ")'>상세보기</button></td>";
			output += "</tr>";
			}
		output +="</table>";
		$("#boardArea").html(output);	
	}	
//게시글 상세보기
	function boardView(num){
		$.ajax({
			type : "POST",
			url : "board/boardView",
			data : {"num":num},
			dataType : "json",
			success : function(abc){
					view(abc);
				},
				error : function(){
					alert("게시글을 찾기 못했습니다.");
					}
			});
	
		}

//게시글 상세정보가 출력된다.
 	function view(abc){
 	 	deleteWrite();
		var output ="";
 		$('#boardArea').html(output);
 	 	
 
		output += "<table><tr>";
		output += "<th>카테고리</th>";
		output += "<td>"+abc.rq+"<td>";
		output += "</tr>";
		output += "<tr>";
		output += "<th>작성자</th>";
		output += "<td>"+abc.fid+"<td>";
		output += "</tr>";
		output += "<tr>";
		output += "<th>제목</th>";
		output += "<td>"+abc.title+"<td>";
		output += "</tr>";
		output += "<tr>"	;
		output += "<th>날짜</th>";
		output += "<td>"+abc.fdate+"<td>";
		output += "</tr>";
		output += "<tr>";
		output += "<th>내용</th></tr>";
		output += "<td>"+abc.content+"<td>";
		output += "</tr>";
		output += "<tr>";
		output += "<td><img src='resources/fileUpload/"+abc.filename+"' alt='사진'></td>"
		output += "</tr></table>";
 		output += "<button onclick='modify("+abc.num+")'>수정하기</button>"
 		output += "<button onclick='boardDelete("+abc.num+")'>삭제하기</button>"
		$('#boardArea').html(output);
		
 	 	}
//전체게시판
function viewAll(){
	viewBoardFunction()
}
//헬스게시판
function health(){
	//이부분에 모든 div가 지워지는 기능 넣어주어야함
	var board = document.getElementById('board');
	board.style.display="block";
			
	$.ajax({
		type : "POST",
		url : "board/boardHealthList",
		success : function(result){
				boardList(result);
			},
			error : function(){
				alert("게시글이 없습니다.");
				}
		});
}
//피트니스게시판
function fitness(){
	//이부분에 모든 div가 지워지는 기능 넣어주어야함
	var board = document.getElementById('board');
	board.style.display="block";
			
	$.ajax({
		type : "POST",
		url : "board/boardFitnessList",
		success : function(result){
				boardList(result);
			},
			error : function(){
				alert("게시글이 없습니다.");
				}
		});
}

//게시판수정
function modify(num){
		var output="";
		output+="<form action='boardmodify' method='POST' id='boardModifyForm' enctype='multipart/form-data'>";
		output+="<table><tr><td>카테고리</td><td><select name='rq'><option value='H' selected>헬스</option><option value='F'>피트니스</option></select></td></tr><tr>	<td>제목</td>	<td><input type='text' name='title' size='39'></td></tr><tr><td>내용</td><td><textarea rows='20' cols='40' name='content'></textarea></td></tr><tr><td>첨부파일</td><td><input type='file' name='file'></td></tr><tr><td><input type='hidden' value="+num+" name='num'/></td></tr></table><input type='submit' value='수정'/></form>";

		$('#boardModifyArea').html(output);
}
//게시글 삭제
function boardDelete(num){
	$.ajax({
		type : "POST",
		url : "board/boardDelete",
		data : {"num":num},
		success : function(result){
			viewBoardFunction()
		},
			error : function(){
				viewBoardFunction()
				}
		});
	
}


//고객센터 
$(function(){
	$('#report').click(function(){
		var reportDiv = document.getElementById('reportBoard');
		reportDiv.style.display="block";
		var board = document.getElementById("board");
		board.style.display="none";
		var feedArea = document.getElementById("feedArea");
		feedArea.style.display="none";
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