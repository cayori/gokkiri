<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
/* Add a dark background color to the footer */
footer {
    background-color: #266eb7;
    color: #f5f5f5;
    padding: 32px;
}

footer a {
    color: #f5f5f5;
}

footer a:hover {
    color: #777;
    text-decoration: none;
}
</style>

<script>
$(document).ready(function(){
    // Initialize Tooltip
    $('[data-toggle="tooltip"]').tooltip(); 
})
 </script>
 
<script>
$(document).ready(function(){
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {

  // Make sure this.hash has a value before overriding default behavior
  if (this.hash !== "") {

    // Prevent default anchor click behavior
    event.preventDefault();

    // Store hash
    var hash = this.hash;

    // Using jQuery's animate() method to add smooth page scroll
    // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
    $('html, body').animate({
       scrollTop: $(hash).offset().top
    }, 900, function(){

      // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if 
  });
})
</script>

</head>
<body>

<footer class="text-center">
  <a class="up-arrow" href="#myPage" data-toggle="tooltip" title="TOP">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a><br><br>
<div class="row">
	<div class="col-sm-3 text-left">
		<div class="row">
		<H4>Gokkiri</H4>
		·여행지&nbsp;&nbsp;
		·일정 만들기&nbsp;&nbsp;
		·일정 게시판&nbsp;&nbsp;
		·여행 Tip&nbsp;&nbsp;
		</div>
	</div>
	<div class="col-sm-4 text-left">
		<div class="row">
		<H4>Guide</H4>
		·사이트 소개&nbsp;&nbsp;
		·이용 방법&nbsp;&nbsp;
		·광고 및 제휴&nbsp;&nbsp;
		</div>
	</div>
	<div class="col-sm-4 text-left">
		<div class="row">
		</div>
	</div>
	<div class="col-sm-4 text-right">
		<div class="row">
		<H4>Copyright ⓒ 2017 Gokkiri.com, All Rights Reserved.</H4>
		</div>
	</div>
</div>
</footer>


</body>
</html>