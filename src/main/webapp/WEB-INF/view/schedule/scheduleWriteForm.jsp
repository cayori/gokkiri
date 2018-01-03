<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/locales/bootstrap-datepicker.ko.min.js"></script>
<script type="text/javascript">
function check(){
var write = document.sForm;	   
if(write.s_name.value==""){
	alert("일정 이름을 입력해주세요.");
	write.s_name.focus();
	return false;
}
else if(write.s_start_date.value==""){
	alert("출발일을 설정해주세요.");
	write.s_start_date.focus();
	return false;
}
else if(write.s_end_date.value==""){
	alert("종료일을 설정해주세요.");
	write.s_end_date.focus();
	return false;
}
else if(write.emailExist.value.length != 0 && write.chk.value == 0){
	alert("이메일 검색 버튼을 눌러주세요.");
	write.emailExist.focus();
	return false;
}
}
function openEmailExist(sForm){
	   var url="emailExist.go?emailExist="+document.sForm.emailExist.value;
	   var form=document.sForm;
	   for (i=0;i<form.emailExist.value.length;i++ ){
	      var ch = document.sForm.emailExist.value.charAt(i)
	      if (!(ch>='0' && ch<='9') && !(ch>='a' && ch<='z')){
	           alert ("이메일은 소문자, 숫자만 입력가능합니다.")
	           form.emailExist.focus();
	           return false;
	        }
	   }
	   if(form.emailExist.value==""){
	      alert("이메일을 입력해주세요.");
	      form.emailExist.focus();
	      return false;
	   }
	   if(form.emailExist.value=="${sessionScope.session_m_email}"){
		      alert("자신 이메일은 사용할 수 없습니다.");
		      form.emailExist.value="";
		      form.emailExist.focus();
		      return false;
	   }

	   open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=500,height=10");
	}

$(document).ready(function(){
    // Initialize Tooltip
    $('[data-toggle="tooltip"]').tooltip(); 
})
</script>
<style>
/*상단 이미지*/
.jumbotron{
background-image: url('/gokkiri/resources/img/cloud2.jpg');
background-repeat: no-repeat;
background-position: center;
background-size: cover;
width: 100%;
height: 100%;
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
</style>
</head>
<body>
<!-- 상단 이미지 -->
<div class="jumbotron text-center">
  <form class="form-inline">
  	<p><font color="#ffffff" size="10"><b>나만의 여행 일정을 만드세요!</b></font></p>
  	<p><font color="#ffffff" size="3">내 여행 일정을 공유할 수 있고 다른 사람이 만든 여행 일정을 볼 수 있습니다.</font></p>
    <div class="input-group">
 		<a class="btn btn-default" href="/gokkiri/schedule/scheduleList.go?currentPage=1" role="button">보러가기</a>
    </div>
  </form>
</div>

<table width="100%">
<tr>
<td>
<form:form commandName="scheduleModel" name="sForm" class="form-horizontal" action="scheduleState.go" method="post" onsubmit="return check();">
  <c:if test="${not empty scheduleIncompleteList }">
	  <div class="form-group"> 
	    <div class="col-sm-offset-2 col-sm-10">
	    	<!-- 누를시 마이페이지 미완성 -->
	        <label>
	        	<span style="cursor:pointer;"
	        			onclick="javascript:location.href='/gokkiri/mypage/myScheduleList.go?s_complete=0&s_private=0'" 
	        			class="label label-primary">${fn:length(scheduleIncompleteList) }</span>&nbsp;개의 일정이 완성을 기다리고 있습니다.
	        </label>
	    </div>
	  </div>
  </c:if>
  <div class="form-group">
    <label class="control-label col-sm-2">일정 이름:</label>
    <div class="col-sm-6">
      <input type="text" 
      		class="form-control" 
      		name="s_name" 
      		data-placement="bottom"
      		data-toggle="tooltip" 
      		title="필수입력 항목 입니다." 
      		placeholder="일정 이름을 입력하세요."/>
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2">날짜 설정:</label>
    
    <div class="col-sm-3"> 
    	<div class="input-group">
    		<span class="input-group-addon">출발일</span>
      		<input id="s_start_date" 
      				name="s_start_date" 
      				class="input-date form-control" 
      				type="text" 
      				placeholder="출발일 선택" 
      				data-placement="bottom"
      				readonly="readonly" 
      				data-toggle="tooltip" 
      				title="필수입력 항목 입니다."/>
      		<span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true" id="s_start_date" style="cursor:pointer;"></span></span>
    	</div>
    </div>
    <div class="col-sm-3"> 
      	<div class="input-group">
      		<span class="input-group-addon">종료일</span>
      		<input id="s_end_date" 
      			name="s_end_date" 
      			class="input-date form-control" 
      			type="text" 
      			placeholder="종료일 선택" 
      			readonly="readonly" 
      			data-placement="bottom"
      			data-toggle="tooltip" 
      			title="필수입력 항목 입니다."/>
      		<span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true" id="s_end_date" style="cursor:pointer;"></span></span>
    	</div>
    </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">검색:</label>
      <div class="col-sm-6">
       <div class="input-group">
        <input type="text" name="emailExist" class="form-control" aria-describedby="basic-addon2" placeholder="이메일을 입력해주세요."> 
        <input type="hidden" name="chk" value="0">
        <span class="input-group-addon" id="basic-addon2">@naver.com</span>
        <span class="input-group-btn">
        <button class="btn btn-default" onclick="openEmailExist(this.form)" name="confirmId" type="button">
        <span class="glyphicon glyphicon-search"></span>&nbsp; </button>
      </span>
       </div>
      </div>
    </div>
    
   <div class="form-group">
   	<label class="control-label col-sm-2" for="pwd">일정을 공유할 친구:</label>
    <div class="col-sm-6">
      <input type="text" name="s_together" class="form-control" aria-describedby="basic-addon2" placeholder="검색 후 추가를 해주세요." readonly="readonly"> 
    </div>
  </div>
    
  <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
        <label data-toggle="tooltip" title="체크할 시 일정 게시판에 나타나지 않습니다.">
        	<input type="checkbox" name="s_private" value="1"/>
        	<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>&nbsp;비밀글
        </label>
      </div>
    </div>
  </div>
  <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="button"><span>만들기</span></button>
    </div>
  </div>

</form:form>
</td>
</tr>
</table>

<script type="text/javascript">
//선언한 TextBox에 DateTimePicker 위젯을 적용한다.
$('#s_start_date').datepicker({
  format : "yyyy-mm-dd",
  language : "ko", // 화면에 출력될 언어를 한국어로 설정한다.
  pickTime : false, // 사용자로부터 시간 선택을 허용하려면 true를 설정하거나 pickTime 옵션을 생략한다.
  startDate : new Date() // 기본값으로 오늘 날짜를 입력한다. 기본값을 해제하려면 defaultDate 옵션을 생략한다.
});

$('#s_end_date').datepicker({
  format : "yyyy-mm-dd",
  language : "ko",
  pickTime : false,
  startDate : new Date()
});
</script>
<br><br><br><br><br>
</body>
</html>