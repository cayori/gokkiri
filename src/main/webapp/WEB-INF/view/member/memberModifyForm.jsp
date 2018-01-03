<%@ page contentType="text/html; charset=euc-kr"%>
<html>
<head>
<style>
.jumbotron{
background-image: url('/gokkiri/resources/img/sea.JPG');
background-repeat: no-repeat;
background-position: center;
background-size: cover;
width: 100%;
height: 100%;
}

/*등록하기 버튼 */
.button {
  padding: 10px 10px;
  font-size: 16px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #fff;
  background-color: #f4511e;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}
.button:hover {background-color: #cc441a}
.button:active {
  background-color: #cc441a;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
</style>

<script language="javascript">
function check(){
   var reg = document.memberModifyForm;
   
   if(reg.m_pw.value==""){
      alert("비밀번호를 입력해주세요");
      reg.m_pw.focus();
      return false;
   }
   else if(reg.m_pw.value != reg.m_pw2.value){
      alert("비밀번호가 일치하지 않습니다.");
      reg.m_pw2.focus();
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

function openNameChk(memberModifyForm){
   var url="nameDuplChk.go?m_name="+document.memberModifyForm.m_name.value;
   var reg=document.memberModifyForm;
   
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
<!-- 상단 이미지-->
<div class="jumbotron text-center">
  <form class="form-inline">
     <br><br>
     <p><font color="#ffffff" size="10"><b>한국, 어디까지 가봤니?</b></font></p>
     <br><br>
  </form>
</div>
<br>


<!-- 카테고리 -->
<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-3">
    
   <div class="panel-group" id="accordion" style="width: 80%; margin-left:5%;" >
  
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title" >
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1" >일정 리스트</a>
        </h4>
      </div>
      <div id="collapse1" class="panel-collapse collapse">
        <div class="panel-body"><a href="/gokkiri/mypage/myScheduleList.go?s_complete=1&s_private=0">내 일정</a></div>
        <div class="panel-body"><a href="/gokkiri/mypage/zzimScheduleList.go">찜한 일정</a></div>
        <div class="panel-body"><a href="/gokkiri/mypage/sharedScheduleList.go">공유중인 일정</a></div>  
      </div>
    </div>
    
    <div class="panel panel-default">
      <div class="panel-heading" >
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">내가쓴 글 리스트</a>
        </h4>
      </div>
      <div id="collapse2" class="panel-collapse collapse">
      <div class="panel-body"><a href="/gokkiri/mypage/myTipList.go">여행 Tip</a></div>
        <div class="panel-body"><a href="/gokkiri/mypage/myAreaReviewList.go">리뷰</a></div>
        <div class="panel-body"><a href="/gokkiri/mypage/myQnaList.go">QnA</a></div>
         
      </div>
    </div>
    
    <div class="panel panel-default">
      <div class="panel-heading" style="background-color:#266eb7;color:#fff;">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3"><b>회원정보 수정</b></a>
        </h4>
      </div>
      <div id="collapse3" class="panel-collapse collapse in">
       <div class="panel-body"><a href="/gokkiri/member/memberModifyForm.go" ><b>정보 수정</b></a></div>
        <div class="panel-body"><a href="/gokkiri/member/memberDeleteForm.go" >회원 탈퇴</a></div>
      </div>
    </div>
  </div> 
    
  </div>

<div class="col-sm-9" style="width:60%;" >
 <h1 class="text-left">
<img src="/gokkiri/resources/img/info.png" />
</h1>
<br/>
 
 <form action="memberModify.go" name="memberModifyForm" method="post" onsubmit="return check();">


        
   <div class="form-group" style="width:50%;" >
     <label class="control-label" for="disabledInput">이메일:</label>
     <input type="hidden" value="${member.m_email}" name="m_email" />
     <input class="form-control" id="disabledInput"  name="m_email" type="text" placeholder="${member.m_email}" disabled="">
   </div>
    

       <br>
     <div class="form-group" style="width:50%;">
     <label class="control-label" for="focusedInput">비밀번호:</label>
     <input class="form-control" id="focusedInput" name="m_pw" type="password" placeholder="비밀번호를 입력하세요.">
   </div>
   
     <br>   
    <div class="form-group has-error" style="width:50%;">
     <label class="control-label" for="inputError">비밀번호 확인:</label>
     <input class="form-control" id="inputError" name="m_pw2" type="password" placeholder="비밀번호를 다시한번 입력하세요.">
   </div>


   <br>  
  <div class="form-group" style="width:50%;">
  <label class="control-label">이름:</label>
  <div class="input-group">
    <input name="m_name" type="text" class="form-control" placeholder="닉네임을 입력하세요.">
    <span class="input-group-btn">
      <button class="btn btn-default" onclick="openNameChk(this.form)" name="confirmName" type="button">중복확인</button>
    </span>
  </div>
</div>
    
   <br><br><br><br>
    <div class="form-group" align="right" style="width:50%;">
      <div class="col-lg-10 col-lg-offset-2">
      <button type="submit" class="button">정보 수정</button>
      <button type="reset" class="btn btn-default"><span class="glyphicon glyphicon-remove"></span>&nbsp;취소</button>
        
      </div>
    </div>

</form>
</div>
</div>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>