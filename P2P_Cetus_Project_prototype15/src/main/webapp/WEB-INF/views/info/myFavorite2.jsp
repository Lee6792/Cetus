<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>  

	<aside>
	<div>
			<div style="margin-bottom: 1%">◎찜한자료</div>
			<div align="center">
			<ul id="tabs">
			    <li><a href="/info/myFavorite?pageNum=${pageMaker.cri.pageNum }&amount=${pageMaker.cri.amount }" title="tab1" id="tab1">내찜한자료</a></li>
			    <li><a class="active" href="/info/myFavorite2?pageNum=${pageMaker.cri.pageNum }&amount=${pageMaker.cri.amount }" id="tab2" title="tab2">찜순위</a></li>
			</ul>
			<table>
				<tr style="border: #fff">
					<td style="border: #fff; width: 20%;"><img src="/resources/images/Favorite.png"></td>
					<td style="border: #fff"><label style="color: #0101DF; font-weight: bold ">원하는 컨텐츠 창에서 찜하기 버튼을 누르신 후 내려받으시면 편리합니다.</label>
					<br>
					<label style="font-size: 10px">▶</label> 찜하기 서비스의 정보는 서버에 저장되기 떄문에 다른 컴퓨터에서 보시더라도
					 <br>&nbsp;&nbsp; 
					확인이 가능하며, 언제 어디서든 내려받기를 이용하실 수 있습니다.</td>
				</tr>
			</table>
			    
			
			</div>	
			<div style="float:left;margin-bottom: 1%">
				<select>
					<option>전체</option>
					<option>영화</option>
					<option>드라마</option>
				</select>
			</div>
		<table class="custom-table">
			<tr>
				<td style="width: 10%; text-align: center">분류</td>
				<td style="width: 80%; text-align: center">제목</td>
				<td style="width: 10%; text-align: center">용량</td>
			</tr>
			<tr>
				<td>영화</td>
				<td><a href="#">타짜</a></td>
				<td>3.9G</td>
			</tr>
		</table>
    </div>
    
    <!-- 찜한목록 페이징 처리 구간 -->
    
    <!-- 찜한목록 제목/아이디로 검색  -->
    
    
    </aside>
    
   <!-- all 체크 박스 선택시 전부 채크 하는 메소드 -->
	
<style type="text/css">
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

#tabs a.active, 
#tabs a.active::after,
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
}
#favorite{
	font-weight: bold;
}

</style>
<%@include file="../include/footer.jsp" %>