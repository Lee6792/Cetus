<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 읽기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/resources/js/reply.js"></script>
<script src="/resources/js/util.js"></script>
<script type="text/javascript">

	var principal = null;
	// 권한이 있는지 먼저 물어본다.
	<sec:authorize access="isAuthenticated()">
	principal = '<sec:authentication property="principal.username"/>'; //인증 안되었을때 그냥쓰면 에러남
	</sec:authorize>

	function favorit(){
		var a = '${board.bno}';
		if('${favorit}' == null){
			var b = 'nodata';
		}else{
			var b = '${favorit.bno}';
		}
		
		//alert("board bno" + a);
		//alert("favorit bno" + b);
		
		 if(a == b){
			alert("이미 찜목록에 있습니다.");
			return;
		}else{
			alert("찜목록에 추가 되었습니다.");
			location.href="/info/favorite?bno=${board.bno}&carte=${board.catecode }&id=${board.id }&title=${board.title }&filesize=${board.filesize }&cash=${board.price }";
		    submit();
		}
	}

   $(function(){
	   
      $("#btnRecommend").click(function(e){
         if(confirm("이 글을 추천하시겠습니까?") == true){
            alert("이 글이 추천되었습니다.");
         }else{
            e.preventDefault();
            alert("추천을 취소하셨습니다.");
            
         }
          });
      
     // ---------- 댓글 -------------
     console.log("============");
     console.log("reply get test");
      
      
      // 등록버튼을 눌렀을 때
   var bno = "${board.bno}";
   var pageNum = "${pageMaker.cri.pageNum }";
   var amount = "${pageMaker.cri.amount }";
   
   $("#finish").on("click", function(e){
        e.preventDefault();
        // 필요한 데이터: 댓글 작성자, 댓글
         var replyer = $("input[name='replyer']").val();
        var reply = $("input[name='reply']").val();
        
        if(reply == "" ) {
           alert("댓글을 작성해주세요.");   
           return;
        }
        
        replyService.add({bno: bno, reply:reply, replyer:replyer}, function(result){
           alert("댓글이 작성되었습니다.");
           $("input[name='replyer']").val();
           $("input[name='reply']").val(null);
           showList(1);
          });
	});
   
   // 데이터 불러와서 댓글 처리하기
   var replyUL = $(".chat");
   
   // 페이지 번호
  
   function showList(page){
      replyService.getList({bno:bno, page : page || 1}, function(list){
         var str = "";
         if(list == null || list.length == 0){
            replyUL.html("");
            
            return;
         }
         for(var i =0, len = list.length || 0; i<len; i++){
            str += " <div>";
            str += "   <div>";
			str += "      <strong data-rno = '"+list[i].rno+"'>"+list[i].replyer+"</strong>";
			str += "      <input type='hidden' data-oper = '"+list[i].reply+"'>";
			str += "      <input type='hidden' id='username' value = '"+list[i].replyer+"'>";
            str += " 	     <small>" + displayTime(list[i].reply_date) + "</small>";
            if(principal == list[i].replyer){
				str += " 			<img class='btn-modify replyModify' src='/resources/images/modify.png'>";
				str += "			<img class='btn-remove replyRemove' src='/resources/images/remove.png'>";
            }
			str += "   </div>";
            str += "   <p class='commentContent'>"+list[i].reply + "</p>";
			str += " </div>"; 
         }
         replyUL.html(str);
      }); // end function
      	
   } // end showList
   

   
   
   // 댓글 삭제
   var rno;
   $(".chat").on("click", ".replyRemove", function(e){ // 이벤트 위임
	   //형제라인에 있는 strong을 찾고 나서 그 객체.data로 가야한다.
	   rno = $(this).siblings('strong').data("rno");
   	  
   	console.log(rno);
	   replyService.remove(rno, function(result){
		   alert("댓글이 삭제되었습니다.");
           showList();
        });

	  });
   
   showList(1);
   
   // 댓글 수정버튼 누르면
   $(".chat").on("click", ".replyModify", function(e){
	   $(this).parents("div").siblings("p").empty();
	   /* alert($(this).parents("div").siblings("p").text()); */
	   rno = $(this).siblings('strong').data("rno");
	   var reply = $(this).siblings('input').data("oper");
	   var replyer = $("input[name='replyer']").val();
	   console.log("수정버튼 누름");
	   console.log(rno);
	   console.log(reply);
	   console.log(replyer);
	   
	   var str ='';
	   
		str += " <div>";
		str += "   <div>";
		str += "     <strong data-rno = '"+rno+"'></strong>";
		str += "  		<input type='text' name='reply' id='reply' class='reply' value='"+reply+"' style='width: 510px; data-oper = '"+reply+"'>";
		str += " 		<img class='btn-modify-success replyModify1' src='/resources/images/confirm.png'>";
		str += "   </div>";
		str += " </div>"; 
	   
		/*  $('.commentContent').html(str); */
		$('.commentContent').each(function(){
			updateRno = $(this).siblings('div').children("strong").data("rno");
			if(updateRno == rno){
				$(this).html(str);
			}
		});
   });
   
   // 댓글 수정완료 버튼 누르면
   
   $(".chat").on("click", ".replyModify1", function(e){
		 console.log("수정완료버튼 누름 확인");
		   var reply1 = $(this).siblings('input[name=reply]').val();
		   rno = $(this).siblings('strong').data("rno");
		   var reply = {rno:rno,  reply:reply1};
		   //var reply = $("#reply").val();
		   console.log(rno);
		   console.log(reply);
		   replyService.update(reply, function(result){
			   alert("댓글이 수정되었습니다.");
	           showList(1);
	        });
		   
		   
	   });
   
   
   
   
   
   
   
   
   
   
   
   });//-- [주의] 함수 종료 괄호임!!
   
    function removeGo(f) {
	    f.method = 'post';
		f.action = '/board/remove';
		f.submit();
    }
   
   
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
      width: 50px;
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
   .replyMake{
      text-align: center;
      background-color: white;
   }
   .replyList{
      
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

.btn-modify-success{
		width: 20px;
		
	}
	.btn-modify{
		width: 20px;
	}
	.btn-remove{
		width: 20px;
	}
	.replyModify{
		background-color: white;
		border: none;
	}
	.replyModify1{
		background-color: white;
		border: none;
	}
	.replyRemove{
		background-color: white;
		border: none;
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
                    <td class="rightSide">
                    ${board.id}
                    <input type="hidden" name="id" class="input" value="${board.id}">
                    <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
                    </td>
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
                       <sec:authorize access="isAuthenticated()">
                       <button class="myButton-blue">내려받기<!-- 나중에 수정하자 --></button>&nbsp;
                       <sec:authentication property="principal.username" var="pusername"/>
                       		<c:choose>
		                    	<c:when test="${board.id eq pusername }">
			                        <a class="myButton-blue" id="btnFavorit" onclick="alert('자신의 글은 찜할수 없습니다.');">찜하기</a>
                       				<button onclick="alert('자신의글은 추천할 수 없습니다.');" class="myButton-blue">추천하기</button>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<a class="myButton-blue" id="btnFavorit" onclick="favorit()">찜하기</a>
                       				<button type="submit" id="btnRecommend" class="myButton-blue">추천하기</button>
		                    	</c:otherwise>
		                    </c:choose>
                       </sec:authorize>
                       <sec:authorize access="isAnonymous()">
                       		<button class="myButton-blue" onclick="alert('로그인 후 이용 가능합니다.');">내려받기<!-- 나중에 수정하자 --></button>&nbsp;
	                   		<a class="myButton-blue" id="btnFavorit" onclick="alert('로그인 후 이용 가능합니다.');">찜하기</a>
                       		<button onclick="alert('로그인 후 이용 가능합니다.');" class="myButton-blue">추천하기</button>
                       </sec:authorize>
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
                    <sec:authorize access="isAuthenticated()">
                    <sec:authentication property="principal.username" var="pusername"/>
                    <c:choose>
                    	<c:when test="${board.id eq pusername }">
	                        <button type="button" data-oper="modify" class="myButton-green" onclick="location.href='/board/modify?bno=<c:out value="${board.bno }"/>'">수정하기</button>
	                        <button type="button" data-oper="remove" class="myButton-red" onclick="removeGo(this.form);">삭제하기</button>
                    	</c:when>
                    	<c:when test="${pusername eq 'admin'}">
	                        <button type="button" data-oper="modify" class="myButton-green" onclick="location.href='/board/modify?bno=<c:out value="${board.bno }"/>'">수정하기</button>
	                        <button type="button" data-oper="remove" class="myButton-red" onclick="removeGo(this.form);">삭제하기</button>
                    	</c:when>
                    	<c:otherwise>
                    		<button type="button" data-oper="modify" class="myButton-green" onclick="alert('작성자만 수정이 가능합니다.');">수정하기</button>
	                        <button type="button" data-oper="remove" class="myButton-red" onclick="alert('작성자만 삭제가 가능합니다.');">삭제하기</button>
                    	</c:otherwise>
                    </c:choose>
                    </sec:authorize>
                    <sec:authorize access="isAnonymous()">
                    	<button type="button" data-oper="modify" class="myButton-green" onclick="alert('로그인 후 이용 가능합니다.');">수정하기</button>
	                    <button type="button" data-oper="remove" class="myButton-red" onclick="alert('로그인 후 이용 가능합니다.');">삭제하기</button>
                    </sec:authorize>
                        <button type="button" onclick="location.href='/board/li'" class="myButton-white">닫기</button>
                    </td>
                </tr>
				<sec:authorize access="isAuthenticated()">
                <tr>
                   <td class="reply" colspan="2">
                      <img src='/resources/images/comment.png' style='width:15px;'>&nbsp;댓글
                   </td>
                </tr>
	                <tr>
	                   <td class="replyMake" colspan="2">
	                      <sec:authentication property="principal.username"/><input type="hidden" name="replyer" value='<c:out value="${pusername }"/>'>
	                      <input type="text" name="reply" class="input" placeholder="회원님의 아름다운 댓글은 모든 회원들께 기쁨이 됩니다." style="width: 555px;">&nbsp;
	                      <button type="button" id="finish">댓글등록</button>
	                   </td>
	                </tr>
                </sec:authorize>
                <tr>
                   <td class="replyList" colspan="2">
                      <ul class="chat">
                        <!-- start reply -->
 				
                  <!-- end reply -->
                      </ul>
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