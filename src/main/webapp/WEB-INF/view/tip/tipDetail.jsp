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

<style type="text/css">


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
  width: 120px;
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

<script type="text/javascript">
   function tipDelete() {
      if (confirm("삭제 하시겠습니까?") == true) {
         location.href = 'tipDelete.go?t_no=${tipModel.t_no}';
      } else {
         return;
      }
   }

   function tipModify() {
      if (confirm("수정 하시겠습니까?") == true) {
         location.href = 'tipModify.go?t_no=${tipModel.t_no}';
      } else {
         return;
      }
   }
   
    function tipCommentDelete(t_co_no){
      if(confirm("댓글을 삭제하시겠습니까?") == true){
         location.href = 'tipcommDelete.go?t_co_no='+t_co_no+'&t_no=${tipModel.t_no}&m_email=${session_m_email}';
      }else{
         return;
      }
      
   }
</script>
</head>

<body>

<br/><br/><br/>


<table align="center" width="60%">
<tr><td align="right">

<button type="button" class="listButton" onclick="javascript:location.href='tipList.go?currentPage=${param.currentPage}'" ><span>목록으로</span></button>
<c:if test="${session_m_email == tipModel.m_email }">
   <button type="button" class="btn btn-default" onclick="tipModify()" >수정</button>
   <button type="button" class="btn btn-default" onclick="tipDelete()" >삭제</button>
</c:if>
<br/><br/>
</td></tr>
<tr><td>

<div class="panel panel-default">
  <div class="list-group-item active" align="center">
     <b><font size="5"><span class="glyphicon glyphicon-send" aria-hidden="true"></span>&nbsp;${tipModel.t_sub }</font></b><br/>
     · 작성자 : ${tipModel.m_email }&nbsp;&nbsp;&nbsp;&nbsp;· 조회수 : ${tipModel.t_hit }&nbsp;&nbsp;&nbsp;&nbsp;· 작성일 : <fmt:formatDate value="${tipModel.t_date }" pattern="yyyy.MM.dd" /><br/>
  </div>

  <div class="panel-body" align="center">
   <img  src="/gokkiri/resources/tip_img/${tip_imgList.t_img_sav}" width="100%"/><br/>
  </div>
</div>

<div class="panel panel-default">
  <div class="panel-heading" align="center">
     <b><font size="3"><span class="glyphicon glyphicon-send" aria-hidden="true"></span>&nbsp;지도 / 로드뷰</font></b>
  </div>

<div id="container" class="view_map">
    <div id="mapWrapper" style="width:100%;height:300px;position:relative;">
        <div id="map" style="width:100%;height:100%"></div> <!-- 지도를 표시할 div 입니다 -->
        <input type="button" id="btnRoadview" onclick="toggleMap(false)" title="로드뷰 보기" value="로드뷰">
    </div>
    <div id="rvWrapper" style="width:100%;height:300px;position:absolute;top:0;left:0;">
        <div id="roadview" style="width:100%;height:100%;position:relative;"></div> <!-- 로드뷰를 표시할 div 입니다 -->
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
geocoder.addr2coord('${tipModel.a_addr}', function(status, result) {

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
                    '<span class="left"></span><span class="center">${tipModel.a_name}</span><span class="right"></span>'+
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

<div class="panel panel-default">
   <div class="panel-heading" align="center">
      <font size="3"><b><span class="glyphicon glyphicon-send" aria-hidden="true"></span>&nbsp;장소</b></font>
   </div>
     <div class="panel-body" align="center">
        <b>${tipModel.a_addr}&nbsp${tipModel.a_name}</b>     
     </div>
</div>

<div class="panel panel-default">
   <div class="panel-heading" align="center">
      <font size="3"><b><span class="glyphicon glyphicon-send" aria-hidden="true"></span>&nbsp;Tip</b></font>
   </div>
     <div class="panel-body" align="center">
        <b>${tipModel.t_con }</b><br/>
     </div>
</div>


</td></tr>
</table>

<br/><br/>

<!-- 댓글 쓰기 -->
<table width="60%" align="center">

   <c:if test="${session_m_email == null}">
   <tr>
      <td align="center">
         <br/><br/>댓글쓰기 권한이 없습니다. 로그인 해주세요.<br/><br/><br/>
      </td>
   </tr>
   </c:if>
   
   <c:if test="${session_m_email != null }">
   <tr>
      <td align="left">
         <form action="tipcommWrite.go" method="post">
               <input type="hidden" name="t_no" value="${tipcoModel.t_no }" />
               <input type="hidden" name="m_email" value="${session_m_email }" />
               <b>작성자 : ${session_m_email }</b>
               <div class="row">
                  <div class="col-sm-12">
                     <div class="form-group">
                          <textarea class="form-control" rows="5" id="comment" name="t_co_con" placeholder="댓글내용을 입력해주세요"></textarea>
                       </div>
                       <div class="col-sm-2-left" align="right">
                          <button type="submit" class="button">등록하기</button>
                     </div>
                  </div>
               </div>
         </form>
      </td>
   </tr>
   </c:if>

</table>



<c:if test="${fn:length(tipcommList) eq 0}">
<table width="60%" align="center">   

   <tr><td align="center">
   <br />
   <center>등록된 댓글이 없습니다</center>
   <br />
   </td></tr>

</table>
</c:if>

<table width="60%" align="center">   
   <c:forEach var="tipcommList" items="${tipcommList }">
   <tr>
      <td>
         <br/>
         <b><font color="gray" size="3">${tipcommList.m_email }</font></b>
          / <fmt:formatDate value="${tipcommList.t_co_date }" pattern="yyyy.MM.dd" />
          
          <c:if test="${session_m_email == tipcommList.m_email || session_m_email == 'admin' }">
         &nbsp;/&nbsp;
         <button type="button" class="btn btn-link" onclick="tipCommentDelete(${tipcommList.t_co_no});">x</button>
         
         </c:if>
         <br/><br/>
         ${tipcommList.t_co_con }
         <br/><br/>
      </td>
   </tr>
   <tr height="1">
      <td bgcolor="gray" colspan="2"></td>
   </tr>
   </c:forEach>
</table>

<br/><br/><br/>
<div>
    <a href="#" class="jcm-top"><img src="../resources/img/arrow-up.png" style="margin-bottom: 40px;width: 40px;"></a>
</div>
</body>
</html>
