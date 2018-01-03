<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>이메일찾기 실패</title>
<script>
	window.onload = function(){
		var chk = ${memberFindChk}
		
		if(chk == -1){
			alert('입력된 정보가 틀립니다');
			history.back();
		}
		if(chk == 0){
			alert('가입되어 있지 않는 사용자입니다');
			history.back();
		}
	}
</script>
</head>
<body>

</body>
</html>