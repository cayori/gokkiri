<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>일정 만들기</title>
<style>
.label {margin-bottom: 96px;}
.label * {display: inline-block;vertical-align: top;}
.label .left {background: url("http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_l.png") no-repeat;display: inline-block;height: 24px;overflow: hidden;vertical-align: top;width: 7px;}
.label .center {background: url(http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_bg.png) repeat-x;display: inline-block;height: 24px;font-size: 12px;line-height: 24px;color: black;}
.label .right {background: url("http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_r.png") -1px 0  no-repeat;display: inline-block;height: 24px;overflow: hidden;width: 6px;}

.panel-body { padding:0px; }
.panel-body table tr td { padding-left: 15px }
.panel-body .table {margin-bottom: 0px; }

.overlay {
    position:absolute;
    left: -50px;
    top:0;
    width:370px;
    height: 30px;
    background: #fff;
    border:1px solid #ccc;
    border-radius: 5px;
    padding:5px;
    font-size:12px;
    text-align: center;
    white-space: pre;
    word-wrap: break-word;
}	
</style>
</head>
<body>
<div style="padding-top: 20px;">
<h3 style="margin-top: 0px; margin-bottom: 0px; padding-left: 10px;"><span class="glyphicon glyphicon-tags"></span>&nbsp;${sch.s_name }</h3>
</div>
 <div class="row" style="padding-top: 5px;">
        <div class="col-sm-2 col-md-2" style="padding-right: 5px; padding-left: 20px;">
            <div class="panel-group" id="accordion">
            
                <div class="panel panel-default">
                    <div class="list-group-item active" style="text-align:center;">
                        <h4 class="panel-title">
                        	지역 선택
                        	<div style="padding-top: 5px;">
								<form action="scheduleState.go">
									<div class="input-group">
										<c:if test="${param.s_no != null }">
										<input type="hidden" value="${param.s_no }" name="s_no">
										</c:if>
										<input type="text" class="form-control input-sm" placeholder="지역 이름" name="keyword">
									    <div class="input-group-btn">
										        <button type="submit" 
										        		class="btn btn-default btn-sm">검색</button>
									    </div>
								    </div>
								</form>
							</div>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in" style="height:635px; overflow:auto">
                        <div class="panel-body">
                            <table class="table">
                            	<c:if test="${param.keyword == null}">
	                            <c:forEach var="stateList" items="${stateList }" varStatus="stat">
	                                <tr>
	                                   <td style="cursor:pointer;" onclick="javascript:location.href='scheduleCity.go?s_no=${sch.s_no}&state_no=${stateList.state_no}'">
	                                   	 ${stateList.state_name }
	                                   </td>
	                                   <td style="text-align:right; cursor:pointer;" onclick="javascript:location.href='scheduleCity.go?s_no=${sch.s_no}&state_no=${stateList.state_no}'"">
	                                   	<span class="glyphicon glyphicon-chevron-right"></span>
	                                   </td>
	                                </tr>
	                            </c:forEach>
	                            </c:if>
	                            <c:if test="${param.keyword != null}">
	                            <c:forEach var="stateSearchList" items="${stateSearchList }" varStatus="stat">
	                                <tr>
	                                   <td style="cursor:pointer;" onclick="javascript:location.href='scheduleCity.go?s_no=${sch.s_no}&state_no=${stateSearchList.state_no}'">
	                                   	 ${stateSearchList.state_name }
	                                   </td>
	                                   <td style="text-align:right">
	                                   	<span class="glyphicon glyphicon-chevron-right"></span>
	                                   </td>
	                                </tr>
	                            </c:forEach>
	                            </c:if>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-10 col-md-10" style="padding-left: 0px;">
            <div class="well" style="padding-top: 5px; padding-left: 5px; padding-bottom: 5px; padding-right: 5px;">
                <div id="map" style="width:100%; height:700px;"></div>
            </div>
        </div>
    </div>
  
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=431016a3643e6541b4ac065848f17cb3&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(35.287058, 127.840157), // 지도의 중심좌표
        level: 13 // 지도의 확대 레벨
    };  
    
// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption);

//지도 타입 변경 컨트롤을 생성한다
var mapTypeControl = new daum.maps.MapTypeControl();

// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);	

//지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
var bounds = new daum.maps.LatLngBounds(); 

window.onload = function setBounds() {
    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
    map.setBounds(bounds);
}

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

<c:if test="${param.keyword == null}">
<c:forEach var="stateList" items="${stateList }" varStatus="stat">
// 주소로 좌표를 검색합니다
geocoder.addr2coord('${stateList.state_name}', function(status, result) {
    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });
        
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(coords);
        
	     // 커스텀 오버레이에 표시할 내용입니다     
	     // HTML 문자열 또는 Dom Element 입니다 
	     var content = '<div class ="label"><a href="scheduleCity.go?s_no=${sch.s_no}&state_no=${stateList.state_no}">'+
	     			   '<span class="left"></span><span class="center">${stateList.state_name}</span><span class="right"></span>'+
	     			   '</a></div>';

	     // 커스텀 오버레이를 생성합니다
	     var customOverlay = new daum.maps.CustomOverlay({
	    	 map: map,
	         position: coords,
	         content: content,
	         yAnchor: 2.6
	     });
   
        // 마커에 클릭이벤트5를 등록합니다
        daum.maps.event.addListener(marker, 'click', function() {
            // 마커 위에 인포윈도우를 표시합니다
        	 location.href='scheduleCity.go?s_no=${sch.s_no}&state_no=${stateList.state_no}';
     	 });
     }
});
</c:forEach>
</c:if>

<c:if test="${param.keyword != null}">
<c:forEach var="stateSearchList" items="${stateSearchList }" varStatus="stat">
//주소로 좌표를 검색합니다
geocoder.addr2coord('${stateSearchList.state_name}', function(status, result) {
 // 정상적으로 검색이 완료됐으면 
  if (status === daum.maps.services.Status.OK) {

     var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

     // 결과값으로 받은 위치를 마커로 표시합니다
     var marker = new daum.maps.Marker({
         map: map,
         position: coords
     });
     
     // LatLngBounds 객체에 좌표를 추가합니다
     bounds.extend(coords);
     
	     // 커스텀 오버레이에 표시할 내용입니다     
	     // HTML 문자열 또는 Dom Element 입니다 
	     var content = '<div class ="label"><a href="scheduleCity.go?s_no=${sch.s_no}&state_no=${stateSearchList.state_no}">'+
	     			   '<span class="left"></span><span class="center">${stateSearchList.state_name}</span><span class="right"></span>'+
	     			   '</a></div>';

	     // 커스텀 오버레이를 생성합니다
	     var customOverlay = new daum.maps.CustomOverlay({
	    	 map: map,
	         position: coords,
	         content: content,
	         yAnchor: 2.6
	     });

     // 마커에 클릭이벤트5를 등록합니다
     daum.maps.event.addListener(marker, 'click', function() {
         // 마커 위에 인포윈도우를 표시합니다
     	 location.href='scheduleCity.go?s_no=${sch.s_no}&state_no=${stateSearchList.state_no}';
  	 });
  }
});
</c:forEach>
</c:if>

//커스텀 오버레이 엘리먼트를 만들고, 컨텐츠를 추가합니다
var content = document.createElement('div');
content.className = 'overlay';
content.innerHTML = '<div><span class="glyphicon glyphicon-info-sign"></span> 마커나 말풍선을 클릭하면 해당 지역의 도시로 이동합니다.'
				   +'<div class="close" onclick="closeOverlay()" title="닫기">X</div></div>';

// 커스텀 오버레이를 생성합니다 
var customoverlay = new daum.maps.CustomOverlay({
    map: map,
    content: content,
    position: new daum.maps.LatLng(38.632872355882476, 122.5418078002513)
});

