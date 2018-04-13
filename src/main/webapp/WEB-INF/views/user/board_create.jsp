<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<div id="fh5co-main">
	
			<div class="container">

				<!-- 
				///////////////////////////////////
				Forms 
				///////////////////////////////////
				-->

				<div class="row">
					<div class="col-md-12 animate-box">
						<h2 class="fh5co-uppercase-heading-sm text-center">새 글 등록</h2>
						<div class="fh5co-spacer fh5co-spacer-sm"></div>
					</div>
					<div class="col-md-12 animate-box">
						<form:form id="form" method="post" modelAttribute="article" enctype="multipart/form-data">
							<div class="col-md-12">
								<div class="form-group">
									<label for="report_subject">글 제목</label>
									<form:input path="title" name="title" placeholder="글 제목" id="report_subject" type="text" class="form-control input-lg" />
								</div>	
							</div>
							<!-- 
							<div class="col-md-12">
								<div class="form-group">
									<label for="report_subject">글 내용</label>
									<div id="summernote">${ article.content }</div>
									<input type="hidden" name="content" />
								</div>	
							</div> -->
							<div class="col-md-12">
								<div class="form-group">
									<label for="report_content">글 내용</label>
									<form:textarea path="content" name="content" placeholder="글 내용" class="form-control input-lg" rows="10" />
								</div>	
							
							<div class="col-md-12">
								<div class="form-group">
									<label>파일 첨부</label>
									<c:if test="${ !empty file }"><p>첨부된 파일: ${ file }</p></c:if>
									<input name="file" type="file" class="btn btn-lg ">
								</div>	
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<input type="submit" class="btn btn-primary btn-lg col-md-offset-11" value="등록">
								</div>	
							</div>
						</form:form>
						<!-- 	
						<div class="col-md-12">
							<div class="form-group">
								<a class="btn btn-primary btn-lg col-md-offset-11" onclick="save()">등록</a>
							</div>	
						</div> -->
					</div>
					
				</div>
				<!-- END row -->

				<div class="fh5co-spacer fh5co-spacer-sm"></div>



			</div>
			<!-- END container -->

		
		</div>
		<!-- END fhtco-main -->
<script>
window.onload=function(){
	document.location.href="#fh5co-main";
}

$('#summernote').summernote({
    placeholder: '내용을 입력해주세요',
    tabsize: 2,
    height: 500
  });
</script>