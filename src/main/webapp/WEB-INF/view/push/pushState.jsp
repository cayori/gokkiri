<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>이메일찾기 실패</title>
<script>
	window.onload = function(){
		var chk = ${s_state}
		
		if(chk == 1){
			alert('일정이 공유되었습니다. 마이페이지로 이동합니다.');
			window.location.href = '/gokkiri/mypage/sharedScheduleList.go';
		}
		if(chk == 2){
			alert('거절하였습니다.');
			window.location.href = '/gokkiri/main.go';
		}
	}
</script>
</head>
<body>

</body>
</html>