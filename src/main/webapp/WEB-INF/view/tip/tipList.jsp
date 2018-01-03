<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
img {
    border-radius: 3px;
}

/*일정 검색*/
.panel {
   x background-color: #f5f5f5;
   text-align: center;
}

div.panel-heading {
   width: 120px;
   height: 50px;
   display: inline-block;
}

div.panel-body {
   width: 120px;
   height: 50px;
   display: inline-block;
}

.jumbotron {
   background-image: url('/gokkiri/resources/img/cloud2.jpg');
   background-repeat: no-repeat;
   background-position: center;
   background-size: cover;
   width: 100%;
   height: 100%;
}

/* 일정 갤러리 */
ul {
   list-style: none;
}

#hover-cap-4col .thumbnail {
   position: relative;
   overflow: hidden;
   height: 300px;
}

.caption {
   display: none;
   position: absolute;
   top: 0;
   left: 0;
   background: rgba(0, 0, 0, 0.4);
   width: 100%;
   height: 100%;
   color: #fff !important;
}

.media-carousel img
{
  width: 250px;
  height: 180px
}

input[type=text] {
    width: 130px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    background-color: white;
    background-image: url('/gokkiri/resources/img/searchicon.png');
    background-position: 5px 5px; 
    background-repeat: no-repeat;
    padding: 7px 20px 7px 40px;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;
}

input[type=text]:focus {
    width: 50%;
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

<script>
   /* //일정 검색
   $('#accordion').on('shown.bs.collapse', function() {

      var panel = $(this).find('.in');

      $('html, body').animate({
         scrollTop : panel.offset().top
      }, 500);

   }); */

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

<title>여행지 TIP 리스트</title>
</head>
<body>
<center>

   <!-- 상단 이미지 + Tip 검색 -->
   <div class="jumbotron text-center">
      <form class="form-inline">
         <p>
            <font color="#ffffff" size="10"><b>여행 Tip을 공유해보세요!</b></font>
         </p>
         <p>
            <font color="#ffffff" size="3">찾는 Tip을 검색해보세요!</font>
         </p>
         <!-- <select class="searchOption btn btn-default " name="searchNum"
            id="searchNum">
            <option value="0">제목</option>
            <option value="1">여행지명</option>

         </select>
         <div class="input-group">
            <input type="text" name="keyword" id="isSearch"
               class="form-control" size="50" placeholder="ex)제주도, 여행, 팁..." required>
            <div class="input-group-btn">
               <button  class="btn btn-default" type="submit">검색</button>
            </div>
         </div> -->
        <input type="hidden" name="searchNum" value="1">
        <input type="text" name="keyword" placeholder="검색">

      </form>
   </div>

<br/>

<c:if test="${param.keyword == null }">
<!-- 인기 여행Tip 리스트  -->  
<h1 class="text-center">
<img src="/gokkiri/resources/img/mainTitle3.png" />
</h1>
<br/>
<table width="80%" align="center" cellpadding="1" cellspacing="1">
<tr>

<td align="center">

  <div class="row">
    <div class="col-md-12">
      <div class="carousel slide media-carousel" id="media3">
        <div class="carousel-inner"> 
           <!-- 첫번째 슬라이드(기준) -->
         <div class="item  active">
         <div class="row" >
         
             <c:forEach var="tipList" items="${tipHList }" varStatus="stat">
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
   <hr/>
</td></tr>
<tr><td align="right">

<c:if test="${session_m_email != null }">
   <button class="button" onclick="javascript:location.href='tipWriteForm.go'">TIP 작성</button>
</c:if>

</td></tr>

</table>
</c:if>   

      <c:choose>
         <c:when test="${fn:length(tipList) le 0 }">
            <tr align="center">
               <td colspan="3"><center>등록된 게시물이 없습니다</center></td>
            </tr>
         </c:when>
         <c:otherwise>
         </c:otherwise>
      </c:choose>
   </p>


   <div class="container">
      <div class="row">
         <div class="col-md-12" align="center">

            <c:forEach var="tipList" items="${tipList }" varStatus="stat">
               <ul class="thumbnails" id="hover-cap-4col"
                  style="width: 80%; height: 100%;">
                  <li class="col-md-12"><font size="5" color="#266eb7"><b>
                           <span class="glyphicon glyphicon-send" aria-hidden="true"></span>
                           &nbsp;${tipList.t_sub}&nbsp;</b></font>
                     <div class="thumbnail">
                        <div class="caption">
                            <br/><br/><br/> <font size="4">
                              <p>· 여행지명 : ${tipList.a_name }</p>
                              <p>· 작성자 : ${tipList.m_email }</p>
                              <p>· 작성일 : <fmt:formatDate value="${tipList.t_date }" pattern="yyyy.MM.dd" /></p>
                           </font>
                           <p style="width: 58%;">
                              <c:if test="${fn:length(tipList.t_con) gt 100 }">
                                 <c:out value="${fn:substring(tipList.t_con, 0, 100) }" />......
                           </c:if>
                              <c:if test="${fn:length(tipList.t_con) le 100 }">
                              ${tipList.t_con }
                           </c:if>
                           </p>

                           <p>
                           	<c:if test="${param.currentPage == null }">
                              <a href="tipDetail.go?currentPage=1&t_no=${tipList.t_no }"
                                 data-toggle="tooltip" title="상세보기"><img
                                 src="../resources/img/view.png" width="25" /></a>
                            </c:if>
                            <c:if test="${param.currentPage != null }">
                              <a href="tipDetail.go?currentPage=${param.currentPage }&t_no=${tipList.t_no }"
                                 data-toggle="tooltip" title="상세보기"><img
                                 src="../resources/img/view.png" width="25" /></a>
                            </c:if>
                           </p>

                        </div>

                        <img src="../resources/tip_img/${tipList.t_img_sav }"
                           alt="ALT NAME" class="img-responsive"
                           style="width: 100%; height: 400px;">
                     </div> <br />
                     <hr> <br /></li>

               </ul>
            </c:forEach>
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