<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:url var="R" value="/" />
<div id="iframeContent">
<div>
				<div class="col-md-12 animate-box">
					<c:if test="${!empty comments }">
					<div class="col-md-12 panel panel-default">
						<c:forEach var="comment" items="${ comments }" varStatus="status">
							<div class="comment">
								<ul>
									<li>${ comment.name }</li>
									<li id="c_content">${ comment.c_post_date }</li>
									<c:if test="${ comment.com_u_id == user }">
										<li><a class="ti-close" style="border:none; font-size:16px;" onclick="deleteClick('${R}embeded/comment_delete?id=${param.id}&cid=${comment.id}')"></a></li>
										<li style="margin-right: 5px;"><a class="ti-pencil" style="border:none; font-size:16px;"
											onclick="comment_edit(${ status.count });"></a></li>
									</c:if>
								</ul>
								<div class="c_content_${ status.count }">${ comment.c_content }</div>
								<div class="c_content_edit_${ status.count } col-md-12" style="display: none; margin-top: 10px">
									<form method="post" action="${R}embeded/comment_edit?id=${param.id}&cid=${comment.id}">
										<div class="col-md-10 form-group">
											<textarea name="c_content" id="board_comment"
												class="form-control input-lg" row="3">${ comment.c_content }</textarea>
										</div>
										<div class="col-md-2 form-group">
											<input type="submit" class="btn btn-primary btn-lg" value="등록">
										</div>
									</form>

								</div>
							</div>
						</c:forEach>
					</div>
					</c:if>
					<c:if test="${empty comments }">
						<div class="fh5co-spacer fh5co-spacer-sm"></div>
						<div class="col-md-12 text-center">
							<p>댓글이 없습니다.</p>
						</div>
					</c:if>
				</div>
			</div>
			<div class="fh5co-spacer fh5co-spacer-sm"></div>
			<div>
				<div class="col-md-12 animate-box">
					<form:form id="newCommentForm" method="post" modelAttribute="newComment" action="${R}embeded/comment_create?id=${param.id}">
						<div class="col-sm-10">
							<div class="form-group">
								<form:textarea path="c_content" placeholder="댓글을 작성해주세요."
									class="form-control input-lg" rows="1"></form:textarea>
							</div>
						</div>
						<div class="col-md-2" style="display:inline-block;">
							<div class="form-group">
								<input type="submit" class="btn btn-primary btn-lg" value="등록">
							</div>
						</div>
					</form:form>
				</div>
			</div>
</div>

<script>
	if(parent){
		console.log("hello");
		//var h = $("#iframeContent").height()+100;
		var h = document.getElementById('iframeContent').offsetHeight+200;
		console.log(h);
		parent.setIframeHeight(h);
	}
	
	function deleteClick(url){
		var check = confirm("삭제하시겠습니까?");
		if(check){
			location.href=url;
			alert("삭제되었습니다.");
		}
	}
</script>
