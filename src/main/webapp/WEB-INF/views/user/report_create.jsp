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
				<h2 class="fh5co-uppercase-heading-sm text-center">보고서 작성</h2>
				<div class="fh5co-spacer fh5co-spacer-sm"></div>
			</div>
			<div class="col-md-12 animate-box">
				<form name="form" method="post" enctype="multipart/form-data"
					onsubmit="return checkWriteReport();">
					<div class="col-md-12">
						<div class="form-group">
							<label for="subject">스터디 주제</label> <input placeholder="스터디 주제"
								id="subject" type="text" name="subject"
								class="form-control input-lg" value="${ report.subject }" />
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<label for="place">스터디 장소</label> <input placeholder="장소"
								name="place" id="place" type="text"
								class="form-control input-lg" value="${ report.place }">
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label for="study_day">이번 주 모임 요일</label> <select id="day"
								class="form-control" name="day">
								<option value=0>--</option>
								<option value=월요일
									<c:if test="${report.day eq '월요일'}">selected</c:if>>월요일</option>
								<option value=화요일
									<c:if test="${report.day eq '화요일'}">selected</c:if>>화요일</option>
								<option value=수요일
									<c:if test="${report.day eq '수요일'}">selected</c:if>>수요일</option>
								<option value=목요일
									<c:if test="${report.day eq '목요일'}">selected</c:if>>목요일</option>
								<option value=금요일
									<c:if test="${report.day eq '금요일'}">selected</c:if>>금요일</option>
								<option value=토요일
									<c:if test="${report.day eq '토요일'}">selected</c:if>>토요일</option>
								<option value=일요일
									<c:if test="${report.day eq '일요일'}">selected</c:if>>일요일</option>
							</select>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label for="start_time">시작 시간</label>

							<c:if test="${report.start_time != null}">
								<input id="datePicker7" type="time"
									class="form-control input-lg" name="start_time"
									value="${ report.start_time }">
							</c:if>

							<c:if test="${report.start_time == null}">
								<input id="datePicker7" type="time"
									class="form-control input-lg" name="start_time" value="now">
							</c:if>

						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label for="end_time">종료 시간</label>

							<c:if test="${report.end_time != null}">
								<input id="datePicker8" name="end_time" type="time"
									class="form-control input-lg" value="${ report.end_time }">
							</c:if>

							<c:if test="${report.end_time == null}">
								<input id="datePicker8" name="end_time" type="time"
									class="form-control input-lg" value="now">
							</c:if>

						</div>
					</div>

					<div class="col-md-12">
						<div class="form-group">
							<label for="study_content">스터디 내용</label>
							<textarea placeholder="스터디 내용" id="study_content"
								name="study_content" class="form-control input-lg" rows="3">${ report.study_content }</textarea>
						</div>
					</div>

					<c:if test="${report.rep_f_photo_id != 0}">
						<div class="col-md-6" onClick="show_photoFile();">
							<a> 인증샷 다시올리기 <img src="${R}images\camera.gif" border="0">
							</a>
						</div>
					</c:if>

					<c:if test="${report.rep_f_study_id != 0}">
						<div class="col-md-6" onClick="show_studyFile();">
							<a> 활동증명 다시올리기 <img src="${R}images\file.png" border="0">
							</a>
						</div>

					</c:if>

					<div class="col-md-6" style="display: none;" id="photoFileDIV">
						<div class="form-group">
							<label style="margin-top: 20px;">인증샷</label> <input type="file"
								class="btn btn-lg " value="파일첨부" style="margin-top: -5px;"
								name="file1">
						</div>
					</div>

					<div class="col-md-2" style="display: none;" id="studyFileDIV">
						<div class="form-group">
							<label style="margin-top: 20px;">활동 증명 자료</label> <input
								type="file" class="btn btn-lg " value="파일첨부"
								style="margin-top: -5px;" name="file2">
						</div>
					</div>

					<c:if test="${report.rep_f_photo_id == 0}">
						<div class="col-md-2">
							<div class="form-group">
								<label>인증샷</label> <input type="file" class="btn btn-lg "
									value="파일첨부" style="margin-top: -5px;" name="file3"> <label
									style="margin-top: 20px;">활동 증명 자료</label> <input type="file"
									class="btn btn-lg " value="파일첨부" style="margin-top: -5px;"
									name="file4">
							</div>
						</div>
					</c:if>
					<div class="col-md-12">
						<div class="form-group">
							<input type="submit"
								class="btn btn-primary btn-lg col-md-offset-10" value="저장">
						</div>
					</div>
				</form>
			</div>

		</div>
		<!-- END row -->

		<div class="fh5co-spacer fh5co-spacer-sm"></div>



	</div>
	<!-- END container -->


</div>
<!-- END fhtco-main -->