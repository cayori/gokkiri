<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
display: inline-block;
}

div.panel-body{
width: 120px;
height: 50px;
display: inline-block;
}

.jumbotron{
background-repeat: no-repeat;
background-position: center;
background-size: cover;
width: 100%;
height: 100%;
}

.panel{
background: rgba(0,0,0, 0.1);
}

.panel2 {
width: 180px;
}

/*일정내용*/
.list-group-item-center{
text-align:center;
}

/*사이드 스크롤 리스트*/
.table-fixed thead {
  width: 97%;
}
.table-fixed tbody {
  height: 130px;
  overflow-y: auto;
  width: 100%;
}
.table-fixed thead, .table-fixed tbody, .table-fixed tr, .table-fixed td, .table-fixed th {
  display: block;
}
.table-fixed tbody td, .table-fixed thead > tr> th {
  float: left;
  border-bottom-width: 0;
}
/*사이드 스크롤 리스트 끝*/

/*지도*/
.label {margin-bottom: 96px;}
.label * {display: inline-block;vertical-align: top;}
.label .left {background: url("http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_l.png") no-repeat;display: inline-block;height: 24px;overflow: hidden;vertical-align: top;width: 7px;}
.label .center {background: url(http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_bg.png) repeat-x;display: inline-block;height: 24px;font-size: 12px;line-height: 24px;color: black;}
.label .right {background: url("http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_r.png") -1px 0  no-repeat;display: inline-block;height: 24px;overflow: hidden;width: 6px;}
/*지도 끝*/

/*테이블 정렬*/
.table>thead>tr>th {
    /* vertical-align: top; */
    text-align:center;
}


img {
    border-radius: 3px;
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

/*목록 버튼 */
.listButton {
  border-radius: 4px;
  background-color: #f4511e;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 16px;
  padding: 10px;
  width: 80px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}
.listButton span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}
.listButton span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}
.listButton:hover span {
  padding-right: 25px;
}
.listButton:hover span:after {
  opacity: 1;
  right: 0;
}
</style>

<script>

//일정 상세정보
$('#accordion').on('shown.bs.collapse', function () {
     
     var panel = $(this).find('.in');
     
     $('html, body').animate({
           scrollTop: panel.offset().top
     }, 500);
     
   });

//댓글 삭제 스크립트
function schCommentDelete(s_co_no){
   if(confirm("댓글을 삭제하시겠습니까?") == true){
      location.href='schCommentDelete.go?s_no=${param.s_no }&s_co_no='+s_co_no;
   }else{
      return;
   }
}

//일정 수정하기
function modify(s_no,state_no,c_no,s_idx){
   location.href='scheduleArea.go?s_no='+s_no+'&state_no='+state_no+'&c_no='+c_no+'&s_idx='+s_idx;
}

//일정 삭제하기
function s_delete(s_no,currentPage){
   location.href='scheduleDelete.go?currentPage='+currentPage+'&s_no=' + s_no;
}

//일정 찜하기
function zzim1(s_no){
   location.href='schZzim1.go?m_email=${session_m_email}&s_no='+s_no;
}

//일정 찜 해제
function zzim2(s_no){
   location.href='schZzim2.go?m_email=${session_m_email}&s_no='+s_no;
}

</script>

</head>
<body>
<br/>
<!--main-->
<div class="container">
<div class="row">
<!--left-->
<div class="col-lg-1">
  <div class="panel2" data-spy="affix" data-offset-top="200">
     <button type="button" class="listButton" onclick="javascript:location.href='scheduleList.go?currentPage=${param.currentPage}'" ><span>목록</span></button>
      <c:forEach var="schDetailDay" items="${schDetailDay }" varStatus="stat">
        <div class="panel-heading"><a href="#sec${stat.index+1 }">DAY ${stat.index+1 }
        <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
        </a></div><br/>
   </c:forEach>   
  </div>
</div><!--/left-->
      
<!--right-->
<div class="col-md-7">
      
