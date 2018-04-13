
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="fh5co-main">

	<div class="container">

		<!-- 
				///////////////////////////////////
				Forms 
				///////////////////////////////////
				-->
		<div class="row">
			<div class="col-md-12 animate-box">
				<h2 class="fh5co-uppercase-heading-sm text-center">설정하기</h2>
				<div class="form-group text-center">
					<label for="stydy_time">2018학년도 1학기</label>
				</div>
				<div class="fh5co-spacer fh5co-spacer-sm"></div>
			</div>
			<div class="col-md-8 col-md-offset-2 animate-box">

				<form:form method="post" modelAttribute="setting" name="form"
					onsubmit="return checkM_setting();">
					<!--모집 기간-->
					<div class="col-md-12">
						<label for="study_day">멘토 모집 기간</label>
						<div class="form-group">

							<form:input type="date" path="mentor_start_date" id="datePicker" />
							<h3 style="width: 25px; display: inline-block;">~</h3>
							<form:input type="date" path="mentor_expire_date"
								id="datePicker2" />
						</div>

						<label for="study_day">멘티 모집 기간</label>
						<div class="form-group">

							<form:input type="date" path="mentee_start_date" id="datePicker3" />
							<h3 style="width: 25px; display: inline-block;">~</h3>
							<form:input type="date" path="mentee_expire_date"
								id="datePicker4" />
						</div>

						<label for="study_day">멘토링 활동 기간</label>
						<div class="form-group">

							<form:input type="date" path="sm_start_date" id="datePicker5" />
							<h3 style="width: 25px; display: inline-block;">~</h3>
							<form:input type="date" path="sm_expire_date" id="datePicker6" />
						</div>
					</div>

					<!--인원-->
					<div class="col-md-6">
						<div class="form-group">
							<label for="study_day">최대 멘토 인원</label>
							<form:input placeholder="멘토 인원" id="max_mentor" type="text"
								path="max_mentor" class="form-control input-lg" />
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="study_day">멘토링 모임 횟수</label>
							<form:input placeholder="모임 횟수" id="study_count" type="text"
								path="study_count" class="form-control input-lg" />
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="study_day">멘토당 최소 멘티 인원</label>
							<form:input placeholder="최소 멘티" id="min_mentee" type="text"
								path="min_mentee" class="form-control input-lg" />
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="study_day">멘토당 최대 멘티 인원</label>
							<form:input placeholder="최대 멘티" id="max_mentee" type="text"
								path="max_mentee" class="form-control input-lg" />
						</div>
					</div>
					<!--마감 요일-->
					<div class="col-md-12">
						<div class="form-group">
							<label for="study_day">보고서 마감 요일</label>
							<form:select path="report_deadline" class="form-control"
								id="report_deadline">
								<option value=0>--</option>
								<option value=1>월요일</option>
								<option value=2>화요일</option>
								<option value=3>수요일</option>
								<option value=4>목요일</option>
								<option value=5>금요일</option>
								<option value=6>토요일</option>
								<option value=7>일요일</option>
							</form:select>
						</div>
					</div>
					<!--버튼-->
					<div class="col-md-12">
						<div class="form-group">
							<button type="submit"
								class="btn btn-primary btn-lg col-md-offset-11">설정</button>
						</div>
					</div>

				</form:form>
			</div>
		</div>

	</div>
	<!-- END row -->

	<div class="fh5co-spacer fh5co-spacer-sm"></div>



</div>
<!-- END container -->
