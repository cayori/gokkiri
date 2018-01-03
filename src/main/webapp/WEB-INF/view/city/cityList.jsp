<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<style>
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
background-image: url('/gokkiri/resources/img/cloud3.jpg');
background-repeat: no-repeat;
background-position: center;
background-size: cover;
width: 100%;
height: 100%;
}

/*이미지 슬라이드*/
  .container {
      padding: 80px 120px;
  }
  .person {
      border: 10px solid transparent;
      margin-bottom: 25px;
      width: 80%;
      height: 80%;
      opacity: 0.7;
  }
  .person:hover {
      border-color: #f1f1f1;
  }
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
  }
  .carousel-caption h3 {
      color: #fff !important;
  }
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
    }
  }  
  
  /*검색*/
  .bootstrap-select.btn-group .btn .caret {
	left: 12px;
	}
	.bootstrap-select.btn-group .btn .filter-option {
	text-align: right;
	}
  /*검색 끝*/

</style>
<script>
$('#accordion').on('shown.bs.collapse', function () {
	  
	  var panel = $(this).find('.in');
	  
	  $('html, body').animate({
	        scrollTop: panel.offset().top
	  }, 500);
	  
	});
});

//검색
$('.selectpicker').selectpicker();

</script>
</head>
<body>

<!-- 상단 이미지 + 지역검색 -->
<div class="jumbotron text-center">
  <form class="form-inline">
  	<p><font color="#ffffff" size="10"><b>다양한 지역의 여행지 정보를 찾아보세요!</b></font></p>
  
	<table width="30%" align="center">
	<tr><td>
      <div class="row">
    	<div class="col-sm-3 text-center">
          	<p><font color="#ffffff" size="6"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span></font></p>
          	<p><font color="#ffffff" size="2">지역 홈</font></p>
    	</div>
        <div class="col-sm-3 text-center">
          	<p><font color="#ffffff" size="6"><span class="glyphicon glyphicon-camera" aria-hidden="true"></span></font></p>
          	<p><font color="#ffffff" size="2">관광지</font></p>
    	</div>
        <div class="col-sm-3 text-center">
          	<p><font color="#ffffff" size="6"><span class="glyphicon glyphicon-cutlery" aria-hidden="true"></span></font></p>
          	<p><font color="#ffffff" size="2">맛집</font></p>
    	</div>
    	<div class="col-sm-3 text-center">
          	<p><font color="#ffffff" size="6"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span></font></p>
          	<p><font color="#ffffff" size="2">여행일정</font></p>
    	</div>
  	</div>
  	</td></tr>
  	</table>
  	<p><font color="#ffffff" size="3">전국 16개 지역의 카테고리안에 세부 지역을 클릭하시면 해당 지역의 홈이 나옵니다.</font></p>
  </form>
</div>

<!-- 지역 카테고리 -->
<table width="80%" align="center">
<tr>
<td align="center">

