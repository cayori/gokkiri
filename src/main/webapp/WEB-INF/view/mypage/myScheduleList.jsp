<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  
  <style>

    
/* 일정 갤러리 */
ul { list-style: none;}

#hover-cap-4col .thumbnail {
	position:relative;
	overflow:hidden;	
	height: 180px;

}
.caption {
	display: none;
	position: absolute;
	top: 0;
	left: 0;
	background: rgba(0,0,0,0.4);
	width: 100%;
	height: 100%;
	color:#fff !important;
}

.jumbotron{
background-image: url('/gokkiri/resources/img/sea.JPG');
background-repeat: no-repeat;
background-position: center;
background-size: cover;
width: 100%;
height: 100%;
}


  </style>
  
  <script>

//일정 갤러리
$(document).ready(function(){
	 
    $("[rel='tooltip']").tooltip();    
 
    $('#hover-cap-4col .thumbnail').hover(
        function(){
            $(this).find('.caption').slideDown(250); //.fadeIn(250)
        },
        function(){
            $(this).find('.caption').slideUp(250); //.fadeOut(205)
        }
    );    
 
});        

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
      <div class="panel-heading" style="background-color:#266eb7;color:#fff;">
        <h4 class="panel-title" >
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1" ><b>일정 리스트</b></a>
        </h4>
      </div>
      <div id="collapse1" class="panel-collapse collapse in">
        <div class="panel-body"><a href="/gokkiri/mypage/myScheduleList.go?s_complete=1&s_private=0"><b>내 일정</b></a></div>
        <div class="panel-body"><a href="/gokkiri/mypage/zzimScheduleList.go">찜한 일정</a></div>
        <div class="panel-body"><a href="/gokkiri/mypage/sharedScheduleList.go">공유중인 일정</a></div>  
      </div>
    </div>
    
    <div class="panel panel-default">
      <div class="panel-heading">
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
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">회원정보 수정</a>
        </h4>
      </div>
      <div id="collapse3" class="panel-collapse collapse">
       <div class="panel-body"><a href="/gokkiri/member/memberModifyForm.go" >정보 수정</a></div>
        <div class="panel-body"><a href="/gokkiri/member/memberDeleteForm.go" >회원 탈퇴</a></div>
      </div>
    </div>
  </div> 
    
  </div>

    <div class="col-sm-9" style="width:73%;">
   <h1 class="text-left">
<img src="/gokkiri/resources/img/mySchedule.png" />
</h1>
<br/>



   
    <ul class="nav nav-tabs nav-tabs" role="tablist" >
    	<li class="active"><a href="/gokkiri/mypage/myScheduleList.go?s_complete=1&s_private=0"><p class="text-primary"><b>완성 일정</b></p></a></li>
    	<li class="active"><a href="/gokkiri/mypage/myScheduleList.go?s_complete=0&s_private=0"><p class="text-danger"><b>미완성 일정</b></p></a></li>      
    </ul>
 <br>
<!-- 완성 -->
<c:if test="${param.s_complete==1}">
<a href="/gokkiri/mypage/myScheduleList.go?s_complete=1&s_private=0"><span class="label label-primary">공개</span></a>
<a href="/gokkiri/mypage/myScheduleList.go?s_complete=1&s_private=1"><span class="label label-default">비공개</span></a>
</c:if>

<!-- 미완성 -->
<c:if test="${param.s_complete==0}">
<a href="/gokkiri/mypage/myScheduleList.go?s_complete=0&s_private=0"><span class="label label-primary">공개</span></a>
<a href="/gokkiri/mypage/myScheduleList.go?s_complete=0&s_private=1"><span class="label label-default">비공개</span></a>
</c:if>


<br><br>

<!-- 완성글&공개 -->      
<c:if test="${param.s_complete==1&&param.s_private==0}">
<table width="100%" align="left" cellpadding="1" cellspacing="1">
<tr>
<td align="center">   
<ul class="thumbnails" id="hover-cap-4col">
	<c:forEach var="comScheduleList" items="${comScheduleList }" varStatus="stat">
    <li class="col-md-3">
   		<font size="4" color="#266eb7"><b>#.&nbsp;${comScheduleList.s_name}&nbsp;</b></font>
        <div class="thumbnail">
            <div class="caption">
                <p><h5>≪&nbsp;${comScheduleList.s_start_date }박 ${comScheduleList.s_start_date + 1 }일 일정&nbsp;≫</h5></p>
                <p></p>
                <p>작성자 : ${comScheduleList.m_email }</p>
                <p>조회수 : ${comScheduleList.s_hit }</p>
                
                <p><a href="/gokkiri/schedule/scheduleDetail.go?s_no=${comScheduleList.s_no }&s_cate=0" class="btn btn-inverse" rel="tooltip" title="상세보기"><i class="glyphicon glyphicon-eye-open"></i></a> 
                    
                </p>
                
                <p><h4>${comScheduleList.s_detail_memo } 출발~</h4></p>
            </div>
            <!-- a_img_sav 컬럼을 s_together 컬럼명으로 바꿔서 불러옴↓↓↓ -->
            <img src="../resources/area_img/${comScheduleList.s_together }" alt="ALT NAME" class="img-responsive"  style="max-width: 100%; height: 100%;" >
        </div>
	</li>
	
	</c:forEach>
</ul>
</td>
</tr>
<td align="center"> <div class="pagination" >${pagingHtml}</div> </td>
</table>
</c:if>




