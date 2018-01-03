<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
/*이미지 슬라이드*/
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      height: 400px;
      margin: auto;
  }
/*이미지 슬라이드 끝*/


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
.media-carousel img
{
  width: 200px;
  height: 130px
}

img {
    border-radius: 3px;
}
</style>
<script>

//게시글 수정 스크립트
function cityModify(){
	if(confirm("글을 수정하시겠습니까?") == true){
		location.href='cityModifyForm.go?c_no=${cityModel.c_no}&keyword=${param.keyword}';	
	}else{
		return;
	}
}

//게시글 삭제 스크립트
function cityDelete(){
	if(confirm("글을 삭제하시겠습니까?") == true){
		location.href='cityDelete.go?c_no=${cityModel.c_no}';
	}else{
		return;
	}
}

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

<c:if test="${param.keyword ne 'info' }">
<br/><br/>

<table width="85%" border="0" align="center">

		<tr>
			<td colspan="3">
				<ul class="nav nav-tabs nav-justified" >
  					<li><a href="/gokkiri/city/cityDetail.go?c_no=${param.c_no }&keyword=${param.keyword}">홈</a></li>
					<li><a href="/gokkiri/area/areaList.go?c_no=${param.c_no }&a_cate=0&keyword=${param.keyword}">관광지</a></li>
					<li><a href="/gokkiri/area/areaList.go?c_no=${param.c_no }&a_cate=1&keyword=${param.keyword}">맛집</a></li>
					<li><a data-toggle="modal" data-target="#scheduleList">여행일정 보기</a></li>
				</ul>
			</td>
		</tr>
		
</table>

<!-- 관련 여행일정 보기 -->
			
<div id="scheduleList" class="modal fade" role="dialog">
<div class="modal-dialog" style="width:80%;">
	<!-- Modal content-->
				<form action="/gokkiri/schedule/scheduleList.go">
				<div class="modal-content">
					<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"><b><font color="#266eb7">＜${param.keyword }＞</font>&nbsp;</b>관련 여행일정 보기</h4>
					</div>
				
					<div class="modal-body" style="padding-left: 0px; padding-right: 35px;">
					
					<table width="100%" align="center"><tr><td>
					<input type="hidden" name="currentPage" value="1">
					<input type="hidden" name="keyword" value="${param.keyword }" />
					<ul class="thumbnails" id="hover-cap-4col">
					<c:forEach var="scheduleList" items="${scheduleList }" varStatus="stat">
					<c:if test="${stat.index lt 8 }">
					
				    <li class="col-md-3">
				   		<font size="2" color="#266eb7"><b>no.&nbsp;${scheduleList.s_no}</font><br/>
				   		<font size="4" color="#266eb7">
				   		<c:if test="${fn:length(scheduleList.s_name) gt 13 }">
							<c:out value="${fn:substring(scheduleList.s_name, 0, 13) }" />..
						</c:if>
						<c:if test="${fn:length(scheduleList.s_name) le 13 }">
							${scheduleList.s_name }
						</c:if>
				   		</b></font>
				        <div class="thumbnail">
				            <div class="caption">
				                <p><h5>≪&nbsp;${scheduleList.s_start_date }박 ${scheduleList.s_start_date + 1 }일 일정&nbsp;≫</h5></p>
				                <p></p>
				                <p>작성자 : ${scheduleList.m_email }</p>
				                <p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>&nbsp;${scheduleList.s_hit }</p>
				                
				                <p><a href="/gokkiri/schedule/scheduleDetail.go?s_no=${scheduleList.s_no }&s_cate=0" data-toggle="tooltip" title="상세보기"><img src="/gokkiri/resources/img/view.png" width="25" /></a></p>
				                
				                <p><h4>${scheduleList.s_detail_memo } 출발~</h4></p>
				            </div>
				            <!-- a_img_sav 컬럼을 s_together 컬럼명으로 바꿔서 불러옴↓↓↓ -->
				            <img src="/gokkiri/resources/area_img/${scheduleList.s_together }" alt="ALT NAME" class="img-responsive"  style="max-width: 100%; height: 100%;" >
				        </div>
					</li>
					
					</c:if>
					</c:forEach>
					</ul>
					</td></tr>
					
					<tr><td>
					</td></tr>
					</table>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">더보기</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">나가기</button>
			</div>
		</div>
		</form>
</div>
</div>
 			
			<!-- 관련 여행일정 보기 끝 -->

<br/><br/>
</c:if>
<table width="70%" align="center">
	<c:if test="${session_m_email == 'admin' }">
	<tr>
		<td align="right">
			<button type="button" class="btn btn-default" onclick="cityModify();">수정</button>
			<button type="button" class="btn btn-default" onclick="cityDelete();">삭제</button>
		</td>
	</tr>
	</c:if>
</table>

<br/><br/>

<table width="70%" align="center">

<tr><td>
<div class="panel panel-default">
  <div class="list-group-item active" align="center">
	 <b><font size="5"><span class="glyphicon glyphicon-flag" aria-hidden="true"></span>&nbsp;${cityModel.c_name}</font></b>
  </div>
  <div class="panel-body">
  
