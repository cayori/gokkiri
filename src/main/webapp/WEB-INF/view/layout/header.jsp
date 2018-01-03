<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>

  .navbar {
      margin-bottom: 0;
      background-color: #266eb7;
      background: rgba(38,110,183,1) !important;
      z-index: 9999;
      border: 0;
      font-size: 12px !important;
      line-height: 1.42857143 !important;
      letter-spacing: 4px;
      border-radius: 0;
      font-family: Montserrat, sans-serif;
  }
  .navbar li a, .navbar .navbar-brand {
      color: #ffffff !important;
  }
  .navbar-nav li a:hover, .navbar-nav li.active a {
      color: #266eb7 !important;
      background-color: #ffffff !important;
  }
  .navbar-default .navbar-toggle {
      border-color: transparent;
      color: #ffffff !important;
  }

  
  /*드롭다운 메뉴*/
  #dm {
  margin-bottom: 0;
  background: rgba(38,110,183,1) !important;
  z-index: 9999;
  border: 0;
 font-size: 12px !important;
 line-height: 1.42857143 !important;
  letter-spacing: 4px;
  border-radius: 0;
  font-family: Montserrat, sans-serif;
 
  }

 /*모달*/
  .modal{
   padding-top:50px; 
   }
  .modal-content{
  text-align:center;
  }

</style>
<script>

</script>
</head>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container2">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="/gokkiri/main.go">　<b>Go끼리</b>　</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-center">
        <li><a href="/gokkiri/city/cityList.go">여행지</a></li>
        <li><a href="/gokkiri/schedule/scheduleWriteForm.go">일정 만들기</a></li>
        <li><a href="/gokkiri/schedule/scheduleList.go?currentPage=1">일정 게시판</a></li>
        <li><a href="/gokkiri/tip/tipList.go">여행Tip</a></li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">      	 
		<c:if test="${session_m_name == null}">
			<li>
				<a data-toggle="modal" data-target="#login">로그인</a>
			</li>
			<li><a href="/gokkiri/member/joinForm.go">회원가입</a></li>
		</c:if>
			
		<c:if test="${session_m_name != null }">
			<li><a href="#" data-toggle="modal" data-target="#push">${session_m_name}&nbsp;님<span class="badge">${session_pushCount }</span></a></li>	
			<li><a href="/gokkiri/member/logout.go">Logout</a></li>
			<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Mypage</a>
			
			<ul class="dropdown-menu" id="dm">
           	 	<li><a href="/gokkiri/mypage/myScheduleList.go?s_complete=1&s_private=0">일정 보기</a></li>
        		<li><a href="/gokkiri/mypage/myTipList.go">내가쓴 글 보기</a></li>
        		<li><a href="/gokkiri/member/memberModifyForm.go">회원정보 수정</a></li>
       		 </ul>
			</li>
			
		</c:if>
      </ul>
    </div>
  </div>
</nav>

<script>
$('.dropdown-toggle').dropdown()
</script>


<!-- 로그인 모달 -->


<div id="login" class="modal fade" role="dialog">
	<div class="modal-dialog">
		 <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style=" background-color: #f4511e; color:white !important; text-align: center; font-size: 30px;padding:35px 50px;" >
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         <!--  <h1 class="text-center" >
			<img src="/gokkiri/resources/img/LoginLogo.png" />
		  </h1> -->
          <h4><span class="glyphicon glyphicon-lock"></span> 로그인</h4>
        </div>
        
        
        <div class="modal-body" style="padding:40px 50px;">
         <form id="schDownload" action="/gokkiri/member/login.go" method="post" class="form-inline">
            <div class="form-group" style="width:100%;">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> 이메일</label>
              <input type="text" name="m_email" class="form-control" id="email" placeholder="Enter email" style="width:100%;">
            </div>
            
            <br><br>
            
            <div class="form-group" style="width:100%;">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> 비밀번호</label>
              <input type="password" name="m_pw" class="form-control" id="psw" placeholder="Enter password" style="width:100%;">
            </div>
            
            <br><br><br>
            <p align="center"><button  type="submit" class="btn btn-default"cm><span class="glyphicon glyphicon-off"></span> 로그인</button>
       		&nbsp;<button type="submit" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> 취소</button></p>
             
         </form>
        </div>
        

          <div class="modal-footer center" style="background-color: #f9f9f9;">
						<p align="left">회원이 아니신가요? <a href="/gokkiri/member/joinForm.go">회원가입</a></p>
          				<p align="left">비밀번호를 잊으셨나요? <a href="/gokkiri/member/findForm.go">비밀번호 찾기</a></p>
          			</div>
        
      
      </div>

	
		</div>
		</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
<!-- 로그인 모달 끝 -->

<!-- 알림 모달 -->
  <!-- Modal -->
  <div class="modal fade" id="push" role="dialog">
    <div class="modal-dialog" >
    
      <!-- Modal content-->
      <div class="modal-content">
      
        <div class="modal-header" style="background-color: #f4511e;  color:white !important; text-align: center; font-size: 30px; padding:20px 30px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <img src='/gokkiri/resources/img/share.png' width="30" /><h3>일정 공유 신청 현황</h3>
        </div>
        
        <div class="modal-body">
        
     <div class="table-responsive">          
  <table class="table">
    <thead>
      <tr>
        <th><b>No</b></th>
        <th><b>From</b></th>
        <th><b>Plan Name</b></th>
        <th><b>Date</b></th>
        <th>Join</th>
      </tr>
    </thead>
    <tbody>
  
    	
     <c:forEach var="pushList" items="${session_pushList}" varStatus="stat">
     <tr>
        <td>${pushList.s_no }</td>
        <td>${pushList.m_email}</td>
        <td><a href="/gokkiri/schedule/scheduleDetail.go?s_no=${pushList.s_no }&s_cate=0"><b>${pushList.s_name}</b></a></td>
        <td>${pushList.s_start_date}~${pushList.s_end_date}</td>
        <td>
      		<a href="/gokkiri/push/updateTogether.go?s_together=${pushList.s_together}&s_no=${pushList.s_no}&s_state=1">수락</a> 
     		/ <a href="/gokkiri/push/updateTogether.go?s_together=${pushList.s_together}&s_no=${pushList.s_no}&s_state=2">거절</a>
      	</td>

      </tr>
     </c:forEach>
      
    </tbody>
    
  </table>
</div>
</div>
<br><br><br><br><br><br><br><br>
<div class="modal-footer" style="background-color: #f9f9f9; padding:35px 50px;">
          
          <!-- <p>Not a member? <a href="#">Sign Up</a></p>
          <p>Forgot <a href="#">Password?</a></p> -->
        </div>



</div></div></div>

<!-- 알림 모달 끝 -->



</body>
</html>