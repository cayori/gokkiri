<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
#boardWriteForm{margin: 30px 0;}
.menu-wrap{text-align: right; margin-right:50px;}
.contents-wrap{margin:30px 0 0 0;min-height: 500px;}
   .contents{ margin: 60px 0 0 0;}
   .recode-wrap{text-align: right; color: #888;}
   .hit-wrap{color:#888; margin: 10px 0;}
   .viewForm{margin: 20px 0 0 0;}
</style>
</head>
<body>


<table width="50%" align="center">
<tr><td>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">

			<div class="page-header">
				
				<div class="panel panel-default" style="text-align:center;">
					<div class="panel-heading">
						<font size="4">
							<a href="/gokkiri/area/areaDetail.go?a_no=${param.a_no }"><b>원글 제목 : ${areaModel.a_name }</b></a>
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
 			</div>
		</div>
	</div>
</div>
</td></tr> 
</table>



<table width="50%" align="center">
<tr><td>
	
	<div id="wrapper">
			<form:form commandName="qnaModel" action="/gokkiri/qna/qnaModifySuccess.go" method="post"> 
			<div id="page-wrapper">
        		 <div class="row">
           			 <div class="col-lg-12">
						<h3 class="page-header"><br/>Q&A 수정</h3>
						<table class="table table-striped table-bordered table-hover"  id="dataTables-example">
						
				<thead>
					<tr class="danger">
							<th width="15%" align="center">글제목</th>
							<td colspan=5><form:input  path="q_sub" theme="simple" value="${qnaModel.q_sub}" />
							</td>
							</tr>
							</thead>
						<tr>		
				<tbody>
				
					<form:input type="hidden" path="q_no" value="${qnaModel.q_no}" />
					<tr>
						 <th>작성날짜</th>
						 <td><fmt:formatDate value="${qnaModel.q_date}" pattern="yyyy.MM.dd, hh:mm"/>
						</td>
					
					<%-- 	 <th >사용자 ID</th>
						 	<form:input type="hidden" path="member_id" value="${session_m_email }" />
							<td align="left">${session_m_email }						 </td> --%>
							</tr>
							<tr>
								<th colspan=6>글내용<font color="red">(제목이나 내용 중 하나라도 입력하지 않으면 수정할 수 없습니다.)</font></th>
							</tr>
							<tr>
								<td colspan=6 height=300 style="padding: 0px !important;">
									<form:textarea path="q_con" theme="simple" value="${qnaModel.q_con}"style="padding:3px; margin:0px; width: 100%; height: 100%;"/>
								</td>
							</tr>
					</tbody>
				</table>
			</div>
			</div>
		<br/>
			<div class="row">
            	<div class="col-lg-12">
            			<div class="menu-wrap">	
								<span >	<input type="submit" value="작성완료" class="btn btn-primary"style="font-size: 14px;padding:5px;height:36px;vertical-align: middle;"/>	</span>
								<span  onclick="history.go(-1);"> <input type="button" value="취소" class="btn btn-primary"style="font-size: 14px;padding:5px;margin-left:5px;height:36px;vertical-align: middle;"/> </span>
						</div>
				</div>
			</div>
				<br/>
				<br/>
				<br/>
				<br/>
				
					</form:form>
	</div>
		</div>
		
</td></tr>
</table>
</body>
</html>