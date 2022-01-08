<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	  .wrap{
      width: 1000px;
      margin: auto;
   }
   header, nav, section, aside, footer, article{
      border: 1px solid gray;
      padding: 10px;
      margin: 10px;
   }
   section{
      float: left;
      width: 200px;
      height: 500px;   
   }
   aside{
      float: right;
      width: 700px;
      height: 500px;
   }
   footer{
      clear: both;
   }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
   * HTML Semantic 문서 구조
   - <header> : 문서의 머릿말, 회사 로고, 제목, 페이지 소개
   - <nav> : 링크, 메뉴
   - <section> : 문서의 주된 내용, 챕터
   - <article> : 문서의 주된 기사, 절
   - <aside> : 문서의 주된 내용과는 조금 거리가 있는 내용. 광고
   - <footer> : 꼬리말, 저작권, 회사 연락처 등.. 
 -->
 
 <div class="wrap">
    <!-- 헤더 부분 -->
    <header>
       <h1>&nbsp;&nbsp;Cetus</h1>
       <div class="search-sec">
			<form action="">
				<select name="category1" id="category1" class="search-slt">
					<c:forEach var="cat1" items="${clist }">
						<c:if test="${cat1.catecode % 100 eq 0 }">
							<option value="${cat1.catecode }">${cat1.catename }</option>
						</c:if>
					</c:forEach>
				</select>
				
				<select name="category2" id="category2" class="search-slt">
					<option value="">select</option>
				</select>
				
				<input type="text" name="search" class="search-sltinput">&nbsp;&nbsp;
				<input type="submit" value="검색" class="wrn-btn">
				
			</form>
		</div>
       <div>
		<div class="menu">
			<ul class="nav">
				<c:forEach var="cat1" items="${clist }">
					<c:if test="${cat1.catecode % 100 eq 0 }">
						<li>
							<a href="${cat1.catecode }">${cat1.catename }</a>
							<ul id="subCate" class="sub">
							</ul>
						</li>
					</c:if>
				</c:forEach>
				<li><a href="1">전체</a></li>
			</ul>
		</div>
	</div>
    </header>
    
        <!-- 본문 부분 -->
         <!-- 1. section 내부에 article --> 
         <!-- 2. article 내부에 section --> 
         <section>
            <h2>section 제목</h2>
            <article>
               <h3>메뉴1</h3>
            </article>
             <article>
               <h3>메뉴2</h3>
            </article>
            <article>
               <h3>메뉴3</h3>
            </article>
            <article>
               <h3>메뉴4</h3>
            </article>
         </section>
         
         <aside>
            <h3>aside 제목</h3>
            <p>aside 내용</p>
         </aside>
        
        <!-- footer 영역 -->
        <footer>
           <p>제작 정보, 회사 정보, 저작권</p>
           <address>제작자 연락처</address>
        </footer>
 </div>
</body>
</html>