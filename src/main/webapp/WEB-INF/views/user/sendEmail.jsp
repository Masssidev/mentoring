<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:url var="R" value="/" />
<div id="fh5co-main">
	
			<div class="container">

				

				<!-- 
				///////////////////////////////////
				Accordions & Progress Bars 
				///////////////////////////////////
				-->

				<div class="row">
					<div class="col-md-12 animate-box">
						<h2 class="fh5co-uppercase-heading-sm text-center" id="mail">메일쓰기</h2>
						<div class="fh5co-spacer fh5co-spacer-sm"></div>
					</div>
					<div class="col-md-12">
						<label for="tab">메일 검색</label>
						<div class="col-md-12" style="padding:0px;">
							<form method="post" action="${R}user/searchEmail">
								<div class="form-group col-sm-8" style="padding:0px;">
									<input name="search" placeholder="받는 사람을 입력하세요." type="text" class="form-control input-lg">
									
								</div>
								<div class="form-group col-md-2">
									<select class="form-control input-lg" name="type">
										<option value=0>전체</option>
										<option value=1>학생</option>
										<option value=2>관리자</option>
										<option value=3>멘토</option>
										<option value=4>멘티</option>
									</select>
								</div>
								<div class="col-md-2 form-group" style="padding-right:0px;">
									<input type="submit" class="btn btn-primary btn-lg" value="검색">
								</div>
							</form>
							<c:if test="${!empty users }">
							<div class="col-md-12" style="padding:0px;">
								<div class="col-md-12 panel panel-default">
										<table class="table board" style="table-layout:fixed;">
											<thead>
												<tr>
													<th style="width:20%;">학번</th>
													<th style="width:20%;">이름</th>
													<th style="width:20%;">이메일</th>
													<th style="width:20%;">학과</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="user" items="${ users }">
											        <tr onclick="$('#form [name=to]').val('${user.email}'); alert('선택되었습니다.');" style="cursor:pointer;">
											          <td>${user.user_id }</td>
											          <td>${user.name }</td>
											          <td>${user.email }</td>
											          <td>${user.d_name }</td>
											        </tr>
											      </c:forEach>
											</tbody>
										</table>
							</div>
						</div>
						</c:if>
						<c:if test="${empty users }">
						</c:if>
						
					</div>
					</div>
					<div class="fh5co-spacer fh5co-spacer-sm"></div>
						<form:form id="form" method="post" action="${R}user/searchSendEmail" modelAttribute="email" enctype="multipart/form-data" onsubmit="return checkInputEmail();">
									<div class="col-md-12">
										<div class="form-group">
											<label for="tab">받는사람</label>
											<div style="margin-bottom:10px;">
												<input name="all" value="no" type="radio" style="display:none;" checked="checked">
												<sec:authorize access="hasRole('MANAGER')">
													<input name="all" value="all" type="radio" onclick="$('#form [name=to]').val('aa@mail.com'); $('#form [name=to]').attr('style','display:none;');">전체 메일 &nbsp;
													<input name="all" value="manager" type="radio" onclick="$('#form [name=to]').val('aa@mail.com'); $('#form [name=to]').attr('style','display:none;');">모든 관리자에게 보내기 &nbsp;
													<input name="all" value="mentor" type="radio" onclick="$('#form [name=to]').val('aa@mail.com'); $('#form [name=to]').attr('style','display:none;');">모든 멘토에게 보내기 &nbsp;
													<input name="all" value="mentee" type="radio" onclick="$('#form [name=to]').val('aa@mail.com'); $('#form [name=to]').attr('style','display:none;');">모든 멘티에게 보내기 &nbsp;
												</sec:authorize>
											</div>          
											<input name="to" placeholder="받는사람" id="tab" type="email" class="form-control input-lg" />
										</div>
										<div class="form-group">
											<label for="tab">제목</label>
											<form:input path="subject" name="subject" placeholder="제목" id="tab" type="text" class="form-control input-lg" />
										</div>	
									
										<div class="form-group">
											<label for="introduce_content">내용</label>
											<form:textarea path="text" name="text" placeholder="내용" id="introduce_content" class="form-control input-lg" rows="10"></form:textarea>
										</div>
										
										<div class="form-group">
											<label>파일 첨부</label>
											<input name="file" type="file" class="btn btn-lg " value="파일첨부">
										</div> 

										<div class="form-group">
									<input type="submit" class="btn btn-primary btn-lg col-md-offset-11" value="보내기">
								</div>	
									</div>
						</form:form>
									
				</div>
			<!-- END row -->

				<div class="fh5co-spacer fh5co-spacer-md"></div>

				



			</div>
			<!-- END container -->

		
		</div>
		<!-- END fhtco-main -->

<script>
	if( ${ param.success!=null } ) { alert("메일이 발송되었습니다.");};
	
window.onload=function(){
	var link = document.location.href;
	if(link=='http://localhost:8080/mybatisEx/user/searchEmail'){
		document.location.href="#mail";
	}
}
</script>

