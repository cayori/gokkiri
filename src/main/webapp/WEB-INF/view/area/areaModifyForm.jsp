<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>Insert title here</title>
<style>
/*모달*/
.modal{
padding-top:50px; 
}

.modal-dialog{
 text-align:center;
}
</style>
<script type="text/javascript"> 

function areaDetail(){
	
	if(confirm("수정하기를 취소하시겠습니까?") == true){
		location.href="areaDetail.go?a_no=${param.a_no}&keyword=${param.keyword}";
	}else{
		false;
	}
}

function searchMap(){
	var url="areaSearchMap.go";
	open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=1000,height=500");	
}

</script>
</head>
<body>


<br/><br/>

<!-- ----------------------------------------------- -->

<div class="container">
<table width="60%" align="center">
<tr><td>
  <div class="row">
  	<div class="col-md-12">
    	<form action="areaModify.go" name="areaWrite" class="form-horizontal" enctype="multipart/form-data"	method="post">
         <input type="hidden" name="keyword" value="${param.keyword }" />
          <fieldset>
            <div id="legend">
              <legend>여행지 글쓰기</legend>
            </div>
          <br/><br/>  
	            <div class="radio">
	            	<c:if test="${a_cate == 0 }">
	 				 	<label><input type="radio" name="a_cate" value="0" checked="checked">관광지</label>
	 				 	<label><input type="radio" name="a_cate" value="1">맛집</label>
	 				 </c:if>
	 				 <c:if test="${a_cate == 1 }">
	 				 	<label><input type="radio" name="a_cate" value="0">관광지</label>
	 				 	<label><input type="radio" name="a_cate" value="1" checked="checked">맛집</label>
	 				 </c:if>
				</div>
          <br/>
          
        <button type="button" class="btn btn-default btn-lg" onclick="searchMap()">
  			<span class="glyphicon glyphicon-search" aria-hidden="true">주소검색</span>
		</button>
          
          <br/><br/>
            <div class="control-group">
              <label class="control-label" for="a_name">· 여행지 이름</label>
              <div class="controls">
                <input name="a_name" class="form-control input" id="a_name" type="text" value="${areaModel.a_name}" placeholder="주소검색 버튼을 클릭 해주세요" readonly>
                <!-- <p class="help-block"></p> -->
              </div>
            </div>
         <br/>
         	<div class="control-group">
              <label class="control-label" for="a_addr">· 여행지 주소</label>
              <div class="controls">
                <input name="a_addr" class="form-control input" id="a_addr" type="text" value="${areaModel.a_addr }" placeholder="주소검색 버튼을 클릭 해주세요" readonly>
              </div>
            </div>
         <br/>
         	<div class="control-group">
              <label class="control-label" for="a_tel">· 전화번호</label>
              <div class="controls">
                <input name="a_tel" class="form-control input" id="a_tel" type="text" value="${areaModel.a_tel }" placeholder="ex) 02-000-0000">
              </div>
            </div>
         <br/>
            <div class="control-group">
              <label class="control-label" for="a_way">· 가는 방법</label>
              <div class="controls">
                <input name="a_way" class="form-control input" id="a_way" type="text"  value="${areaModel.a_way }" placeholder="ex) 2호선 삼성역 5번 출구로 나가서 도보로 5분">
              </div>
            </div>
         <br/>
         <div class="control-group">
              <label class="control-label" for="a_hours">· 영업 시간</label>
              <div class="controls">
                <input name="a_hours" class="form-control input" id="a_hours" type="text"  value="${areaModel.a_hours }"  placeholder="ex) AM 07:00 ~ PM 9:00 연중무휴">
              </div>
            </div>
         <br/>
         <div class="control-group">
              <label class="control-label" for="a_web">· 웹 사이트</label>
              <div class="controls">
                <input name="a_web" class="form-control input" id="a_web" type="text" value="${areaModel.a_web }" placeholder="ex) www.google.co.kr">
              </div>
            </div>
         <br/>
         <div class="control-group">
              <label class="control-label" for="a_con">· 상세 설명</label>
              <div class="controls">
                <textarea rows="10" cols="100"  name="a_con" class="form-control input" id="a_con" 
                placeholder="ex) 압구정/청담에 이어 새로운 패션, 뷰티, 문화의 중심지 역할을 하고 있는 가로수길은 영동호텔 맞은편 부터 시작하여 압구정 현대고등학교 사이의 700m정도의 거리를 가로수길이라고...">${areaModel.a_con }</textarea>
              </div>
            </div>
         <br/>
         <div class="control-group">
              <label class="control-label" for="file">· 첨부파일</label>
              <div class="controls">
              <input id="files-upload" type="file" name="file" multiple>
				
				<ul id="file-list">
				</ul>
				
				<ul>
					<li class="no-items"><font color="red">* 이미지 파일을 다시 첨부하지 않으면 이전 원본 이미지로 저장이 됩니다.</font></li>
					<c:forEach var="imgList" items="${imgList }" varStatus="stat">
						<c:if test="${stat.index == 0 }">
						</c:if>
						<li class="no-items"><font color="gray">${imgList.a_img_org }</font></li>
					</c:forEach>
				</ul>
<script>

/* 파일 업로드 */

var filesUpload = document.getElementById("files-upload"),
    fileList = document.getElementById("file-list");
 
function traverseFiles (files) {
  var li,
      file,
      fileInfo;
  fileList.innerHTML = "";
     
  for (var i=0, il=files.length; i<il; i++) {
    li = document.createElement("li");
    file = files[i];
    fileInfo = "<div><strong>Name:</strong> " + file.name + "</div>";
    fileInfo += "<div><strong>Size:</strong> " + file.size + " bytes</div>";
    fileInfo += "<div><strong>Type:</strong> " + file.type + "</div>";
    li.innerHTML = fileInfo;
    fileList.appendChild(li);
  };
};
 
filesUpload.onchange = function () {
  traverseFiles(this.files);
};
</script>

              </div>
            </div>
         <br/>
            <div class="control-group">
              <!-- Button -->
              <div class="controls">

              </div>
            </div>
          </fieldset>
          

    
    </div> 
  </div>
  </td></tr>
 </table>
</div>
<center>
<input type="hidden" name="a_no" value="${param.a_no }" />
<button class="btn btn-success" onclick="this.form.submit();">수정하기</button>&nbsp;</form>
<button class="btn btn-default" onclick="areaDetail();">취소</button>
</center>
<br><br><br>
</body>
</html>