<!-- 일정 상세정보 -->
<c:forEach var="dayList" items="${dayList }" varStatus="stat">
<c:if test="${stat.index == 0 }">
<c:forEach var="day" items="${dayList}" varStatus="stat2">
<c:if test="${stat2.index == 0 }">
<div class="jumbotron text-center" style="background-image: url('/gokkiri/resources/area_img/${day.s_together}');">



   <form class="form-inline">
      <br/><br/>
      
      <table width="70%" align="center" style="background:rgba(256,256,256,0.6) !important;">
      <tr height="50"><td>
      <br/>
      <font size="4">
      ${scheduleModel.s_start_date } ~ ${scheduleModel.s_end_date }<br/><br/>
      </font>
      <font size="6"><b><span class="glyphicon glyphicon-flag" aria-hidden="true"></span>&nbsp;${scheduleModel.s_name }</b></font>
      <br/><br/>
        <font><b>작성자 : ${scheduleModel.m_email } / 조회수 : ${scheduleModel.s_hit }</b></font><br/><br/>
        
        
        
        <!-- 로그인되어있으면 찜하기/가져오기 버튼 보이도록 -->
           <!-- 이미 찜하기 등록되어있으면 찜 해제 버튼 -->
           <c:if test="${session_m_email != null && zzim == 0 }">
              <span data-toggle="modal" data-target="#zzim">
                 <a href="#" data-toggle="tooltip" title="찜하기"><img src="/gokkiri/resources/img/zzim1.png" width="25" /></a>
              </span>
         </c:if>
         <c:if test="${session_m_email != null && zzim != 0 }">
            <span data-toggle="modal" data-target="#zzim">
               <a href="#" data-toggle="tooltip" title="찜 해제"><img src="/gokkiri/resources/img/zzim2.png" width="25" /></a>
            </span>
         </c:if>
         
         &nbsp;&nbsp;
         
         <c:if test="${session_m_email != null}">
         <span data-toggle="modal" data-target="#download">
            <a href="#" data-toggle="tooltip" title="내 일정에 담기"><img src="/gokkiri/resources/img/download.png" width="25" /></a>
         </span>
         </c:if>
         
         <!-- 작성자나 공유자일 경우 일정 수정하기 버튼 -->        
           <c:forEach var="m_email" items="${s_together }">
              <c:set var="together" value="${together } / ${m_email.s_together }" />
           </c:forEach>
           
           <c:if test="${session_m_email != null }">
           <c:if test="${session_m_email == scheduleModel.m_email || fn:contains(together, session_m_email)}">
              &nbsp;&nbsp;|&nbsp;&nbsp;
              <span data-toggle="modal" data-target="#modify">
                 <a href="#" data-toggle="tooltip" title="일정 수정하기"><img src="/gokkiri/resources/img/modify.png" width="25" /></a>
              </span>
           </c:if>
           </c:if>
           &nbsp;&nbsp;
           
           <!-- 작성자인경우에만 삭제 가능 -->
           <c:if test="${session_m_email != null && session_m_email == scheduleModel.m_email}">
              <span data-toggle="modal" data-target="#delete">
                 <a href="#" data-toggle="tooltip" title="일정 삭제하기"><img src="/gokkiri/resources/img/trashcan.png" width="25" /></a>
              </span>
           </c:if>
           
           <br/>&nbsp;<br/>
           </td></tr>
           </table>
           <br/>
   </form>      
