<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
</style>

<style>
.myButton {
   -moz-box-shadow: inset 0px 1px 0px 0px #ffffff;
   -webkit-box-shadow: inset 0px 1px 0px 0px #ffffff;
   box-shadow: inset 0px 1px 0px 0px #ffffff;
   background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f9f9f9
      ), color-stop(1, #e9e9e9));
   background: -moz-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
   background: -webkit-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
   background: -o-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
   background: -ms-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
   background: linear-gradient(to bottom, #f9f9f9 5%, #e9e9e9 100%);
   filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f9f9f9',
      endColorstr='#e9e9e9', GradientType=0);
   background-color: #f9f9f9;
   -moz-border-radius: 6px;
   -webkit-border-radius: 6px;
   border-radius: 6px;
   border: 1px solid #dcdcdc;
   display: inline-block;
   cursor: pointer;
   color: #666666;
   font-family: Arial;
   font-size: 15px;
   font-weight: bold;
   padding: 6px 24px;
   text-decoration: none;
   text-shadow: 0px 1px 0px #ffffff;
}

.myButton:hover {
   background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #e9e9e9
      ), color-stop(1, #f9f9f9));
   background: -moz-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
   background: -webkit-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
   background: -o-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
   background: -ms-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
   background: linear-gradient(to bottom, #e9e9e9 5%, #f9f9f9 100%);
   filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#e9e9e9',
      endColorstr='#f9f9f9', GradientType=0);
   background-color: #e9e9e9;
}

.myButton:active {
   position: relative;
   top: 1px;
}

.media-carousel img
{
  width: 250px;
  height: 180px
}
</style>

<script>
   //일정 갤러리
   $(document).ready(function() {

      $("[rel='tooltip']").tooltip();

      $('#hover-cap-4col .thumbnail').hover(function() {
         $(this).find('.caption').slideDown(250); //.fadeIn(250)
      }, function() {
         $(this).find('.caption').slideUp(250); //.fadeOut(205)
      });

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
      <div class="panel-heading" style="background-color:#266eb7;color:#fff;">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2"><b>내가쓴 글 리스트</b></a>
        </h4>
      </div>
      <div id="collapse2" class="panel-collapse collapse in">
      <div class="panel-body"><a href="/gokkiri/mypage/myTipList.go"><b>여행 Tip</b></a></div> 
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
<img src="/gokkiri/resources/img/myTip.png" />
</h1>
<br/>
<table width="80%" align="left" cellpadding="1" cellspacing="1">
<tr>

<td align="center">

  <div class="row">
    <div class="col-md-12">
      <div class="carousel slide media-carousel" id="media3">
        <div class="carousel-inner"> 
         <div class="item  active">
         <div class="row" >

         	<c:forEach var="tipList" items="${tipList }" varStatus="stat">
            <c:if test="${stat.index lt 8 }">
               <div class="col-xs-6 col-md-3">
                  <a href="/gokkiri/tip/tipDetail.go?t_no=${tipList.t_no }&a_no=${tipList.a_no}" class="thumbnail">
                     <img src="/gokkiri/resources/tip_img/${ tipList.t_img_sav }"><br/>
                     <font size="4"><b>${tipList.t_sub }&nbsp;&nbsp;<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>${tipList.t_hit }</b></font>
                  </a>
               </div>
            </c:if>
            </c:forEach> 
            
            
            
            
            
            
            
         
         </div>
         </div>  

   
   </div>
</div>
</div>

   </div>
   <hr/>
</td></tr>
<td align="center"> <div class="pagination" >${pagingHtml}</div> </td>
</table>  
     
    </div>   
    </div>
    </div>


</body>
</html>