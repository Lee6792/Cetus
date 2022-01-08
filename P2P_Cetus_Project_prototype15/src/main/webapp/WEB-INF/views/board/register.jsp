<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<script src = "${path}/ckeditor/ckeditor.js"></script>
<meta charset="UTF-8">
<title>게시글 작성</title>
<style type="text/css">
    body{
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
        width: 200px;
        padding: 10px;
        vertical-align: top;
        border-right: 1px solid #ccc;
        border-bottom: 1px solid #ccc;
    }
    .rigthSort{
        border-collapse: collapse;
    }
    textarea{
        resize: none;

    }
    .represent{
        text-align: center;
        font-weight: 1000;
        background-color: rgb(243, 243, 243);
    }
    .bigTitle{
        text-align: center;
    }
    .btn{
        text-align: center;
    }
    .input{
        width: 610px;
        
    }
    .content{
        background-color: white;
        text-align: center;
    }
    .detail{
        background-color: white;
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
.myButton-blue:active {
   position:relative;
   top:1px;
}

.myButton-orange {
   box-shadow:inset 0px 1px 0px 0px #fce2c1;
   background:linear-gradient(to bottom, #ffc477 5%, #fb9e25 100%);
   background-color:#ffc477;
   border-radius:6px;
   border:1px solid #eeb44f;
   display:inline-block;
   cursor:pointer;
   color:#ffffff;
   font-family:Arial;
   font-size:15px;
   font-weight:bold;
   padding:8px 20px;
   text-decoration:none;
   text-shadow:0px 1px 0px #cc9f52;
}
.myButton-orange:hover {
   background:linear-gradient(to bottom, #fb9e25 5%, #ffc477 100%);
   background-color:#fb9e25;
}
.myButton-orange:active {
   position:relative;
   top:1px;
}
</style>
</head>
<body>
    <div class="wrap">
        <form action="/board/register" method="post" class="form" id="myForm">
            <table class="tg">
                <tr>
                    <th class="bigTitle" colspan="2">게시글 작성</th>
                </tr>
                <tr>
                    <td class="represent">제목</td>
                    <td class="detail"><input type="text" name="title" class="input" ></td>
                </tr>
                <tr>
                    <td class="represent">아이디</td>
                    <td class="detail">
                    	<sec:authentication property="principal.username" var="pusername"/>
                    	<sec:authentication property="principal.username"/>
                    	<input type="hidden" name="id" class="input" value="${pusername }">
                    </td>
                </tr>
                <tr>
                    <td class="represent">분류</td>
                    <td class="detail">
                        <select name="catecode" id="category1" class="search-slt">
                     <option id="cate" value="">::분류선택::</option>
                     <c:forEach var="cat1" items="${clist }">
                        <c:if test="${cat1.catecode % 100 eq 0 }">
                        <option value="${cat1.catecode }">${cat1.catename }</option>
                        </c:if>
                        </c:forEach>
                  </select>
            
                  <select name="catecoderef" id="category2" class="search-slt">
                     <option value="">::소분류선택::</option>
                  </select>
                    </td>
                </tr>
                <tr>
                    <td class="represent">파일업로드</td>
                    <td class="detail"><input type="file"></td>
                </tr>
                <tr>
                    <td class="represent">캐시설정</td>
                    <td class="detail"><input type="number" class="input" name="price"></td>
                </tr>
                <tr>
                    <td class="content" colspan="2">
                        <textarea rows="50" cols="100" name="content" placeholder="내용을 작성하세요" id="description"></textarea>
                        <script type="text/javascript">
                        CKEDITOR.replace("description",{
                        }); 
                  </script>
                        <input type="submit" class="myButton-blue" id="submit" value="작성완료" >
                        <button type="reset" class="myButton-orange">다시작성</button>
                        <button type="button" onclick="location.href='/board/li'" class="myButton-white">닫기</button>
                    </td>
                </tr>
            </table>
            <input type="hidden" name="pageNum" value="${cri.pageNum }">
            <input type="hidden" name="amount" value="${cri.amount }">
        </form>
    </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
   $("#category1").change(function(){
      var catecode = $(this).val();
      //alert(catecode);
      $("#cate").attr("disabled","disabled");
      opener.parent.subCateService.get(catecode, function(result){
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
   
   $(document).ready(function() { 
      $("form").submit(function(event) { 
         var title = $("input[name=title]").val();
         var id = $("input[name=id]").val();
         var price = $("input[name=price]").val();
         var content = CKEDITOR.instances.description.getData();
         var cate1 = $("#category1").on("click option").val();
         var cate2 = $("#category2").on("click option").val();
         
         if(title ==''){
            alert("제목을 입력하세요.");
            return false;
         }
         if(id ==''){
            alert("아이디를 입력하세요.");
            return false;
         }
         if(cate1 == ''){
            alert("분류를 선택해주세요.");
            return false;
         }
         if(cate2 == ''){
            alert("소분류를 선택해주세요.");
            return false;
         }
         if(price ==''){
            alert("캐쉬를 설정하세요.");
            return false;
         }
         if(content ==''){
            alert("내용을 입력하세요.");
            return false;
         }
      }); 
   });

   
</script>
</body>


</html>