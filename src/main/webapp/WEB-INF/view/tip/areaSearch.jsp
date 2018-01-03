<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*,com.gokkiri.tip.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>결과창</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href='//fonts.googleapis.com/css?family=Amaranth' rel='stylesheet'>

</head>

<script>
	//main페이지로 값 전달: 부모로 값전달하기 위해서는 opener사용
	function sendAdd(a_name,a_no){
		opener.document.tForm.a_no.value= a_no;
		opener.document.tForm.a_name.value= a_name;
	self.close();	
	}

</script>

<body>
<div style="margin-top:100px;margin-bottom:100px;"  id="myModal" >

	

<form class="form-inline">
		<select class="searchOption btn btn-default " name="searchNum2"
				id="searchNum2">
				<option value="0">명소 이름</option>
				<option value="1">명소 주소</option>

			</select>
		<div class="input-group">
				<input type="text" name="isSearch2" id="isSearch2"
					class="form-control" size="50" 
					required>
				<div class="input-group-btn">
					<button type="button" class="btn btn-default" type="submit" >search</button>
				</div>
			</div>
			</form>
			</div>
			
			<div>
		<c:forEach var="areaList" items="${areaList }" varStatus="stat">
				
<p><td>${areaList.a_addr }</td> --- <a  href="javascript:sendAdd('${areaList.a_name}','${areaList.a_no }')">${areaList.a_name }</a></p>

</c:forEach>	
		</div>
		
		
		
	
	
	
	
</body>
</html>