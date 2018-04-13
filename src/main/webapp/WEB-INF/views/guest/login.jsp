<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="fh5co-main">
	<div class="container" id="login">
		<div class="row">
			<div class="col-md-12 animate-box">
				<h2 class="fh5co-uppercase-heading-sm text-center">로그인</h2>
				<div class="fh5co-spacer fh5co-spacer-sm"></div>
			</div>	
			<div class="col-md-8 col-md-offset-2 animate-box">
				<form id="form" method="post" action="login_processing" onsubmit="return checkInput();">
					<div class="col-md-12">
						<div class="form-group">
							<label for="id">ID</label>
							<input name="user_id" placeholder="id" id="id" type="text" class="form-control input-lg" >
						</div>	
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<label for="password">Password</label>
							<input name="pw" placeholder="Password" id="password" type="password" class="form-control input-lg" >
						</div>	
					</div>
					<div class="col-md-12 col-r">
						<input type="submit" class="btn btn-primary btn-lg " value="Login">
					</div>
				</form>	
			</div>
		</div>
	<!-- END row -->
	</div>
</div>

<script>
	if(${param.error!=null}){alert("다시 로그인해주세요.");};
</script>
        