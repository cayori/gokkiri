<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>일정 만들기</title>
<style>
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

    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #d95050;border-bottom: 1px solid #ddd;font-size: 12px;font-weight: bold; font-size:12px;color: #fff;}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden; border-radius: 3px;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;} 
    .label {margin-bottom: 96px;}
    
.label * {display: inline-block;vertical-align: top;}
.label .left {background: url("http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_l.png") no-repeat;display: inline-block;height: 24px;overflow: hidden;vertical-align: top;width: 7px;}
.label .center {background: url(http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_bg.png) repeat-x;display: inline-block;height: 24px;font-size: 12px;line-height: 24px;color: black;}
.label .right {background: url("http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_r.png") -1px 0  no-repeat;display: inline-block;height: 24px;overflow: hidden;width: 6px;}

.modal{
padding-top:50px; 
}

.panel-body { padding:0px; }
.panel-body table tr td { padding-left: 15px }
.panel-body .table {margin-bottom: 0px;}

$(document).ready(function(){
    // Initialize Tooltip
    $('[data-toggle="tooltip"]').tooltip(); 
})

</style>
</head>
<body>
<div style="padding-top: 15px;">
<form:form class="form-inline" action="scheduleComplete.go">
  <div class="form-group" style="margin-top: 0px; margin-bottom: 0px; padding-left: 10px;">
    <label for="exampleInputName2"><font size="5"><span class="glyphicon glyphicon-tags"></span></font>&nbsp;&nbsp;</label>
    <input type="text" class="form-control" name="s_name" value="${sch.s_name }" placeholder="일정 이름을 입력해주세요.">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </div>
  
  <c:if test="${not empty togetherList }">
	  <button class="btn btn-default btn-md" type="button" onclick="#" data-toggle="modal" data-target="#together">
	     	<span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;공유 친구 목록
	  </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </c:if>
  								 <div id="together" class="modal fade" role="dialog">
					               <div class="modal-dialog">
					               <!-- Modal content-->
					               	<div class="modal-content">
						                <div class="modal-header">
							                <button type="button" class="close" data-dismiss="modal">&times;</button>
							                <h4 class="modal-title">공유 친구 목록</h4>
						                </div>
						                <div class="modal-body">
  	<c:forEach var="togetherList" items="${togetherList }">
    		<span class="glyphicon glyphicon-user"></span>&nbsp;${togetherList.s_together }
    		<c:if test="${togetherList.s_state == 0 }">
				(요청중...)&nbsp;
			</c:if>
			<br/>
    </c:forEach>
						                </div>                 
						                <div class="modal-footer">
						                	<button type="button" class="btn btn-default" data-dismiss="modal">나가기</button>
						                </div>
					               	</div>
					               </div>
					             </div>
  
  <input type="hidden" name="s_no" value="${param.s_no }">
  <button class="button" type="submit">일정 완성!</button>
</form:form>
</div>

