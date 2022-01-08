<%@include file="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside>
<style type ="text/css">
	body{
		background-attachment : fixed;
		
	}
	#a{
		text-align: center;
		margin: auto;
		padding-top: 20%;
		color: red;
		
	}
</style>
<script src="https://tistory4.daumcdn.net/tistory/3134841/skin/images/confetti_v2.js"></script>

<style>
	canvas{z-index:10;pointer-events: none;position: fixed;top: 0;transform: scale(1.1);}
</style>

<div class="buttonContainer">
	<button class="canvasBtn" id="stopButton" style="display: none;">Stop Confetti</button>
	<button class="canvasBtn" id="startButton" style="display: none;">Drop Confetti</button>	 
</div>

<canvas id="canvas"></canvas>
<h1 id="a">회원가입이 완료 되었습니다.</h1>
</aside>
<%@include file="../include/footer.jsp" %>