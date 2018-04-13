<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="fh5co-main">
	
			<div class="container">

                <!-- 
				///////////////////////////////////
				검색
				///////////////////////////////////
				-->
				<div class="row animate-box">
					<h2 class="fh5co-uppercase-heading-sm text-center">멘토링 관리</h2>
					<form action="#" method="post">
						<div class="col-md-12">
							<div class="col-md-6">
								<div class="form-group">
									<label for="search" class="sr-only">검색어</label>
									<input placeholder="멘토링 검색" id="search" type="text" class="form-control input-lg">
								</div>	
							</div>
							<div class="col-md-2">
								<div class="form-group">
									<label for="search_year" class="sr-only">년도</label>
									<input placeholder="2017" id="search_year" type="text" class="form-control input-lg">
								</div>	
							</div>
							<div class="col-md-2">
								<div class="form-group">
									<label for="search_term" class="sr-only">학기</label>
									<select class="form-control input-lg" id="search_term">
									  <option>--학기</option>
									  <option>1</option>
									  <option>2</option>
									</select>
								</div>	
							</div>
							<div class="col-md-2">
								<div class="form-group">
									<!--<input type="submit" class="btn btn-primary btn-lg " value="검색">-->
									<a id="comment_btn" class="btn btn-primary btn-lg">검색</a>
								</div>	
							</div>
						</div>
					</form>
				</div>
					<!-- 
					///////////////////////////////////
					검색 결과
					///////////////////////////////////
					-->
				<div id="comment" class="row animate-box" style="display:none;">
					<div class="panel panel-default ">
						<table class="table search_user">
							<thead>
								<tr>
									<th>번호</th>
									<th>멘토이름</th>
							     	<th>멘토링 이름</th>
									<th>멘티 수</th>
									<th>개설일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>최윤경</td>
									<td>C언어 스터디 모임</td>
									<td>3/5</td>
									<td>2017-09-22</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="fh5co-spacer fh5co-spacer-sm"></div>
				</div>
				<div class="fh5co-spacer fh5co-spacer-sm"></div>
				
				<!-- 
				///////////////////////////////////
				회원 목록
				///////////////////////////////////
				-->						
				<div class="row">
					<div class="col-md-12 animate-box">
						<div class="fh5co-spacer fh5co-spacer-sm"></div>
						<form action="#" method="post" class="search_min">
							<div class="col-md-2">
								<div class="form-group">
									<label for="search_term" class="sr-only">학기</label>
									<select class="form-control" id="search_term">
									  <option>--학기</option>
									  <option>1</option>
									  <option>2</option>
									</select>
								</div>	
							</div>
							<div class="col-md-2">
								<div class="form-group">
									<label for="search_year" class="sr-only">년도</label>
									<input placeholder="2017학년도" id="search_year" type="text" class="form-control">
								</div>	
							</div>
						</form>
					</div>
				    <div class="col-md-12 animate-box">
						<div id="fh5co-tab-feature-center" class="fh5co-tab text-center">
							<ul class="resp-tabs-list hor_1">
								<li>멘토링</li>
								<li>미개설멘토링</li>
							</ul>
						
							<div class="resp-tabs-container hor_1">
							
								<div>
									
									<!--멘토링-->
									<div class="row">
										
										<div class="panel panel-default ">
											<table class="table search_user">
												<thead>
													<tr>
														<th>번호</th>
														<th>멘토이름</th>
														<th>멘토링 이름</th>
														<th>멘티 수</th>
														<th>개설일</th>
						
													</tr>
												</thead>
												<tbody>
													<tr data-url="mentoring_info">
														<td>1</td>
														<td>최윤경</td>
														<td>C언어 스터디 모임</td>
														<td>3/5</td>
														<td>2017-09-22</td>
													</tr>
													<tr data-url="mentoring_info">
														<td>2</td>
														<td>마재희</td>
														<td>자바 스터디 모임</td>
														<td>4/5</td>
														<td>2017-09-22</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								
								</div>
						
								<div>
									
									<!--미개설 멘토링-->
									<div class="row">
										<div class="panel panel-default ">
											<table class="table search_user">
												<thead>
													<tr>
														<th>번호</th>
														<th>멘토이름</th>
														<th>멘토링 이름</th>
														<th>멘티 수</th>
														<th>개설일</th>
						
													</tr>
												</thead>
												<tbody>
													<tr data-url="mentoring_info">
														<td>1</td>
														<td>최윤경</td>
														<td>C언어 스터디 모임</td>
														<td>3/5</td>
														<td>2017-09-22</td>
													</tr>
													<tr data-url="mentoring_info">
														<td>2</td>
														<td>마재희</td>
														<td>자바 스터디 모임</td>
														<td>4/5</td>
														<td>2017-09-22</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							
						
							</div>
						</div>
					</div>
				</div>
				<div class="fh5co-spacer fh5co-spacer-sm"></div>
			</div>
			<!-- END container -->
		
		</div>
		<!-- END fhtco-main -->