<div class="row" style="padding-top: 5px;">
        <div class="col-sm-3 col-md-3" style="padding-right: 0px; padding-left: 20px;">
            <div class="panel-group" id="accordion">
            
                <div class="panel panel-default">
                    <div class="list-group-item active" style="text-align:center;">
                        <h4 class="panel-title">
                        	<span class="glyphicon glyphicon-calendar"></span>&nbsp;${sch.s_start_date} ~ ${sch.s_end_date }
                        	<div style="padding-top: 5px;">
							<div class="btn-group" >
							<c:forEach var="a" begin="1" end="${sch.s_idx+1}" step="1">
								<c:if test="${param.a_cate == null }">
								  <button type="button" onclick="javascript:location.href='scheduleArea.go?s_no=${param.s_no}&state_no=${param.state_no}&c_no=${param.c_no}&s_idx=${a}'" class="btn btn-default btn-xs">
								  	${a }일차
								  </button>
							    </c:if>
							    <c:if test="${param.a_cate != null }">
								  <button type="button" onclick="javascript:location.href='scheduleArea.go?s_no=${param.s_no}&state_no=${param.state_no}&c_no=${param.c_no}&a_cate=${param.a_cate }&s_idx=${a}'" class="btn btn-default btn-xs">
								  	${a }일차
								  </button>
							    </c:if>
							</c:forEach>	
							</div>
							</div>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in" style="height:650px; overflow:auto">
                        <div class="panel-body">
                            <table class="table">
                            	<tr>
                            		<td style="text-align:center; font-weight:bold;">
                            			<c:if test="${empty scheduleList }">
                            				일정을 추가해주세요.
                            			</c:if>
                            			<c:if test="${not empty scheduleList }">
                            				<span class="glyphicon glyphicon-th-list"></span>&nbsp;${param.s_idx }일차 일정 목록
                            			</c:if>
                            		</td>
                            	</tr>
	                            <c:forEach var="scheduleList" items="${scheduleList }" varStatus="stat">
	                                <tr>
	                                   <td class="col-xs-6">
	                                   	<span class="label label-primary">${stat.count }</span>
	                                   	<c:if test="${scheduleList.a_cate == 0 }">
	                                   		<span class="glyphicon glyphicon-camera"></span>
	                                   	</c:if>
	                                    <c:if test="${scheduleList.a_cate == 1 }">
	                                   		<span class="glyphicon glyphicon-cutlery"></span>
	                                   	</c:if>
	                                   	${scheduleList.a_name } 
	                                   </td>
	                                   <td class="col-xs-2" style="text-align:right">
	                                   	<button onclick="#" data-toggle="modal" data-target="#memo_${stat.count }" class="btn btn-default btn-xs">메모</button>
	                                   </td>
	                                   <td class="col-xs-2" style="text-align:right">
	                                   	<c:if test="${param.a_cate == null }">
	                                   		<c:if test="${!stat.first }">
	                                   			<span class="glyphicon glyphicon-chevron-up"
	                                   				data-toggle="tooltip" title="이 여행지의 순서를 변경합니다."
	                                   				style="cursor:pointer;"
	                                   				onclick="javascript:location.href='turnDown.go?s_no=${param.s_no}&state_no=${param.state_no}&c_no=${param.c_no}&s_idx=${param.s_idx}&a_no=${scheduleList.a_no }&s_detail_turn=${scheduleList.s_detail_turn }'"></span>
								        	</c:if>
								        	<c:if test="${!stat.last }">
								        		<span class="glyphicon glyphicon-chevron-down"
								        			data-toggle="tooltip" title="이 여행지의 순서를 변경합니다."
								        			style="cursor:pointer;"
								        			onclick="javascript:location.href='turnUp.go?s_no=${param.s_no}&state_no=${param.state_no}&c_no=${param.c_no}&s_idx=${param.s_idx}&a_no=${scheduleList.a_no }&s_detail_turn=${scheduleList.s_detail_turn }'"></span>
								        	</c:if>
								        </c:if>
								        <c:if test="${param.a_cate != null }">
	                                   		<c:if test="${!stat.first }">
	                                   			<span class="glyphicon glyphicon-chevron-up"
	                                   				data-toggle="tooltip" title="이 여행지의 순서를 변경합니다."
	                                   				style="cursor:pointer;"
	                                   				onclick="javascript:location.href='turnDown.go?s_no=${param.s_no}&state_no=${param.state_no}&c_no=${param.c_no}&a_cate=${param.a_cate }&s_idx=${param.s_idx}&a_no=${scheduleList.a_no }&s_detail_turn=${scheduleList.s_detail_turn }'"></span>
								        	</c:if>
								        	<c:if test="${!stat.last }">
								        		<span class="glyphicon glyphicon-chevron-down"
								        			data-toggle="tooltip" title="이 여행지의 순서를 변경합니다."
								        			style="cursor:pointer;"
								        			onclick="javascript:location.href='turnUp.go?s_no=${param.s_no}&state_no=${param.state_no}&c_no=${param.c_no}&a_cate=${param.a_cate }&s_idx=${param.s_idx}&a_no=${scheduleList.a_no }&s_detail_turn=${scheduleList.s_detail_turn }'"></span>
								        	</c:if>
								        </c:if>
								       </td>
								       <td class="col-xs-1" style="text-align:right">
								       		<c:if test="${param.a_cate ==null }">
											<span class="glyphicon glyphicon-remove"
								        		data-toggle="tooltip" title="이 여행지를 일정에서 삭제합니다." 
								        		style="cursor:pointer;"
								        		onclick="javascript:location.href='deleteArea.go?s_no=${param.s_no}&state_no=${param.state_no}&c_no=${param.c_no}&s_idx=${param.s_idx}&a_no=${scheduleList.a_no }&s_detail_turn=${scheduleList.s_detail_turn }'">
								        	</span>
								        	</c:if>
								        	<c:if test="${param.a_cate !=null }">
											<span class="glyphicon glyphicon-remove"
								        		data-toggle="tooltip" title="이 여행지를 일정에서 삭제합니다." 
								        		style="cursor:pointer;"
								        		onclick="javascript:location.href='deleteArea.go?s_no=${param.s_no}&state_no=${param.state_no}&c_no=${param.c_no}&s_idx=${param.s_idx}&a_cate=${param.a_cate }&a_no=${scheduleList.a_no }&s_detail_turn=${scheduleList.s_detail_turn }'">
								        	</span>
								        	</c:if>
										</td>
	                                </tr>
	                                
	                                 <div id="memo_${stat.count }" class="modal fade" role="dialog">
					                 <div class="modal-dialog">
					                     <!-- Modal content-->
					                     <form:form commandName="scheduleModel" id="writeMemo" action="writeMemo.go" method="post" class="form-inline">
					                     <div class="modal-content">
					                        <div class="modal-header">
					                        <button type="button" class="close" data-dismiss="modal">&times;</button>
					                        <h4 class="modal-title">메모</h4>
					                        </div>
					                     
					                        <div class="modal-body">
											    <textarea class="form-control" rows="5" cols="70" name="s_detail_memo">${scheduleList.s_detail_memo }</textarea>
												<input type="hidden" name="s_detail_no" value="${scheduleList.s_detail_no }">
												<input type="hidden" name="state_no" value="${param.state_no }">
												<input type="hidden" name="c_no" value="${param.c_no }">
												<input type="hidden" name="s_idx" value="${param.s_idx }">
												<input type="hidden" name="s_no" value="${param.s_no }">
												<c:if test="${param.a_cate != null }">
													<input type="hidden" name="a_cate" value="${param.a_cate }">
												</c:if>
					                        </div>
					                                                    
					                           <div class="modal-footer">
					                              <input type="submit" class="btn btn-primary odom-submit" value="저장" onclick='document.forms["schDownload"].submit();'/>
					                              <button type="button" class="btn btn-default" data-dismiss="modal">나가기</button>
					                           </div>
					                        </div>
					                     </form:form>
					                     </div>
					               </div>
	                            </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-2 col-md-2" style="padding-right: 5px; padding-left: 5px;">
            <div class="panel-group" id="accordion">
            
                <div class="panel panel-default">
                    <div class="list-group-item active" style="text-align:center;">
                        <h4 class="panel-title">
                        	<button onclick="javascript:location.href='scheduleCity.go?s_no=${param.s_no}&state_no=${param.state_no}'" 
                        		class="btn btn-default btn-xs"
                        		style="margin-bottom: 5px;">
                        				<span class="glyphicon glyphicon-refresh"></span>&nbsp;도시 변경
                        	</button>
                        	<br>
                        	여행지
							<div style="padding-top: 5px;">
								<form action="scheduleArea.go">
									<div class="input-group">
										<input type="hidden" value="${param.s_no }" name="s_no">
										<input type="hidden" value="${param.state_no }" name="state_no">
										<input type="hidden" value="${param.c_no }" name="c_no">
										<c:if test="${param.a_cate != null }">
											<input type="hidden" value="${param.a_cate }" name="a_cate">
										</c:if>
										<input type="hidden" value="${param.s_idx }" name="s_idx">
										<input type="text" class="form-control input-sm" placeholder="여행지 이름" name="searchKeyword">
									    <div class="input-group-btn">
										        <button type="submit" 
										        		class="btn btn-default btn-sm">검색</button>
									    </div>
								    </div>
								</form>
							</div>
							<div class="btn-group" style="padding-top: 5px;" >
							  <button type="button" onclick="javascript:location.href='scheduleArea.go?s_no=${param.s_no }&state_no=${param.state_no}&c_no=${param.c_no}&s_idx=${param.s_idx }'" class="btn btn-default btn-xs">
							  	<span class="glyphicon glyphicon-th-list"></span>&nbsp;전체
							  </button>
							  <button type="button" onclick="javascript:location.href='scheduleArea.go?s_no=${param.s_no }&state_no=${param.state_no}&c_no=${param.c_no}&a_cate=0&s_idx=${param.s_idx }'" 
							  	data-toggle="tooltip" title="여행지 중 관광지만 검색합니다." 
							  	class="btn btn-default btn-xs">
							  		<span class="glyphicon glyphicon-camera"></span>&nbsp;관광지
							  </button>
							  <button type="button" onclick="javascript:location.href='scheduleArea.go?s_no=${param.s_no }&state_no=${param.state_no}&c_no=${param.c_no}&a_cate=1&s_idx=${param.s_idx }'" 
							  	data-toggle="tooltip" title="여행지 중 맛집만 검색합니다." 
							  	class="btn btn-default btn-xs">
							  		<span class="glyphicon glyphicon-cutlery"></span>&nbsp;맛집
							  </button>
							</div>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in" style="height:585px; overflow:auto">
                        <div class="panel-body">
                            <table class="table">
                            	<c:if test="${param.searchKeyword==null }">
		                            <c:forEach var="schAreaList" items="${schAreaList }" varStatus="stat">
		                                <tr>
		                                   <td>
		                                   	<c:if test="${schAreaList.a_cate == 0 }">
		                                   		<span class="glyphicon glyphicon-camera"></span>
		                                   	</c:if>
		                                   	<c:if test="${schAreaList.a_cate == 1 }">
		                                   		<span class="glyphicon glyphicon-cutlery"></span>
		                                   	</c:if>
		                                   	${schAreaList.a_name }
		                                   </td>
		                                   <td 
	                                   		style="cursor:pointer;" 
	                                   		onclick="window.open('http://localhost:8080/gokkiri/area/areaDetail.go?a_no=${schAreaList.a_no}&keyword=info','여행지 정보','width=550, height=500, toolbar=no, menubar=no, scrollbars=yes,status=no, resizable=yes');return false;">
		                                   	<span class="glyphicon glyphicon-info-sign"></span>
		                                   </td>
		                                   <td>
		                                   	<span data-toggle="tooltip" title="인기가 많은 여행지" class="glyphicon glyphicon-paperclip">${schAreaList.a_count }</span>
		                                   </td>
		                                   <td style="text-align:right">
		                                   <c:if test="${param.a_cate!=null }">
		                                   	<span class="glyphicon glyphicon-plus"
		                                   		data-toggle="tooltip" title="이 여행지를 일정에 추가합니다." 
		                                   		style="cursor:pointer;"
		                                   		onclick="javascript:location.href='insertArea.go?s_no=${param.s_no}&state_no=${param.state_no}&c_no=${param.c_no}&s_idx=${param.s_idx}&a_cate=${param.a_cate }&a_no=${schAreaList.a_no }'">
		                                   	</span>
		                                   </c:if>
		                                   <c:if test="${param.a_cate==null }">
		                                   	<span class="glyphicon glyphicon-plus"
		                                   		data-toggle="tooltip" title="이 여행지를 일정에 추가합니다." 
		                                   		style="cursor:pointer;"
		                                   		onclick="javascript:location.href='insertArea.go?s_no=${param.s_no}&state_no=${param.state_no}&c_no=${param.c_no}&s_idx=${param.s_idx}&a_no=${schAreaList.a_no }'">
		                                   	</span>
		                                   </c:if>
									       </td>
		                                </tr>
		                            </c:forEach>
	                            </c:if>
	                            <c:if test="${param.searchKeyword != null }">
		                            <c:forEach var="schAreaSearch" items="${schAreaSearch }" varStatus="stat">
		                                <tr>
		                                   <td>
		                                   	<c:if test="${schAreaSearch.a_cate == 0 }">
		                                   		<span class="glyphicon glyphicon-camera"></span>
		                                   	</c:if>
		                                   	<c:if test="${schAreaSearch.a_cate == 1 }">
		                                   		<span class="glyphicon glyphicon-cutlery"></span>
		                                   	</c:if>
		                                   	${schAreaSearch.a_name }
		                                   </td>
		                                   <td
	                                   		style="cursor:pointer;" 
											onclick="window.open('http://localhost:8080/gokkiri/area/areaDetail.go?a_no=${schAreaSearch.a_no}&keyword=info','여행지 정보','width=550, height=500, toolbar=no, menubar=no, scrollbars=yes,status=no, resizable=yes');return false;">
		                                   	<span class="glyphicon glyphicon-info-sign"></span>
		                                   </td>
		                                   <td>
		                                   	<span class="glyphicon glyphicon-paperclip">${schAreaSearch.a_count }</span>
		                                   </td>
		                                   <td>
		                                   	<span class="glyphicon glyphicon-plus"
		                                   		data-toggle="tooltip" title="이 여행지를 일정에 추가합니다." 
		                                   		style="cursor:pointer;"
		                                   		onclick="javascript:location.href='insertArea.go?s_no=${param.s_no}&state_no=${param.state_no}&c_no=${param.c_no}&s_idx=${param.s_idx}&a_no=${schAreaSearch.a_no }'"></span>
									       </td>
		                                </tr>
		                            </c:forEach>
	                            </c:if>
	                            
	                            <div id="info" class="modal fade" role="dialog">
					               <div class="modal-dialog">
					               <!-- Modal content-->
					               	<div class="modal-content">
						                <div class="modal-header">
							                <button type="button" class="close" data-dismiss="modal">&times;</button>
							                <h4 class="modal-title"></h4>
						                </div>
						                	<div class="modal-body">
						                </div>                 
						                <div class="modal-footer">
						                	<button type="button" class="btn btn-default" data-dismiss="modal">나가기</button>
						                </div>
					               	</div>
					               </div>
					             </div>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-7 col-md-7" style="padding-left: 0px;">
            <div class="well" style="padding-top: 5px; padding-left: 5px; padding-bottom: 5px; padding-right: 5px;">
                <div id="map" style="width:100%; height:700px;"></div>
            </div>
        </div>
    	</div>
  
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=431016a3643e6541b4ac065848f17cb3&libraries=services"></script>
<script async="async">
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.534584, 126.983512), // 지도의 중심좌표
        level: 8 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

