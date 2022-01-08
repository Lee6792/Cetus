<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>  

	<aside>
	<div>	
		<div style="margin-bottom: 1%">◎내 정보 관리</div>
		<div align="center">
			<table class="tab_face">
				<tr id="tabs">
		  		<td width="50%"><a href="/info/myInfo?id=${id }" title="tab1" id="tab1">내 정보</a></td>
		  		  <td><a href="/info/myUpdate?id=${id }" title="tab2" id="tab2">내 정보 수정</a></td>
				</tr>
			</table>
		</div>
		<br>
		
		<div class="text_contents">
			<ul class="text_contents_title">
				<li>
					<strong class="text">Cetus는 회원정보 보호를 위해 사이트 이용에 필요한 최소정보만 입력받고 있습니다.</strong>
				</li>
			</ul>
		
		</div>
		
		<div>
			<table class="custom-table">
            	<tr>
            		<th scope="row" width="30%">아이디</th>
            		<td>${user.id }</td>
            	</tr>
            	<tr>
            		<th scope="row">이메일</th>
            		<td>
            		<input type="text" name="editEmailID" id="editEmailID" onkeyup="$(this.)">
            		@
            		<input type="text" name="editEmailDomain" id="editEmailDmain" placeholder="선택해주세요" onkeyup="$(this.)">
            		<select id="editEmailSelect" onchange="if($(this.val()))"></select>
            		<span class="emailForgot">* 회원정보 분실 시 이메일로 안내해 드립니다.(미완성)</span>
            		</td>
            	</tr>
            	<tr>
            		<th scope="row">이메일 수신</th>
            		<td>
            			<input name="mailYN" type="checkbox">캐시, 포인트 증정 및 컨텐츠 할인 등 이벤트 행사시 안내해 드립니다.(미완성)
            		</td>
            	</tr>
			</table>
		</div>
		
		<div class="text_contents">
			<ul class="text_contents_title">
				<li>
					<strong class="text">Cetus는 회원정보 보호를 위해 사이트 이용에 필요한 최소정보만 입력받고 있습니다.</strong>
				</li>
				<li class="text_pw">비밀번호는 도용방지를 위해 자주 바꾸어 주는것이 좋습니다.</li>
				<li class="text_pw">전화번호, 주민등록번호, 연속된 숫자, 반복 숫자 등 타인이 알아내기 쉬운 비밀번호는 사용을 피하시기 바랍니다.</li>
				<li class="text_pw">10자 이상 12자 이하</li>
			</ul>
		</div>
		<form action="/info/myUpdate" method="post">
		<div>
			<table class="custom-table">
            	<tr>
            		<th scope="row" width="30%">현재 비밀번호</th>
            		<td>
            		<input type="password" id="oldPw" onkeyup="oldPass();">
            		
            		<span class="test_pw" id="oldPwNotice">현재 사용 중인 비밀번호를 입력해 주세요.</span>
            		</td>
            	</tr>
            	<tr>
            		<th scope="row">새 비밀번호</th>
            		<td>
            		<input type="password" name="pw" id="newPw" onkeyup="newPass();" maxlength="12">
            		
            		<span class="test_pw" id="newPwNotice">10자이상 12자 이하로 입력해주세요.</span>
            		</td>
            	</tr>
            	<tr>
            		<th scope="row">비밀번호 재입력</th>
            		<td>
            		<input type="password" name="rpw" id="rnewPw" onkeyup="rnewPass();" maxlength="12">
            		
            		<span class="test_pw" id="rnewPwNotice">비밀번호를 한번 더 입력해주세요.</span>
            		</td>
            	</tr>
			</table>
		</div>
		<br>
		<div class="ac">
			<input type="button" value="내 정보 수정" onclick="myUpdateGo(this.form);">
		</div>
		<input type="hidden" name="id" value="${user.id }">
		</form>	
    </div>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

	var oldPwNotice = $("#oldPwNotice");
	var newPwNotice = $("#newPwNotice");
	var rnewPwNotice = $("#rnewPwNotice");
	var userPw = '${user.pw}';
	
	var principal = null;
	// 권한이 있는지 먼저 물어본다.
	<sec:authorize access="isAuthenticated()">
	principal = '<sec:authentication property="principal.username"/>'; //인증 안되었을때 그냥쓰면 에러남
	</sec:authorize>
	
	$("#tab1").on("click", function(e){
		e.preventDefault();
		if(principal == null){
			alert("로그인 후 이용가능합니다.");
		}else{
			location.href = '/info/myInfo?id=' + principal;
		}
	});
	
	$("#tab2").on("click", function(e){
		e.preventDefault();
		if(principal == null){
			alert("로그인 후 이용가능합니다.");
		}else{
			location.href = '/info/myUpdate?id=' + principal;
		}
	});

	$(function(){
		oldPwNotice.attr("hidden","hidden");
		newPwNotice.attr("hidden","hidden");
		rnewPwNotice.attr("hidden","hidden");
	});
	
	function oldPass() {
		if($("#oldPw").val().length > 0){
			oldPwNotice.removeAttr("hidden","hidden");
		}else{
			oldPwNotice.attr("hidden","hidden");
		}
		if($("#oldPw").val() == userPw){
			oldPwNotice.html("비밀번호가 일치합니다.");
		}else{
			oldPwNotice.html("현재 사용 중인 비밀번호를 입력해 주세요.");
		}	 
	}
	function newPass() {
		if($("#newPw").val().length > 0){
			newPwNotice.removeAttr("hidden","hidden");
		}
		if($("#newPw").val() == userPw){
			newPwNotice.html("기존 비밀번호로 변경할 수 없습니다.");
		}else{
			if($("#newPw").val().length == 0){
				newPwNotice.attr("hidden","hidden");
			}else if($("#newPw").val().length > 9){
				newPwNotice.html("사용가능한 비밀번호입니다.");
			}else{
				newPwNotice.html("10자이상 12자 이하로 입력해주세요.");
			}
		}
	}
	function rnewPass() {
		if($("#rnewPw").val().length > 0){
			rnewPwNotice.removeAttr("hidden","hidden");
		}else{
			rnewPwNotice.attr("hidden","hidden");
		}
		if($("#rnewPw").val() == $("#newPw").val()){
			rnewPwNotice.html("비밀번호확인이 일치합니다.");
		}else{
			rnewPwNotice.html("비밀번호를 한번 더 입력해주세요.");
		}
	}
	function myUpdateGo(f) {
		if(oldPwNotice.html() != "비밀번호가 일치합니다."){
			alert("비밀번호가 다릅니다.");
			oldPwNotice.attr("hidden","hidden");
			newPwNotice.attr("hidden","hidden");
			rnewPwNotice.attr("hidden","hidden");
			f.reset();
			return;
		}
		if(newPwNotice.html() != "사용가능한 비밀번호입니다."){
			alert("사용할 수 없는 비밀번호입니다.");
			oldPwNotice.attr("hidden","hidden");
			newPwNotice.attr("hidden","hidden");
			rnewPwNotice.attr("hidden","hidden");
			f.reset();
			return;
		}
		if(rnewPwNotice.html() != "비밀번호확인이 일치합니다."){
			alert("비밀번호확인이 다릅니다.");
			oldPwNotice.attr("hidden","hidden");
			newPwNotice.attr("hidden","hidden");
			rnewPwNotice.attr("hidden","hidden");
			f.reset();
			return;
		}
		
		f.submit();
	}
