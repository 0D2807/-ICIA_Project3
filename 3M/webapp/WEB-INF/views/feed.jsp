<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	int j = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건돼입구</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/css/sidebar.css"
	type="text/css" rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/menubar.css"
	type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/feed.css"
	type="text/css" rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/modalWindow.css"
	type="text/css" rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/feedwrite.css"
	type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/like.css"
	type="text/css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/feedwrite.css"
	type="text/css" rel="stylesheet" />
<style>
	html, body, div, span, applet, object, iframe, table, caption, tbody,
	tfoot, thead, tr, th, td, del, dfn, em, font, img, ins, kbd, q, s, samp,
	small, strike, strong, sub, sup, tt, var, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, a, abbr, acronym, address, big, cite, code, dl, dt, dd,
	ol, ul, li, fieldset, form, label, legend, button {
	vertical-align: baseline;
	font-family: inherit;
	font-weight: inherit;
	font-style: inherit;
	font-size: 100%;
	padding: 0;
	margin: 0;
	border: 0;
}

.oneFeedDiv {
	position: relative;
}
</style>
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
	<!-- 피드 최근글 -->
	<div id="Contents">
	<div id="feedArea">
		<c:forEach var="feed" items="${MyFeedList}" varStatus="status"
			begin="0" end="0">
			<div id='lastFeed'>
				<p>
					작성자 : <span>${feed.fid}</span>
				</p>
				<p>
					작성일 : <span>${feed.fdate}</span>
				</p>
				<p>
					제목 : <span>${feed.title}</span>
				</p>
				<br>
				<p>
					내용 : <img src='resources/fileUpload/"+lastFeed[0].filename+"'
						alt='첨부파일' /><span>${feed.conten}</span>
				</p>
				<br>
				<p>
					조회수 : <span>${feed.hit}</span>
				</p>
			</div>
		</c:forEach>
		<div id='myFeed'>
			<table>
				<tr>
					<th>글제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
				<c:forEach var="feed" items="${MyFeedList}">
					<tr>
						<td>${feed.title}</td>
						<td>${feed.fid}</td>
						<td>${feed.hit}</td>
						<td>${feed.fdate}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id='myTrainer'>트레이너정보</div>
		<div id='feedNav'>
			<div id='feedbtnDiv'>
				<button onclick='allFeedViewBtn()' id='allFeedView'>전체피드</button>
				<button onclick='followFeedViewBtn()' id='followFeedView'>팔로우</button>
				<button onclick='followerFeedViewBtn()' id='followerFeedView'>팔로워</button>
			</div>
			<div id='searchDiv'>
				<input type='text' id='feedSearch' placeholder='검색어입력'>
				<button id='searchbtn' onclick='searchbtn()'>검색</button>
			</div>
		</div>
		<div id='feedBoardArea'>
			<c:forEach var="feed" items="${feeds}">

				<div id="<%=j%>" class="oneFeedDiv">

					<p class='feedWriter'>작성자 : ${feed.fid}</p>

					<p class='feedTitle'>제목 : ${feed.title }</p>

					<img src='resources/fileUpload/${feed.filename}' alt='사진'
						width="400px" />

					<p class='feedConten'>내용 : ${feed.conten}</p>
					<c:forEach var="like" items="${like}">
						<c:if test="${like.clientid eq sessionScope.member.id}&&${like.feednum eq feed.fnum}">
							<c:choose>

								<c:when test="${like.clientid eq sessionScope.member.id}&&${like.feednum eq feed.fnum}">

									<input type="checkbox" id="${feed.fnum}" class="likeBtn"
										onclick="feedLike(${feed.fnum})" checked="checked">
									<label for="${feed.fnum}" class="likelabel"></label>
									<div class="heart like" class="likediv"></div>
								</c:when>
								<c:otherwise>
									<input type="checkbox" id="${feed.fnum}" class="likeBtn"
										onclick="feedLike(${feed.fnum})">
									<label for="${feed.fnum}" class="likelabel"></label>
									<div class="heart" class="likediv"></div>

								</c:otherwise>

							</c:choose>
							<%j++;%>
						</c:if>
					</c:forEach>
				</div>

			</c:forEach>
			<input type="checkbox" id="feedwrite"> <label for="feedwrite">피드
				작성</label>
			<div>
				<div>
					<form action="feedWriterFrom" method="post"
						enctype="multipart/form-data">
						<input type="text" name="fid" value="${member.id}"> <input
							type="text" name="title" id="title" placeholder="제목">
						<textarea name="conten" id="conten" cols="30" rows="10"
							placeholder="내용"></textarea>
						<input type="file" name="file"> <input type="submit"
							value="피드작성">
					</form>
				</div>
				<label for="feedwrite"></label>
			</div>
		</div>
	</div>
	</div>
	<br />

	<!-- footer  -->
	<div id="footer">카피라이터 by 3M</div>
</body>
<script>
/* 좋아좋아좋아요 */
function feedLike(fnum){
	

 
		var id = "${sessionScope.member.id}";
		
		$.ajax({
			type : "POST",
			url : "feed/feedlike",
			data : {"feednum" : fnum,
					"clientid":id},
			success : function(){
				
				},
				error : function(){
					alert("당신은 좋아할 자격이 없습니다.");
					}
			}); 		 
}

