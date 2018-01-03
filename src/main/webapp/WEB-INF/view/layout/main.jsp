<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>

html,body {
	height:100%;
    background:center no-repeat fixed url('/gokkiri/resources/img/cloud.jpg');
}

 section {
	padding-top:50px; 
    padding-bottom:50px; 
   /*  min-height:calc(100% - 1px);  */
}

.v-center {
    /* font-size:70px; */
    padding-bottom:20px;
}

#section1 {
	background-color: #266eb7;
    color:#d1d7ee;
}

#section4 {
	background-color: #ffffff;
    color:#f5f5f5;
}

#section5 {
    color:#f5f5f5;
}

/* 인기여행일정 리스트 */
ul { 
list-style: none;
}

#hover-cap-4co{
	text-align:center !important;
}

#hover-cap-4col .thumbnail {
	position:relative;
	overflow:hidden;	
	height: 180px;
	right: 25px;
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


/* 인기 리스트 */
/* CSS used here will be applied after bootstrap.css */
/* carousel */
.media-carousel 
{
  margin-bottom: 0;
  padding: 0 40px 30px 40px;
  margin-top: 30px;
}

/* Changes the position of the indicators */
.media-carousel .carousel-indicators 
{
  right: 50%;
  top: auto;
  bottom: 0px;
  margin-right: -19px;
}
/* Changes the colour of the indicators */
.media-carousel .carousel-indicators li 
{
  background: #c0c0c0;
}
.media-carousel .carousel-indicators .active 
{
  background: #333333;
}
.media-carousel img
{
  width: 250px;
  height: 180px
}
/* End carousel */

img {
    border-radius: 3px;
}
</style>

<script>

//인기 리스트
/* $(document).ready(function() {
  $('#media').carousel({
    pause: true,
    interval: false,
  });
}); 

$(document).ready(function() {
	  $('#media2').carousel({
	    pause: true,
	    interval: false,
	  });
	}); 

$(document).ready(function() {
	  $('#media3').carousel({
	    pause: true,
	    interval: false,
	  });
	}); 
 */
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
 
<section class="container-fluid" id="section1">
  	<h3 class="text-center v-center">
  	<p><img src='/gokkiri/resources/img/mainLogo4.png' width="300" /></p><br/>
  	</h3>
  	<div class="row">
    	<div class="col-sm-3 text-center">
          <div class="row">
          	<div class="col-sm-10 col-sm-offset-2 text-center">
          	<p><a href="/gokkiri/city/cityList.go" onmouseover="this.style.opacity='0.5'" onmouseout="this.style.opacity='1'">
          	<img src='/gokkiri/resources/img/search.png' width="70" /></a></p>
          	<h3>Search !</h3>
          	<p>전국 각지의 여행지 정보와<br/>다양한 여행일정을 찾아보세요!</p>
          	</div>
          </div>
    	</div>
        <div class="col-sm-3 text-center">
          <div class="row">
          	<div class="col-sm-10 col-sm-offset-1 text-center">
          	<p><a href="/gokkiri/schedule/scheduleWriteForm.go" onmouseover="this.style.opacity='0.5'" onmouseout="this.style.opacity='1'">
          	<img src='/gokkiri/resources/img/plan.png' width="70" /></a></p>
          	<h3>Make a Plan !</h3>
          	<p>빠르고 간단하게<br/>나만의 일정을 만들어보세요!</p>
          	</div>
          </div>
    	</div>
        <div class="col-sm-3 text-center">
          <div class="row">
          	<div class="col-sm-10 text-center">
          	<p><a href="/gokkiri/schedule/scheduleList.go?currentPage=1" onmouseover="this.style.opacity='0.5'" onmouseout="this.style.opacity='1'">
          	<img src='/gokkiri/resources/img/share.png' width="70" /></a></p>
          	<h3>Share !</h3>
          	<p>내가 만든 일정을 공유하고<br/>내 일정에 친구를 초대해보세요!</p>
          	</div>
          </div>
    	</div>
    	<div class="col-sm-3 text-center">
          <div class="row">
          	<div class="col-sm-10 text-center">
          	<p><a href="/gokkiri/tip/tipList.go" onmouseover="this.style.opacity='0.5'" onmouseout="this.style.opacity='1'">
          	<img src='/gokkiri/resources/img/tip.png' width="70" /></a></p>
          	<h3>Give a Tip !</h3> 
          	<p>여행에 관련한 팁을 얻고<br/>나의 팁도 공유해보세요!</p>
          	</div>
          </div>
    	</div>
  	</div>
</section>



<section class="container-fluid" id="section5">

<br/><br/><br/><br/><br/><br/><br/>


<table width="90%" align="center" style="background: rgba(256,256,256, 0.8);">
<tr><td>
<br/><br/><br/>
<!-- 인기 여행지 리스트  -->
<h1 class="text-center">
<a href="/gokkiri/city/cityList.go" onmouseover="this.style.opacity='0.9'" onmouseout="this.style.opacity='1'">
<img src="/gokkiri/resources/img/mainTitle1.png" />
</a>
</h1>

