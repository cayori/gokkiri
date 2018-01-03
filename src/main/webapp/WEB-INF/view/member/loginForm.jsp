<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

</head>
<body>
<br><br><br><br><br>

<div class="container">
  <h2>로그인</h2>
  <hr>
        <form name="loginForm" method="post" action="login.go">
        <div class="form-group">
  		<div class="col-xs-4" align="right">
      	<input type="text" name="m_email" class="form-control" id="email" placeholder="이메일을 입력하세요.">
      	<input type="password" name="m_pw" class="form-control" id="pwd" placeholder="비밀번호를 입력하세요.">
	    <button type="submit" class="btn btn-default">
	    <span class="glyphicon glyphicon-ok"></span>&nbsp;로그인</button>
	  
	   <div class="form-group">
		    <button type="button" onclick="window:location='findForm.go'" class="btn btn-default">
		    <span class="glyphicon glyphicon-search"></span>&nbsp;이메일/비밀번호찾기</button>
	   </div>
	   <hr>
		<a href="/gokkiri/member/joinForm.go">회원가입</a>
	</div>
  </div>
        </form>
 </div>
 <br><br><br><br><br>
 
 
</body>
</html>