</script>
    
    </aside>
	
<style type="text/css">

aside{
    font-family: Dotum,"돋움", AppleGothic, Sans-serif;
    font-size: 12px;
    line-height: 14px;
    color: #636363;
    font-weight: normal;
    letter-spacing: 0px;
    font-style: normal;
    text-decoration: none;
    }
    
/* body, p, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, dt, dd, table, th, td, form, fieldset, legend, input {
    margin: 0;
    padding: 0;
} */ 

li, ul, ol {
    list-style: none;
}   

input[type="text"] {
    ime-mode: active;
}
input {
    -webkit-border-radius: 0px;
    -webkit-apprearance: none;
    outline: none;
    border: 1px solid #ccc;
    height: 18px;
    line-height: 18px;
}

input, select, button {
    vertical-align: middle;
}

select {
    height: 20px;
    border: 1px solid #999;
}

.emailForgot {
	margin-top: 7px !important;
	display: inline-block !important;
}
    
.tab_face {
	width: 100%;
	height: 32px;
	margin-top: 10px;
}

.text_contents {
	padding-top: 10px !important;
}

.text_contents td {
	padding: 7px 0 7px 10px;
    border-top: 1px solid #dcdcdc;
    color: #4c4c4c;
    line-height: 16px;
    vertical-align: middle;
}

