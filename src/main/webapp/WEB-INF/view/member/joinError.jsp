<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
<title></title>

</head>
<body>
<script type="text/javascript">


window.onload = function(){
	var chk = ${joinError}

	if(chk == 1){
		alert("이미 사용중인 이메일(${m_email}) 입니다. 다른이메일을 선택해주세요.");
		history.back();
	}
	
	if(chk == 2){
		alert("이미 사용중인 닉네임(${m_name}) 입니다. 다른 닉네임을 선택해주세요.");
		history.back();
	}
	if(chk == 3){
		alert("이미 사용중인 이메일(${m_email})과 닉네임(${m_name}) 입니다. 다시 입력해주세요.");
		history.back();
	}
}
</script>
</body>
</html>