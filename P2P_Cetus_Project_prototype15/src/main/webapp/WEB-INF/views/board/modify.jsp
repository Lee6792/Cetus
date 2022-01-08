<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src = "${path}/ckeditor/ckeditor.js"></script>
<meta charset="UTF-8">
<title>게시글 수정</title>
<style type="text/css">
body {
	background-color: rgb(41, 125, 250);
}

.wrap {
	background-color: rgb(41, 125, 250);
	text-align: center;
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

.btn {
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
   padding:8px 24px;
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
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

	<div class="wrap">
		<form action="/board/modify" method="post">
			<table class="tg">
				<tr>
					<th class="bigTitle" colspan="2">${board.bno}번게시글수정</th>
				</tr>
				<tr>
					<td class="represent">제목</td>
					<td class="detail"><input type="text" name="title"
						class="input" value="${board.title}"></td>
				</tr>
				<tr>
					<td class="represent">작성자</td>
					<td class="detail">
					${board.id}
					<input type="hidden" name="id" class="input" value="${board.id}">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					</td>
				</tr>
				<tr>
					<td class="represent">파일(임시)</td>
					<td class="detail"><input type="file"></td>
				</tr>
				<tr>
					<td class="represent">캐시</td>
					<td class="detail"><input type="number" name="price"
						class="input" value="${board.price}"></td>
				</tr>
				<tr>
					<%-- value="<fmt:formatDate pattern="yyyy/MM/dd" value="${board.reg_date}"/>" --%>
					<td class="represent">작성일</td>
					<td class="detail"><input type="text" name="reg_date" class="input" value="${board.reg_date}" readonly="readonly"></td>
				</tr>
				<tr>
					<td class="content" colspan="2" ><textarea rows="50" cols="100"
							name="content" id="description">${board.content }</textarea>
							<script type="text/javascript">
	                        CKEDITOR.replace("description",{
	                        }); 
							</script>
					</td>
				</tr>
				<tr>
					<td class="bottom" colspan="2">
						<button type="submit" class="myButton-green">수정완료</button>
						<input type="hidden" name="pageNum" value="${cri.pageNum }">
            			<input type="hidden" name="amount" value="${cri.amount }">
            			<input type="hidden" name="bno" value="${board.bno}">
					    <!-- <button type="submit" class="btn">수정완료</button> -->
						<button type="button" onclick="self.close();" class="myButton-white">닫기</button>
					</td>				
				</tr>
			</table>
		</form>
	</div>
<script type="text/javascript">
	/* $(function() {
		var pageNum = "${cri.pageNum}";
		var amount = "${cri.amount}";
		var f = $("form");

		$("button").click(
				function(e) { // 버튼 클릭 이벤트
					// 버튼 타입 클릭시 submit() 이벤트와 click() 이벤트를 동시에 진행할 수 있다.
					// e.preventDefault() 메소드를 이용하여 기존에 설정된 이벤트 해제(submit)
					e.preventDefault();
					var oper = $(this).data("oper");
					if (oper == 'list') {
						location.href = "/board/list?pageNum=" + pageNum
								+ "&amount=" + amount;
					} else if (oper == "modify") {
						f.submit();
					}

				});
	});
	
	
	function reload(){
	    window.opener.location.reload();
	    window.close();
	}
 */
</script>
</body>

</html>