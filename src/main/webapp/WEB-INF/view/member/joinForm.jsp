<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입 폼</title>
<style type="text/css">
img {
	border: 0;
	margin: 0;
}

center {
	color: white;
	font-size: 55px;
	font-weight: bold;
	margin: 25px;
	margin-bottom: 80px;
}

.button {
  border-radius: 4px;
  background-color: #f4511e;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 16px;
  padding: 10px;
  width: 120px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}

/* 로딩  */
#snackbar {
    visibility: hidden;
    min-width: 250px;
    margin-left: -125px;
    background-color: #333;
    color: #fff;
    text-align: center;
    border-radius: 2px;
    padding: 16px;
    position: fixed;
    z-index: 1;
    left: 50%;
    bottom: 30px;
    font-size: 17px;
}

#snackbar.show {
    visibility: visible;
    -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
    animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

@-webkit-keyframes fadein {
    from {bottom: 0; opacity: 0;} 
    to {bottom: 30px; opacity: 1;}
}

@keyframes fadein {
    from {bottom: 0; opacity: 0;}
    to {bottom: 30px; opacity: 1;}
}

@-webkit-keyframes fadeout {
    from {bottom: 30px; opacity: 1;} 
    to {bottom: 0; opacity: 0;}
}

@keyframes fadeout {
    from {bottom: 30px; opacity: 1;}
    to {bottom: 0; opacity: 0;}
}
</style>

<script language="javascript">
function myFunction() {
    var x = document.getElementById("snackbar")
    x.className = "show";
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 9000);
}

function check(){
	var reg = document.joinForm;
	
	if(reg.m_email.value==""){
		alert("이메일을 입력해주세요.");
		reg.m_email.focus();
		return false;
	}
	
	else if(reg.m_pw.value==""){
		alert("비밀번호를 입력해주세요");
		reg.m_pw.focus();
		return false;
	}
	else if(reg.m_pw.value != reg.m_pw2.value){
		alert("비밀번호가 일치하지 않습니다.");
		reg.m_pw.focus();
		return false;
	}
	else if(reg.m_pw.value.length < 6 || reg.m_pw.value.length > 13){
		alert("비밀번호를 6~13자까지 입력해주세요.");
		reg.m_pw.focus();
		return false;
	}
	else if(reg.m_name.value==""){
		alert("이름을 입력해주세요");
		reg.m_name.focus();
		return false;
	}
	
}
function openIdChk(joinForm){
	var url="duplChk.go?m_email="+document.joinForm.m_email.value;
	var reg=document.joinForm;
	for (i=0;i<reg.m_email.value.length;i++ ){
		var ch = document.joinForm.m_email.value.charAt(i)
		if (!(ch>='0' && ch<='9') && !(ch>='a' && ch<='z')){
	  		alert ("이메일은 소문자, 숫자만 입력가능합니다.")
	  		reg.m_email.focus();
	  		return false;
	  	}
	}
	if(reg.m_email.value==""){
		alert("이메일을 입력해주세요");
		reg.m_email.focus();
		return false;
	}
	
	open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=400");
}
$(document).ready(function(){
    // Initialize Tooltip
    $('[data-toggle="tooltip"]').tooltip(); 
}) 

function openNameChk(joinForm){
	var url="nameDuplChk.go?m_name="+document.joinForm.m_name.value;
	var reg=document.joinForm;
	
	if(reg.m_name.value==""){
		alert("이름(닉네임)을 입력해주세요");
		reg.m_name.focus();
		return false;
	}
	
	open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=400");
}
$(document).ready(function(){
    // Initialize Tooltip
    $('[data-toggle="tooltip"]').tooltip(); 
})
</script>

</head>
<body>


<div class="container" style="width:60%;">
<img src="/gokkiri/resources/img/welcome.jpg" width="100%"/>
  <h2>회원가입</h2>
  <span class="glyphicon glyphicon-info-sign"></span>&nbsp;모든 항목을 입력하셔야 가입하실 수 있습니다.
  <hr>
  
  <form action="join.go" name="joinForm" method="post" onsubmit="return check();">
  
     <div class="form-group">
      <label for="email">이메일:</label>
      
       <div class="input-group">
        <input type="text" name="m_email" class="form-control" aria-describedby="basic-addon2"> 
        <span class="input-group-addon" id="basic-addon2">@naver.com</span>
        <span class="input-group-btn">
        <button class="btn btn-default" onclick="openIdChk(this.form)" name="confirmId" type="button">
        <span class="glyphicon glyphicon-ok"></span>&nbsp중복확인</button></span>
       </div>
      
    </div>
   
    <div class="form-group">
      <label for="pwd">비밀번호:</label>
      
        <input type="password" data-toggle="tooltip" title="6~13자까지 입력해주세요." class="form-control" name="m_pw">
      
    </div>
<div class="form-group">
      <label for="pwd">비밀번호 확인:</label>
      
        <input type="password" data-toggle="tooltip" title="다시 한번 입력해주세요." class="form-control" name="m_pw2">
      
    </div>

    
    	<div class="form-group">
      <label for="pwd">이름:</label>
      <div class="input-group">
        <input type="text" class="form-control" name="m_name" aria-describedby="basic-addon2">
        <span class="input-group-btn" >
        <button class="btn btn-default" onclick="openNameChk(this.form)" name="confirmName" type="button">
        <span class="glyphicon glyphicon-ok"></span>&nbsp중복확인</button></span>
        </div>
      
    </div>

      <button type="submit" class="button" onclick="myFunction()"><span>회원가입</span></button>
      
      <div id="snackbar">인증 이메일 전송 중...</div>

      </form>
      
      </div>
    

<br><br><br><br><br>
</body>
</html>