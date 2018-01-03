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
      width: 80%;
      margin: auto;
  }
/*이미지 슬라이드 끝*/

/*지도 로드뷰*/
#container {overflow:hidden;height:300px;position:relative;}
#btnRoadview,  #btnMap {position:absolute;top:5px;left:5px;padding:7px 12px;font-size:14px;border: 1px solid #dbdbdb;background-color: #fff;border-radius: 2px;box-shadow: 0 1px 1px rgba(0,0,0,.04);z-index:1;cursor:pointer;}
#btnRoadview:hover,  #btnMap:hover{background-color: #fcfcfc;border: 1px solid #c1c1c1;}
#container.view_map #mapWrapper {z-index: 10;}
#container.view_map #btnMap {display: none;}
#container.view_roadview #mapWrapper {z-index: 0;}
#container.view_roadview #btnRoadview {display: none;}
/*지도 로드뷰 끝*/

/* 커스텀 오버레이 */
.label {margin-bottom: 96px;}
.label * {display: inline-block;vertical-align: top;}
.label .left {background: url("http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_l.png") no-repeat;display: inline-block;height: 24px;overflow: hidden;vertical-align: top;width: 7px;}
.label .center {background: url(http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_bg.png) repeat-x;display: inline-block;height: 24px;font-size: 12px;line-height: 24px;color: black;}
.label .right {background: url("http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_r.png") -1px 0  no-repeat;display: inline-block;height: 24px;overflow: hidden;width: 6px;}

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

<script type="text/javascript">

//게시글 삭제 스크립트
function areaDelete(){
	if(confirm("글을 삭제하시겠습니까?") == true){
		location.href='areaDelete.go?a_no=${areaModel.a_no}&keyword=${param.keyword}';
	}else{
		return;
	}
}

//게시글 수정 스크립트
function areaModify(){
	if(confirm("글을 수정하시겠습니까?") == true){
		location.href='areaModifyForm.go?a_no=${areaModel.a_no}&keyword=${param.keyword}';	
	}else{
		return;
	}
}