</script>
<script>
/* 펼치기 기능 */ 
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
// 회원상세정보 , 수정
function process(){
	var modify = document.getElementById("modify");
	var procs = document.getElementById("process");
	modify.style.display="none";
	procs.style.display="block";
}
//피드 이동기능
$(function(){
$('#feed').click(function(){
	location.href="feed";
	// 피드 상세내용 출력
});
});

var feedoutput="";
//전체피드 보기
function allFeedViewBtn(){
	/* var setting = "";
	$('#feedBoardArea').html(setting); */
		$.ajax({
			type : "POST",
			url : "feed/allFeedView",
			dataType : "json",
			success : function(result){
					allFeedView(result);
 	  var allFeedBack = document.getElementById("feedBoardArea");
	  allFeedBack.style.backgroundColor="rgba(255,0,0,0.1)"; 
				},
				error : function(){
					alert("피드를 찾지 못했습니다.");
					}
			});
}
function allFeedView(result){
	var j = 0;
	var output ="";
	var feedBoardArea = document.getElementById("feedBoardArea");
	for (var i in result){
		var feedWriter = result[i].fid;
	 	output+="<div id ='"+j+"'>";
		
		output+="<p class='feedWriter'>작성자 : "+result[i].fid+"</p>";
		output+="<p class='feedTitle'>제목 : "+result[i].title+"</p>";
		output+="<img src='resources/fileUpload/"+result[i].filename+"' alt='사진'/>";
		output+="<p class='feedConten'>내용 : "+result[i].conten+"</p>";
		
		output+="</div>"; 
		
		j++;
 		feedBoardArea.innerHTML=output; 
		
		}
}
//팔로워 피드 
function followerFeedViewBtn(){
	feedoutput="";
	$('#feedBoardArea').html(feedoutput);
 
		var id = "${sessionScope.member.id}";
		$.ajax({
			type : "POST",
			url : "feed/followerFeedView",
			data : {"id":id},
			dataType : "json",
			success : function(result){
					followerFeed(result);
				 	 var followerFeedBack = document.getElementById("feedBoardArea");
					  followerFeedBack.style.backgroundColor="rgba(0,0,255,0.1)"; 
				},
				error : function(){
					alert("팔로워 정보를 불러오지 못했습니다..");
					}
			});
		
}
 function followerFeed(result){
			for(var i in result){
	var id = result[i].sfid;
	$.ajax({
		type : "POST",
		url : "feed/followerFeed",
		data : {"id":id},
		dataType : "json",
		success : function(asd){
			getFollowerFeed(asd);
		},
		error : function(){
				alert("팔로워 정보를 불러오지 못했습니다....");
				}
		});
}}
 function getFollowerFeed(result){
		var feedBoardArea = document.getElementById("feedBoardArea");
		var j = 0;
		feedoutput+="<div id='"+j+"'>";
			for(var i in result){
				feedoutput+="<p class='feedWriter'>작성자 : "+result[i].fid+"</p>";
				feedoutput+="<p class='feedTitle'>제목 : "+result[i].title+"</p>";
				feedoutput+="<img src='resources/fileUpload/"+result[i].filename+"' alt='사진'/>";
				feedoutput+="<p class='feedConten'>내용 : "+result[i].conten+"</p>";
			}
			feedoutput+="</div>";
			j++;
 
			feedBoardArea.innerHTML=feedoutput;
}
//최근피드 가져오기
 function getLastFeed(lastFeed){
 	var output="";
 	output+="<p>작성자 : <span>"+lastFeed[0].fid+"</span></p>";
 	output+="<p>작성일 : <span>"+lastFeed[0].fdate+"</span></p>";
 	output+="<p>제목 : <span>"+lastFeed[0].title+"</span></p><br>";
 	output+="<p>내용 : <img src='resources/fileUpload/"+lastFeed[0].filename+"' alt='첨부파일'/><span>"+lastFeed[0].conten+"</span></p><br>";
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
//팔로우 보기
 function followFeedViewBtn(){
 	feedoutput="";
 $('#feedBoardArea').html(feedoutput);
 	followFeedView()
 }

 function followFeedView(){

 	var id = "${sessionScope.member.id}";
 	$.ajax({
 		type : "POST",
 		url : "board/followView",
 		data : {"id":id},
 		dataType : "json",
 		success : function(result){
 			allFollowView(result);
 		 	 var followFeedBack = document.getElementById("feedBoardArea");
 			  followFeedBack.style.backgroundColor="rgba(0,255,0,0.1)"; 
 			},
 			error : function(){
 				alert("팔로우를 찾지 못했습니다.");
 				}
 		});
 }
 function allFollowView(result){
 var feedBoardArea = document.getElementById("feedBoardArea");
 	for(var i in result){
 		var id = result[i].gfid;
 		$.ajax({
 			type : "POST",
 			url : "board/allFollowView",
 			data : {"id":id},
 			dataType : "json",
 			success : function(feedav){
 				allFollowFeedView(feedav);
 				},
 				error : function(){
 					alert("팔로우를 찾지 못했습니다.");
 					}
 			});
 			}
 }

</script>
</html>