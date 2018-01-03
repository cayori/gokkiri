<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="javascript">
function validation(){
	if(document.findPassword.m_name.value==""){
		alert("이름을 입력해주세요.");
		document.findPassword.m_name.focus();
		return false;
	}
	if(document.findPassword.m_email.value==""){
		alert("이메일을 입력해주세요.");
		document.findPassword.member_id.focus();
		return false;
	}

}
</script>
<title>비밀번호 찾기 결과</title>
</head>
<body>
<br><br><br><br><br>

<c:choose>
<c:when test="list.size() <= 0">
<div class="container">
  <h2>아이디 찾기 실패</h2>
  <span class="glyphicon glyphicon-info-sign"></span>&nbsp;<strong>이름</strong>과 <strong>이메일 주소</strong>를 확인해주세요.
  <hr>
  <form action="pwFind.go" method="post"  name="findPassword" onsubmit="return validation();">
  <div class="form-group">
  	<div class="col-xs-4" align="right">
      	<input type="text" name="m_name" class="form-control" placeholder="이름을 입력하세요.">
      	<input type="text" name="m_email" class="form-control" placeholder="이메일을 입력하세요.">
	    <button type="submit" class="btn btn-default">
	    <span class="glyphicon glyphicon-ok"></span>&nbsp;비밀번호 찾기</button>
	    <button type="button" class="btn btn-default" onclick="javascript:history.go(-1)"><span class="glyphicon glyphicon-remove"></span>&nbsp;닫기</button>
	</div>
  </div>
  </form>
</div>
</c:when>

 <c:otherwise>
<div class="container">
  <h2>비밀번호 찾기 결과</h2>
  <hr>
  <form class="form-horizontal">
  <div class="col-xs-4">
 
	<p class="fz15"><center>${member.m_name}님의 비밀번호는 <strong>${member.m_pw}</strong>입니다.</center></p>

  <div align="right">
 <button type="button" class="btn btn-default" onclick="window:location='loginForm.go'"><span class="glyphicon glyphicon-log-in"></span>&nbsp;로그인</button>
 </div>
 </div>
 </form>
 <br>
</div>
</c:otherwise>

</c:choose>
<br><br><br><br><br>
</body>
</html>