//지도 타입 변경 컨트롤을 생성한다
var mapTypeControl = new daum.maps.MapTypeControl();
// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);	
//지도에 확대 축소 컨트롤을 생성한다
var zoomControl = new daum.maps.ZoomControl();
// 지도의 우측에 확대 축소 컨트롤을 추가한다
map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

//지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
var bounds = new daum.maps.LatLngBounds(); 

window.onload = function setBounds() {
    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
    map.setBounds(bounds);
}

var linePath = new Array(); 

<c:forEach var="scheduleList" items="${scheduleList }" varStatus="status">
geocoder.addr2coord('${scheduleList.a_addr}', function(status, result) {
	// 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

    	var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
		
    	//맛집
    	if(${scheduleList.a_cate}==1){
    	var markerImageUrl = 'http://t1.daumcdn.net/localimg/localimages/07/2012/img/marker_r.png', 
	    markerImageSize = new daum.maps.Size(27, 27), // 마커 이미지의 크기
	    markerImageOptions = { 
	        spriteOrigin : new daum.maps.Point(46, 154), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	        spriteSize : new daum.maps.Size(72, 648), // 스프라이트 이미지의 전체 크기 
	        offset : new daum.maps.Point(11, 27)// 마커 좌표에 일치시킬 이미지 안의 좌표
	    };

		// 마커 이미지를 생성한다
		var markerImage = new daum.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);
	
		// 지도에 마커를 생성하고 표시한다
		var marker = new daum.maps.Marker({
		    position: coords, // 마커의 좌표
		    image : markerImage, // 마커의 이미지
		    map: map // 마커를 표시할 지도 객체
		});
    	}
        
    	//관광지
    	if (${scheduleList.a_cate}==0) {
		// 마커 이미지의 주소
		var markerImageUrl = 'http://t1.daumcdn.net/localimg/localimages/07/2012/img/marker_r.png', 
		    markerImageSize = new daum.maps.Size(27, 27), // 마커 이미지의 크기
		    markerImageOptions = { 
		        spriteOrigin : new daum.maps.Point(46, 118), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		        spriteSize : new daum.maps.Size(72, 648), // 스프라이트 이미지의 전체 크기 
		        offset : new daum.maps.Point(11, 27)// 마커 좌표에 일치시킬 이미지 안의 좌표
		    };

		// 마커 이미지를 생성한다
		var markerImage = new daum.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);

		// 지도에 마커를 생성하고 표시한다
		var marker = new daum.maps.Marker({
		    position: coords, // 마커의 좌표
		    image : markerImage, // 마커의 이미지
		    map: map // 마커를 표시할 지도 객체
		});
     	}
       
   	    // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(coords);
   	    
   		 if(linePath.length == ${status.index}){
   	    	 linePath.push(coords);
   	     } 
   	     // 지도에 표시할 선을 생성합니다
   	     var polyline = new daum.maps.Polyline({
   	         path: linePath, // 선을 구성하는 좌표배열 입니다
   	         strokeWeight: 2, // 선의 두께 입니다
   	         strokeColor: '#db4040', // 선의 색깔입니다
   	         strokeOpacity: 0.9, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
   	         endArrow : true,
   	         map : map
   	     });

   
         // 커스텀 오버레이에 표시할 내용입니다     
	     // HTML 문자열 또는 Dom Element 입니다 
	    var content = '<div class ="label">'+
	     			   '<span class="left"></span><span class="center"><bold>${status.index+1}</bold> ${scheduleList.a_name}</span><span class="right"></span>'+
	     			   '</div>';

	     // 커스텀 오버레이를 생성합니다
	     var customOverlay = new daum.maps.CustomOverlay({
	    	 map: map,
	         position: coords,
	         content: content,
	         yAnchor: 2.2
	     });
         
	  	// 마커에 클릭이벤트를 등록합니다
        daum.maps.event.addListener(marker, 'click', function() {
             // 마커 위에 인포윈도우를 표시합니다
         	 location.href='insertArea.go?s_no=${param.s_no}&state_no=${param.state_no}&c_no=${param.c_no}&s_idx=${param.s_idx}&a_no=${scheduleList.a_no }';
      	 });  

     }
    
});
</c:forEach>

