<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 읽기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
		$("#btnRecommend").click(function(e){
			if(confirm("이 글을 추천하시겠습니까?") == true){
				alert("이 글이 추천되었습니다.");
			}else{
				e.preventDefault();
				alert("추천을 취소하셨습니다.");
			}
		    });
		$("#btnFavorit").click(function(e){
			alert("찜목록에 추가 되었습니다.");
		    });
	});
	
</script>
<style type="text/css">
	body {
		background-color: rgb(41, 125, 250);
	}
	
	.wrap {
		background-color: rgb(41, 125, 250);
		/* text-align: center; */
	}
	
	table.tg {
		border-collapse: separate;
		border-spacing: 0;
		text-align: left;
		line-height: 1.5;
		border-top: 1px solid #ccc;
		border-left: 1px solid #ccc;
		margin: 20px 10px;
	}
	
	table.tg th {
		width: 100px;
		padding: 10px;
		font-weight: bold;
		vertical-align: top;
		border-right: 1px solid #ccc;
		border-bottom: 1px solid #ccc;
		border-top: 1px solid #fff;
		border-left: 1px solid #fff;
		background: rgb(192, 210, 230);
	}
	
	table.tg td {
		width: 100px;
		padding: 10px;
		vertical-align: top;
		border-right: 1px solid #ccc;
		border-bottom: 1px solid #ccc;
	}
	
	.rigthSort {
		border-collapse: collapse;
	}
	
	textarea {
		resize: none;
	}
	
	.represent {
		text-align: center;
		font-weight: 1000;
		background-color: rgb(243, 243, 243);
	}
	
	.bigTitle {
		text-align: center;
	}
	
	
	.input {
		width: 600px;
	}
	
	.content {
		background-color: white;
		text-align: center;
	}
	
	.detail {
		background-color: white;
	}
	.bottom{
	    text-align: center;
	    background-color: #eee;
	}
	.rightSide{
	    background-color: white;
	}
	.reply{
		background-color: rgb(225, 235, 250);
	}
	.replylist{
		text-align: center;
		background-color: white;
	}
	.myButton-blue {
	box-shadow:inset 0px 1px 0px 0px #bbdaf7;
	background:linear-gradient(to bottom, #79bbff 5%, #378de5 100%);
	background-color:#79bbff;
	border-radius:6px;
	border:1px solid #84bbf3;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:8px 20px;
	text-decoration:none;
	text-shadow:0px 1px 0px #528ecc;
}
.myButton-blue:hover {
	background:linear-gradient(to bottom, #378de5 5%, #79bbff 100%);
	background-color:#378de5;
}
.myButton:active {
	position:relative;
	top:1px;
}
.myButton-red {
	box-shadow:inset 0px 1px 0px 0px #f29c93;
	background:linear-gradient(to bottom, #fe1a00 5%, #ce0100 100%);
	background-color:#fe1a00;
	border-radius:6px;
	border:1px solid #d83526;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:8px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #b23e35;
}
.myButton-red:hover {
	background:linear-gradient(to bottom, #ce0100 5%, #fe1a00 100%);
	background-color:#ce0100;
}
.myButton-red:active {
	position:relative;
	top:1px;
}
.myButton-green {
	box-shadow:inset 0px 1px 0px 0px #d9fbbe;
	background:linear-gradient(to bottom, #b8e356 5%, #a5cc52 100%);
	background-color:#b8e356;
	border-radius:8px;
	border:1px solid #83c41a;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #86ae47;
}
.myButton-green:hover {
	background:linear-gradient(to bottom, #a5cc52 5%, #b8e356 100%);
	background-color:#a5cc52;
}
.myButton-green:active {
	position:relative;
	top:1px;
}
.myButton-white {
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:linear-gradient(to bottom, #f9f9f9 5%, #e9e9e9 100%);
	background-color:#f9f9f9;
	border-radius:6px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:8px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
}
.myButton-white:hover {
	background:linear-gradient(to bottom, #e9e9e9 5%, #f9f9f9 100%);
	background-color:#e9e9e9;
}
.myButton-white:active {
	position:relative;
	top:1px;
}

div.editable {
    width: 700px;
    height: 500px;
    border: 1px solid #dcdcdc;
    overflow-y: auto;
    text-align: left;
}
        
</style>
</head>

<body>
    <div class="wrap">
   			<form method="get" action="/board/recoCount">	
            <table class="tg">
                <tr>
                    <th class="bigTitle" colspan="2">게시글 읽기</th>
                </tr>
                <tr>
                    <td class="represent">제목</td>
                    <td class="rightSide"><input type="text" name="title" class="input" value='<c:out value="${board.title}"/>' readonly="readonly"></td>
                </tr>
                <tr>
                    <td class="represent">아이디</td>
                    <td class="rightSide"><input type="text" name="id" class="input" value='<c:out value="${board.id}"/>' readonly="readonly"></td>
                </tr>
                <tr>
                    <td class="represent">파일(임시)</td>
                    <td class="rightSide"><input type="file"></td>
                </tr>
                <tr>
                    <td class="represent">캐시</td>
                    <td class="rightSide"><input type="number"name="price" class="input" value='<c:out value="${board.price}"/>' readonly="readonly"></td>
                </tr>
                <tr>
                    <td class="represent" colspan="2">
	                    <button class="myButton-blue">내려받기<!-- 나중에 수정하자 --></button>&nbsp;
	                    <button type="submit" id="btnRecommend" class="myButton-blue">추천하기</button>
	                    <input type="hidden" name="bno" value="${board.bno}">
                    </td>
                </tr>
                <tr>
                    <td class="content" colspan="2">
                        <%-- <textarea rows="50" cols="100" name="content" readonly><c:out value="${board.content }" /></textarea> --%>
                    	<div class="editable">${board.content }</div>
                    </td>
                </tr>
                <tr>
                    <td class="bottom" colspan="2">
                        <button type="button" data-oper="modify" class="myButton-green" onclick="location.href='/board/modify?bno=<c:out value="${board.bno }"/>'">수정하기</button>
                        <button type="button" data-oper="remove" class="myButton-red" onclick="location.href='/board/remove?bno=<c:out value="${board.bno }"/>'">삭제하기</button>
                        <button type="button" onclick="location.href='/board/li'" class="myButton-white">닫기</button>
                    </td>
                </tr>

                <tr>
                	<td class="reply" colspan="2">
                		<img src='/resources/images/comment.png' style='width:15px;'>&nbsp;댓글
                	</td>
                </tr>
                 <tr>
                	<td class="replylist" colspan="2">
                		댓글&nbsp;<input type="text" class="input" placeholder="회원님의 아름다운 댓글은 모든 회원들께 기쁨이 됩니다.">&nbsp;<button type="button">댓글등록</button>
                	</td>
                </tr>
            </table>
            </form>
            <form id="operForm" action="/board/modify" method="get">
                <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'> <input type='hidden'  name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
                     <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
            </form>
    </div>

</body>

</html>