.text_contents_title li {
    margin-top: 10px;
    padding-left: 18px;
    line-height: 18px;
}

.text_contents_title li.text_pw {
	margin-top: 0;
    margin-left: 8px;
}

.text {
	color: #395ec4 !important;
}

strong {
    font-weight: bold;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
	display: table;
	box-sizing: border-box;
    text-indent: initial;
    border-color: grey;
}

tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}

.tab_face td.on {
    border: 1px solid #7d99d0;
    background: #82a3e6;
    color: #fff;
    font-weight: bold;
}

.tab_face td {
    padding: 6px 7px 5px 5px;
    border: 1px solid #e4e4e4;
    text-align: center;
    cursor: pointer;
}

.custom-table {
	table-layout: fixed;
    width: 100%;
    margin-top: 10px;
    border-top: 2px solid #bbc6ef;
    border-bottom: 1px solid #dcdcdc;
    font-size: 12px;
}

.custom-table th {
	padding: 8px 0 6px 0px;
    border-top: 1px solid #dcdcdc;
    border-bottom: 1px solid #dcdcdc;
    background-color: #ebeffc;
    color: #5c738e;
    font-size: 12px;
    text-align: center;
    vertical-align: middle;
}

.custom-table td {
	padding: 7px 0 7px 10px;
    border-top: 1px solid #dcdcdc;
    color: #4c4c4c;
    line-height: 16px;
    vertical-align: middle;
}




/* 
	#tabs{
  overflow: hidden;
  width: 100%;
  margin: 0;
  padding: 0;
  list-style: none;
}
 
#tabs li{
  float: left;
  margin: 0 .5em 0 0;
}
 
#tabs a{
  position: relative;
  background: #ddd;
  background-image: linear-gradient(to bottom, #fff, #ddd);
  padding: .7em 3.5em;
  float: left;
  text-decoration: none;
  color: #444;
  text-shadow: 0 1px 0 rgba(255,255,255,.8);
  border-radius: 5px 0 0 0;
  box-shadow: 0 2px 2px rgba(0,0,0,.4);
}
 
#tabs a:hover,
#tabs a:hover::after,
#tabs a:focus,
#tabs a:focus::after{
  background: #fff;
}
 
#tabs a:focus{
  outline: 0;
}
 
#tabs a::after{
  content:'';
  position:absolute;
  z-index: 1;
  top: 0;
  right: -.5em;
  bottom: 0;
  width: 1em;
  background: #ddd;
  background-image: linear-gradient(to bottom, #fff, #ddd);
  box-shadow: 2px 2px 2px rgba(0,0,0,.4);
  transform: skew(10deg);
  border-radius: 0 5px 0 0;
}
 
#tabs #current a,
#tabs #current a::after{
  background: #fff;
  z-index: 3;
} */

</style>
<%@include file="../include/footer.jsp" %>