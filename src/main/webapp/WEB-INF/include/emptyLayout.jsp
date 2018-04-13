<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html class="no-js">
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
  	
  	<!-- include libraries(jQuery, bootstrap) 
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
-->
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

	<tiles:insertAttribute name="body" />
	
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