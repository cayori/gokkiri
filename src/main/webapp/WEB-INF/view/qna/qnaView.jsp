<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>

<!-- <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css"> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.contents-wrap {
	margin: 30px 0 0 0;
	min-height: 500px;
}

.contents {
	margin: 60px 0 0 0;
}

.recode-wrap {
	text-align: right;
	color: #888;
}

.hit-wrap {
	color: #888;
	margin: 10px 0;
}

.viewForm {
	margin: 20px 0 0 0;
}
</style>
<title>Q&A</title>
<script type="text/javascript">
	/* var onComment = function() {
		var form = $('.commentForm')[0];
		form.action = 'qnacommWrite.go';
		if (form.q_co_con.value == "") {
			alert("내용을 입력해주세요");
		} else {
			form.submit();
		}
		//넘기는 부분
	} */
	function qnaDelete() {
		if (confirm("삭제 하시겠습니까?") == true) {
			location.href = 'qnaDelete.go?q_no=${qnAModel.q_no}';
		} else {
			return;
		}
	}

	function qnaModify() {
		if (confirm("수정 하시겠습니까?") == true) {
			location.href = 'qnaModify.go?q_no=${qnAModel.q_no}&a_no=${param.a_no}';
		} else {
			return;
		}
	}
	function qnacommDelete(num) {
		if (confirm("댓글을 삭제 하시겠습니까?") == true) {
			location.href = 'qnacommDelete.go?q_co_no=' + num
					+ '&q_no=${qnAModel.q_no}';
		} else {
			return;
		}
	}
</script>
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
 			</div>
		</div>
	</div>
</div>
</td></tr>
</table>


<table width="50%" align="center">
<tr><td>
	<div id="wrapper">
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><b>Q&A 상세보기</b></h3>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="dataTable_wrapper">
							<table class="table table-striped table-bordered table-hover" id="dataTables-example">
								<tr>
									<td align="center" class="tg-yw4l" colspan="2" height="50">
										<h2>
											<b>${qnAModel.q_sub}</b>
										</h2>
									</td>
								</tr>

								<tr>
									<td align="center" class="tg-yw4l" colspan="2" height="50">${qnAModel.q_con}</td>
								</tr>
								<tr>
									<td class="tg-yw4l" height="30">${qnAModel.m_email}</td>
									<td class="tg-yw4l" height="30"><fmt:formatDate
											value="${qnAModel.q_date}" pattern="YYYY-MM-dd, hh:mm" /></td>

								</tr>

							</table>
						</div>
					</div>
				</div>


				&nbsp;&nbsp;
				<input type="button" onclick="location.href='qnaList.go?a_no=${param.a_no}'" value="목록" class="btn btn-default" />
				<!-- 작성자 아이디와 로그인한 아이디가 같거나 로그인한 아이디가 admin일때만 수정과 삭제 버튼을 보여줌-->
				<c:if test="${session_m_email == qnAModel.m_email }"> 
				<input type="button" onclick="qnaModify()" value="수정"
					class="btn btn-primary" /> <input type="button"
					onclick="qnaDelete()" value="삭제" class="btn btn-primary" /> 
					</c:if><br />
				<br /> <br /> <br />
				
            <form:form commandName="qnAModel" action="qnacommWrite.go" enctype="multipart/form-data"   method="post">
				<!-- 댓글쓰는 창 -->
				<div class="inner">
					<form class="commentForm" method="post" onsubmit="return validation();">
					
						<input type="hidden" name="q_no" value="${qnAModel.q_no}" />
						<input type="hidden" name="m_email" value="${session_m_email}" />
						<input type="hidden" name="a_no" value="${param.a_no }" />

						<div class="reply_form">

							<div class="reply_write">
								<div class="textarea_grp" >
									<!-- 로그인안했을 때 보여주는 댓글 요청 내용 -->
									<br />
								 <c:if test="${session_m_email == null}"> 
										&nbsp;&nbsp;<input type="text"
										style="align: center; margin: 10px; width: 950px; height: 55px;"
										value="로그인 후에  댓글 작성이 가능합니다." readonly="readonly" /> -
										</c:if>
									<!-- 댓글 쓰는 창 -->
									 <c:if test="${session_m_email != null}"> 
									<!-- 글자 수 제한 -->
									<textarea name="q_co_con" style="width: 885px; height: 55px;"
										onKeyUp="javascript:fnChkByte(this,'200')"></textarea>
									<input type="button" class="btn1 btn-primary1" value="입력"
										onclick="this.form.submit()"/> 
										</c:if>				
									<div style="margin-bottom: 10px;">
										<br />&nbsp;&nbsp;&nbsp;
									</div>


								</div>
							</div>
							</div>
							</form>
					</form:form>


						
								<c:if test="${fn:length(qnacommList) eq 0}">
									<br />
									<center>등록된 댓글이 없습니다</center>
									<br />
								</c:if>
								<!-- 댓글 차례로 보여주는 창 -->
								<c:forEach var="qnacommList" items="${qnacommList }"
									varStatus="stat">
									<div class="reply_view">
										<div class="reply_tit">
											<p class="tit">
												<strong>${qnacommList.m_email }</strong>님
												<fmt:formatDate value="${qnacommList.q_co_date}"
													pattern="yy.MM.dd"></fmt:formatDate>
												<span class="ip"></span>
											</p>
							<c:if test="${session_m_email == qnacommList.m_email || session_m_email == 'admin'}"> 
							<!-- 관리자 혹은 글쓴이는 댓글 삭제가능 -->
								<a href="qnacommDelete.go?q_co_no=${qnacommList.q_co_no}&q_no=${qnAModel.q_no} &m_email=${qnacommList.m_email} >">
								<input type="button" onclick="qnacommDelete(${qnacommList.q_co_no})"  value="삭제" class="btn btnC_01 btnP_02"/>
								</a>
							</c:if>
						</div>
						<div class="reply_cts">
							<p>${qnacommList.q_co_con}</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</form>

	</div>



		</div>
	</div>
</div>
	
</td></tr>
</table>
</body>
</html>