<div class="panel-group" id="accordion">

	<!-- 첫째줄 -->
    <div class="panel panel-default">
    	<!-- 상위 메뉴(STATE) -->
    	<!-- 1.서울 -->
        <div class="panel-heading">
        	 <span class="strong"><a data-toggle="collapse" data-parent="#accordion" href="#Seoul" id="predict"><b>서울</b><span class="caret"></span>
                </a>
            </span>
        </div>
        
        <!-- 2.부산 -->
        <div class="panel-heading">
        	 <span class="strong"><a data-toggle="collapse" data-parent="#accordion" href="#Busan" id="predict"><b>부산</b><span class="caret"></span>
                </a>
            </span>
        </div>
        
        <!-- 3.대구 -->
        <div class="panel-heading">
        	 <span class="strong"><a data-toggle="collapse" data-parent="#accordion" href="#Daegu" id="predict"><b>대구</b><span class="caret"></span>
                </a>
            </span>
        </div>
        
        <!-- 4.인천 -->
        <div class="panel-heading">
        	 <span class="strong"><a data-toggle="collapse" data-parent="#accordion" href="#Incheon" id="predict"><b>인천</b><span class="caret"></span>
                </a>
            </span>
        </div>
        
        <!-- 5.광주 -->
        <div class="panel-heading">
        	 <span class="strong"><a data-toggle="collapse" data-parent="#accordion" href="#Gwangju" id="predict"><b>광주</b><span class="caret"></span>
                </a>
            </span>
        </div>
        
        <!-- 6.대전 -->
        <div class="panel-heading">
        	 <span class="strong"><a data-toggle="collapse" data-parent="#accordion" href="#Daejeon" id="predict"><b>대전</b><span class="caret"></span>
                </a>
            </span>
        </div>
        
        <!-- 7.울산 -->
        <div class="panel-heading">
        	 <span class="strong"><a data-toggle="collapse" data-parent="#accordion" href="#Ulsan" id="predict"><b>울산</b><span class="caret"></span>
                </a>
            </span>
        </div>
        
        <!-- 8.경기 -->
        <div class="panel-heading">
        	 <span class="strong"><a data-toggle="collapse" data-parent="#accordion" href="#Gyeonggi" id="predict"><b>경기</b><span class="caret"></span>
                </a>
            </span>
        </div>
        
        
        <!-- 하위메뉴(CITY) -->
        <!-- 1.서울 -->
        <div id="Seoul" class="panel-collapse collapse">
        	<c:forEach var="seoulList" items="${seoulList }" >
            <div class="panel-body">
                <p><a href="cityDetail.go?c_no=${seoulList.c_no }&keyword=서울">${seoulList.c_name }</a></p>
            </div>
            </c:forEach>
            <c:if test="${session_m_email == 'admin' }">
            <div class="panel-body">
          		<p>
          			<a href='cityWriteForm.go?state_no=1'><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></a>
          		</p>
          	</div>
          	</c:if>
        </div>
        
        <!-- 2.부산 -->
        <div id="Busan" class="panel-collapse collapse">
        	<c:forEach var="busanList" items="${busanList }" >
            <div class="panel-body">
                <p><a href="cityDetail.go?c_no=${busanList.c_no }&keyword=부산">${busanList.c_name }</a></p>
            </div>
            </c:forEach>
            <c:if test="${session_m_email == 'admin' }">
            <div class="panel-body">
          		<p>
          			<a href='cityWriteForm.go?state_no=2'><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></a>
          		</p>
          	</div>
          	</c:if>
        </div>
        
        <!-- 3.대구 -->
        <div id="Daegu" class="panel-collapse collapse">
        	<c:forEach var="daeguList" items="${daeguList }" >
            <div class="panel-body">
                <p><a href="cityDetail.go?c_no=${daeguList.c_no }&keyword=대구">${daeguList.c_name }</a></p>
            </div>
            </c:forEach>
            <c:if test="${session_m_email == 'admin' }">
            <div class="panel-body">
          		<p>
          			<a href='cityWriteForm.go?state_no=3'><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></a>
          		</p>
          	</div>
          	</c:if>
        </div>
        
        <!-- 4.인천 -->
        <div id="Incheon" class="panel-collapse collapse">
        	<c:forEach var="incheonList" items="${incheonList }" >
            <div class="panel-body">
                <p><a href="cityDetail.go?c_no=${incheonList.c_no }&keyword=인천">${incheonList.c_name }</a></p>
            </div>
            </c:forEach>
            <c:if test="${session_m_email == 'admin' }">
            <div class="panel-body">
          		<p>
          			<a href='cityWriteForm.go?state_no=4'><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></a>
          		</p>
          	</div>
          	</c:if>
        </div>
        
        <!-- 5.광주 -->
        <div id="Gwangju" class="panel-collapse collapse">
        	<c:forEach var="gwangjuList" items="${gwangjuList }" >
            <div class="panel-body">
                <p><a href="cityDetail.go?c_no=${gwangjuList.c_no }&keyword=광주">${gwangjuList.c_name }</a></p>
            </div>
            </c:forEach>
            <c:if test="${session_m_email == 'admin' }">
            <div class="panel-body">
          		<p>
          			<a href='cityWriteForm.go?state_no=5'><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></a>
          		</p>
          	</div>
          	</c:if>
        </div>
        
        <!-- 6.대전 -->
        <div id="Daejeon" class="panel-collapse collapse">
        	<c:forEach var="daejeonList" items="${daejeonList }" >
            <div class="panel-body">
                <p><a href="cityDetail.go?c_no=${daejeonList.c_no }&keyword=대전">${daejeonList.c_name }</a></p>
            </div>
            </c:forEach>
            <c:if test="${session_m_email == 'admin' }">
            <div class="panel-body">
          		<p>
          			<a href='cityWriteForm.go?state_no=6'><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></a>
          		</p>
          	</div>
          	</c:if>
        </div>
        
        <!-- 7.울산 -->
        <div id="Ulsan" class="panel-collapse collapse">
        	<c:forEach var="ulsanList" items="${ulsanList }" >
            <div class="panel-body">
                <p><a href="cityDetail.go?c_no=${ulsanList.c_no }&keyword=울산">${ulsanList.c_name }</a></p>
            </div>
            </c:forEach>
            <c:if test="${session_m_email == 'admin' }">
            <div class="panel-body">
          		<p>
          			<a href='cityWriteForm.go?state_no=7'><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></a>
          		</p>
          	</div>
          	</c:if>
        </div>
        
        <!-- 8.경기 -->
        <div id="Gyeonggi" class="panel-collapse collapse">
        	<c:forEach var="gyeonggiList" items="${gyeonggiList }" >
            <div class="panel-body">
                <p><a href="cityDetail.go?c_no=${gyeonggiList.c_no }&keyword=경기">${gyeonggiList.c_name }</a></p>
            </div>
            </c:forEach>
            <c:if test="${session_m_email == 'admin' }">
            <div class="panel-body">
          		<p>
          			<a href='cityWriteForm.go?state_no=8'><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></a>
          		</p>
          	</div>
          	</c:if>
        </div>

    </div>
    
	<!-- 둘째줄 -->
    <div class="panel panel-default">
    	<!-- 상위 메뉴(STATE) -->
    	<!-- 9.강원 -->
        <div class="panel-heading">
        	 <span class="strong"><a data-toggle="collapse" data-parent="#accordion" href="#Gangwon" id="predict"><b>강원</b><span class="caret"></span>
                </a>
            </span>
        </div>
        
        <!-- 10.충북 -->
        <div class="panel-heading">
        	 <span class="strong"><a data-toggle="collapse" data-parent="#accordion" href="#Chungbuk" id="predict"><b>충북</b><span class="caret"></span>
                </a>
            </span>
        </div>
        
        <!-- 11.충남 -->
        <div class="panel-heading">
        	 <span class="strong"><a data-toggle="collapse" data-parent="#accordion" href="#Chungnam" id="predict"><b>충남</b><span class="caret"></span>
                </a>
            </span>
        </div>
        
        <!-- 12.전북 -->
        <div class="panel-heading">
        	 <span class="strong"><a data-toggle="collapse" data-parent="#accordion" href="#Jeonbuk" id="predict"><b>전북</b><span class="caret"></span>
                </a>
            </span>
        </div>
        
        <!-- 13.전남 -->
        <div class="panel-heading">
        	 <span class="strong"><a data-toggle="collapse" data-parent="#accordion" href="#Jeonnam" id="predict"><b>전남</b><span class="caret"></span>
                </a>
            </span>
        </div>
        
        <!-- 14.경북-->
        <div class="panel-heading">
        	 <span class="strong"><a data-toggle="collapse" data-parent="#accordion" href="#Gyeongbuk" id="predict"><b>경북</b><span class="caret"></span>
                </a>
            </span>
        </div>
        
        <!-- 15.경남 -->
        <div class="panel-heading">
        	 <span class="strong"><a data-toggle="collapse" data-parent="#accordion" href="#Gyeongnam" id="predict"><b>경남</b><span class="caret"></span>
                </a>
            </span>
        </div>
        
        <!-- 16.제주 -->
        <div class="panel-heading">
        	 <span class="strong"><a data-toggle="collapse" data-parent="#accordion" href="#Jeju" id="predict"><b>제주</b><span class="caret"></span>
                </a>
            </span>
        </div>
        
        
        <!-- 하위메뉴(CITY) -->
        <!-- 9.강원 -->
        <div id="Gangwon" class="panel-collapse collapse">
        	<c:forEach var="gangwonList" items="${gangwonList }" >
            <div class="panel-body">
                <p><a href="cityDetail.go?c_no=${gangwonList.c_no }&keyword=강원">${gangwonList.c_name }</a></p>
            </div>
            </c:forEach>
            <c:if test="${session_m_email == 'admin' }">
            <div class="panel-body">
          		<p>
          			<a href='cityWriteForm.go?state_no=9'><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></a>
          		</p>
          	</div>
          	</c:if>
        </div>
        
        <!-- 10.충북 -->
        <div id="Chungbuk" class="panel-collapse collapse">
        	<c:forEach var="chungbukList" items="${chungbukList }" >
            <div class="panel-body">
                <p><a href="cityDetail.go?c_no=${chungbukList.c_no }&keyword=충북">${chungbukList.c_name }</a></p>
            </div>
            </c:forEach>
            <c:if test="${session_m_email == 'admin' }">
            <div class="panel-body">
          		<p>
          			<a href='cityWriteForm.go?state_no=10'><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></a>
          		</p>
          	</div>
          	</c:if>
        </div>
        
        <!-- 11.충남 -->
        <div id="Chungnam" class="panel-collapse collapse">
        	<c:forEach var="chungnamList" items="${chungnamList }" >
            <div class="panel-body">
                <p><a href="cityDetail.go?c_no=${chungnamList.c_no }&keyword=충남">${chungnamList.c_name }</a></p>
            </div>
            </c:forEach>
            <c:if test="${session_m_email == 'admin' }">
            <div class="panel-body">
          		<p>
          			<a href='cityWriteForm.go?state_no=11'><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></a>
          		</p>
          	</div>
          	</c:if>
        </div>
        
        <!-- 12.전북 -->
        <div id="Jeonbuk" class="panel-collapse collapse">
        	<c:forEach var="jeonbukList" items="${jeonbukList }" >
            <div class="panel-body">
                <p><a href="cityDetail.go?c_no=${jeonbukList.c_no }&keyword=전북">${jeonbukList.c_name }</a></p>
            </div>
            </c:forEach>
            <c:if test="${session_m_email == 'admin' }">
            <div class="panel-body">
          		<p>
          			<a href='cityWriteForm.go?state_no=12'><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></a>
          		</p>
          	</div>
          	</c:if>
        </div>
        
        <!-- 13.전남 -->
        <div id="Jeonnam" class="panel-collapse collapse">
        	<c:forEach var="jeonnamList" items="${jeonnamList }" >
            <div class="panel-body">
                <p><a href="cityDetail.go?c_no=${jeonnamList.c_no }&keyword=전남">${jeonnamList.c_name }</a></p>
            </div>
            </c:forEach>
            <c:if test="${session_m_email == 'admin' }">
            <div class="panel-body">
          		<p>
          			<a href='cityWriteForm.go?state_no=13'><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></a>
          		</p>
          	</div>
          	</c:if>
        </div>
        
        <!-- 14.경북 -->
        <div id="Gyeongbuk" class="panel-collapse collapse">
        	<c:forEach var="gyeongbukList" items="${gyeongbukList }" >
            <div class="panel-body">
                <p><a href="cityDetail.go?c_no=${gyeongbukList.c_no }&keyword=경북">${gyeongbukList.c_name }</a></p>
            </div>
            </c:forEach>
            <c:if test="${session_m_email == 'admin' }">
            <div class="panel-body">
          		<p>
          			<a href='cityWriteForm.go?state_no=14'><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></a>
          		</p>
          	</div>
          	</c:if>
        </div>
        
        <!-- 15.경남 -->
        <div id="Gyeongnam" class="panel-collapse collapse">
        	<c:forEach var="gyeongnamList" items="${gyeongnamList }" >
            <div class="panel-body">
                <p><a href="cityDetail.go?c_no=${gyeongnamList.c_no }&keyword=경남">${gyeongnamList.c_name }</a></p>
            </div>
            </c:forEach>
            <c:if test="${session_m_email == 'admin' }">
            <div class="panel-body">
          		<p>
          			<a href='cityWriteForm.go?state_no=15'><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></a>
          		</p>
          	</div>
          	</c:if>
        </div>
        
        <!-- 16.제주 -->
        <div id="Jeju" class="panel-collapse collapse">
        	<c:forEach var="jejuList" items="${jejuList }" >
            <div class="panel-body">
                <p><a href="cityDetail.go?c_no=${jejuList.c_no }&keyword=제주">${jejuList.c_name }</a></p>
            </div>
            </c:forEach>
            <c:if test="${session_m_email == 'admin' }">
            <div class="panel-body">
          		<p>
          			<a href='cityWriteForm.go?state_no=16'><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></a>
          		</p>
          	</div>
          	</c:if>
        </div>

    </div>
    
</div>
</td>
</tr>
</table>

<br/>

<!-- 이미지 타일 -->

<table width="80%" align="center">
<tr height>

<td align="center">
<div id="myCarousel" class="carousel slide" data-ride="carousel"  data-interval="2500">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="/gokkiri/resources/img/main1.jpg" alt="제주" height="300">
        <div class="carousel-caption">
         <h4>환상의 섬</h4>
          <h3>제주</h3>
          <p></p>
        </div>      
      </div>

      <div class="item">
        <img src="/gokkiri/resources/img/main2.jpg" alt="부산" height="300">
        <div class="carousel-caption">
          <h4>대한민국 제 2의 도시</h4>
          <h3>부산</h3>
          <p></p>
        </div>      
      </div>
    
      <div class="item">
        <img src="/gokkiri/resources/img/main3.jpg" alt="서울" height="300">
        <div class="carousel-caption">
          <h4>대한민국의 수도</h4>
          <h3>서울</h3>
          <p></p>
        </div>      
      </div>
      
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
</td>

</tr>
</table>

<!-- 이미지 타일 끝 -->

<br/><br/><br/><br/>
</html>