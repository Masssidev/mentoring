<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="fh5co-main">
	
			<div class="container">

				<!-- 
				///////////////////////////////////
				Forms 
				///////////////////////////////////
				-->

				<div class="row">
					<div class="col-md-12 animate-box">
						<h2 class="fh5co-uppercase-heading-sm text-center">신청서 수정</h2>
						<div class="fh5co-spacer fh5co-spacer-sm"></div>
					</div>
					<div class="col-md-12 animate-box">
						<form name="form" action="mentorapply_edit" method="post" enctype="multipart/form-data" onsubmit="return checkMentorApply(${ setting.min_mentee },${ setting.max_mentee });">
						
							<div class="col-md-12">
								<div class="form-group">
									<label for="group_name">팀명</label>
									<input name="group_name" placeholder="팀명" value="${ mentor.group_name }" id="group_name" type="text" class="form-control input-lg"/>
								</div>	
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label for="subject">주제</label>
									<input name="subject" placeholder="주제" value="${ mentor.subject }" id="subject" type="text" class="form-control input-lg"/>
								</div>	
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="year">학년</label>
									<select class="form-control input-lg"
									id="year" name="year">
									<option value=0>--</option>
									<option value=2 <c:if test="${ mentor.year eq 2 }">selected</c:if>>2</option>
									<option value=3 <c:if test="${ mentor.year eq 3 }">selected</c:if>>3</option>
									<option value=4 <c:if test="${ mentor.year eq 4 }">selected</c:if>>4</option>
									</select>
								</div>	
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="grade">해당 과목 성적(전공 관련만 선택)</label>
									<select class="form-control input-lg"
									id="grade" name="grade">
									<option value=해당없음 <c:if test="${ mentor.grade eq '해당없음' }">selected</c:if>>해당없음</option>
									<option value=A+ <c:if test="${ mentor.grade eq 'A+' }">selected</c:if>>A+</option>
									<option value=A0 <c:if test="${ mentor.grade eq 'A0' }">selected</c:if>>A0</option>
									<option value=B+ <c:if test="${ mentor.grade eq 'B+' }">selected</c:if>>B+</option>
									<option value=B0 <c:if test="${ mentor.grade eq 'B0' }">selected</c:if>>B0</option>
									<option value=C+ <c:if test="${ mentor.grade eq 'C+' }">selected</c:if>>C+</option>
									<option value=C0 <c:if test="${ mentor.grade eq 'C0' }">selected</c:if>>C0</option>
									<option value=D0 <c:if test="${ mentor.grade eq 'D0' }">selected</c:if>>D0</option>
									</select>
								</div>	
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="count">희망 멘티 인원(${ setting.min_mentee }~${ setting.max_mentee }명)</label>
									<input name="count" placeholder="희망 멘티 인원" value="${ mentor.count }" id="count" type="text" class="form-control input-lg"/>
								</div>	
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label for="study_purpose">스터디 목적</label>
									<textarea name="study_purpose" placeholder="스터디 목적" id="study_purpose" class="form-control input-lg" rows="3">${ mentor.study_purpose }</textarea>
								</div>	
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label for="study_content">스터디 내용</label>
									<textarea name="study_content" placeholder="스터디 내용" id="study_content" class="form-control input-lg" rows="3">${ mentor.study_content }</textarea>
								</div>	
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label for="study_method">스터디 방법</label>
									<textarea name="study_method" placeholder="스터디 방법" id="study_method" class="form-control input-lg" rows="3">${ mentor.study_method }</textarea>
								</div>	
							</div>
							
							<div class="col-md-2">
								<div class="form-group">
									<p>홍보 이미지</p>
									<input type="file" class="btn btn-lg " value="파일첨부" style="margin-top:-15px;" name="e_file1"/>
									<p style="margin-top: 10px;">시간표</p>
									<input type="file" class="btn btn-lg" value="파일첨부" style="margin-top:-15px;" name="e_file2"/>
									<p style="margin-top: 10px;">증빙서류</p>
									<input type="file" class="btn btn-lg " value="파일첨부" style="margin-top:-15px;"  name="e_file3"/>
								</div>	
							</div>
							 
							<div class="col-md-12">
								<div class="form-group">
									<input type="submit" class="btn btn-primary btn-lg col-md-offset-8" value="등록">
									<input type="button" class="btn btn-outline btn-lg" onclick="location.href='mypost.do'" value="목록">
								</div>
							</div>
							
						</form>	
					</div>
					
				</div>
				<!-- END row -->

				<div class="fh5co-spacer fh5co-spacer-sm"></div>



			</div>
			<!-- END container -->

		
		</div>
		<!-- END fhtco-main -->