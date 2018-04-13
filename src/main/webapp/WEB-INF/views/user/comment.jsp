<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:url var="R" value="/" />
<div class="row">
				<div class="col-md-12 animate-box">
					<div class="col-md-12 panel panel-default">
						<c:forEach var="comment" items="${ comments }" varStatus="status">
							<div class="comment">
								<ul>
									<li>${ comment.name }</li>
									<li id="c_content">${ comment.c_post_date }</li>
									<c:if test="${ comment.com_u_id == user }">
										<li><a class="ti-close"
											href="${R}user/comment_delete"></a></li>
										<li style="margin-right: 5px;"><a class="ti-pencil"
											onclick="comment_edit(${ status.count });"></a></li>
									</c:if>
								</ul>
								<div class="c_content_${ status.count }">${ comment.c_content }</div>
								<div class="c_content_edit_${ status.count } col-md-12"
									style="display: none; margin-top: 10px">
									<form method="post"
										action="${R}user/comment_edit">
										<div class="col-md-10 form-group">
											<textarea name="c_content" id="board_comment"
												class="form-control input-lg" row="3">${ comment.c_content }</textarea>
										</div>
										<div class="col-md-2 form-group">
											<!-- -->
											<button class="btn btn-primary btn-lg"
												onclick="editCommentText()">등록</button>
										</div>
									</form>

								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="fh5co-spacer fh5co-spacer-sm"></div>
			<div class="row">
				<div class="col-md-12 animate-box">
					<form:form id="newCommentForm" method="post"
						modelAttribute="newComment"
						action="${R}user/comment_create">
						<div class="col-md-10">
							<div class="form-group">
								<form:textarea path="c_content" placeholder="댓글을 작성해주세요."
									class="form-control input-lg" rows="3"></form:textarea>
							</div>
						</div>
						<div class="col-md-2">
							<div class="form-group">
								<input type="submit" class="btn btn-primary btn-lg" value="등록">
							</div>
						</div>
					</form:form>
				</div>
			</div>