<!-- 완성글&비공개 -->      
<c:if test="${param.s_complete==1&&param.s_private==1}">
<table width="100%" align="left" cellpadding="1" cellspacing="1">
<tr>
<td align="center">  
<ul class="thumbnails" id="hover-cap-4col">
	<c:forEach var="comScheduleList_p" items="${comScheduleList_p }" varStatus="stat">
    <li class="col-md-3">
   		<font size="4" color="#266eb7"><b>#.&nbsp;${comScheduleList_p.s_name}&nbsp;</b></font>
        <div class="thumbnail">
            <div class="caption">
                <p><h5>≪&nbsp;${comScheduleList_p.s_start_date }박 ${comScheduleList_p.s_start_date + 1 }일 일정&nbsp;≫</h5></p>
                <p></p>
                <p>작성자 : ${comScheduleList_p.m_email }</p>
                <p>조회수 : ${comScheduleList_p.s_hit }</p>
                
                <p><a href="/gokkiri/schedule/scheduleDetail.go?s_no=${comScheduleList_p.s_no }&s_cate=0" class="btn btn-inverse" rel="tooltip" title="상세보기"><i class="glyphicon glyphicon-eye-open"></i></a> 
                    
                </p>
                
                <p><h4>${comScheduleList_p.s_detail_memo } 출발~</h4></p>
            </div>
            <!-- a_img_sav 컬럼을 s_together 컬럼명으로 바꿔서 불러옴↓↓↓ -->
            <img src="../resources/area_img/${comScheduleList_p.s_together }" alt="ALT NAME" class="img-responsive"  style="max-width: 100%; height: 100%;" >
        </div>
	</li>
	</c:forEach>
</ul>
</td>
</tr>
<td align="center"> <div class="pagination" >${pagingHtml}</div> </td>
</table>
</c:if>





<!-- 미완성글&공개 -->      
<c:if test="${param.s_complete==0&&param.s_private==0}"> 
<table width="100%" align="left" cellpadding="1" cellspacing="1">
<tr>
<td align="center"> 
<ul class="thumbnails" id="hover-cap-4col">
	<c:forEach var="IncomScheduleList" items="${IncomScheduleList }" varStatus="stat">
    <li class="col-md-3">
   		<font size="4" color="#266eb7"><b>#.&nbsp;${IncomScheduleList.s_name}&nbsp;</b></font>
        <div class="thumbnail">
            <div class="caption">
                <p><h5>≪&nbsp;${IncomScheduleList.s_start_date }박 ${IncomScheduleList.s_start_date + 1 }일 일정&nbsp;≫</h5></p>
                <p></p>
                <p>작성자 : ${IncomScheduleList.m_email }</p>
                <p>조회수 : ${IncomScheduleList.s_hit }</p>
                
                <p><a href="/gokkiri/schedule/scheduleDetail.go?s_no=${IncomScheduleList.s_no }&s_cate=0" class="btn btn-inverse" rel="tooltip" title="상세보기"><i class="glyphicon glyphicon-eye-open"></i></a> 
                    
                </p>
                
                <p><h4>${IncomScheduleList.s_detail_memo } 출발~</h4></p>
            </div>
            <!-- a_img_sav 컬럼을 s_together 컬럼명으로 바꿔서 불러옴↓↓↓ -->
            <img src="../resources/area_img/${IncomScheduleList.s_together }" alt="ALT NAME" class="img-responsive"  style="max-width: 100%; height: 100%;" >
        </div>
	</li>
	</c:forEach>
</ul>
</td>
</tr>
<td align="center"> <div class="pagination" >${pagingHtml}</div> </td>
</table>
</c:if>



<!-- 미완성글&비공개 -->      
<c:if test="${param.s_complete==0&&param.s_private==1}"> 
<table width="100%" align="left" cellpadding="1" cellspacing="1">
<tr>
<td align="center">   
<ul class="thumbnails" id="hover-cap-4col">
	<c:forEach var="IncomScheduleList_p" items="${IncomScheduleList_p }" varStatus="stat">

    <li class="col-md-3">
   		<font size="4" color="#266eb7"><b>#.&nbsp;${IncomScheduleList_p.s_name}&nbsp;</b></font>
        <div class="thumbnail">
            <div class="caption">
                <p><h5>≪&nbsp;${IncomScheduleList_p.s_start_date }박 ${IncomScheduleList_p.s_start_date + 1 }일 일정&nbsp;≫</h5></p>
                <p></p>
                <p>작성자 : ${IncomScheduleList_p.m_email }</p>
                <p>조회수 : ${IncomScheduleList_p.s_hit }</p>
                
                <p><a href="/gokkiri/schedule/scheduleDetail.go?s_no=${IncomScheduleList_p.s_no }&s_cate=0" class="btn btn-inverse" rel="tooltip" title="상세보기"><i class="glyphicon glyphicon-eye-open"></i></a> 
                    
                </p>
                
                <p><h4>${IncomScheduleList_p.s_detail_memo } 출발~</h4></p>
            </div>
            <!-- a_img_sav 컬럼을 s_together 컬럼명으로 바꿔서 불러옴↓↓↓ -->
            <img src="../resources/area_img/${IncomScheduleList_p.s_together }" alt="ALT NAME" class="img-responsive"  style="max-width: 100%; height: 100%;" >
        </div>
	</li>

	</c:forEach>
</ul>
</td>
</tr>
<td align="center"> <div class="pagination" >${pagingHtml}</div> </td>
</table>
</c:if>

    
    

    </div>
  </div>
</div>


</body>
</html>
