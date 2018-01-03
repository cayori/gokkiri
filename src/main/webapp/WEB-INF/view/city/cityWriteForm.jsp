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

</style>
<script type="text/javascript"> 

function cityList(){
	
	if(confirm("리스트로 이동하시겠습니까?") == true){
		location.href="cityList.go";
	}else{
		false;
	}
}

</script>
</head>
<body>

<br><br>



<div class="container">

<table width="60%" align="center">
<tr><td>
  <div class="row">
  	<div class="col-md-12">
    	<form action="cityWrite.go" class="form-horizontal" enctype="multipart/form-data"	method="post">
         
          <fieldset>
            <div id="legend">
              <legend>도시 글쓰기</legend>
            </div>
          <br/><br/>  
          
		 <div class="control-group">
              <label class="control-label" for="state_name">· 도시 : ${state_name }</label>
         </div>
         <br/>
            <div class="control-group">
              <label class="control-label" for="c_name">· 구 이름</label>
              <div class="controls">
                <input name="c_name" class="form-control input" id="c_name" type="text" placeholder="ex) 강남구, 중구...">
                <!-- <p class="help-block"></p> -->
              </div>
            </div>
         <br/>
            <div class="control-group">
              <label class="control-label" for="c_addr">· 주소 </label>
              <div class="controls">
                <input name="c_addr" class="form-control input" id="c_addr" type="text" placeholder="시,구 까지의 주소를 적어주세요.  ex)서울특별시 강남구" >
              </div>
            </div>
         <br/>
         <div class="control-group">
              <label class="control-label" for="c_con">· 지역 설명</label>
              <div class="controls">
                <textarea rows="10" cols="100"  name="c_con" class="form-control input" id="c_con" 
                placeholder="ex) 서울특별시 남동부에 있는 구. 북쪽으로 한강을 경계로 성동구·광진구, 동쪽으로 송파구, 서쪽으로 서초구와 접하고, 남쪽으로 경기 성남시와 경계를 이룬..."></textarea>
              </div>
            </div>
         <br/>
         <div class="control-group">
              <label class="control-label" for="file">· 첨부파일</label>
              <div class="controls">
              <input id="files-upload" type="file" name="file" multiple>
				
				<ul id="file-list"> 
					<li class="no-items">(파일이 선택되지 않음)</li>
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
<input type="hidden" name="state_no" value="${param.state_no }" />
<button class="btn btn-success" onclick="this.form.submit();">등록하기</button>&nbsp;</form>
<button class="btn btn-default" onclick="cityList();">취소</button>
</center>
<br><br><br>
</body>
</html>