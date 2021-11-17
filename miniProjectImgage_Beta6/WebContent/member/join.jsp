<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
	body{
		background-image: url("../img/photo-02.jpg");
	}
	.wrapper {
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  min-height: 100vh;
	  
	}
	.content {
	  font-family: system-ui, serif;
	  font-size: 2rem;
	  padding: 3rem;
	  border-radius: 1rem;
	  background: #1B3029;
	  opacity: 0.7;
	  color: white;
	 
	}
	h3{
		margin-top: 0px;
	}
	.inputId{
		width: 80%;
		height: 30px;
		margin-bottom: 20px;
	}
	.inputPass{
		width: 80%;
		height: 30px;
		margin-bottom: 20px;
	}
	.joinButton{
		width: 50%;
		justify-content: center;
		margin-left: 15%;
	}
</style>
</head>
<body>
<div class="wrapper">
	<div class="content">
		<h3> 회원 가입 </h3>
		<form method="post" action="join_server.jsp">
			<input type='text' name='u_id' class="inputId" placeholder="아이디">
			<input type='password' name='u_pass' class="inputPass" placeholder="비밀번호">
			<input type='submit' value='회원가입' class="joinButton">
		</form>
	</div>
</div>

</body>
</html>