//댓글 삭제 스크립트
function areaReviewDelete(r_no){
	if(confirm("댓글을 삭제하시겠습니까?") == true){
		location.href='areaReviewDelete.go?a_no=${param.a_no }&r_no='+r_no+'&keyword=${param.keyword}';
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
<center>

<c:if test="${param.keyword ne 'info' }">
<br/><br/>

<table width="80%" border="0" align="center">

		<tr>
			<td colspan="3">
				<ul class="nav nav-tabs nav-justified" >
  					<li><a href="/gokkiri/city/cityDetail.go?c_no=${areaModel.c_no }&keyword=${param.keyword}">홈</a></li>
					<li><a href="/gokkiri/area/areaList.go?c_no=${areaModel.c_no }&a_cate=0&keyword=${param.keyword}">관광지</a></li>
					<li><a href="/gokkiri/area/areaList.go?c_no=${areaModel.c_no }&a_cate=1&keyword=${param.keyword}">맛집</a></li>
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
		<td align="right" colspan="2">
			<button type="button" class="btn btn-default" onclick="areaModify();">수정</button>
			<button type="button" class="btn btn-default" onclick="areaDelete();">삭제</button>
		</td>
	</tr>
	</c:if>
</table>

<br/>

<br/>

<table width="70%" align="center">

<tr><td>
<div class="panel panel-default">
    <div class="list-group-item active" align="center">
     <b><font size="5"><span class="glyphicon glyphicon-flag" aria-hidden="true"></span>&nbsp;${areaModel.a_name }</font></b><br/>
     	<c:if test="${revScoreAvg == 0 }">
		&nbsp;리뷰 별점을 등록해주세요! &nbsp;&nbsp;
		</c:if>
		<c:if test="${revScoreAvg != 0 }">
			<font size="3" color="#ffe616"><span class="label label-default">&nbsp;
				<c:if test="${revScoreAvg == 1 }">
					<span class="glyphicon glyphicon-star"></span>
				</c:if>
				<c:if test="${revScoreAvg == 2 }">
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
				</c:if>
				<c:if test="${revScoreAvg == 3 }">
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
				</c:if>
				<c:if test="${revScoreAvg == 4 }">
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
				</c:if>
				<c:if test="${revScoreAvg == 5 }">
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
				</c:if>
			</span></font>
		</c:if>
     <br/>
  </div>
  <div class="panel-body" align="center">
  
<!-- 이미지 슬라이드 -->	
<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="2000" style="width:100%;">
  <!-- Indicators -->
   <ol class="carousel-indicators">
   <c:forEach var="area_imgList" items="${area_imgList }" varStatus="stat"> 
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
  
  <c:forEach var="area_imgList" items="${area_imgList }" varStatus="stat">
  
  <c:choose>
  
  <c:when test="${stat.index == 0 }">
    <div class="item active">
      <img src="../resources/area_img/${area_imgList.a_img_sav }" alt="Chania" style="width:100%; height:500px;">
      <div class="carousel-caption">
      </div>
    </div>
  </c:when>
  
  <c:otherwise>
  	<div class="item">
      <img src="../resources/area_img/${area_imgList.a_img_sav }" alt="Chania" style="width:100%; height:500px;">
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

<tr><td>
<div class="panel panel-default">
  <div class="panel-heading"><b><font size="3">· 지도 / 로드뷰</font></b></div>

<div id="container" class="view_map">
    <div id="mapWrapper" style="width:100%;height:300px;position:relative;">
        <div id="map" style="width:100%;height:100%"></div> <!-- 지도를 표시할 div 입니다 -->
        <input type="button" id="btnRoadview" onclick="toggleMap(false)" title="로드뷰 보기" value="로드뷰">
    </div>
    <div id="rvWrapper" style="width:100%;height:300px;position:absolute;top:0;left:0;">
        <div id="roadview" style="height:100%"></div> <!-- 로드뷰를 표시할 div 입니다 -->
        <input type="button" id="btnMap" onclick="toggleMap(true)" title="지도 보기" value="지도">
    </div>
</div>


	
<!-- 지도 -->
<script src="//apis.daum.net/maps/maps3.js?apikey=431016a3643e6541b4ac065848f17cb3&libraries=services"></script>
<script>
var container = document.getElementById('container'), // 지도와 로드뷰를 감싸고 있는 div 입니다
mapWrapper = document.getElementById('mapWrapper'), // 지도를 감싸고 있는 div 입니다
btnRoadview = document.getElementById('btnRoadview'), // 지도 위의 로드뷰 버튼, 클릭하면 지도는 감춰지고 로드뷰가 보입니다 
btnMap = document.getElementById('btnMap'), // 로드뷰 위의 지도 버튼, 클릭하면 로드뷰는 감춰지고 지도가 보입니다 
roadviewContainer = document.getElementById('roadview'), // 로드뷰를 표시할 div 입니다
mapContainer = document.getElementById('map'); // 지도를 표시할 div 입니다

//지도와 로드뷰 위에 마커로 표시할 특정 장소의 좌표입니다 
var placePosition = new daum.maps.LatLng(33.450701, 126.570667);

//지도 옵션입니다 
var mapOption = {
center: placePosition, // 지도의 중심좌표 
level: 3 // 지도의 확대 레벨
};


//주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();



// 주소로 좌표를 검색합니다
geocoder.addr2coord('${areaModel.a_addr}', function(status, result) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

    	var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
    
    	//로드뷰 객체를 생성한다
    	var roadview = new daum.maps.Roadview(roadviewContainer, {
    		pan: 47, // 로드뷰 처음 실행시에 바라봐야 할 수평 각
    		tilt: 0, // 로드뷰 처음 실행시에 바라봐야 할 수직 각
    		zoom: 0 // 로드뷰 줌 초기값
    	}); 

    	//좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체를 생성한다
    	var roadviewClient = new daum.maps.RoadviewClient(); 

    	// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다
    	roadviewClient.getNearestPanoId(coords, 50, function(panoId) {
    		// panoId와 중심좌표를 통해 로드뷰를 실행한다
    	    roadview.setPanoId(panoId, coords); 
    	});
    	
    	//로드뷰 초기화가 완료되면 
    	daum.maps.event.addListener(roadview, 'init', function() {

    	// 로드뷰에 특정 장소를 표시할 마커를 생성하고 로드뷰 위에 표시합니다 
    	var rvMarker = new daum.maps.Marker({
    		map: roadview,
    		position: coords
    	});
    	});

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });

     	// 커스텀 오버레이에 표시할 내용입니다     
        // HTML 문자열 또는 Dom Element 입니다 
        var content = '<div class ="label">'+
                    '<span class="left"></span><span class="center">${areaModel.a_name}</span><span class="right"></span>'+
                    '</div>';

        // 커스텀 오버레이를 생성합니다
        var customOverlay = new daum.maps.CustomOverlay({
           map: map,
            position: coords,
            content: content,
            yAnchor: 2.7
        });

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
}); 



//지도를 표시할 div와 지도 옵션으로 지도를 생성합니다
var map = new daum.maps.Map(mapContainer, mapOption);


//지도와 로드뷰를 감싸고 있는 div의 class를 변경하여 지도를 숨기거나 보이게 하는 함수입니다 
function toggleMap(active) {
if (active) {

    // 지도가 보이도록 지도와 로드뷰를 감싸고 있는 div의 class를 변경합니다
    container.className = "view_map"
    
} else {

    // 지도가 숨겨지도록 지도와 로드뷰를 감싸고 있는 div의 class를 변경합니다
    container.className = "view_roadview"  
    
}
}
</script>
<!-- 지도 끝 -->

