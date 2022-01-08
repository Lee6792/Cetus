<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<style type="text/css">
	h3{
		float : left;
		color: #000080;
	}
	.re-btn{
	    width: 13%;
	    font-size: 12px;
	    font-weight: 700;
	    text-transform: capitalize;
	    height: calc(2.2rem + 3px) !important;
	    border-radius:0;
	    background-color: #dde8f7;
	    border-color: #dde8f7;
	    color: #000080;
	}
	.button{
		text-align: right;
	}
	#notice{
		font-weight: bold;
	}
	.ntablelength{
		width: 25%;
	}
	div.editable {
    width: 700px;
    height: 300px;
    border: 1px solid #dcdcdc;
    overflow-y: auto;
    text-align: left;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		var nno = "${nvo.nno}";
		
		$("button").on("click",function(){
			var oper = $(this).data("oper");
			var amount = "${cri.amount}";		// 전역변수로 선언
			var pageNum = "${cri.pageNum}";	// 전역변수로 선언
			
			if(oper == 'list'){
				var choice = confirm("목록으로 이동하시겠습니까??"); // 예 아니오 누를수있는 함수 리턴값은 boolean
				if(choice){
					location.href="/customerCenter/notice?amount="+amount+"&pageNum=" + pageNum;
				}else {
					return;
				}
			}else if(oper == 'nModify'){
				var choice = confirm("수정 하시겠습니까??"); // 예 아니오 누를수있는 함수 리턴값은 boolean
				if(choice){
					location.href="/customerCenter/nModify?amount="+amount+"&pageNum=" + pageNum + "&nno=" + nno;
				}else {
					return;
				}
			}else if(oper == 'nRemove'){
				var choice = confirm("삭제하시겠습니까??"); // 예 아니오 누를수있는 함수 리턴값은 boolean
				if(choice){
					location.href="/customerCenter/nRemove?amount="+amount+"&pageNum=" + pageNum + "&nno=" + nno;
				}else {
					return;
				}
			}
		})
	});
</script>
	<aside>
	<div>
	<div class="button">
	<h3>◎ 제목 : ${nvo.ntitle }</h3>
		<button class="re-btn" type="button" data-oper="list">목록으로 이동</button>&nbsp;&nbsp;
		 <sec:authorize access="isAuthenticated()">
	     <sec:authentication property="principal.username" var="pusername"/>
	     <c:choose>
	     	<c:when test="${pusername eq 'admin'}">
				<button class="re-btn" type="button" data-oper="nModify">수정</button>&nbsp;&nbsp;
				<button class="re-btn" type="button" data-oper="nRemove">삭제</button>
	     	</c:when>
	     </c:choose>
	     </sec:authorize>
	<hr>
	</div>
		<br>
		<table class="custom-table">
			<tbody>
				<tr>
					<th class="ntablelength">글쓴이</th>
					<td class="ntablelength">${nvo.nwriter }</td>
					<th class="ntablelength">날짜</th>
					<td class="ntablelength">${nvo.nreg_date }</td>
				</tr>
				<tr>
					<td colspan="4">
						<div class="editable">${nvo.ncontent }</div>
					</td>
				</tr>
			</tbody>
		</table>
		<hr>
	</div>
	</aside>
<%@include file="../include/footer.jsp" %>