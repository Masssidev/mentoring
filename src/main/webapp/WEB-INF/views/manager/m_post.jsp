<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="R" value="/" />
<div id="fh5co-main">
	<div class="container">
		<div class="row">
			<div class="col-md-12 animate-box">
				<h2 class="fh5co-uppercase-heading-sm text-center" id="fh5co-tab-feature-vertical4com">내가 쓴 글</h2>
				<div class="fh5co-spacer fh5co-spacer-sm"></div>
			</div>
			<div class="col-md-12 animate-box">
				<div id="fh5co-tab-feature-vertical" class="fh5co-tab">
					<ul class="resp-tabs-list hor_1">
						<li><i class="fh5co-tab-menu-icon ti-announcement"></i>공지사항</li>
						<li><i class="fh5co-tab-menu-icon ti-help-alt"></i> 질문게시판</li>
						<li><i class="fh5co-tab-menu-icon ti-layout-media-overlay"></i>
							컨퍼런스홍보</li>
						<li><i class="fh5co-tab-menu-icon ti-comments"></i> 댓글</li>
					</ul>
					<div class="resp-tabs-container hor_1">
						<!-- 
						///////////////////////////////////
						공지사항
						///////////////////////////////////
						-->

						<!-- 
						///////////////////////////////////
						질문게시판
						///////////////////////////////////
						-->
						
						<!-- 
								///////////////////////////////////
								컨퍼런스
								///////////////////////////////////
								-->
						<c:forEach var="board" items="${ boards }">
							<div>
								<div class="row">
									<div class="col-md-12">
										<h2 class="h3">${ board.b_name }</h2>
									</div>
									<embed class="iframeBox" style="width:100%;" src="${R}embeded/mypostList?bd=${board.id}" scrolling="no"></embed>
								</div>
							</div>
						
						</c:forEach>
						
						<!-- 
								///////////////////////////////////
								댓글
								///////////////////////////////////
								-->
						<div>
							<div class="row">
								<div class="col-md-12">
									<h2 class="h3" id="comment">댓글</h2>
								</div>
								<c:if test="${!empty postComments}">

										<div class="col-md-12" style="padding: 0px;">
											<div class="col-md-12 animate-box">
												<div class="panel panel-default ">
													<table class="table board" style="table-layout: fixed">
														<thead>
															<tr>
																<th class="w_5">번호</th>
																<th class="w_22">내용</th>
																<th class="w_8">작성일</th>
																<th class="w_6">원문보기</th>
																<th class="w_6"></th>
															</tr>
														</thead>
														<tbody>

															<c:forEach var="postComments" items="${ postComments}"
																varStatus="status">
																<tr>
																	<td>${ status.index+1 }</td>
																	<td class="ellip">${ postComments.c_content }</td>
																	<td>${ postComments.c_post_date }</td>
																	<td>
																		<a href="${R}user/board_detail?id=${postComments.com_a_id}&bd=${ postComments.art_b_id }#com">원문보기</a></td>
																	<td><a
																		href="${R}manager/comment_delete_mypost?cid=${postComments.id}"
																		class="btn btn-primary btn-sm " style="margin: auto;"
																		onclick="return deleteComment();">삭제</a></td>
																		
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</c:if>
									<c:if test="${empty postComments}">
										<div class="fh5co-spacer fh5co-spacer-sm"></div>
										<div class="col-md-12 text-center">
											<p>작성한 댓글이 없습니다.</p>
										</div>
									</c:if>
							</div>
						</div>
						<!-- 탭 페이지 끝 -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="deleteReport">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- header -->
			<div class="modal-header">
				<!-- 닫기(x) 버튼 -->
				<button type="button" class="close" data-dismiss="modal">×</button>
				<!-- header title -->
				<h4 class="modal-title">경고!</h4>
			</div>
			<!-- body -->
			<div class="modal-body">
				<p>정말로 삭제하시겠습니까?</p>
			</div>
			<!-- Footer -->
			<div class="modal-footer">
				<button onclick="location.href='${R}user/deleteMyReport?id"
					type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				<button type="button" class="btn btn-outline" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<script>
function setIframeHeight(h){
	$(".iframeBox").height(h);
}
</script>