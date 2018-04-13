<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="R" value="/" />
<div id="fh5co-main">

	<div class="container">

		<!-- 
				///////////////////////////////////
				Forms 
				///////////////////////////////////
				-->
		<div class="row">
			<div class="col-md-12 animate-box">
				<h2 class="fh5co-uppercase-heading-sm text-center">멘토 상세보기</h2>
				<div class="fh5co-spacer fh5co-spacer-sm"></div>
			</div>
			<div class="col-md-12 animate-box board">
				<form method="post">
					<div class="col-md-12">
						<img src="${R}manager/getImage?id=${ mentor.apply_f_intro_fk }"
							alt="" class="fh5co-align-center img-responsive">
						<div class="fh5co-spacer fh5co-spacer-md"></div>
					</div>
					<div class="col-md-6">
						<label for="name">멘토(학번)</label>
						<div class="panel panel-default">${ mentor.name }(${ mentor.user_id })</div>
					</div>
					<div class="col-md-6">
						<label for="group_name">주제</label>
						<div class="panel panel-default">${ mentor.subject }</div>
					</div>
					<div class="col-md-12">
						<label for="subject">팀명</label>
						<div class="panel panel-default">${ mentor.group_name }</div>
					</div>
					<div class="col-md-4">
						<label for="year">학년</label>
						<div class="panel panel-default">${ mentor.year }</div>
					</div>
					<div class="col-md-4">
						<label for="grade">해당 과목 성적</label>
						<div class="panel panel-default">${ mentor.grade }</div>
					</div>
					<div class="col-md-4">
						<label for="mentee_num">희망 멘티 인원</label>
						<div class="panel panel-default">${ mentor.count }</div>
					</div>
					<div class="col-md-12">
						<label for="study_purpose">스터디 목적</label>
						<div class="panel panel-default">${ mentor.study_purpose }</div>
					</div>
					<div class="col-md-12">
						<label for="study_content">스터디 내용</label>
						<div class="panel panel-default">${ mentor.study_content }</div>
					</div>
					<div class="col-md-12">
						<label for="message">스터디 방법</label>
						<div class="panel panel-default">${ mentor.study_method }</div>
					</div>
					<div class="col-md-2">
						<a href="${R}manager/file/download?id=${ mentor.apply_f_time_id }">
							시간표 <img src="${R}images\file.png" border="0">
						</a>
					</div>
					<div class="col-md-2">
						<a href="${R}manager/file/download?id=${ mentor.apply_f_doc_fk }">
							증빙서류 <img src="${R}images\file.png" border="0">
						</a>
					</div>
					
					<div class="fh5co-spacer fh5co-spacer-sm"></div>
					<c:if test="${ period ne 2 }">
					<div class="col-md-12">
						<c:choose>
							<c:when test="${ mentor.type == 1}">
								<a href="mentor_detail_update.do?id=${ mentor.id }"
									class="btn btn-primary btn-lg col-md-offset-8">멘토선정</a>
							</c:when>
							<c:when test="${ mentor.type == 3 }">
								<a href="mentor_detail_update.do?id=${ mentor.id }"
									class="btn btn-cancel btn-lg col-md-offset-8">선정취소</a>
							</c:when>
						</c:choose>
						<input type="button" class="btn btn-outline btn-lg"
							onclick="location.href='m_contact.do'" value="목록">
					</div>
					</c:if>
				</form>
			</div>
		</div>
		<!-- END row -->
	</div>
	<!-- END container -->
</div>
<!-- END fhtco-main -->