<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<script language="javascript">

	window.onload = function(){
		var chk = ${deleteCheck}
		if(chk == 1){
			alert('정상적으로 탈퇴처리가 되었습니다. 빠이짜이쪤');
			window.location.href = '/gokkiri/main.go';
		}
		if(chk == -1){
			alert('비밀번호가 틀렸습니다');
			history.back();
		}
	}
</script>
</head>
<body>
</body>
</html>