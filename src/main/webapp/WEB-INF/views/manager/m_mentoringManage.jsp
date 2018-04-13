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
			<h2 class="fh5co-uppercase-heading-sm text-center"
				id="mentoringManage">멘토링 관리</h2>
			<form action="m_mentoringManage#mentoringManage" method="post"
				style="float: right" class="row" name="searchMentoringForm"
				onsubmit="return checkSearchMentoring();">
				<div class="col-md-8">
					<div class="form-group">
						<label for="search" class="sr-only ">검색어</label> <input
							name="mentoringSearch" placeholder="멘토방 검색" id="mentoringSearch"
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
		</div>
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
				<c:if test="${!empty SearchTeams}">

					<div class="panel panel-default">
						<table class="table search_user">
							<thead>
								<tr>
									<th>번호</th>
									<th>멘토이름</th>
									<th>멘토링 이름</th>
									<th style="width: auto;">신청인원/정원</th>
									<th>개설일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="searchteam" items="${ SearchTeams }"
									varStatus="status">
									<tr>
										<td>${ status.index+1 }</td>
										<td>${ searchteam.name }</td>
										<td>${ searchteam.group_name }</td>
										<td>${ searchteam.apply_mentee_count }/${ searchteam.count }</td>
										<td>${ searchteam.open_date }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:if>
				<c:if test="${empty SearchTeams}">
					<div class="fh5co-spacer fh5co-spacer-sm"></div>
					<div class="col-md-12 text-center">
						<p>검색 결과가 없습니다.</p>
					</div>
				</c:if>

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
					<form action="term_search_mentoring#mentoringManage" method="post"
						name="searchForm" onsubmit="return checkSearch2();" class="row">
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
							<li>멘토링</li>
						</ul>

						<div class="resp-tabs-container hor_1">

							<div>

								<!--멘토링-->
								<div class="row">
									<c:if test="${!empty teams}">

										<div class="panel panel-default ">
											<table class="table search_user">
												<thead>
													<tr>
														<th>번호</th>
														<th>멘토이름</th>
														<th>멘토링 이름</th>
														<th>신청인원/정원</th>
														<th>개설일</th>

													</tr>
												</thead>
												<tbody>
													<c:forEach var="team" items="${ teams }" varStatus="status">
														<tr>
															<td>${ status.index+1 }</td>
															<td>${ team.name }</td>
															<td>${ team.group_name }</td>
															<td>${ team.apply_mentee_count }/${ team.count }</td>
															<td>${ team.open_date }</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</c:if>
									<c:if test="${empty teams}">
										<div class="fh5co-spacer fh5co-spacer-sm"></div>
										<div class="col-md-12 text-center">
											<p>해당학기 멘토링 활동이 없습니다.</p>
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
</div>
<!-- END fhtco-main -->