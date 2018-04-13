<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="fh5co-main">
	
			<div class="container">

				<!-- 
				///////////////////////////////////
				Forms 
				///////////////////////////////////
				-->

				<div class="row">
					<div class="col-md-12 animate-box">
						<h2 class="fh5co-uppercase-heading-sm text-center">설문조사</h2>
					
						<div class="fh5co-spacer fh5co-spacer-md"></div>
					</div>
				<div class="col-md-8 col-md-offset-2 animate-box">
				<div class="panel panel-default ">
						<p style="text-align:center;"><br><br><br>설문조사 링크를 등록하면 메인 페이지에 팝업창이 생성됩니다.</p>
						<div class="fh5co-spacer fh5co-spacer-md"></div>
							
				</div>
						
				<div class="fh5co-spacer fh5co-spacer-sm"></div>
				<form name="r_form" action="m_survey" method="post">
					<div class="col-md-12">
						<div class="form-group">
							<label>설문조사 링크 등록</label>
							<input type="text" class="form-control" placeholder="설문조사 링크를 입력해주세요." name="link">
						</div>
					</div>
					<div class="fh5co-spacer fh5co-spacer-md"></div>
					<!--<input type=submit class="btn btn-primary col-md-offset-10" value="등록">-->
					<button class="btn btn-primary col-md-offset-10" data-target="#layerpop" data-toggle="modal" onclick="alert('등록되었습니다.')">등록</button>
				</form>
				</div>
				</div>
					
				</div>
				<!-- END row -->

				<div class="fh5co-spacer fh5co-spacer-sm"></div>



			</div>
			<!-- END container -->
			
