<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
				<h2 class="fh5co-uppercase-heading-sm text-center">보고서</h2>
				<div class="fh5co-spacer fh5co-spacer-sm"></div>
			</div>
			<form:form method="post" modelAttribute="report" name="frm"
				onsubmit="return excel();">
				<div class="col-md-12 animate-box board" id="excel_body">
					<input type="hidden" name="excel_data" />
					<div class="col-md-12">
						<label>스터디 주제</label>
						<div class="panel panel-default">${ report.subject }</div>
					</div>
					<div class="col-md-3">
						<label>장소</label>
						<div class="panel panel-default">${ report.place }</div>
					</div>
					<div class="col-md-3">
						<label>모임요일</label>
						<div class="panel panel-default">${ report.day }</div>
					</div>
					<div class="col-md-3">
						<label>시작 시간</label>
						<div class="panel panel-default">${ report.start_time }</div>
					</div>
					<div class="col-md-3">
						<label>종료 시간</label>
						<div class="panel panel-default">${ report.end_time }</div>
					</div>

					<div class="col-md-12">
						<label>스터디 내용</label>
						<div class="panel panel-default">${ report.study_content }</div>
					</div>

					<div class="col-md-2">
						<a href="${R}user/file/download?id=${ report.rep_f_photo_id }">
							인증샷 <img src="${R}images\camera.gif" border="0">
						</a>
						<div class="fh5co-spacer fh5co-spacer-md"></div>
					</div>

					<div class="col-md-2">
						<a href="${R}user/file/download?id=${ report.rep_f_study_id }">
							활동증명 <img src="${R}images\file.png" border="0">
						</a>
						<div class="fh5co-spacer fh5co-spacer-md"></div>
					</div>

					<div class="col-md-12">
						<a data-url="${url}"
							class="btn btn-primary btn-lg col-md-offset-8">목록으로</a> <a
							href="${R}/report/excel-xls?id=${ report.id }"
							class="btn btn-primary btn-lg">다운로드</a>
					</div>
				</div>
			</form:form>
		</div>
		<!-- END row -->

		<div class="fh5co-spacer fh5co-spacer-sm"></div>



	</div>
	<!-- END container -->


</div>
<!-- END fhtco-main -->