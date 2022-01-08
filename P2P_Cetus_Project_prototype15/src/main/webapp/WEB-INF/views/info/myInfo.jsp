<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
	
		var principal = null;
		// 권한이 있는지 먼저 물어본다.
		<sec:authorize access="isAuthenticated()">
		principal = '<sec:authentication property="principal.username"/>'; //인증 안되었을때 그냥쓰면 에러남
		</sec:authorize>
	
		onload = function(){
			var result = '${result }';
	    	if(result == '1'){
	    		alert("비밀번호 변경에 성공했습니다.");
	    	}
		}
    	
		
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
	</script>

	<aside>
	<div>	
		<div style="margin-bottom: 1%"> ◎내 정보 관리</div>
		<div align="center">
			<table class="tab_face">
				<tr id="tabs">
		  		  <td width="50%"><a href="/info/myInfo?id=${id }" title="tab1" id="tab1">내 정보</a></td>
		  		  <td><a href="/info/myUpdate?id=${id }" title="tab2" id="tab2">내 정보 수정</a></td>
				</tr>
			</table>
		</div>
		<br>
		
	<div>
		<table class="custom-table">
            	<tr>
            		<th scope="row" width="30%">아이디</th>
            		<td>${user.id }</td>
            	</tr>
            	<tr>
            		<th scope="row">이메일</th>
            		<td>${user.email }</td>
            	</tr>
            	<tr>
            		<th scope="row">가입경로</th>
            		<td>${user.root }</td>
            	</tr>
            	<tr>
            		<th scope="row">이메일 수신(미완성)</th>
            		<td>
            			<input name="mailYN" type="checkbox">캐시, 포인트 증정 및 컨텐츠 할인 등 이벤트 행사시 안내해 드립니다.
            		</td>
            	</tr>
		</table>
	</div>
		
		
    </div>
    
    </aside>
	
<style type="text/css">

aside {
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
}     */
    
.tab_face {
	width: 100%;
	height: 32px;
	margin-top: 10px;
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