<c:if test="${empty param.a_cate}">
<c:forEach var="areaList" items="${areaList }" varStatus="status">
geocoder.addr2coord('${areaList.a_addr}', function(status, result) {
	// 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

    	var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
		
    	//맛집
    	<c:if test="${areaList.a_cate == 1}">
    	var markerImageUrl = 'http://t1.daumcdn.net/localimg/localimages/07/2012/img/marker_r.png', 
	    markerImageSize = new daum.maps.Size(27, 27), // 마커 이미지의 크기
	    markerImageOptions = { 
	        spriteOrigin : new daum.maps.Point(10, 154), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	        spriteSize : new daum.maps.Size(72, 648), // 스프라이트 이미지의 전체 크기 
	        offset : new daum.maps.Point(11, 27)// 마커 좌표에 일치시킬 이미지 안의 좌표
	    };

		// 마커 이미지를 생성한다
		var markerImage = new daum.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);
	
		// 지도에 마커를 생성하고 표시한다
		var marker = new daum.maps.Marker({
		    position: coords, // 마커의 좌표
		    image : markerImage, // 마커의 이미지
		    map: map // 마커를 표시할 지도 객체
		});
        </c:if>
        
    	//관광지
    	<c:if test="${areaList.a_cate == 0}">
		// 마커 이미지의 주소
		   var markerImageUrl = 'http://t1.daumcdn.net/localimg/localimages/07/2012/img/marker_r.png', 
		    markerImageSize = new daum.maps.Size(27, 27), // 마커 이미지의 크기
		    markerImageOptions = { 
		        spriteOrigin : new daum.maps.Point(10, 118), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		        spriteSize : new daum.maps.Size(72, 648), // 스프라이트 이미지의 전체 크기 
		        offset : new daum.maps.Point(11, 27)// 마커 좌표에 일치시킬 이미지 안의 좌표
		    };

		// 마커 이미지를 생성한다
		var markerImage = new daum.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);

		// 지도에 마커를 생성하고 표시한다
		var marker = new daum.maps.Marker({
		    position: coords, // 마커의 좌표
		    image : markerImage, // 마커의 이미지
		    map: map // 마커를 표시할 지도 객체
		});
        </c:if>
        
   	    // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(coords);
   	    
   	    var content = '<div class="wrap">' + 
			'    <div class="info">' + 
			'        <div class="title">' + 
			'            ${areaList.a_name}' +
			'        </div>' + 
			'        <div class="body">' + 
			'            <div class="img">' +
			'                <img src="/gokkiri/resources/area_img/${areaList.a_img_sav }" width="73" height="70" />' +
			'           </div>' + 
			'            <div class="desc">' + 
			'                <div class="ellipsis">${areaList.a_addr}</div>' + 
			'                <div class="jibun ellipsis">${areaList.a_way}</div>' + 
			'                <div class="link">${areaList.a_tel}</div>'+
			'            </div>' + 
			'        </div>' + 
			'    </div>' +    
			'</div>'; 
			
         // 마커에 마우스오버 이벤트를 등록합니다
         daum.maps.event.addListener(marker, 'mouseover', function() {
           // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
        	 overlay = new daum.maps.CustomOverlay({
        		    content: content,
        		    map: map,
        		    position: marker.getPosition()
        		 });
        	 daum.maps.event.addListener(marker, 'mouseout', function() {
                 // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
        		 overlay.setMap(null);
             }); 
         });
         
     	 // 마커에 클릭이벤트를 등록합니다
         daum.maps.event.addListener(marker, 'click', function() {
             // 마커 위에 인포윈도우를 표시합니다
         	 location.href='insertArea.go?s_no=${param.s_no}&state_no=${param.state_no}&c_no=${param.c_no}&s_idx=${param.s_idx}&a_no=${areaList.a_no }';
      	 });      	 
     }
    
});
</c:forEach>
</c:if>