<!-- 이미지 슬라이드 -->   
<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="2000"  style="width:100%;">
  <!-- Indicators -->
   <ol class="carousel-indicators">
   <c:forEach var="city_imgList" items="${city_imgList }" varStatus="stat"> 
  	 <c:choose>
   		<c:when test="${stat.index == 0 }">
    		<li data-target="#myCarousel" data-slide-to="${stat.index }" class="active"></li>
  		</c:when>

   	 <c:otherwise>
   		 <li data-target="#myCarousel" data-slide-to="${stat.index }"></li>
   	 </c:otherwise>
   	 </c:choose>
  </c:forEach>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
  
  <c:forEach var="city_imgList" items="${city_imgList }" varStatus="stat">
  
  <c:choose>
  <c:when test="${stat.index == 0 }">
    <div class="item active">
      <img src="../resources/city_img/${city_imgList.c_img_sav }" alt="Chania" style="width:100%; height:500px;">
      <div class="carousel-caption">
      </div>
    </div>
  </c:when>
  <c:otherwise>
     <div class="item">
      <img src="../resources/city_img/${city_imgList.c_img_sav }" alt="Chania" style="width:100%; height:500px;">
      <div class="carousel-caption">
      </div>
    </div>
  </c:otherwise>
  </c:choose>
    
  </c:forEach>
  
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<!-- 이미지 슬라이드 끝 -->
  
</div>
</div>
</td></tr>
</table>

<table width="70%" align="center">
	<tr>
		<td align="left">
		<div class="panel panel-default">
			<div class="panel-heading"><b><font size="3">· 설명</font></b></div>
			<div class="panel-body">${cityModel.c_con }</div>
		</div>
		</td>
	</tr>
</table>

<br/>
<!-- 인기 여행지 리스트  -->
<h1 class="text-center">
<img src="/gokkiri/resources/img/mainTitle1.png"/>
</h1>
<br/>
<table width="70%" align="center" cellpadding="1" cellspacing="1">
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
							<font size="4"><b>
							<c:if test="${fn:length(areaList.a_name) gt 7 }">
							<c:out value="${fn:substring(areaList.a_name, 0, 7) }" />..
							</c:if>
							<c:if test="${fn:length(areaList.a_name) le 7 }">
								${areaList.a_name }
							</c:if>
							&nbsp;&nbsp;<span class="glyphicon glyphicon-paperclip" aria-hidden="true"></span>${areaList.a_count }</b></font>
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

<table border="0" width="70%" align="center">  
	<tr>
		<td align="center">
		
		<div class="btn-group btn-group-justified" role="group" aria-label="...">
  			<div class="btn-group" role="group">
				<button type="button" class="btn btn-primary"><b><font size="5">REVIEW&nbsp;<span class="badge">${revCount }</font></b></span></button>
  			</div>
  			<div class="btn-group" role="group">
				<button type="button" class="btn btn-primary-disabled" onclick="javascript:location='/gokkiri/qna/cityqnaList.go?c_no=${param.c_no}'"><b><font size="5">QNA&nbsp;<span class="badge">${qnaCount }</font></b></span></button>
 			</div>
		</div>
		</td>
	</tr>
</table>

<br/><br/>

<table border="0" width="70%" align="center"> 
	<c:if test="${fn:length(areaReviewList) lt 1 }">
	<tr><td align="center">
	<br/><br/>등록된 리뷰가 없습니다. 관광지/맛집 리뷰를 등록해주세요<br/><br/>
	</td></tr>
	</c:if>  
   <c:forEach var="areaReviewList" items="${areaReviewList }">
   <tr>
      <td>
         <br/>
         <b>
         <a href="/gokkiri/area/areaDetail.go?a_no=${areaReviewList.a_no}&keyword=${param.keyword }">
         <c:if test="${areaReviewList.a_cate == 0}">
         	<font color="#266eb7"><span class="glyphicon glyphicon-camera" aria-hidden="true"></span></font>
         </c:if>
         <c:if test="${areaReviewList.a_cate == 1 }">
         	<font color="#266eb7"><span class="glyphicon glyphicon-cutlery" aria-hidden="true"></span></font>
         </c:if>
         ${areaReviewList.a_name }</a>&nbsp;&nbsp;<font color="gray" size="3">${areaReviewList.m_email }</font></b>
          / <fmt:formatDate value="${areaReviewList.r_date }" pattern="yyyy.MM.dd" />
         <br/><br/>
         ${areaReviewList.r_con }
         <br/><br/>
      </td>
      <td width="100" align="center">
      <font color="#ffe616" size="5">
         <c:choose>
         <c:when test="${areaReviewList.r_score == 5 }">
         ★★★★★
         </c:when>
         <c:when test="${areaReviewList.r_score == 4 }">
         ★★★★
         </c:when>
         <c:when test="${areaReviewList.r_score == 3 }">
         ★★★
         </c:when>
         <c:when test="${areaReviewList.r_score == 2 }">
         ★★
         </c:when>
         <c:when test="${areaReviewList.r_score == 1 }">
         ★
         </c:when>
         </c:choose>
      </font>
      </td>
   </tr>
   <tr height="1">
      <td bgcolor="gray" colspan="2"></td>
   </tr>
   </c:forEach>
</table>

<c:if test="${param.keyword eq 'info' }">
<table width="70%" align="center">
<tr>
<td>
<button type="button" class="btn btn-primary btn-lg btn-block" onclick="javascript:self.close();">닫기</button>
</td>
</tr>
</table>
</c:if>
<c:if test="${param.keyword ne 'info' }">
<br/><br/><br/><br/>
</c:if>
<div>
    <a href="#" class="jcm-top"><img src="../resources/img/arrow-up.png" style="margin-bottom: 40px;width: 40px;"></a>
    </div>
</body>
</html>