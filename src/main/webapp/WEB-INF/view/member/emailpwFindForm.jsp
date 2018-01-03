<%@ page contentType="text/html; charset=euc-kr"%>

<html>
<head>
<script language="javascript">
function validation(){
	if(document.findEmail.m_name.value==""){
		alert("이름을 입력해주세요.");
		document.findEmail.m_name.focus();
		return false;
	}
	
}
function validation2(){
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
<title>이메일/비밀번호 찾기</title>
</head>
<body>
<br><br><br><br><br>

<div class="container">
  <h2>이메일 찾기</h2>
  <hr>
  <form action="emailFind.go" method="post"  name="findEmail" onsubmit="return validation();">
  <div class="form-group">
  	<div class="col-xs-4" align="right">
      	<input type="text" name="m_name" class="form-control" placeholder="이름을 입력하세요.">
	    <button type="submit" class="btn btn-default">
	    <span class="glyphicon glyphicon-ok"></span>&nbsp;이메일 찾기</button>
	</div>
  </div>
  </form>
</div>

<br><br><br>

	<div class="container">
  <h2>비밀번호 찾기</h2>
  <hr>
  <form action="pwFind.go" method="post"  name="findPassword" onsubmit="return validation2();">
  <div class="form-group">
  	<div class="col-xs-4" align="right">
      	<input type="text" name="m_name" class="form-control" placeholder="이름을 입력하세요.">
      	<input type="text" name="m_email" class="form-control" placeholder="이메일을 입력하세요.">
	    <button type="submit" class="btn btn-default">
	    <span class="glyphicon glyphicon-ok"></span>&nbsp;패스워드 찾기</button>
	</div>
  </div>
  </form>
</div>
<br><br><br>
	

<br><br><br><br><br>
</body>
</html>