</div>
</td></tr>

<tr><td>
<div class="panel panel-default">
  <div class="panel-heading"><b><font size="3">· 주소</font></b></div>
  <div class="panel-body">${areaModel.a_addr }</div>
</div>
</td></tr>

<tr><td>
<div class="panel panel-default">
  <div class="panel-heading"><b><font  size="3">· 가는 방법</font></b></div>
  <div class="panel-body">${areaModel.a_way }</div>
</div>
</td></tr>

<c:if test="${areaModel.a_tel != null }">
<tr><td>
<div class="panel panel-default">
  <div class="panel-heading"><b><font  size="3">· 전화번호</font></b></div>
  <div class="panel-body">${areaModel.a_tel }</div>
</div>
</td></tr>
</c:if>

<c:if test="${areaModel.a_hours != null }">
<tr><td>
<div class="panel panel-default">
  <div class="panel-heading"><b><font size="3">· 영업시간</font></b></div>
  <div class="panel-body">${areaModel.a_hours }</div>
</div>
</td></tr>
</c:if>

<c:if test="${areaModel.a_web != null }">
<tr><td>
<div class="panel panel-default">
  <div class="panel-heading"><b><font size="3">· 웹 사이트</font></b></div>
  <div class="panel-body"><a href="http://${areaModel.a_web }" >${areaModel.a_web}</a>
  </div>
</div>
</td></tr>
</c:if>

<tr><td>
<div class="panel panel-default">
  <div class="panel-heading"><b><font size="3">· 상세설명</font></b></div>
  <div class="panel-body">${areaModel.a_con }</div>
</div>
</td></tr>
</table>


<br/><br/>

<!-- 리뷰/QnA -->

<table border="0" width="70%">
	<tr>
		<td align="left">
		
		<div class="btn-group btn-group-justified" role="group" aria-label="...">
  			<div class="btn-group" role="group">
				<button type="button" class="btn btn-primary"><b><font size="5">REVIEW&nbsp;<span class="badge">${revCount }</font></b></span></button>
  			</div>
  			<div class="btn-group" role="group">
				<button type="button" class="btn btn-primary-disabled" onclick="javascript:location='/gokkiri/qna/qnaList.go?a_no=${param.a_no }'"><b><font size="5">QNA&nbsp;<span class="badge">${qnaCount }</font></b></span></button>
 			</div>
		</div>
		
		<br/><br/>
		</td>
	</tr>
	
	<c:if test="${session_m_email == null}">
	<tr>
		<td align="center">
			<br/><br/>댓글쓰기 권한이 없습니다. 로그인 해주세요.<br/><br/>
		</td>
	</tr>
	</c:if>
	
	<c:if test="${session_m_email != null }">
	<tr>
		<td align="left">
			<form action="areaReview.go" method="post">
					<input type="hidden" name="keyword" value="${param.keyword }" />
					<input type="hidden" name="a_no" value="${areaModel.a_no }" />
					<input type="hidden" name="m_email" value="${session_m_email }" />
					<b>작성자 : ${session_m_email }</b>
					<div class="row">
						<div class="col-sm-12">
							<div class="form-group">
	  							<select class="form-control" id="sel1" name="r_score">
	  								<option value="5">★★★★★</option>
	  								<option value="4">★★★★</option>
	  								<option value="3">★★★</option>
	  								<option value="2">★★</option>
			   					 	<option value="1">★</option>
	  							</select>
  								<textarea class="form-control" rows="5" id="comment" name="r_con" placeholder="리뷰내용을 입력해주세요"></textarea>
  							</div>
  							<div class="col-sm-12" style="text-align: right; padding-right: 0px;">
  								<button type="submit" class="button">등록하기</button>
							</div>
						</div>
					</div>
			</form>
		</td>
	</tr>
	</c:if>
	
</table>

<br/><br/>

<table border="0" width="70%">	
	<c:forEach var="areaReviewList" items="${areaReviewList }">
	<tr>
		<td>
			<br/>
			<b><font color="gray" size="3">${areaReviewList.m_email }</font></b>
			 / <fmt:formatDate value="${areaReviewList.r_date }" pattern="yyyy.MM.dd" />
			 <c:if test="${session_m_email == areaReviewList.m_email }">
			&nbsp;/&nbsp;
			<button type="button" class="btn btn-link" onclick="areaReviewDelete(${areaReviewList.r_no});">x</button>
			</c:if>
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

</center>
<div>
    <a href="#" class="jcm-top"><img src="../resources/img/arrow-up.png" style="margin-bottom: 40px;width: 40px;"></a>
    </div>
</body>
</html>