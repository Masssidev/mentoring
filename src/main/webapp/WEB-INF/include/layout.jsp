<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>SKHU &mdash; SM사업 멘토링</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" />
<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
  	<link rel="shortcut icon" href="${R}images/favicon.ico">
  	


  	<!-- Google Webfont -->
	<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css'>
	<!-- Themify Icons -->
	<link rel="stylesheet" href="${R}css/themify-icons.css">
	<!-- Bootstrap -->
	<link rel="stylesheet" href="${R}css/bootstrap.css">
	<!-- Owl Carousel -->
	<link rel="stylesheet" href="${R}css/owl.carousel.min.css">
	<link rel="stylesheet" href="${R}css/owl.theme.default.min.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="${R}css/magnific-popup.css">
	<!-- Superfish -->
	<link rel="stylesheet" href="${R}css/superfish.css">
	<!-- Easy Responsive Tabs -->
	<link rel="stylesheet" href="${R}css/easy-responsive-tabs.css">
	<!-- Animate.css -->
	<link rel="stylesheet" href="${R}css/animate.css">
	<!-- Theme Style -->
	<link rel="stylesheet" href="${R}css/style.css">

	<!-- Modernizr JS -->
	<script src="${R}js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

</head>
<body>

	<!--메뉴-->
	<sec:authorize access="not authenticated">  
		<tiles:insertAttribute name="user_menu" />
	</sec:authorize>
	<sec:authorize access="authenticated">
    	<sec:authorize access="hasRole('ROLE_MANAGER')">
	   		<tiles:insertAttribute name="manager_menu" />
		</sec:authorize>
		<sec:authentication property="user.type" var="type"/>
		<sec:authorize access="${type!=2}">
			<tiles:insertAttribute name="user_menu" />
		</sec:authorize>  
  	</sec:authorize>    

	
  	<!--게시판 이름-->
  	
	<div id="fh5co-hero">
		<a href="#fh5co-main" class="smoothscroll fh5co-arrow to-animate hero-animate-4"><i class="ti-angle-down"></i></a>
		<!-- End fh5co-arrow -->
		<div class="container">
			<div class="col-md-8 col-md-offset-2">
				<div class="fh5co-hero-wrap">
					<div class="fh5co-hero-intro">
						<h1 class="to-animate hero-animate-1">SKHU SM</h1>
						<h2 class="to-animate hero-animate-2">${ board }</h2>	<!-- 게시판 이름 모델에서 꺼내오기 -->
					</div>
				</div>
			</div>
		</div>		
	</div>
	
	<!--바디-->
	<tiles:insertAttribute name="body" />

	

	<!--메인 페이지 하단-->
		
		<footer role="contentinfo" id="fh5co-footer">
			<a href="#" class="fh5co-arrow fh5co-gotop footer-box"><i class="ti-angle-up"></i></a>
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-sm-6 footer-box">
						<h3 class="fh5co-footer-heading">About us</h3>
						<p>성공회대학교 소프트웨어공학과 데이터베이스 캡스톤디자인</p>
						<p> 남하영, 마재희, 이혜민, 최윤경</p>
					</div>
					<div class="col-md-3 col-sm-6 footer-box">
						<h3 class="fh5co-footer-heading">Links</h3>
						<ul class="fh5co-footer-links">
							<li><a href="http://www.skhu.ac.kr">성공회대학교</a></li>
							<li><a href="http://sw.skhu.ac.kr">소프트웨어공학과</a></li>
							<li><a href="http://forest.skhu.ac.kr">종합정보시스템</a></li>
							<li><a href="http://report.skhu.net">과제제출시스템</a></li>
						</ul>
					</div>
					<div class="col-md-12 footer-box">
						<h3 class="fh5co-footer-heading">문의</h3>
						<p><a href="#" class="btn btn-outline btn-sm">e-mail</a></p>
					</div>
					<div class="col-md-12 footer-box">
						<div class="fh5co-copyright">
						<p>&copy; 2015 Free Slant. All Rights Reserved. <br>Designed by <a href="http://freehtml5.co" target="_blank">FREEHTML5.co</a> Images by: <a href="http://unsplash.com">Unsplash</a> and <a href="http://plmd.me" target="_blank">plmd.me</a></p>
						</div>
					</div>
					
				</div>
				<!-- END row -->
				<div class="fh5co-spacer fh5co-spacer-md"></div>
			</div>
		</footer>

			
		<!-- jQuery -->
		<script src="${R}js/jquery-1.10.2.min.js"></script>
		<!-- jQuery Easing -->
		<script src="${R}js/jquery.easing.1.3.js"></script>
		<!-- Bootstrap -->
		<script src="${R}js/bootstrap.js"></script>
		<!-- Owl carousel -->
		<script src="${R}js/owl.carousel.min.js"></script>
		<!-- Magnific Popup -->
		<script src="${R}js/jquery.magnific-popup.min.js"></script>
		<!-- Superfish -->
		<script src="${R}js/hoverIntent.js"></script>
		<script src="${R}js/superfish.js"></script>
		<!-- Easy Responsive Tabs -->
		<script src="${R}js/easyResponsiveTabs.js"></script>
		<!-- FastClick for Mobile/Tablets -->
		<script src="${R}js/fastclick.js"></script>
		<!-- Parallax -->
		<script src="${R}js/jquery.parallax-scroll.min.js"></script>
		<!-- Waypoints -->
		<script src="${R}js/jquery.waypoints.min.js"></script>
		<!-- jquery 파일 -->
		<script src="${R}js/main.js"></script>
		<!-- 자바스크립트 파일 -->
		<script src="${R}js/javascript.js"></script> 

</body>
</html>

