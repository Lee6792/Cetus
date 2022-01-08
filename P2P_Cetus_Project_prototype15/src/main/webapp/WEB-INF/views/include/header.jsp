<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list page</title>
<script type="text/javascript" src="/resources/js/sub_category.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
  
/* 테이블 style */
  .custom-table{border-collapse:collapse;width:100%; height:100% border:solid 1px #c0c0c0;font-family:open sans;font-size:11px;}
     .custom-table th,.custom-table td{text-align:left;padding:8px;border:solid 1px #fff}
     .custom-table th{color:#000080}
     .custom-table tr:nth-child(odd){background-color:#f7f7ff}
     .custom-table>thead>tr{background-color:#dde8f7!important}
     .tbtn{border:0;outline:0;background-color:transparent;font-size:13px;cursor:pointer}
     .toggler{display:none}
     .toggler1{display:table-row;}
     .custom-table a{color: #0033cc;}
     .custom-table a:hover{color: #f00;}
     .page-header{background-color: #eee;}
     
     
/* 검색창 style */
	.search-slt{
	    width: 15%;
	    font-size: 0.875rem;
	    line-height: 1.0;
	    color: #55595c;
	    background-color: #fff;
	    background-image: none;
	    border: 2px solid #dde8f7;
	    height: calc(2rem + 2px) !important;
	    border-radius:0;
	    color: #000080;
	    text-align: center;
	}
	.search-sltinput{
	   width: 56%;
	   font-size: 0.875rem;
	   line-height: 1.5;
	   color: #55595c;
	   background-color: #fff;
	   background-image: none;
	   border: 2px solid #dde8f7;
	   height: calc(1.8rem + 2px) !important;
	   border-radius:0;
	   color: #000080;
	}
	.wrn-btn{
	    width: 10%;
	    font-size: 16px;
	    font-weight: 400;
	    text-transform: capitalize;
	    height: calc(2.2rem + 3px) !important;
	    border-radius:0;
	    background-color: #dde8f7;
	    border-color: #dde8f7;
	    color: #000080;
	}
	.search-sec{
		width:100%;
	}

	
/* 상단 카테고리 style */	
	.nav,.nav ul{
    	margin:0px;
    	padding :0px;
    	list-style :none outside none;
    	height:30px;
    }
    .nav li{
    	float: right;
    	width:12.5%;
    	position:relative;
    	height:50px;
        background:#dde8f7;
        display:block;
     }
    .nav a{
    	text-decoration :none;
    	height:50px;
    	display:block ;
    	text-align :center ;
    	color:#0033cc;
    	padding-top:10px;
    }
    .sub{
    	left:-9999px;
    	position :absolute ;
    	top:-9999px;
    	z-index :2;
    }
    .nav li:hover .sub{
    	visibility:visible ;
    }
    .nav{
    	font-family :Calibri;
    	font-size :14px;
    	height:10px;
    	font-weight:bold;
    	margin:20px auto;
    	text-shadow :0 -1px 3px white;
    	border-radius:4px;
    }
    .nav li:first-child{
    	border-left :0 none;
    }
   .nav li a{
   	color:#0033cc ;
   	display :block;
   	line-height :24px;
   	text-decoration :none;
   	}
    .nav li >a:hover
    {
    	animation:ss 0.7s linear infinite forwards;
    }
    .nav li:hover>a{
    	z-index:4;
    }
    .nav li:hover .sub{
    left:0;
    top:50px;
    width:100%;
    }
    .nav ul li{
    	background :none repeat scroll 0 0 #f7f7ff;
    	box-shadow:0px 0px 0px rgb(0,0,0,0.5);
    	opacity:0.3;
    	width :100%;
    }
    .nav li:hover ul li{
    animation:ss1 0.3s linear 1 forwards;	
    }
    @keyframes ss1
    {
    	0%
    {
     margin-left :300px;top:900px;transform:rotate(90deg);
    }
    100%
    {
    margin-left :0px;top:0px;transform:rotate(360deg);
    opacity:1;
    }
    	}
    	.nav li:hover ul li:nth-child(3)
    	{
    		animation-delay:0;
    	}
    		
    	.nav li:hover ul li:nth-child(2)
    	{
    		animation-delay:0.1s;
    	}
    	
    		
    	.nav li:hover ul li:nth-child(1)
    	{
    		animation-delay:0.2s;
    	}
	
	.nav li:hover {
		background: #d3d3d3;
	}
	
	
/* 구간 영역 나누는 style */
	.wrap{
	    width: 1000px;
	    margin: auto;
	    background-color: #F5F5F5;
		border: 1px solid #000080;
    }
   	header{
	   	width : 100%;
	    margin: 10px;
	   	height: 200px;
   	}
   	nav, section, aside, article{
      border: 2px solid #dde8f7;
      padding: 10px;
      margin: 10px;
      background-color: #fff;
   	}
  	 section{
      float: left;
      width: 15%;
      height: 500px;   
   	}
   	aside{
      float: right;
      width: 75%;
      height: 500px;
   	}
   	footer{
      clear: both;
      margin-bottom : 10px;
      text-align: center;
      font-size: 14px;
      color: #000080;
   	}
   	address{
		font-size: 12px;
   	}


/* 로그인 영역 style */
   	.login{
   	  float : left;
   	  width : 15%;
   	  height : 160px;
   	  border: 2px solid #b0d1ff;
      padding: 10px;
      margin-top: 10px;
      text-align: center;
      color: #000080;
      background-color: #fff;
  	 }
  	 .login-btn{
		width: 100%;
	    font-size: 16px;
	    font-weight: 400;
	    text-transform: capitalize;
	    height: calc(2.2rem + 3px) !important;
	    border-radius:0;
	    background-color: #dde8f7;
	    border-color: #dde8f7;
	    color: #000080;
	}
  	 
  	 
/* 검색 & 상단 카테고리 영역 style */
   	.menu{
   	 float : right;
	 width: 75%;
	 height : 160px;
	 border: 2px solid #b0d1ff;
     padding: 10px;
     margin: 10px;
     margin-right : 20px;
     background-color: #fff;
   	}
   	.admin-sidenav {
	    width: auto;
		height: auto;
		margin-left: 0px; 
	}
	@import 'https://fonts.googleapis.com/css?family=Raleway:300,400';
	.admin-sidenav a {
		text-decoration: none; 
	}
	.admin-sidenav li {
		text-align: justify;
		padding: .5rem;
		padding-left: 1rem;
		-webkit-transition: all .2s linear;
		transition: all .2s linear;
		background-color: #dde8f7;
		border: 2px solid #dde8f7; 
	}
	.admin-sidenav li a {
		color: gray; 
	}

	.admin-sidenav li:hover {
		border-radius: 0 .5rem .5rem 0;
		-webkit-transform: translate(30px, 0px);
		transform: translate(30px, 0px);
	}
	
	
/* a태그 & ul 기본 세팅 관련 style */
	a { text-decoration:none } 
	a:hover{font-weight: bold;}
	A:link {text-decoration:none; color:#000080;}
	A:visited {text-decoration:none; color:#000080;}
	A:active {text-decoration:none; color:#000080;}
	A:hover {text-decoration:none; color:#000080;}
	
	ul{
	   list-style:none;
	   padding-left:0px;
	}
	hr{
		background-color: #b0d1ff;
		width: 96%;
		height: 0.1px;
		border: 0px;
	}
	
	
/* 상단 메뉴 style */
	#nav_menu ul {
		list-style-type:none;
		padding-left:0px;
		float:right;
	}
	#nav_menu ul li {
		display:inline;
		border-left: 1px solid #c0c0c0;
		padding: 0px 10px 0px 10px;
		margin: 5px 0px 5px 0px;
		font-size: 13px;
	}
	#nav_menu ul li:first-child {
		border-left: none;
	}
	#nav_menu{
		width : 95.8%;
		height : 50px; 
	    padding: 10px;
	    margin: 10px;
	}
	#nav_menu a:hover {
	 color: #000080;
	 font-weight: bold;
	}
	input::placeholder{
		font-size: 13px;
	}
</style>
<script type="text/javascript">

	var principal = null;
	// 권한이 있는지 먼저 물어본다.
	<sec:authorize access="isAuthenticated()">
	principal = '<sec:authentication property="principal.username"/>'; //인증 안되었을때 그냥쓰면 에러남
	</sec:authorize>

	$(function(){
		var catecode = 0;
		var amount = "${pageMaker.cri.amount}";		// 전역변수로 선언
		var pageNum = "${pageMaker.cri.pageNum}";	// 전역변수로 선언
		
		$(".catemenu").mouseenter(function(){
			catecode = $(this).attr("href");
			if(catecode == 1){
				//$(".sub").html("<li>분류->소분류</li>");
			}else{
				subCateService.get(catecode, function(result){
					var str ="";
					for(var i=0; i<result.length; i++){
						str += "<li><a class='catemenu' href=/board/listSubAction?pageNum=1&amount=10&catecoderef=";
						str += result[i].catecode;
						str += ">";
						str += result[i].catename;
						str += "</a></li>";
					}
					$(".sub").html(str);
				});
			}
		});
		
		$(".catemenu").on("click",function(e){
			e.preventDefault();
			catecode = $(this).attr("href");
			if(catecode == 1){
				location.href="/board/list?amount=10&pageNum=1";
			}else{
				location.href ="/board/listAction?pageNum=1&amount=10&catecode=" +catecode;
				subCateService.get(catecode, function(result){
				});
			}
		});
		
		$("#category1").change(function(){
			$("#cate").attr("disabled","disabled");
			var catecode = $(this).val();
			//alert(catecode);
			subCateService.get(catecode, function(result){
				var str ="";
				for(var i=0; i<result.length; i++){
					str += "<option value=";
					str += result[i].catecode;
					str += ">";
					str += result[i].catename;
					str += "</option>";
				}
				$("#category2").html(str);
			}); 
		});
		
		$("#myInfomation").on("click", function(e){
			e.preventDefault();
			if(principal == null){
				alert("로그인 후 이용가능합니다.");
			}else{
				location.href = '/info/myInfo?id=' + principal;
			}
		});
		
		$(".loginAccess").on("click", function(e){
			e.preventDefault();
			alert("로그인 후 이용가능합니다.");
		})
	});
	
	function login() {
		location.href = "/customLogin";
	}
	
	function join(){
		location.href = "/info/myinsert?pageNum=1&amount=10";
	}
	function searchGo(f) {
		var cate1 = $("#category1").on("click option").val();
		if(cate1 == ''){
			alert("분류를 선택해주세요.");
			return;
		}
		var cate2 = $("#category2").on("click option").val();
		if(cate2 == ''){
			alert("소분류를 선택해주세요.");
			return;
		}
		
		var search_key = $("input[name=search]").val();
		if(search_key == ''){
			alert("검색어를 입력해주세요");
			return;
		}
		
		f.submit();
	}
</script>
</head>
<body>
	<div class="wrap">
	<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="pusername"/>
	</sec:authorize>
	<div id="nav_menu">
		<ul>
			<li><a href="/board/best?pageNum=1&amount=10">best100</a></li>
			<li><a href="#" id="myInfomation">내정보</a></li>
			<li><a href="/board/charge">충전샵</a></li>
			<li><a id="notice" href="/customerCenter/notice?pageNum=1&amount=10">공지사항</a></li>
			<li><a href="#">자료실</a></li>
		</ul>
	<h1>&nbsp;&nbsp;<a class="catemenu" href="1">Cetus</a></h1>
	</div>
    <!-- 헤더 부분 --> 
    <header>
    <sec:authorize access="isAnonymous()">
		<div class="login">
			<h3>로그인 후 이용 가능합니다.</h3>
			<button class="login-btn" type="button" onclick="login();">login</button>
			<button class="login-btn" type="button" onclick="join();">회원가입</button>
		</div>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<div class="login">
			<h4>${pusername }님</h4>
			<h4>환영합니다.</h4>
			<button class="login-btn" type="button" onclick="location.href='/customLogout';">logout</button>
		</div>
	</sec:authorize>
	<div class="menu">
       <div class="search-sec">
			<form action="/board/search">
				<select name="category1" id="category1" class="search-slt">
					<option id="cate" value="">::분류선택::</option>
					<c:forEach var="cat1" items="${clist }">
						<c:if test="${cat1.catecode % 100 eq 0 }">
							<option value="${cat1.catecode }">${cat1.catename }</option>
						</c:if>
					</c:forEach>
				</select>
				
				<select name="category2" id="category2" class="search-slt">
					<option value="">::소분류선택::</option>
				</select>
				
				<input type="text" placeholder="제목을 입력하세요." name="search" class="search-sltinput">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
            	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
				<input type="button" value="검색" class="wrn-btn" onclick="searchGo(this.form);">
				
			</form>
		</div>
     	<div>
		<ul class="nav">
			<c:forEach var="cat1" items="${clist }">
				<c:if test="${cat1.catecode % 100 eq 0 }">
					<li>
						<a class="catemenu" href="${cat1.catecode }">${cat1.catename }</a>
						<ul id="subCate" class="sub">
						</ul>
					</li>
				</c:if>
			</c:forEach>
			<li><a class="catemenu" href="1">전체</a></li>
		</ul>
	</div>
	</div>
    </header>
        <!-- 본문 부분 -->
         <!-- 1. section 내부에 article --> 
         <!-- 2. article 내부에 section --> 
         <section>
           <div id="admin-sidebar" class="col-md-2 p-x-0 p-y-3">
                <ul class="sidenav admin-sidenav list-unstyled">
                    <a href="/board/best?pageNum=1&amount=10"><li>Best 100</li></a>
                    <sec:authorize access="isAuthenticated()">
                    <a href="#"><li>내가받은자료</li></a>
                    <a id="favorite" href="/info/myFavorite?pageNum=1&amount=7"><li>찜한자료</li></a>
                    </sec:authorize>
                    <sec:authorize access="isAnonymous()">
                    	<a class="loginAccess" href="#"><li>내가받은자료</li></a>
                    	<a class="loginAccess" href="/info/myFavorite?pageNum=1&amount=7"><li>찜한자료</li></a>
                    </sec:authorize>
                    <a href="#"><li>잦은질문</li></a>                  
                   <!--  <a href="/board/self_auth"><li>성인인증</li></a> -->                  
                </ul>
            </div>
         </section>