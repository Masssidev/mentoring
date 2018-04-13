<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="fh5co-main">
	<div class="container">
		<div class="col-md-12" id="fh5co-features">
			<div class="row">
				<div class="col-md-12 animate-box">
					<h2 class="fh5co-uppercase-heading-sm text-center">회원정보수정</h2>
					<div class="fh5co-spacer fh5co-spacer-sm"></div>
				</div>
				<div class="col-md-12 animate-box">
					<div id="fh5co-tab-feature-center" class="fh5co-tab text-center">
						<ul class="resp-tabs-list hor_1">
							<li>회원정보수정</li>
							<li>회원탈퇴</li>
						</ul>
						<form:form method="post" modelAttribute="user">
						<div class="resp-tabs-container hor_1">
								<!--정보수정-->
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label for="password">현재 비밀번호</label>
											<form:input path="pw" placeholder="현재 비밀번호" id="current_password" type="password" class="form-control input-lg" />
										</div>	
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="email">이메일</label>
											<form:input path="email" placeholder="이메일" id="email" type="text" class="form-control input-lg" />
										</div>	
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="phonenum">전화번호</label>
											<form:input path="phone" placeholder="전화번호" id="phonenum" type="text" class="form-control input-lg" />
										</div>	
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="password">새 비밀번호</label>
											<form:input path="newPw" placeholder="비밀번호" id="password" type="password" class="form-control input-lg" />
										</div>	
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<form:input path="newPw2" placeholder="비밀번호 다시 입력" id="re_password" type="password" class="form-control input-lg" />
										</div>	
									</div>
									<!--
									<div class="col-md-12">
										<div class="form-group">
											<label for="password_q">비밀번호 질문</label>
											<select class="form-control input-lg" id="question">
											  <option>가장 기억에 남는 장소는?</option>
											  <option>나의 좌우명은?</option>
											</select>
										</div>	
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<input placeholder="비밀번호 질문 답" id="answer" type="text" class="form-control input-lg">
										</div>	
									</div>
									-->
									<!-- 
									<div class="col-md-12">
										<div class="form-group">
											<label for="public_bool">정보공개여부</label><p></p>
											성명  <input id="name_bool" type="checkbox">
											이메일  <input id="email_bool" type="checkbox">
											휴대전화  <input id="phonenum_bool" type="checkbox">
											생년월일  <input id="birth_bool" type="checkbox">
										</div>	
									</div>
									-->
									<div class="col-md-8 col-md-offset-10">
										<div class="form-group">
											<input type="submit" class="btn btn-primary btn-lg " value="저장">
										</div>	
									</div>
								</div>
							<!--회원탈퇴-->
							<div class="row">
								<div class="panel panel-default ">
									<p style="text-align:center;"><br><br>SM사업을 다시 사용할 일이 없어 회원탈퇴를 하고 싶으시면 회원 탈퇴를 눌러주세요.<br>
									탈퇴된 계정은 다시 복구할 수 없고 계정의 게시물이나 정보는 완전히 삭제됩니다.<br><br>
									그래도 회원탈퇴를 원하시면 "회원탈퇴"를 클릭하세요.</p>
									<div class="fh5co-spacer fh5co-spacer-md"></div>
								</div>
								<div class="col-r">
									<button class="btn btn-primary col-md-offset-10" data-target="#layerpop" data-toggle="modal">회원탈퇴</button>
								</div>
							<!--내용 box 끝-->
							</div>
							<div class="fh5co-spacer fh5co-spacer-md"></div>
						</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 팝업창시작 -->
<div class="modal fade" id="layerpop" >
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
           	<p>정말로 탈퇴하시겠습니까?</p>
      </div>
      <!-- Footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
        <button type="button" class="btn btn-outline" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- 팝업창끝 -->
<script>
	if(${error!=null}){alert("${error}");};
</script>