</div>   
</c:if>
</c:forEach>
</c:if>
</c:forEach>
   
         <!-- 일정 수정하기 모달 -->
            <div id="modify" class="modal fade" role="dialog">
                 <div class="modal-dialog">
                     <!-- Modal content-->
                     <div class="modal-content">
                        <div class="modal-body">
                           <br/>
                           
                           일정을 수정하시겠습니까?
                           <br/><br/><br/>
                           
                           <input type="submit" class="btn btn-primary odom-submit" value="확인" 
                           onclick='modify(${scheduleModel.s_no},${state_city.s_no},${state_city.a_no},${s_idx.s_idx});'/>                                                         
                           <button type="button" class="btn btn-default" data-dismiss="modal">취소하기</button>
                           
                        </div>
                     </div>
               </div>
            </div>
         <!-- 일정 수정하기 모달 끝 -->
         
         <!-- 일정 삭제하기 모달 -->
            <div id="delete" class="modal fade" role="dialog">
                 <div class="modal-dialog">
                     <!-- Modal content-->
                     <div class="modal-content">
                        <div class="modal-body">
                           <br/>
                           
                           일정을 삭제하시겠습니까?<br/>
                           (*원작성자의 일정이 삭제되면 공유한 친구의 일정도 동시삭제됩니다.)
                           <br/><br/><br/>
                           <input type="submit" class="btn btn-primary odom-submit" value="확인" 
                            onclick='s_delete(${scheduleModel.s_no},${param.currentPage });'/>                                                       
                           <button type="button" class="btn btn-default" data-dismiss="modal">취소하기</button>
                        </div>
                     </div>
               </div>
            </div>
         <!-- 일정 삭제하기 모달 끝 -->
         
         <!-- 찜하기/해체 모달 -->
            <div id="zzim" class="modal fade" role="dialog">
                 <div class="modal-dialog">
                     <!-- Modal content-->
                     <div class="modal-content">
                        <div class="modal-body">
                           <br/>
                           <c:if test="${zzim == 0 }">
                           찜 하시겠습니까?
                           <br/><br/><br/>
                           <input type="submit" class="btn btn-primary odom-submit" value="확인" onclick='zzim1(${scheduleModel.s_no});'/>                                                         
                           <button type="button" class="btn btn-default" data-dismiss="modal">취소하기</button>
                           </c:if>
                           
                           <c:if test="${zzim != 0 }">
                           찜하기를 취소하시겠습니까?
                           <br/><br/><br/>
                           <input type="submit" class="btn btn-primary odom-submit" value="확인" onclick='zzim2(${scheduleModel.s_no});'/>                                                         
                           <button type="button" class="btn btn-default" data-dismiss="modal">취소하기</button>
                           </c:if>
                        </div>
                     </div>
               </div>
            </div>
         <!-- 찜하기/해제 모달 끝 -->
         
         <!-- 내 일정에 담기 (내용수정해서 담기) -->
         
            <div id="download" class="modal fade" role="dialog">
                 <div class="modal-dialog">
                     <!-- Modal content-->
                     <form id="schDownload" action="schDownload.go" method="post" class="form-inline">
                     <div class="modal-content">
                        <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">내 일정에 담기</h4>
                        </div>
                     
                        <div class="modal-body">
                        
                           <p>여행일정 제목&nbsp;&nbsp;
                           <input name="s_name" class="form-control input" type="text" value="${scheduleModel.s_name }"></p>
                           <p><h5>* 담기 클릭 시, 마이페이지에 비공개&미완성으로 저장이 됩니다.</h5></p>
                           <input type="hidden" name="m_email" value="${session_m_email }" />
                           <input type="hidden" name="s_no" value="${scheduleModel.s_no }" />
                           
                           <div class="modal-footer">
                              <input type="submit" class="btn btn-primary odom-submit" value="담기" onclick='document.forms["schDownload"].submit();'/>
                              <button type="button" class="btn btn-default" data-dismiss="modal">취소하기</button>
                           </div>
                        </div>
                     </div>
                  </form>
               </div>
             </div>
          
         <!-- 내 일정에 담기 끝 (내용수정해서 담기) -->
   
      

<!-- 상세보기/일정표/댓글 버튼 -->
<ul class="nav nav-tabs nav-justified" >
     <li><a href="scheduleDetail.go?currentPage=${param.currentPage}&s_no=${param.s_no }&s_cate=0&s_count=1"><b>상세보기</b>&nbsp;<span class="glyphicon glyphicon-list"></span></a></li>
   <li><a href="scheduleDetail.go?currentPage=${param.currentPage}&s_no=${param.s_no }&s_cate=1&s_count=1"><b>일정표</b>&nbsp;<span class="glyphicon glyphicon-th-large"></span></a></li>
   <li><a href="scheduleDetail.go?currentPage=${param.currentPage}&s_no=${param.s_no }&s_cate=2&s_count=1"><b>댓글</b>&nbsp;<span class="badge">${sch_commCount }</span></a></li>
</ul>

