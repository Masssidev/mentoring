<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="R" value="/" />	
		<div id="fh5co-main">
	
			<div class="container">


				<div class="row">
					<div class="col-md-12 animate-box">
						<h2 class="fh5co-uppercase-heading-sm text-center">질문게시판</h2>
						<div class="fh5co-spacer fh5co-spacer-sm"></div>
					</div>
					<div class="col-md-12 animate-box">
						<div class="panel panel-default ">
							<table class="table board">
								<thead>
									<tr>
										<th>질문</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>파일</th>
										<th>답변</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="article" items="${ article }" varStatus="status">
								        <tr data-url="${R}user/board_detail?id=${article.id}&${ pagination.queryString }">
								          <td>${ (pagination.pg-1)*15+status.count }</td>
								          <td>${ article.title }</td>
								          <td>${ article.userName }</td>
								          <td>${ article.post_date }</td>
								          <td><a href="#"><img src="${R}images\file.png" border="0"></a></td>
								          <td><a href="#">답변완료</a></td>
								        </tr>
								      </c:forEach>
								</tbody>
							</table>
						</div>
						<my:pagination pageSize="${ pagination.sz }" recordCount="${ pagination.recordCount }" />
					<div class="col-md-12">
						<a href="${R}user/board_create?${ pagination.queryString }" class="btn btn-primary btn-lg col-md-offset-11">질문하기</a>
					</div>
				  	</div>
				</div>
			<!-- END row -->

				<div class="fh5co-spacer fh5co-spacer-md"></div>

				



			</div>
			<!-- END container -->

		
		</div>
		<!-- END fhtco-main -->
