<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건돼입구</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.ckeditor.com/4.15.0/standard-all/ckeditor.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/sidebar.css" type="text/css" rel="stylesheet"/>
<link
	href="${pageContext.request.contextPath}/resources/css/menubar.css"
	type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/feed.css"
	type="text/css" rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/modalWindow.css"
	type="text/css" rel="stylesheet" />

</head>

<body onload="load()">

	<!-- 탑배너 -->
	<div id="topbanner">

		<!-- 네비게이션  -->
		<!-- 펼치기 버튼 -->
		<input type="checkbox" id="menub"> <label for="menub">
			<span></span> <span></span> <span></span>
		</label>
		<div class="menubar">
			<button onclick="location.href='feed'">피드</button>
			<button onclick="location.href='board'">게시판</button>
			<button onclick="location.href='report'">고객센터</button>
		</div>

		<!-- 로고 -->
		<div id="logo">
			<a href="mainController">로고</a>
		</div>


		<div id="loginCheck">
			<c:choose>
				<c:when test="${sessionScope.member != null }">
					<input type="checkbox" id="popup">
					<label for="popup"><img
						src="resources/fileUpload/${member.filename }" id="profile">${member.id }님</label>
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
							<form action="process" method="post"
								enctype="multipart/form-data">
								<input type="hidden" name="id" value="${member.id }"> <img
									src="resources/fileUpload/${member.filename }" id="img">
								<input type="file" name="file">
								<table id="table">
									<tr>
										<td>이름</td>
										<td><input type="text" name="cname"
											value="${member.cname}"></td>
									</tr>
									<tr>
										<td>성별</td>
										<td><input type="radio" name="gender" value="남">남자
											<input type="radio" name="gender" value="여">여자</td>
									</tr>
									<tr>
										<td>이메일</td>
										<td><input type="email" name="email"
											value="${member.email }"></td>
									</tr>
									<tr>
										<td>헬스(선호/비선호)</td>
										<td><input type="radio" name="health" value="선호">선호
											<input type="radio" name="health" value="비선호">비선호</td>
									</tr>
									<tr>
										<td>피트니스(선호/비선호)</td>
										<td><input type="radio" name="fitness" value="선호">선호
											<input type="radio" name="fitness" value="비선호">비선호</td>
									</tr>
									<tr>
										<td><input type="submit" value="수정하기"></td>
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
								<input type="text" name="id" placeholder="아이디" id="idform">
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
										<td><input type="text" name="id" placeholder="아이디"
											onkeyup="idOverlap()"> <span id="confirmId"></span></td>
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
										<td>헬스 <input type="radio" name="health" value="선호">선호
											<input type="radio" name="health" value="비선호">비선호
										</td>
									</tr>
									<tr>
										<td>피트니스 <input type="radio" name="fitness" value="선호">선호
											<input type="radio" name="fitness" value="비선호">비선호
										</td>
									</tr>
									<tr>
										<td>성별 <input type="radio" name="gender" value="남">남자
											<input type="radio" name="gender" value="여">여자
										</td>
									</tr>
									<tr>
										<td><input type="text" name="intro" placeholder="한줄소개" />
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
<div id="Contents">
	<div id="board">
		<div id="boardNav">
			<button onclick="viewAll()">전체보기</button>
			<button onclick="viewHealth()">헬스게시판보기</button>
			<button onclick="viewFitness()">피트니스게시판보기</button>
		</div>
		<!-- 게시판이 나오는 div -->
			<input type="checkbox" id="writeboard">
			 <label	for="writeboard">작동</label>
			<div>
				<div>
					<form action='boardWrite' method='POST' id='boardWriteForm'
						enctype='multipart/form-data'>
						<table>
							<tr>
								<td>카테고리</td>
								<td><select name='rq'><option value='H' selected>헬스</option>
										<option value='F'>피트니스</option></select></td>
							</tr>
							<tr>
								<td>작성자</td>
								<td><input type="text" name="fid" size="39"
									value='${member.id}' readonly></td>
							</tr>
							<tr>
								<td>제목</td>
								<td><input type='text' name='title' size='39'></td>
							</tr>
							<tr>
								<td>내용</td>
								<td><textarea rows="20" cols="40" name="content"
										id="content">
								</textarea></td>
							</tr>
							<tr>
								<td>첨부파일</td>
								<td><input type='file' name='file'></td>
							</tr>
						</table>
					</form>
					<input type='button' id='deleteInputTag' value='작성하기' />
				</div>
				<label for="writeboard"></label>
			</div>
		</div>
		<div id="boardArea">
		<!-- 글작성을 위한 div -->

		<script>
    CKEDITOR.plugins.addExternal('a11ychecker', 'https://ckeditor.com/docs/ckeditor4/4.15.0/examples/assets/plugins/a11ychecker/', 'plugin.js');

    // Performance optimization:
    // Send a request for tests JSON file ASAP, so it's likely to be ready when the user runs Acessibility Checker.
    $.getJSON('https://ckeditor.com/docs/vendors/4.15.0/ckeditor/assets/plugins/a11ychecker/libs/quail/tests.json');

    CKEDITOR.replace('content', {
      extraPlugins: 'a11ychecker',
      removePlugins: 'scayt,wsc',
      height: 500,
      a11ychecker_quailParams: {
        jsonPath: 'assets/plugins/a11ychecker/libs/quail',
        // Override Accessibility Checker guidelines from the default configuration.
        guideline: [
          'imgNonDecorativeHasAlt',
          'imgImportantNoSpacerAlt',
          'aTitleDescribesDestination',
          'aAdjacentWithSameResourceShouldBeCombined',
          'aImgAltNotRepetitive',
          'aMustNotHaveJavascriptHref',
          'aSuspiciousLinkText',
          'blockquoteNotUsedForIndentation',
          'documentVisualListsAreMarkedUp',
          'headerH1',
          'headerH2',
          'headerH3',
          'headerH4',
          'imgAltIsDifferent',
          'imgAltIsTooLong',
          'imgAltNotEmptyInAnchor',
          'imgAltTextNotRedundant',
          'imgHasAlt',
          'imgShouldNotHaveTitle',
          'linkHasAUniqueContext',
          'pNotUsedAsHeader',
          'tableDataShouldHaveTh',
          'imgWithEmptyAlt'
        ]
      },
      contentsCss: [
        'http://cdn.ckeditor.com/4.15.0/full-all/contents.css',
        'https://ckeditor.com/docs/vendors/4.15.0/ckeditor/assets/accessibilitychecker/contents.css'
      ]
    });
  </script>

		<!-- 글수정을 위한 div -->
		<div id="boardModifyArea"></div>
	</div>
	</div>
</body>

<script>
window.onload =function(){
	viewBoardFunction();
}
//작성창 지워지는 기능
$(function() {
	$('#deleteInputTag').click(function(){
		$('#boardWriteForm').submit();
	});
});
//게시판 보이는 기능
$(function(){
$('#viewBoard').click(function(){
	
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
		output += "<td><img src='resources/fileUpload/"+abc.filename+"' alt='사진'/></td>";
		output += "</tr></table>";
 		output += "<button onclick='modify("+abc.num+")'>수정하기</button>";
 		output += "<button onclick='boardDelete("+abc.num+")'>삭제하기</button>";
		$('#boardArea').html(output);
		
 	 	}
//전체게시판
function viewAll(){
	viewBoardFunction()
}
//헬스게시판
function viewHealth(){
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
function viewFitness(){
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
		success : function(){
			viewBoardFunction()
		},
			error : function(){
				viewBoardFunction()
				}
		});
}
</script>
</html>