<!-- 스케쥴 상세보기 -->
<c:if test="${s_cate == 0 }">
      
         <c:forEach var="dayList" items="${dayList }" varStatus="stat">
            
            <div class="list-group">
              <div class="list-group-item active"><h2 id="sec${stat.count }">DAY ${stat.count }</h2></div>
             <c:forEach var="day" items="${dayList}" varStatus="stat2">
                <div class="list-group-item">
                   <img src="/gokkiri/resources/area_img/${day.s_together }" width="200" height="120">
                   &nbsp;&nbsp;&nbsp;<font size="5" color="#266eb7"><b>${stat2.count }. ${day.a_name }&nbsp;&nbsp;
                   <span class="glyphicon glyphicon-info-sign" 
                         style="cursor:pointer;"
                               onclick="window.open('http://localhost:8080/gokkiri/area/areaDetail.go?a_no=${day.a_no}&keyword=info','여행지 정보','width=550, height=500, toolbar=no, menubar=no, scrollbars=yes,status=no, resizable=yes');return false;">
                   </span>
                   </b></font>
                </div>
                
                <div class="list-group-item">
                   <b><font color="gray">&nbsp;· 주소 : </font></b>&nbsp;&nbsp;${day.a_addr }
                </div>
                
                <c:if test="${day.a_tel != null }">
                <div class="list-group-item">
                   <b><font color="gray">&nbsp;· 전화번호 : </font></b>&nbsp;&nbsp;${day.a_tel }
                </div>
                </c:if>
                
                <c:if test="${day.a_way != null }">
                <div class="list-group-item">
                   <b><font color="gray">&nbsp;· 가는방법 : </font></b>&nbsp;&nbsp;${day.a_way }
                </div>
                </c:if>
                
                <c:if test="${day.s_detail_memo != null }">
                <div class="list-group-item">
                   <b><font color="gray">&nbsp;· 메모 : </font></b>&nbsp;&nbsp;${day.s_detail_memo }<br/>
                </div>
                </c:if>
                
               <c:if test="${fn:length(dayList) gt stat2.count}">
               <div class="list-group-item-center">
                  <br/><img src="/gokkiri/resources/img/arrow.png" width="50" height="20" /><br/><br/>
               </div>
               </c:if>
              </c:forEach>
         </div>
         
         <br/><br/>
         
          </c:forEach>

</c:if>

<!-- 스케쥴 일정표 -->
<c:if test="${s_cate == 1 }">

  <table class="table table">
    <thead>
      <tr>
        <th>날짜</th>
        <th>여행지</th>
        <th>주소</th>
        <th>메모</th>
      </tr>
    </thead>
    <tbody>
    
    <c:forEach var="dayList" items="${dayList }" varStatus="stat">  
      
      <c:forEach var="day" items="${dayList}" varStatus="stat2">
       <tr>
       <c:if test="${stat2.count == 1}">
        <td rowspan="${fn:length(dayList) }" align="center" style="vertical-align: middle !important;">DAY ${stat.count }</td>
       </c:if>
        <td>${stat2.count}. ${day.a_name }</td>
        <td>${day.a_addr }</td>
          <td>
           <c:if test="${day.s_detail_memo != null}">
           ${day.s_detail_memo }
           </c:if>
           <c:if test="${day.s_detail_memo == null }">
           -
           </c:if>
        </td>
       </tr>
      </c:forEach>

   </c:forEach>
   
    </tbody>
  </table>
  
  <br/>
  

</c:if>

<!-- 스케쥴 댓글 -->
<c:if test="${s_cate == 2 }">
<table border="0" align="center" width="100%">
      
<c:if test="${session_m_email != null }">
      <form action="schComment.go" method="post">
      <tr>
         <td><br/><p><b><font color="gray" size="3">작성자 : ${session_m_email }</font></b></p></td>
      </tr>
      <tr>
      <td align="right">
            <input type="hidden" name="s_no" value="${scheduleModel.s_no }" />
            <input type="hidden" name="m_email" value="${session_m_email }" />
            <textarea class="form-control" rows="5" name="s_co_con"></textarea>
            <br/><button type="submit" class="button">등록하기</button>
      </td>
      </tr>
      </form>
</c:if>
<c:if test="${session_m_email == null }">
      <tr>
      <td align="center">
         <br/><br/>댓글쓰기 권한이 없습니다. 로그인 해주세요.<br/><br/>
      </td>
      </tr>
</c:if>
</table>
<br/><br/>

