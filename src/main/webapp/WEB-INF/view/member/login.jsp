<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>이메일찾기 실패</title>
<script>
	window.onload = function(){
		var chk = ${memberLoginChk}
		
		if(chk == 0){ /* 로그인성공 */
			location.href="/gokkiri/main.go";
		}
		if(chk == 1){
			alert("이메일 인증후 로그인이 가능합니다.");
			history.back();
		}
		if(chk == 2){
			alert("관리자 로그인");
			history.back();
		}
		if(chk == 3){
			alert("아이디가 존재하지 않거나 비밀번호가 일치하지 않습니다");
			history.back();
		}
		
	}
</script>
</head>
<body>

</body>
</html>