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
<style>
/*일정 검색*/
 .panel{
 background-color: #f5f5f5;
 text-align:center;

} 

div.panel-heading{
width: 120px;
height: 50px;
display: inline-blㅊock;
}

div.panel-body{
width: 120px;
height: 50px;
display: inline-block;
}

.jumbotron{
background-image: url('/gokkiri/resources/img/cloud3.jpg');
background-repeat: no-repeat;
background-position: center;
background-size: cover;
width: 100%;
height: 100%;
}

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

img {
    border-radius: 3px;
}
</style>

<script>

//일정 검색
$('#accordion').on('shown.bs.collapse', function () {
	  
	  var panel = $(this).find('.in');
	  
	  $('html, body').animate({
	        scrollTop: panel.offset().top
	  }, 500);
	  
	});

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
<center>

<!-- 상단 이미지 + 일정 검색 -->
<div class="jumbotron text-center">
  <form class="form-inline">
  	<p><font color="#ffffff" size="10"><b>일정을 공유해보세요!</b></font></p>
  	<p><font color="#ffffff" size="3">여러 일정을 찜하고 내 일정으로 스크랩할 수 있어요. 일정을 검색해보세요!</font></p>

        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#search">
        <span class="glyphicon glyphicon-flag" aria-hidden="true"></span>&nbsp;&nbsp;출발지역으로 검색</button>

  </form>
</div>

			<!-- 출발지역으로 검색하기 모달 -->
				<div id="search" class="modal fade" role="dialog">
  					<div class="modal-dialog">
   						<!-- Modal content-->
   							<form action="scheduleList.go">
							<div class="modal-content">
								<div class="modal-header">
									<h4><span class="glyphicon glyphicon-flag" aria-hidden="true"></span>
									&nbsp;출발 지역을 선택해주세요</h4>
								</div>
								
								<div class="modal-body">
									<br/>
									<input type="hidden" name="currentPage" value="1">
									<div class="btn-group btn-group-justified" role="group" aria-label="...">
									  <div class="btn-group" role="group">
									    <button type="submit" class="btn btn-default" name="keyword" value="서울">서울</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="submit" class="btn btn-default" name="keyword" value="부산">부산</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="submit" class="btn btn-default" name="keyword" value="대구">대구</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="submit" class="btn btn-default" name="keyword" value="인천">인천</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="submit" class="btn btn-default" name="keyword" value="광주">광주</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="submit" class="btn btn-default" name="keyword" value="대전">대전</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="submit" class="btn btn-default" name="keyword" value="울산">울산</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="submit" class="btn btn-default" name="keyword" value="경기">경기</button>
									  </div>
									</div>
									<br/>
									<div class="btn-group btn-group-justified" role="group" aria-label="...">
									  <div class="btn-group" role="group">
									    <button type="submit" class="btn btn-default" name="keyword" value="강원">강원</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="submit" class="btn btn-default" name="keyword" value="충북">충북</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="submit" class="btn btn-default" name="keyword" value="충남">충남</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="submit" class="btn btn-default" name="keyword" value="전북">전북</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="submit" class="btn btn-default" name="keyword" value="전남">전남</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="submit" class="btn btn-default" name="keyword" value="경북">경북</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="submit" class="btn btn-default" name="keyword" value="경남">경남</button>
									  </div>
									  <div class="btn-group" role="group">
									    <button type="submit" class="btn btn-default" name="keyword" value="제주">제주</button>
									  </div>
									</div>
									
									<br/>
								</div>
								<div class="modal-footer">
						            <button type="submit" class="btn btn-primary">모두 보기</button>
									<button type="button" class="btn btn-default" data-dismiss="modal">나가기</button>
						        </div>
							</div>
							</form>
					</div>
				</div>
			<!--  출발지역으로 검색하기  모달 끝 -->

<!-- ------------- -->
<br/>
<c:if test="${param.keyword != null }">
	<table width="80%" align="center">
	<tr><td align="center">
	<font color="red">* 출발 지역으로 검색 : '${param.keyword }'</font>
	<br/><hr/><br/><br/>
	</td></tr>
	</table>
