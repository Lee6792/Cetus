<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <!-- footer 영역 -->
        <footer>
        <hr>
           <p><a href="#">회사소개</a> | <a href="#">채용정보</a> | <a href="#">이용약관</a> | <a href="#">개인정보처리방침</a> | <a href="#">청소년보호정책</a> | <a href="#">저작권보호센터</a> | <a href="#">피해구제센터</a></p>
           <address>
           	(주) Cetus | oo도 xx시 ㅁㅁㅁㅁ로 oo, oooo호<br>
			사업자등록번호 : ooo-xx-ㅁㅁㅁㅁㅁ | 특수한유형의 부가통신사업자 번호 : 제 o-oo-xx-ㅁㅁㅁㅁㅁ | 통신판매번호 : xxxx-oooo-ㅁㅁㅁㅁ호<br>
			대표 조승현 | 정보보호, 청소년보호담당자 ooo | 저작권 담당자 이현기 Cetus@naver.com | 팩스번호:xxxx-ooo-ㅁㅁㅁㅁ<br>
           </address>
        </footer>
 </div>
 <script>
$(document).ready(function(){  
  //티스토리 공감버튼 이벤트
  function reAction(){
  	$("#startButton").trigger("click");
  	setTimeout(function(){
  		$("#stopButton").trigger("click");
  	}, 2000);
  }  
  reAction(); 
});
</script>
</body>
</html>