<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="fh5co-main">
	
			<div class="container">

                <!-- 
				///////////////////////////////////
				검색
				///////////////////////////////////
				-->
				<div class="row animate-box">
					<h2 class="fh5co-uppercase-heading-sm text-center">회원 관리</h2>
					<form action="#" method="post">
							<div class="col-md-6">
								<div class="form-group">
									<label for="search" class="sr-only">검색어</label>
									<input placeholder="회원 검색" id="search" type="text" class="form-control input-lg">
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
									<a class="btn btn-primary btn-lg search_btn">검색</a>
								</div>	
							</div>
					</form>
					
					<!-- 
					///////////////////////////////////
					검색 결과
					///////////////////////////////////
					-->
				<div class="animate-box search_result col-md-12" style="display:none;">
					<div class="panel panel-default ">
						<table class="table search_user">
							<thead>
								<tr>
									<th>번호</th>
									<th>이름</th>
									<th>학과</th>
									<th>구분</th>
									<th>회원 가입일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>최윤경</td>
									<td>소프트웨어공학과</td>
									<td>학생</td>
									<td>2017-09-22</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="fh5co-spacer fh5co-spacer-sm"></div>
				</div>
				
				<div class="fh5co-spacer fh5co-spacer-sm"></div>
					
				</div>
					
				
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
								<li>관리자</li>
								<li>멘토</li>
								<li>멘티</li>
							</ul>
						
							<div class="resp-tabs-container hor_1">
							
								<div>
									
									<!--관리자-->
									<div class="row">
										
										<div class="panel panel-default ">
											<table class="table search_user">
												<thead>
													<tr>
														<th>번호</th>
														<th>이름</th>
														<th>학과</th>
														<th>구분</th>
														<th>권한 부여일</th>
														<th></th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>1</td>
														<td>최윤경</td>
														<td>소프트웨어공학과</td>
														<td>학생</td>
														<td>2017-09-22</td>
														<td><a href="#" class="btn btn-primary">권한삭제</a></td>
													</tr>
													<tr>
														<td>1</td>
														<td>최윤경</td>
														<td>소프트웨어공학과</td>
														<td>학생</td>
														<td>2017-09-22</td>
														<td><a href="#" class="btn btn-primary">권한삭제</a></td>
													</tr>
													<tr>
														<td>1</td>
														<td>최윤경</td>
														<td>소프트웨어공학과</td>
														<td>학생</td>
														<td>2017-09-22</td>
														<td><a href="#" class="btn btn-primary">권한삭제</a></td>
													</tr>
													<tr>
														<td>1</td>
														<td>최윤경</td>
														<td>소프트웨어공학과</td>
														<td>학생</td>
														<td>2017-09-22</td>
														<td><a href="#" class="btn btn-primary">권한삭제</a></td>
													</tr>
													<tr>
														<td>1</td>
														<td>최윤경</td>
														<td>소프트웨어공학과</td>
														<td>학생</td>
														<td>2017-09-22</td>
														<td><a href="#" class="btn btn-primary">권한삭제</a></td>
													</tr>
													<tr>
														<td>1</td>
														<td>최윤경</td>
														<td>소프트웨어공학과</td>
														<td>학생</td>
														<td>2017-09-22</td>
														<td><a href="#" class="btn btn-primary">권한삭제</a></td>
													</tr>
													<tr>
														<td>1</td>
														<td>최윤경</td>
														<td>소프트웨어공학과</td>
														<td>학생</td>
														<td>2017-09-22</td>
														<td><a href="#" class="btn btn-primary">권한삭제</a></td>
													</tr>
													
												</tbody>
											</table>
										</div>
									</div>

									<button class="btn btn-primary col-md-offset-10" data-target="#layerpop" data-toggle="modal">관리자추가</button>
									

								</div>
						
								<div>
									
									<!--멘토-->
									<div class="row">
										<div class="panel panel-default ">
											<table class="table search_user">
												<thead>
													<tr>
														<th>번호</th>
														<th>이름</th>
														<th>학과</th>
														<th>구분</th>
														<th>권한 부여일</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>1</td>
														<td>최윤경</td>
														<td>소프트웨어공학과</td>
														<td>학생</td>
														<td>2017-09-22</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div>
									<!--멘티-->
									<div class="row">
										<div class="panel panel-default ">
											<table class="table search_user">
												<thead>
													<tr>
														<th>번호</th>
														<th>이름</th>
														<th>학과</th>
														<th>구분</th>
														<th>권한 부여일</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>1</td>
														<td>최윤경</td>
														<td>소프트웨어공학과</td>
														<td>학생</td>
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
		
<div class="modal fade" id="layerpop" >
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title">목록</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
      	<!-- 
				///////////////////////////////////
				검색
				///////////////////////////////////
				-->
				<div class="row">
					<form action="#" method="post">
						<div class="col-md-12">
							<div class="col-md-6">
								<div class="form-group">
									<label for="search" class="sr-only">검색어</label>
									<input placeholder="회원 검색" id="search" type="text" class="form-control input-lg">
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
									  <option>학기</option>
									  <option>1</option>
									  <option>2</option>
									</select>
								</div>	
							</div>
							<div class="col-md-2">
								<div class="form-group">
									<!--<input type="submit" class="btn btn-primary btn-lg " value="검색">-->
									<a class="btn btn-primary btn-lg search_manager_btn">검색</a>
								</div>	
							</div>
						</div>
					</form>
					
					<!-- 
					///////////////////////////////////
					검색 결과
					///////////////////////////////////
					-->
				<div class="animate-box search_result_manager col-md-12" style="display:none;">
					<div class="panel panel-default ">
						<table class="table search_user">
							<thead>
								<tr>
									<th>번호</th>
									<th>이름</th>
									<th>학과</th>
									<th>구분</th>
									<th>회원 가입일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>최윤경</td>
									<td>소프트웨어공학과</td>
									<td>학생</td>
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