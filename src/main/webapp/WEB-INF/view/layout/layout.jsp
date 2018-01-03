<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Go끼리</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href='//fonts.googleapis.com/css?family=Amaranth' rel='stylesheet'>
  
  <style>
a.jcm-top {
    position: fixed;
    right: 15px;
    bottom: 15px;
    border-radius: 5px;
    color: #ffffff;
	  text-align: center;
	  width: 45px;
	  height: 45px;
	  font-size: 40px;
    /*background-color: rgba(50,50,50,0.5);*/
    background-color:#ffffff; opacity:0.5; filter:alpha(opacity=50); /*ie8 호환을 위한코드 위와 동일한 것임 호환필요없으면 한줄로 rgba적으면됨*/
    z-index: 999;
   display: none;
}

</style>
 <script>
      $( document ).ready( function() {
        $( window ).scroll( function() {
          if ( $( this ).scrollTop() > 200 ) {
            $( '.jcm-top' ).fadeIn();
          } else {
            $( '.jcm-top' ).fadeOut();
          }
        } );
        $( '.jcm-top' ).click( function() {
          $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
          return false;
        } );
      } );
    </script>

<style type="text/css">
  body {
    font-family: 'Amaranth';
}
</style>
</head>
<body>

<!-- header -->
<tiles:insertAttribute name="header" />
<br/><br/>

<!-- container -->
<tiles:insertAttribute name="body" />

<!-- footer -->
<tiles:insertAttribute name="footer" />

</body>
</html>