<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div id="fh5co-main">

	<div class="container">

		<!-- 
				///////////////////////////////////
				검색
				///////////////////////////////////
				-->
		<div class="row animate-box">
			<h2 class="fh5co-uppercase-heading-sm text-center" id="userManage">회원
				관리</h2>
			<form action="m_userManage#userManage" method="post" style="float: right"
				class="row" name="fm" onsubmit="return checkSearch1();">
				<div class="col-md-9">
					<div class="form-group">
						<label for="search" class="sr-only ">검색어</label> <input
							name="search" placeholder="이름 검색 및 관리자 추가" id="search"
							type="text" class="form-control input-lg" value="${keyword}">
					</div>
				</div>
				<div class="col-md-2" style="margin-left: -20px">
					<div class="form-group">
						<input type="submit" class="btn btn-primary btn-lg " value="검색">
						<!--	 <a class="btn btn-primary btn-lg search_btn">검색</a>   -->
					</div>
				</div>
			</form>
			<!-- 
					///////////////////////////////////
					검색 결과
					///////////////////////////////////
					-->
			<%
				Object keyword = null;
				if (request.getAttribute("keyword") != null) {
					keyword = request.getAttribute("keyword");
				}
				if (keyword == null) {
			%>
			<div class="animate-box col-md-12" style="display: none">
				<%
					} else {
				%>
				<div class="animate-box col-md-12" style="display: block">
					<%
						}
					%>
					<c:if test="${!empty SearchUsers}">

						<div class="panel panel-default">

							<table class="table search_user">
								<thead>
									<tr>
										<th>번호</th>
										<th>이름</th>
										<th>학과</th>
										<th>구분</th>
										<th>이메일</th>
										<th style="text-align: center">권한</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="searchUser" items="${ SearchUsers }"
										varStatus="status">
										<tr>
											<td>${ status.index+1 }</td>
											<td>${ searchUser.name }</td>
											<td>${ searchUser.d_name }</td>
											<td>${ searchUser.status_name }</td>
											<td>${ searchUser.email }</td>
											<td style="text-align: center"><c:choose>
													<c:when test="${searchUser.type eq '1'}">
														<a href="auth_update?id=${ searchUser.id }"
															class="btn btn-primary col-sm">권한부여</a>
													</c:when>
													<c:when test="${searchUser.type eq '2'}">
														<span class="text-info">관리자</span>
													</c:when>
													<c:when test="${searchUser.type eq '3'}">
														<span class="text-primary">멘토</span>
													</c:when>
													<c:when test="${searchUser.type eq '4'}">
														<span class="text-warning">멘티</span>
													</c:when>
												</c:choose></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</c:if>
					<c:if test="${empty SearchUsers}">
						<div class="fh5co-spacer fh5co-spacer-sm"></div>
						<div class="col-md-12 text-center">
							<p>검색 결과가 없습니다.</p>
						</div>
					</c:if>

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
					<div class="col-md-6" id="searchUser"></div>
					<form action="term_search_user#searchUser" method="post" name="searchForm" onsubmit="return checkSearch2();"
						class="row">
						<!-- 정렬조건 -->
						<div class="col-md-6">
							<div class="col-md-2" style="margin-left: 80px; padding: 0px;">
								<div class="form-group">
									<input type="hidden" name="keyword" value="${keyword}" /> <label
										for="search_year" class="sr-only">년도</label> <input
										placeholder="2017" id="year" name="year" type="text"
										class="form-control" value="${year}">
								</div>
							</div>
							<div class="col-md-1"
								style="padding: 0px; margin-top: 5px; margin-left: 5px;">
								<b>년도</b>
							</div>
							<div class="col-md-2" style="margin-left: 10px; padding: 0px;">
								<div class="form-group">
									<label for="search_term" class="sr-only">학기</label> <select
										class="form-control" id="semester" name="semester">
										<option value=0>--</option>
										<option value=1
											<c:if test="${semester eq '1'}">selected</c:if>>1</option>
										<option value=2
											<c:if test="${semester eq '2'}">selected</c:if>>2</option>
									</select>
								</div>
							</div>
							<div class="col-md-1"
								style="padding: 0px; margin-top: 5px; margin-left: 5px;">
								<b>학기</b>
							</div>
							<div class="col-md-3" style="margin-left: 10px">
								<div class="form-group">
									<input type="submit" class="btn btn-primary" value="검색">

								</div>
							</div>
						</div>
						<!-- 정렬조건 끝 -->
					</form>
				</div>


				<div class="col-md-12 animate-box">
					<div id="fh5co-tab-feature-center" class="fh5co-tab text-center">
						<ul class="resp-tabs-list hor_1">
							<li>관리자</li>
							<li>멘토</li>
							<li>멘티</li>
							<li>일반회원</li>
						</ul>

						<div class="resp-tabs-container hor_1">

							<!--관리자-->
							<div>
								<div class="row">
									<c:if test="${!empty TermSearchManagers || !empty managers}">
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
													<%
														if (request.getAttribute("TermSearchManagers") != null) {
													%>
													<c:forEach var="TermSearchManagers"
														items="${ TermSearchManagers }" varStatus="status">
														<tr>
															<td>${ status.index+1 }</td>
															<td>${ TermSearchManagers.name }</td>
															<td>${ TermSearchManagers.d_name }</td>
															<td>${ TermSearchManagers.status_name }</td>
															<td>${ TermSearchManagers.auth_date }</td>
															<td><a
																href="auth_update?id=${ TermSearchManagers.id }"
																class="btn btn-primary col-sm">권한삭제 </a></td>
														</tr>

													</c:forEach>
													<%
														} else {
													%>

													<c:forEach var="manager" items="${ managers }"
														varStatus="status">
														<tr>
															<td>${ status.index+1 }</td>
															<td>${ manager.name }</td>
															<td>${ manager.d_name }</td>
															<td>${ manager.status_name }</td>
															<td>${ manager.auth_date }</td>
															<td><a href="auth_update?id=${ manager.id }"
																class="btn btn-primary col-sm">권한삭제 </a></td>
														</tr>
													</c:forEach>
													<%
														}
													%>
												</tbody>
											</table>
										</div>
									</c:if>
									<c:if test="${empty TermSearchManagers && empty managers}">
										<div class="fh5co-spacer fh5co-spacer-sm"></div>
										<div class="col-md-12 text-center">
											<p>해당학기 관리자가 없습니다.</p>
										</div>
									</c:if>

								</div>
							</div>

							<!--멘토-->
							<div>
								<div class="row">
									<c:if test="${!empty TermSearchMentors || !empty mentors}">

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
													<%
														if (request.getAttribute("TermSearchMentors") != null) {
													%>
													<c:forEach var="TermSearchMentors"
														items="${ TermSearchMentors }" varStatus="status">
														<tr>
															<td>${ status.index+1 }</td>
															<td>${ TermSearchMentors.name }</td>
															<td>${ TermSearchMentors.d_name }</td>
															<td>${ TermSearchMentors.status_name }</td>
															<td>${ TermSearchMentors.auth_date }</td>
														</tr>

													</c:forEach>
													<%
														} else {
													%>
													<c:forEach var="mentor" items="${ mentors }"
														varStatus="status">
														<tr>
															<td>${ status.index+1 }</td>
															<td>${ mentor.name }</td>
															<td>${ mentor.d_name }</td>
															<td>${ mentor.status_name }</td>
															<td>${ mentor.auth_date }</td>

														</tr>
													</c:forEach>
													<%
														}
													%>
												</tbody>
											</table>
										</div>
									</c:if>
									<c:if test="${empty TermSearchMentors && empty mentors}">
										<div class="fh5co-spacer fh5co-spacer-sm"></div>
										<div class="col-md-12 text-center">
											<p>해당학기 멘토가 없습니다.</p>
										</div>
									</c:if>
								</div>
							</div>


							<!--멘티-->
							<div>
								<div class="row">
									<c:if test="${!empty TermSearchMentees || !empty mentees}">

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
													<%
														if (request.getAttribute("TermSearchMentees") != null) {
													%>
													<c:forEach var="TermSearchMentees"
														items="${ TermSearchMentees }" varStatus="status">
														<tr>
															<td>${ status.index+1 }</td>
															<td>${ TermSearchMentees.name }</td>
															<td>${ TermSearchMentees.d_name }</td>
															<td>${ TermSearchMentees.status_name }</td>
															<td>${ TermSearchMentees.auth_date }</td>
														</tr>

													</c:forEach>
													<%
														} else {
													%>
													<c:forEach var="mentee" items="${ mentees }"
														varStatus="status">
														<tr>
															<td>${ status.index+1 }</td>
															<td>${ mentee.name }</td>
															<td>${ mentee.d_name }</td>
															<td>${ mentee.status_name }</td>
															<td>${ mentee.auth_date }</td>

														</tr>
													</c:forEach>
													<%
														}
													%>
												</tbody>
											</table>
										</div>
									</c:if>
									<c:if test="${empty TermSearchMentees && empty mentees}">
										<div class="fh5co-spacer fh5co-spacer-sm"></div>
										<div class="col-md-12 text-center">
											<p>해당학기 멘티가 없습니다.</p>
										</div>
									</c:if>
								</div>

							</div>
							<!--일반회원-->
							<div>
								<div class="row">
									<c:if test="${!empty TermSearchUsers || !empty users}">
										<div class="panel panel-default ">
											<table class="table search_user">
												<thead>
													<tr>
														<th>번호</th>
														<th>이름</th>
														<th>학과</th>
														<th>구분</th>
													</tr>
												</thead>
												<tbody>
													<%
														if (request.getAttribute("TermSearchUsers") != null) {
													%>
													<c:forEach var="TermSearchUsers"
														items="${ TermSearchUsers }" varStatus="status">
														<tr>
															<td>${ status.index+1 }</td>
															<td>${ TermSearchUsers.name }</td>
															<td>${ TermSearchUsers.d_name }</td>
															<td>${ TermSearchUsers.status_name }</td>
														</tr>

													</c:forEach>
													<%
														} else {
													%>

													<c:forEach var="user" items="${ users }" varStatus="status">
														<tr>
															<td>${ status.index+1 }</td>
															<td>${ user.name }</td>
															<td>${ user.d_name }</td>
															<td>${ user.status_name }</td>
														</tr>
													</c:forEach>
													<%
														}
													%>
												</tbody>
											</table>
										</div>
									</c:if>
									<c:if test="${empty TermSearchUsers && empty users}">
										<div class="fh5co-spacer fh5co-spacer-sm"></div>
										<div class="col-md-12 text-center">
											<p>해당학기 일반회원이 없습니다.</p>
										</div>
									</c:if>
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

	<%-- <div class="modal fade" id="layerpop">
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
						<form method="post" id="frmManager" name="addManager">
							<div class="col-md-12">
								<div class="col-md-3"></div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="search" class="sr-only">검색어</label> <input
											placeholder="이름 검색" id="search" type="text"
											class="form-control input-lg" value="${keyword}">
									</div>
								</div>

								<div class="col-md-3">
									<div class="form-group">
										<input type="button"
											class="btn btn-primary btn-lg search_manager_btn"
											id="submitBtn" value="검색" data-dismiss="modal"
											data-toggle="modal" data-target="#layerpop">
										<!-- <a class="btn btn-primary btn-lg search_manager_btn">검색</a> -->
									</div>
								</div>
							</div>
						</form>

						<!-- 
					///////////////////////////////////
					검색 결과
					///////////////////////////////////
					-->
						<div class="animate-box search_result_manager col-md-12"
							id="search_user">
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
										<c:forEach var="searchUser" items="${ SearchUsers }"
											varStatus="status">
											<tr>
												<td>${ status.index+1 }</td>
												<td>${ searchUser.name }</td>
												<td>${ searchUser.d_name }</td>
												<td>학생</td>
												<td>2017-11-12</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="fh5co-spacer fh5co-spacer-sm"></div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div> --%>
</div>