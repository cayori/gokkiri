<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>회원 탈퇴</title>

<style>
.jumbotron{
background-image: url('/gokkiri/resources/img/sea.JPG');
background-repeat: no-repeat;
background-position: center;
background-size: cover;
width: 100%;
height: 100%;
}

</style>

<script language="javascript">
function check(){
   if(document.deleteform.m_pw.value==""){
      alert("비밀번호를 입력하세요");
      document.deleteform.m_pw.focus();
      return false;
   }
   return true;
}
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
       <div class="panel-body"><a href="/gokkiri/member/memberModifyForm.go" >정보 수정</a></div>
        <div class="panel-body"><a href="/gokkiri/member/memberDeleteForm.go" ><b>회원 탈퇴</b></a></div>
      </div>
    </div>
  </div> 
    
  </div>

    <div class="col-sm-9" style="width:73%;">
 <h1 class="text-left">
<img src="/gokkiri/resources/img/delete.png" />
</h1>
<br/>
  <form action="memberDelete.go" method="post" name="deleteform" onsubmit="return check();">
  
 <div class="form-group" style="width:50%;">
  <label class="control-label" for="focusedInput">*비밀번호 입력 후 회원탈퇴 처리 됩니다.</label>
  <div class="input-group">
    <input class="form-control" id="focusedInput" name="m_pw" type="password" placeholder="비밀번호를 입력하세요.">
    <span class="input-group-btn">
      <button class="btn btn-default" type="submit">회원탈퇴</button>
        <button type="reset" class="btn btn-default"><span class="glyphicon glyphicon-remove"></span>&nbsp;취소</button>
    </span>
  </div>
</div>


  </form>
</div>
</div>
</div>

<br><br><br><br><br>
</body>
</html>