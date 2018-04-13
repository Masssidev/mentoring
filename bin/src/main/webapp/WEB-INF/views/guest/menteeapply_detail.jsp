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
						<h2 class="fh5co-uppercase-heading-sm text-center">멘토링 신청</h2>
						<div class="fh5co-spacer fh5co-spacer-sm"></div>
					</div>
					<div class="col-md-12 animate-box">
						<form action="#" method="post">
							<div class="col-md-12">
								<img src="images/work_1.jpg" alt="Images" class="fh5co-align-center img-responsive">
								<div class="fh5co-spacer fh5co-spacer-sm"></div>
								<div class="fh5co-spacer fh5co-spacer-sm"></div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="group_name">멘토</label>
									<input placeholder="멘토" id="group_name" type="text" class="form-control input-lg">
								</div>	
							</div>
								<div class="col-md-6">
								<div class="form-group">
									<label for="group_name">주제</label>
									<input placeholder="주제" id="group_name" type="text" class="form-control input-lg">
								</div>	
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label for="subject">팀명</label>
									<input placeholder="팀명" id="subject" type="text" class="form-control input-lg">
								</div>	
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="year">학년</label>
									<input placeholder="학년" id="year" type="text" class="form-control input-lg">
								</div>	
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="grade">해당 과목 성적</label>
									<input placeholder="해당 과목 성적" id="grade" type="text" class="form-control input-lg">
								</div>	
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="mentee_num">희망 멘티 인원</label>
									<input placeholder="희망 멘티 인원" id="mentee_num" type="text" class="form-control input-lg">
								</div>	
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label for="study_purpose">스터디 목적</label>
									<textarea placeholder="스터디 목적" id="study_purpose" class="form-control input-lg" rows="3"></textarea>
								</div>	
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label for="study_content">스터디 내용</label>
									<textarea placeholder="스터디 내용" id="study_content" class="form-control input-lg" rows="3"></textarea>
								</div>	
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label for="message">스터디 방법</label>
									<textarea placeholder="스터디 방법" id="message" class="form-control input-lg" rows="3"></textarea>
								</div>	
							</div>
								<div class="col-md-2">
								<a href="#">첨부된 파일 <img src="images\file.png" border="0"></a>
								<div class="fh5co-spacer fh5co-spacer-md"></div>
						</div>
							
							<div class="col-md-12">
									<input type="submit" class="btn btn-primary btn-lg col-md-offset-9" value="신청">
									<input type="button" class="btn btn-outline btn-lg" onclick="location.href='menteeapply.do'" value="목록">
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