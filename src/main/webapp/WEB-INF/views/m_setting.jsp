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
						<h2 class="fh5co-uppercase-heading-sm text-center">설정하기</h2>
						<div class="form-group text-center">
							<label for="stydy_time">2018학년도 1학기</label>
						</div>
						<div class="fh5co-spacer fh5co-spacer-sm"></div>
					</div>
					<div class="col-md-8 col-md-offset-2 animate-box">
						<form action="#" method="post">
							<!--모집 기간-->
							<div class="col-md-12">
								<label for="study_day">멘토 모집 기간</label>
								<div class="form-group">
									<input type="date">
									<h3 style="width:25px; display:inline-block;">~</h3>
									<input type="date">
								</div>
								<label for="study_day">멘티 모집 기간</label>
								<div class="form-group">
									<input type="date">
									<h3 style="width:25px; display:inline-block;">~</h3>
									<input type="date">
								</div>	
							
							</div>
							<!--인원-->
							<div class="col-md-6">
								<div class="form-group">
									<label for="study_day">최대 멘토 인원</label>
									<input placeholder="멘토 인원" id="study_day" type="text" class="form-control input-lg">
								</div>	
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="study_day">멘토링 모임 횟수</label>
									<input placeholder="모임 횟수" id="study_day" type="text" class="form-control input-lg">
								</div>	
							</div>
                            <div class="col-md-6">
								<div class="form-group">
									<label for="study_day">멘토당 최소 멘티 인원</label>
									<input placeholder="최소 멘티" id="study_day" type="text" class="form-control input-lg">
								</div>	
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="study_day">멘토당 최대 멘티 인원</label>
									<input placeholder="최대 멘티" id="study_day" type="text" class="form-control input-lg">
								</div>	
							</div>
							<!--마감 요일-->
							<div class="col-md-12">
								<div class="form-group">
									<label for="study_day">보고서 마감 요일</label>
									<select class="form-control" id="search_term">
									  <option>--</option>
									  <option>월요일</option>
									  <option>화요일</option>
									  <option>수요일</option>
									  <option>목요일</option>
									  <option>금요일</option>
									  <option>토요일</option>
									  <option>일요일</option>
									</select>
								</div>	
							</div>
							<!--버튼-->
							<div class="col-md-12">
								<div class="form-group">
									<input type="submit" class="btn btn-primary btn-lg col-md-offset-11" value="설정">
								</div>	
							</div>
							
						</form>	
						</div>
					</div>
					
				</div>
				<!-- END row -->

				<div class="fh5co-spacer fh5co-spacer-sm"></div>



			</div>
			<!-- END container -->
