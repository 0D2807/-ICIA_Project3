<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.heart {
   width: 100px;
  height: 100px;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  background-position:0;
  background: url(https://cssanimation.rocks/images/posts/steps/heart.png) no-repeat;
  background-position: 0 0;
  cursor: pointer;
}
input[id="likeBtn"]:checked + label+ div{
  transition: background  steps(28);
  
  animation: fave-heart 1s steps(28);
 background-position: -2800px 0;
}
@keyframes fave-heart {
  0% {
    background-position: 0 0;
  }
  100% {
    background-position: -2800px 0;
  }
}
#likelabel{
width:100px;
height:100px;
position:fixed;
left:0;
top:50px;
z-index:999;
}
#likediv{
position:fixed;
left:50px;
top:50px;
z-index:1;
}
#likeBtn{
	display:none;
}

</style>
</head>
 <body>

<input type="checkbox" id="likeBtn" >
<label for="likeBtn" id="likelabel"></label>
<div class="heart" id="likediv"></div>

</body>
</html>