<c:if test="${not empty param.a_cate}">
<c:forEach var="areaCateList" items="${areaCateList }" varStatus="stat">
geocoder.addr2coord('${areaCateList.a_addr}', function(status, result) {
    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

      //맛집
    	<c:if test="${areaCateList.a_cate == 1}">
    	var markerImageUrl = 'http://t1.daumcdn.net/localimg/localimages/07/2012/img/marker_r.png', 
	    markerImageSize = new daum.maps.Size(27, 27), // 마커 이미지의 크기
	    markerImageOptions = { 
	        spriteOrigin : new daum.maps.Point(10, 154), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	        spriteSize : new daum.maps.Size(72, 648), // 스프라이트 이미지의 전체 크기 
	        offset : new daum.maps.Point(11, 27)// 마커 좌표에 일치시킬 이미지 안의 좌표
	    };

		// 마커 이미지를 생성한다
		var markerImage = new daum.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);
	
		// 지도에 마커를 생성하고 표시한다
		var marker = new daum.maps.Marker({
		    position: coords, // 마커의 좌표
		    image : markerImage, // 마커의 이미지
		    map: map // 마커를 표시할 지도 객체
		});
        </c:if>
        
    	//관광지
    	<c:if test="${areaCateList.a_cate == 0}">
		// 마커 이미지의 주소
		var markerImageUrl = 'http://t1.daumcdn.net/localimg/localimages/07/2012/img/marker_r.png', 
		    markerImageSize = new daum.maps.Size(27, 27), // 마커 이미지의 크기
		    markerImageOptions = { 
		        spriteOrigin : new daum.maps.Point(10, 118), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		        spriteSize : new daum.maps.Size(72, 648), // 스프라이트 이미지의 전체 크기 
		        offset : new daum.maps.Point(11, 27)// 마커 좌표에 일치시킬 이미지 안의 좌표
		    };

		// 마커 이미지를 생성한다
		var markerImage = new daum.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);

		// 지도에 마커를 생성하고 표시한다
		var marker = new daum.maps.Marker({
		    position: coords, // 마커의 좌표
		    image : markerImage, // 마커의 이미지
		    map: map // 마커를 표시할 지도 객체
		});
        </c:if>
     

        var content = '<div class="wrap">' + 
			'    <div class="info">' + 
			'        <div class="title">' + 
			'            ${areaCateList.a_name}  ' + 
			'        </div>' + 
			'        <div class="body">' + 
			'            <div class="img">' +
			'                <img src="../resources/area_img/${areaCateList.a_img_sav }" width="73" height="70" />' +
			'           </div>' + 
			'            <div class="desc">' + 
			'                <div class="ellipsis">${areaCateList.a_addr}</div>' + 
			'                <div class="jibun ellipsis">${areaCateList.a_way}</div>' + 
			'                <div class="link">${areaCateList.a_tel}</div>'+
			'            </div>' + 
			'        </div>' + 
			'    </div>' +    
			'</div>';
			
			// LatLngBounds 객체에 좌표를 추가합니다
	        bounds.extend(coords);
           
        // 마커에 마우스오버 이벤트를 등록합니다
        daum.maps.event.addListener(marker, 'mouseover', function() {
          // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
       	 overlay = new daum.maps.CustomOverlay({
       		    content: content,
       		    map: map,
       		    position: marker.getPosition()
       		 });
       	 daum.maps.event.addListener(marker, 'mouseout', function() {
                // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
       		 overlay.setMap(null);
            }); 
        });
        
    	 // 마커에 클릭이벤트를 등록합니다
        daum.maps.event.addListener(marker, 'click', function() {
            // 마커 위에 인포윈도우를 표시합니다
        	 location.href='insertArea.go?s_no=${param.s_no}&state_no=${param.state_no}&c_no=${param.c_no}&a_cate=${param.a_cate}&s_idx=${param.s_idx}&a_no=${areaCateList.a_no }';
        	 
     	 }); 
     }
    
});
</c:forEach>
</c:if>
</script>
</body>
</html>