<table width="100%" align="center" cellpadding="1" cellspacing="1">
<tr>

<td align="center">

  <div class="row">
    <div class="col-md-12">
      <div class="carousel slide media-carousel" id="media">
        <div class="carousel-inner"> 
        	<!-- 첫번째 슬라이드(기준) -->
			<div class="item  active">
				<div class="row" >
				
				<c:forEach var="areaList" items="${areaList }" varStatus="stat">
				<c:if test="${stat.index lt 4 }">
					<div class="col-xs-6 col-md-3">
						 <a href="/gokkiri/area/areaDetail.go?a_no=${areaList.a_no }&keyword=${fn:substring(areaList.a_addr, 0, 2) }" class="thumbnail">
							<img src="/gokkiri/resources/area_img/${ areaList.a_img_sav }"><br/>
							<font size="4"><b>${areaList.a_name }&nbsp;&nbsp;<span class="glyphicon glyphicon-paperclip" aria-hidden="true"></span>${areaList.a_count }</b></font>
						</a> 
					</div>
				</c:if>
				</c:forEach>
				
				</div>
			</div>  
			<!-- 첫번째 슬라이드(기준) 끝 -->


	</div>
</div>
</div>

	</div>
	</td>
	
	</tr>
</table>

<br/><br/>
	
<!-- 인기 여행일정 리스트  -->
<h1 class="text-center">
<a href="/gokkiri/schedule/scheduleList.go" onmouseover="this.style.opacity='0.3'" onmouseout="this.style.opacity='1'">
<img src="/gokkiri/resources/img/mainTitle2.png" />
</a>
</h1>
<br/>
<table width="100%" align="center" cellpadding="1" cellspacing="1">
<tr>

<td align="center">

<div class="container">
  <div class="row">
    <div class="col-md-12">
		<ul class="thumbnails" id="hover-cap-4col" >
				
			<c:forEach var="scheduleList" items="${scheduleList }" varStatus="stat">
			<c:if test="${stat.index lt 4 }">
		    <li class="col-md-3">
		   		
		        <div class="thumbnail">
		            <div class="caption">
		            	<p><font size="4"><b>#.&nbsp;
				   		<c:if test="${fn:length(scheduleList.s_name) gt 12 }">
							<c:out value="${fn:substring(scheduleList.s_name, 0, 12) }" />..
						</c:if>
						<c:if test="${fn:length(scheduleList.s_name) le 12 }">
							${scheduleList.s_name }
						</c:if>
				   		</b></font></p>
				   		
		                <p><h5>≪&nbsp;${scheduleList.s_start_date }박 ${scheduleList.s_start_date + 1 }일 일정&nbsp;≫</h5></p>
		                <p></p>
		                <p>작성자 : ${scheduleList.m_email }</p>
		                <p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>&nbsp;${scheduleList.s_hit }</p>
		                
		                <p><a href="schedule/scheduleDetail.go?s_no=${scheduleList.s_no }&s_cate=0" data-toggle="tooltip" title="상세보기"><img src="/gokkiri/resources/img/view.png" width="25" /></a></p>
                
		            </div>
		            <!-- a_img_sav 컬럼을 s_together 컬럼명으로 바꿔서 불러옴↓↓↓ -->
		            <img src="/gokkiri/resources/area_img/${scheduleList.s_together }" alt="ALT NAME" class="img-responsive"  style="max-width: 100%; height: 100%;" >
		        </div>
			</li>
			</c:if>
			</c:forEach>
		
		</ul>

</div>
</div>

	</div>
	</td>
	
	</tr>
</table>
	
<br/><br/><br/>

<!-- 인기 여행Tip 리스트  -->  
<h1 class="text-center">
<a href="/gokkiri/tip/tipList.go" onmouseover="this.style.opacity='0.9'" onmouseout="this.style.opacity='1'">
<img src="/gokkiri/resources/img/mainTitle3.png" />
</a>
</h1>

<table width="100%" align="center" cellpadding="1" cellspacing="1">
<tr>

<td align="center">

  <div class="row">
    <div class="col-md-12">
      <div class="carousel slide media-carousel" id="media3">
        <div class="carousel-inner"> 
        	<!-- 첫번째 슬라이드(기준) -->
			<div class="item  active">
			<div class="row" >
			
 				<c:forEach var="tipList" items="${tipList }" varStatus="stat">
				<c:if test="${stat.index lt 4 }">
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
			<!-- 첫번째 슬라이드(기준) 끝 -->
	
	</div>
</div>
</div>

	</div>
	</td>
	
	</tr>
</table>

<br/><br/>

</td></tr>
</table>
	
<br/><br/><br/><br/>

</section>


</body>
</html>