<table border="0" width="100%" align="center">   
   <c:forEach var="schCommentList" items="${schCommentList }">
   <tr>
      <td align="left">
         <br/>
         <b><font color="gray" size="3">${schCommentList.m_email }</font></b>
          / <fmt:formatDate value="${schCommentList.s_co_date }" pattern="yyyy.MM.dd" />
         <c:if test="${session_m_email == schCommentList.m_email }">
         &nbsp;/&nbsp;
         <button type="button" class="btn btn-link" onclick="schCommentDelete(${schCommentList.s_co_no});">x</button>
         </c:if>
         <br/><br/>
         ${schCommentList.s_co_con }
         <br/><br/>
      </td>
   </tr>
   <tr height="1">
      <td bgcolor="gray" colspan="2"></td>
   </tr>
   </c:forEach>
</table>
<br/><br/>

</c:if>

</div><!--/right-->

<div class="col-lg-4">
  <div class="panel2" data-spy="affix" data-offset-top="200">


<table width="100%" class="table table">
<thead><tr><th><b><font color="gray" size="3">· 지도</font></b></th></tr></thead>
<tbody>
<tr><td>

<div id="map" style="width:400px;height:200px;"></div>
<!-- 지도 -->
<script src="//apis.daum.net/maps/maps3.js?apikey=431016a3643e6541b4ac065848f17cb3&libraries=services"></script>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(35.287058, 127.840157), // 지도의 중심좌표
        level: 13 // 지도의 확대 레벨
    };  
    
// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption);

//지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
var bounds = new daum.maps.LatLngBounds(); 

window.onload = function setBounds() {
    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
    map.setBounds(bounds);
}

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

<c:forEach var="mapList" items="${mapList }" varStatus="stat">
// 주소로 좌표를 검색합니다
geocoder.addr2coord('${mapList.a_addr}', function(status, result) {
    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(0, (${stat.index}*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        }; 
        
        var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions)
        
        var   marker = new daum.maps.Marker({
            map: map,
            position: coords,
            image: markerImage
        });
        
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(coords);
        
        // 커스텀 오버레이에 표시할 내용입니다     
        // HTML 문자열 또는 Dom Element 입니다 
        /* var content = '<div class ="label"><a href="/gokkiri/area/areaDetail.go?a_no=${mapList.a_no}&keyword=${fn:substring(mapList.a_addr,0,2)}">'+
                    '<span class="left"></span><span class="center">${mapList.a_name}</span><span class="right"></span>'+
                    '</a></div>'; */

        // 커스텀 오버레이를 생성합니다
        var customOverlay = new daum.maps.CustomOverlay({
           map: map,
            position: coords,
            content: content,
            yAnchor: 2.6
        });
   
       
     }
});

</c:forEach>
</script>

</td></tr>

<tr><td>

<div class="panel panel-default">
  <table class="table table-fixed">
    <thead>
      <tr>
        <th class="col-xs-12" style="text-align:center;"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
        &nbsp;여행지 리스트(일정순)</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="mapList" items="${mapList }" varStatus="stat">
         <tr>
           <td class="col-xs-3">
                <font color="#266eb7">
                 <span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>${stat.count}
              </font>
           </td>
           
           <td class="col-xs-8" align="left">
              <!-- 관광지 -->
              <c:if test="${mapList.a_cate == 0 }">
                 <span class="glyphicon glyphicon-camera" aria-hidden="true"></span>
              </c:if>
              <!-- 맛집 -->
              <c:if test="${mapList.a_cate == 1 }">
                 <span class="glyphicon glyphicon-cutlery" aria-hidden="true"></span>
              </c:if>
               ${mapList.a_name }
           </td>
           
           <td class="col-xs-1">
              <a href="/gokkiri/area/areaDetail.go?a_no=${mapList.a_no}&keyword=${fn:substring(mapList.a_addr,0,2)}">
              <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a>
           </td>
         </tr>
      </c:forEach>
    </tbody>
  </table>
</div>

</td></tr>
</tbody>
</table>
  </div>
</div>

</div><!--/row-->
</div><!--/container-->

<div>
    <a href="#" class="jcm-top"><img src="../resources/img/arrow-up.png" style="margin-bottom: 40px;width: 40px;"></a>
</div>
</body>
</html>