// 커스텀 오버레이를 드래그 하기 위해 필요한  
// 드래그 시작좌표, 커스텀 오버레이의 위치좌표를 넣을 변수를 선업합니다
var startX, startY, startOverlayPoint;

// 커스텀 오버레이에 mousedown이벤트를 등록합니다 
addEventHandle(content, 'mousedown', onMouseDown);

// mouseup 이벤트가 일어났을때 mousemove 이벤트를 제거하기 위해
// document에 mouseup 이벤트를 등록합니다 
addEventHandle(document, 'mouseup', onMouseUp);

// 커스텀 오버레이에 mousedown 했을 때 호출되는 핸들러 입니다 
function onMouseDown(e) {
    // 커스텀 오버레이를 드래그 할 때, 내부 텍스트가 영역 선택되는 현상을 막아줍니다.
    if (e.preventDefault) {
        e.preventDefault();
    } else {
        e.returnValue = false;
    }

    var proj = map.getProjection(), // 지도 객체로 부터 화면픽셀좌표, 지도좌표간 변환을 위한 MapProjection 객체를 얻어옵니다 
        overlayPos = customoverlay.getPosition(); // 커스텀 오버레이의 현재 위치를 가져옵니다

    // 커스텀오버레이에서 마우스 관련 이벤트가 발생해도 지도가 움직이지 않도록 합니다
    daum.maps.event.preventMap();

    // mousedown된 좌표를 설정합니다 
    startX = e.clientX; 
    startY = e.clientY;

    // mousedown됐을 때의 커스텀 오버레이의 좌표를
    // 지도 컨테이너내 픽셀 좌표로 변환합니다 
    startOverlayPoint = proj.containerPointFromCoords(overlayPos);

    // document에 mousemove 이벤트를 등록합니다 
    addEventHandle(document, 'mousemove', onMouseMove);       
}

// 커스텀 오버레이에 mousedown 한 상태에서 
// mousemove 하면 호출되는 핸들러 입니다 
function onMouseMove(e) {
    // 커스텀 오버레이를 드래그 할 때, 내부 텍스트가 영역 선택되는 현상을 막아줍니다.
    if (e.preventDefault) {
        e.preventDefault();
    } else {
        e.returnValue = false;
    }

    var proj = map.getProjection(),// 지도 객체로 부터 화면픽셀좌표, 지도좌표간 변환을 위한 MapProjection 객체를 얻어옵니다 
        deltaX = startX - e.clientX, // mousedown한 픽셀좌표에서 mousemove한 좌표를 빼서 실제로 마우스가 이동된 픽셀좌표를 구합니다 
        deltaY = startY - e.clientY,
        // mousedown됐을 때의 커스텀 오버레이의 좌표에 실제로 마우스가 이동된 픽셀좌표를 반영합니다 
        newPoint = new daum.maps.Point(startOverlayPoint.x - deltaX, startOverlayPoint.y - deltaY), 
        // 계산된 픽셀 좌표를 지도 컨테이너에 해당하는 지도 좌표로 변경합니다 
        newPos = proj.coordsFromContainerPoint(newPoint);

    // 커스텀 오버레이의 좌표를 설정합니다 
    customoverlay.setPosition(newPos);
}

// mouseup 했을 때 호출되는 핸들러 입니다 
function onMouseUp(e) {
    // 등록된 mousemove 이벤트 핸들러를 제거합니다 
    removeEventHandle(document, 'mousemove', onMouseMove);
}

// target node에 이벤트 핸들러를 등록하는 함수힙니다  
function addEventHandle(target, type, callback) {
    if (target.addEventListener) {
        target.addEventListener(type, callback);
    } else {
        target.attachEvent('on' + type, callback);
    }
}

// target node에 등록된 이벤트 핸들러를 제거하는 함수힙니다 
function removeEventHandle(target, type, callback) {
    if (target.removeEventListener) {
        target.removeEventListener(type, callback);
    } else {
        target.detachEvent('on' + type, callback);
    }
}

function closeOverlay() {
	customoverlay.setMap(null);     
}
</script>
</body>
</html>