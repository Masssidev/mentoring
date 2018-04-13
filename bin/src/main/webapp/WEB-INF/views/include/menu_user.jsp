<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<header id="fh5co-header-section" role="header" class="" >
			<div class="container">

				

				<!-- <div id="fh5co-menu-logo"> -->
					<!-- START #fh5co-logo -->
					<h1 id="fh5co-logo" class="pull-left"><a href="main"><img src="images/logo.png" alt="SM사업 멘토링"></a></h1>
					
					<!-- START #fh5co-menu-wrap -->
					<nav id="fh5co-menu-wrap" role="navigation" >
						
						
					 <ul class="sf-menu" id="fh5co-primary-menu">
                     <!--<li class="active">-->
                        <!--<a href="main.html">Home</a>-->
                     <!--</li>-->
                     <li>
                         <a href="#" class="fh5co-sub-ddown">sm사업</a>
                        <ul class="fh5co-sub-menu">
                           <li><a href="introduce">사업소개</a></li>
                        </ul>
                     </li>
                     <li>
								<a href="#" class="fh5co-sub-ddown">알립니다</a>
								<ul class="fh5co-sub-menu">
									<li><a href="board">공지사항</a></li>
									<li><a href="mentorapply">멘토모집</a></li>
									<li><a href="menteeapply">멘토링신청</a></li>
								</ul>
							</li>
							<li>
								<a href="#" class="fh5co-sub-ddown">참여광장</a>
								<ul class="fh5co-sub-menu">
									<li><a href="question">질문게시판</a></li>
									<li><a href="board">컨퍼런스홍보</a></li>
								</ul>
							</li>
							<li>
								<a href="#" class="fh5co-sub-ddown">멘토링방</a>
								<ul class="fh5co-sub-menu">
									<li><a href="timetable">시간표</a></li>
									<li><a href="report">보고서</a></li>
									<li><a href="board">학습자료게시판</a></li>
								</ul>
							</li>
							<li>
								<a href="meminfo.html" class="fh5co-sub-ddown">마이페이지</a>
								 <ul class="fh5co-sub-menu">
								 	<li><a href="mypost">내가 쓴 글</a></li>
								 	<li><a href="sendEmail">메일쓰기</a></li>
								 	<li><a href="meminfo">회원정보수정</a></li>
								</ul>
							</li>
							<sec:authorize access="not authenticated">  
							<li class="fh5co-special"><a href="/guest/login">LOGIN</a></li>
							</sec:authorize>
							<sec:authorize access="authenticated">
							<li class="fh5co-special"><a href="/user/logout_processing">LOGOUT</a></li>
							</sec:authorize>
						</ul>
					</nav>
				<!-- </div> -->

			</div>
		</header>
