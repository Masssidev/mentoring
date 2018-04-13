<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="fh5co-main">
	<div class="container">
		<div class="row">
			<div class="col-md-12 animate-box">
				<h2 class="fh5co-uppercase-heading-sm text-center">회원가입</h2>
				<div class="fh5co-spacer fh5co-spacer-sm"></div>
			</div>
			<div class="col-md-8 col-md-offset-2 animate-box">
				<form:form id="form" method="post" modelAttribute="user"
					onsubmit="return checkInput();">
					<div class="col-md-12">
						<div class="form-group">
							<label for="id">아이디</label>
							<form:input path="user_id" name="user_id" placeholder="id"
								id="id" type="text" class="form-control input-lg" />
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<label for="password" style=float:left>비밀번호</label>
							<form:input path="pw" name="pw" placeholder="Password" id="text"
								type="password" class="form-control input-lg" />
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="major_id">학과</label>
							<form:select path="major_id" class="form-control" id="major_id"
								name="major_id">
								<option value=0>--</option>
								<option value=1>소프트웨어공학과</option>
								<option value=2>컴퓨터공학과</option>
								<option value=3>정보통신공학과</option>
								<option value=4>글로컬IT학과</option>
							</form:select>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="status_id">직책</label>
							<form:select path="status_id" class="form-control" id="status_id"
								name="status_id" onChange="show_office();">
								<option value=0>--</option>
								<option value=1>학생</option>
								<option value=2>교수</option>
								<option value=3>직원</option>
							</form:select>
						</div>
					</div>
					<div class="animate-box col-md-12" style="display: none;" id="officeDIV">
						<div class="col-md-12">
							<div class="form-group">
								<label for="office">사무실</label>
								<form:input path="office" name="office" placeholder="사무실"
									id="office" type="text" class="form-control input-lg" />
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label for="office_tel">사무실 전화번호</label>
								<form:input path="office_tel" name="office_tel" placeholder="사무실 전화번호" id="office_tel"
									type="password" class="form-control input-lg" />
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="minor_id">복수전공</label> <input type="radio"
								name="radio" id="double_id_radio" value="1"
								onclick="double_dep(this.value,'search_double','search_minor');" />
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="minor_id">부전공</label> <input type="radio"
								name="radio" id="minor_id_radio" value="2"
								onclick="minor_dep(this.value,'search_minor','search_double');" />
						</div>
					</div>

					<div class="animate-box col-md-12" style="display: none;" id="search_double">
						<div class="col-md-6">
							<div class="form-group">
								<label for="double_id">복수전공</label>
								<form:select path="double_id" class="form-control"
									id="double_id" name="double_id">
									<option value=0>--</option>
									<option value=1>소프트웨어공학과</option>
									<option value=2>컴퓨터공학과</option>
									<option value=3>정보통신공학과</option>
									<option value=4>글로컬IT학과</option>
								</form:select>
							</div>
						</div>
					</div>
					<div class="animate-box col-md-12" style="display: none;"
						id="search_minor">
						<div class="col-md-6">
							<div class="form-group">
								<label for="minor_id">부전공</label>
								<form:select path="minor_id" class="form-control" id="minor_id"
									name="minor_id">
									<option value=0>--</option>
									<option value=1>소프트웨어공학과</option>
									<option value=2>컴퓨터공학과</option>
									<option value=3>정보통신공학과</option>
									<option value=4>글로컬IT학과</option>
								</form:select>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<label for="name">이름</label>
							<form:input path="name" name="name" id="name" type="text"
								class="form-control input-lg" />
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<label for="email">이메일</label>
							<form:input path="email" name="email" id="email" type="email"
								class="form-control input-lg" />
							<form:errors path="email" class="error"/>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<label for="email">연락처</label>
							<form:input path="phone" name="phone" id="phone" type="text"
								class="form-control input-lg" />
						</div>
					</div>

					<div class="col-md-12 col-r">
						<input type="submit" class="btn btn-primary btn-lg " value="join">
					</div>
				</form:form>
			</div>
		</div>
		<!-- END row -->
	</div>
</div>

<script>
	if(${param.error!=null}){alert("로그인 실패");};
</script>
