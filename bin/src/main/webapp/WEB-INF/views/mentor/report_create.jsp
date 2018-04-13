<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
						<form action="#" method="post">
							<div class="col-md-12">
								<div class="form-group">
									<label for="report_subject">스터디 주제</label>
									<input placeholder="스터디 주제" id="report_subject" type="text" class="form-control input-lg">
								</div>	
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label for="study_place">장소</label>
									<input placeholder="장소" id="study_place" type="text" class="form-control input-lg">
								</div>	
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="study_day">이번 주 모임 요일</label>
									<input placeholder="모임 요일" id="study_day" type="text" class="form-control input-lg">
								</div>	
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="stydy_time">시작 시간</label>
									<input id="study_time_start" type="time" class="form-control input-lg">
								</div>	
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="stydy_time">종료 시간</label>
									<input id="study_time_end" type="time" class="form-control input-lg">
								</div>	
							</div>
							
							<div class="col-md-12">
								<div class="form-group">
									<label for="report_content">스터디 내용</label>
									<textarea placeholder="스터디 내용" id="report_content" class="form-control input-lg" rows="3"></textarea>
								</div>	
							</div>
							
							<div class="col-md-2">
								<div class="form-group">
									<label>인증샷</label>
									<input type="file" class="btn btn-lg " value="파일첨부" style="margin-top:-5px;">
									<label style="margin-top:20px;">활동 증명 자료</label>
									<input type="file" class="btn btn-lg " value="파일첨부" style="margin-top:-5px;">
								</div>	
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<input type="submit" class="btn btn-primary btn-lg col-md-offset-10" value="저장">
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