</c:if>

<c:if test="${fn:length(scheduleList) lt 1 }">

<br/><br/><br/><br/><br/><br/><br/>
등록된 일정이 없습니다.<br/>
일정을 등록해주세요!
<br/><br/><br/><br/><br/><br/><br/>

</c:if>

<c:if test="${param.keyword == null }">
<!-- 인기 여행일정 리스트  -->
<h1 class="text-center">
<a>
<img src="/gokkiri/resources/img/mainTitle2.png" />
</a>
</h1>
<br/>
<table width="70%" align="center" cellpadding="1" cellspacing="1">
<tr>

<td align="center">

<div class="container">
  <div class="row">
    <div class="col-md-12">
		<ul class="thumbnails" id="hover-cap-4col" >
				
			<c:forEach var="bestScheduleList" items="${bestScheduleList }" varStatus="stat">
			<c:if test="${stat.index lt 4 }">
		    <li class="col-md-3">
		   		
		        <div class="thumbnail">
		            <div class="caption">
		            	<p><font size="4"><b>#.&nbsp;
				   		<c:if test="${fn:length(bestScheduleList.s_name) gt 12 }">
							<c:out value="${fn:substring(bestScheduleList.s_name, 0, 12) }" />..
						</c:if>
						<c:if test="${fn:length(bestScheduleList.s_name) le 12 }">
							${bestScheduleList.s_name }
						</c:if>
				   		</b></font></p>
				   		
		                <p><h5>≪&nbsp;${bestScheduleList.s_start_date }박 ${bestScheduleList.s_start_date + 1 }일 일정&nbsp;≫</h5></p>
		                <p></p>
		                <p>작성자 : ${bestScheduleList.m_email }</p>
		                <p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>&nbsp;${bestScheduleList.s_hit }</p>
		                
		                <p><a href="scheduleDetail.go?currentPage=${param.currentPage }&s_no=${bestScheduleList.s_no }&s_cate=0" data-toggle="tooltip" title="상세보기"><img src="/gokkiri/resources/img/view.png" width="25" /></a></p>
                
		            </div>
		            <!-- a_img_sav 컬럼을 s_together 컬럼명으로 바꿔서 불러옴↓↓↓ -->
		            <img src="/gokkiri/resources/area_img/${bestScheduleList.s_together }" alt="ALT NAME" class="img-responsive"  style="max-width: 100%; height: 100%;" >
		        </div>
			</li>
			</c:if>
			</c:forEach>
		
		</ul>

</div>
</div>

	</div>
	<hr/>
	</td>
	</tr>
</table>
</c:if>

<div class="container">
  <div class="row">
    <div class="col-md-12">
    
<ul class="thumbnails" id="hover-cap-4col">
	<c:forEach var="scheduleList" items="${scheduleList }" varStatus="stat">
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
                
                <p><a href="scheduleDetail.go?currentPage=${param.currentPage }&s_no=${scheduleList.s_no }&s_cate=0" data-toggle="tooltip" title="상세보기"><img src="/gokkiri/resources/img/view.png" width="25" /></a></p>
                
                <p><h4>${scheduleList.s_detail_memo } 출발~</h4></p>
            </div>
            <!-- a_img_sav 컬럼을 s_together 컬럼명으로 바꿔서 불러옴↓↓↓ -->
            <img src="../resources/area_img/${scheduleList.s_together }" alt="ALT NAME" class="img-responsive"  style="max-width: 100%; height: 100%;" >
        </div>
	</li>
	</c:forEach>
</ul>
    </div>
  </div>
</div>

<ul class="pagination">
			${pagingHtml}
</ul>

<br/><br/>

</center>
<div>
    <a href="#" class="jcm-top"><img src="../resources/img/arrow-up.png" style="margin-bottom: 40px;width: 40px;"></a>
</div>
</body>
</html>