<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>


<table width="50%" align="center">
<tr><td>
<div id="wrapper">

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">

			<div class="page-header">
				
				<div class="panel panel-default" style="text-align:center;">
					<div class="panel-heading">
						<font size="4">
							<a href="/gokkiri/area/areaDetail.go?a_no=${param.a_no }&keyword=${fn:substring(areaModel.a_addr,0,2)}"><b>원글 제목 : ${areaModel.a_name }</b></a>
						</font>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-sm-4">
								<img src="/gokkiri/resources/area_img/${main_img }" width="200" height="120">
							</div>
							<div class="col-sm-8" style="text-align:left;">
								<font size="2">· 주소 : ${areaModel.a_addr }<br/>
								· 가는 방법 : ${areaModel.a_way }<hr>
								·&nbsp;
								<!-- 몇자 이상이면 ...으로 보이도록 -->
								<c:if test="${fn:length(areaModel.a_con) gt 100 }">
									<c:out value="${fn:substring(areaModel.a_con, 0, 100) }" />......
								</c:if>
								<c:if test="${fn:length(areaModel.a_con) le 100 }">
									${areaModel.a_con }
								</c:if>
								</font>
							</div>
						</div>
					</div>
				</div>
				
				<br/><br/>
				<strong><font size="6px">Q&A</font></strong>&nbsp;&nbsp; 
				<font color="red">질문&답변 게시판입니다.</font>
				<div class="menu-wrap" style="text-align:right;">
				<!-- 로그인 하지 않으면 글쓰기를 할 수 없다. -->
			   <c:if test="${session_m_email != null }">
					<button type="submit" class="btn btn-default" 
					onclick="javascript:location.href='qnaWriteForm.go?a_no=${param.a_no}'">글쓰기</button>
				</c:if>
				
			</div>
		</div>
	</div>

</div>


<c:forEach var="qnaList" items="${qnaList }" varStatus="stat">
														
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-primary" style="text-align:center;">
			<div class="panel-heading">
				<a href="qnaView.go?q_no=${qnaList.q_no }&a_no=${param.a_no}">
					<font size="4" color="#ffffff">
					<b><span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>&nbsp;&nbsp;
					${qnaList.q_sub}</b></font>
				</a>
			</div>
			<div class="panel-body">
				작성자 : ${qnaList.m_email}&nbsp;&nbsp;|&nbsp;&nbsp;
				작성일 : <fmt:formatDate value="${qnaList.q_date}" pattern="YYYY-MM-dd, hh:mm" /><hr/>
				${qnaList.q_con}
			</div>
		</div>
	</div>
</div>
</c:forEach>


<!-- DB상 게시물이 없으면 보여주는 것 -->
<c:if test="${fn:length(qnaList) le 0}">
	<br />
	<center>등록된 게시물이 없습니다</center>
	<br />
</c:if>

</div>
</div>
</td>
</tr>
</table>

<br/><br/>
</body>

</html>