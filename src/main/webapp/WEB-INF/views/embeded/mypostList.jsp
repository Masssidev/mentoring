<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<c:url var="R" value="/" />
<div id="iframeContent">
	
		<c:if test="${!empty articles }">
			<div class="col-md-12" style="padding: 0px;">
				<div class="col-md-12">
					<div class="panel panel-default ">
						<table class="table board" style="table-layout: fixed">
							<thead>
								<tr>
									<th class="w_5">번호</th>
									<th class="w_30">제목</th>
									<th class="w_10">작성일</th>
									<th class="w_5">파일</th>
									<th class="w_8"></th>
									<th class="w_8"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="article" items="${ articles }"
									varStatus="status">
									<tr>
										<td>${ (pagination.pg-1)*15+status.count }</td>
										<td class="ellip" onclick="window.parent.location.href='${R}user/board_detail?id=${article.id}&bd=${param.bd}'">${ article.title }</td>
										<td>${ article.post_date }</td>
										<td><c:if test="${ article.art_f_id != 0 }">
												<a
													href="${R}user/file/download?id=${ article.art_f_id }"
													style="margin-left: 10px;"><img
													src="${R}images\file.png" border="0"></a>
											</c:if></td>
										<td><a onclick="window.parent.location.href='${R}user/board_edit?id=${article.id}&bd=${param.bd}'"
											class="btn btn-primary btn-sm " style="margin: auto;">수정</a></td>
										<td><a onclick="deleteClick('${R}embeded/mypost_board_delete?id=${article.id}&bd=${param.bd}')"
											class="btn btn-primary btn-sm " style="margin: auto;">삭제</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						
					</div>
					<div onclick="location.href='#iframeContent';"><my:pagination pageSize="${ pagination.sz }" recordCount="${ pagination.recordCount }" /></div>
				</div>
			</div>
		</c:if>
		<c:if test="${empty articles }">
			<div class="fh5co-spacer fh5co-spacer-sm"></div>
			<div class="col-md-12 text-center">
				<p>작성한 글이 없습니다.</p>
			</div>
		</c:if>
	</div>

<script>
if(parent){
	var h = document.getElementById("iframeContent").offsetHeight+50;
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
