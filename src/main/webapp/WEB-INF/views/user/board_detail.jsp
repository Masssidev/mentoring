<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:url var="R" value="/" />
<div id="fh5co-main">

	<div class="container">

		<div class="row">
			<div class="col-md-12 animate-box">
				<h2 class="fh5co-uppercase-heading-sm text-center" id="com">${ board }</h2>

				<div class="fh5co-spacer fh5co-spacer-sm"></div>
			</div>
			<div class="col-md-12 animate-box board">
				<div class="col-md-12">
					<div class="panel panel-default" style="margin-bottom:5px;">${ article.title }</div>
				</div>
				<div class="col-md-12" style="font-size:10px; margin-bottom:20px; text-align:right;">
					<p>작성자: ${ article.userName } &nbsp;&nbsp;&nbsp; 작성일: ${ article.post_date }</p>
				</div>

				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="row">
							<div class="col-md-12">
								<p>${ article.content }</p>
							</div>
						</div>

						<!-- END row -->
						<div class="fh5co-spacer fh5co-spacer-md"></div>
					</div>
				</div>

				<div class="col-md-2">
					<c:if test="${ article.art_f_id != 0 }">
						<a href="${R}user/file/download?id=${ article.art_f_id }">첨부된
							파일 <img src="${R}images\file.png" border="0">
						</a>
					</c:if>
				</div>
				<c:if test="${ article.art_u_id == user }">
					<div class="col-md-12 col-r" style="margin-bottom: 10px;">
						<a href="${R}user/board_edit?id=${article.id}&${ pagination.queryString }"
							class="ti-close" style="border:none; margin-right:10px;">수정</a> 
							<a onclick="deleteClick('${R}user/board_delete?id=${article.id}&${ pagination.queryString }')"
							class="ti-trash" style="border:none; margin-right:10px;">삭제</a>
						<c:if
							test="${fn : contains(url,'http://localhost:8080/mybatisEx/user/board')}">
							<a data-url="${R}user/board?${ pagination.queryString }#${board}"
								class="ti-arrow-left" style="border:none; text-align:right;">목록으로</a>
						</c:if>
					</div>
				</c:if>
				<!-- <div class="col-md-12 col-r">
					<a href="${R}user/board?${ pagination.queryString }"
						class="btn btn-primary btn-lg">목록으로</a>
				</div>-->

				
			</div>

		</div>
		<!-- END row -->
		<div class="fh5co-spacer fh5co-spacer-sm"></div>

		<!--댓글-->
		<div class="col-md-12">
			<h2 id="comment_btn" class="fh5co-uppercase-heading-sm">댓글 ${ comments.size() }개
				∨</h2>
		</div>
		
		<div id="comment" style="display:none;">
			<embed id="iframe1" src="${R}embeded/comment?id=${article.id}" style="width:100%; overflow:hidden;" scrolling="no"> </embed>
		</div>

		<div class="fh5co-spacer fh5co-spacer-sm"></div>



	</div>
	<!-- END container -->


</div>
<!-- END fhtco-main -->

<script>

function setIframeHeight(h){
	$("#iframe1").height(h);
}

function deleteClick(url){
	var check = confirm("삭제하시겠습니까?");
	if(check){
		location.href=url;
		alert("삭제되었습니다.");
	}
}

window.onload=function(){
	document.location.href="#fh5co-main";
}

</script>