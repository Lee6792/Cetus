<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	#wrap{
	    width:100%;
	    height:100%;
	    background:gray;
	}
	  
	#wrap .box{ 
	    width:1000px;
	    height:800px;
	    margin:auto;
	    background-color: #fff;
	}
	#wrap .logo{
		width: 200px;
		height: 100px;
		background-color: yellow;
		margin: 10px;
		text-align: center;
		color: #000;
		font-size: 50px;
	}
	#wrap .login{
		width: 200px;
		height: 250px;
		background-color: yellow;
		margin: 10px;
	}
	#wrap .id_view{
		margin: 10px;
	}
</style>
</head>
<body>
	<div id="wrap">
		<div class="box">
			<div class="logo">
				logo
			</div>
			<div class="login">
				<label class="id_view">아이디</label>
			</div>
		</div>
	</div>
</body>
</html>