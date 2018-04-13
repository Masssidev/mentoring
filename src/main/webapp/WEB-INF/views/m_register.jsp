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
						<h2 class="fh5co-uppercase-heading-sm text-center">신/편입생등록</h2>
					
						<div class="fh5co-spacer fh5co-spacer-md"></div>
					</div>
					<div class="col-md-8 col-md-offset-2 animate-box">
				<div class="panel panel-default ">
												<p style="text-align:center;"><br><br><br>신입생/편입생 정보는 엑셀 파일을 업로드 해서 일괄 회원 등록할 수 있습니다.</p>
							<div class="fh5co-spacer fh5co-spacer-md"></div>
							
										</div>
						
								<div class="fh5co-spacer fh5co-spacer-sm"></div>
							<div class="col-md-12">
									<label>신/편입생 명단</label>
									<input type="file" class="btn btn-lg " value="파일첨부">
							</div>
						<div class="fh5co-spacer fh5co-spacer-md"></div>
					<button class="btn btn-primary col-md-offset-10" data-target="#layerpop" data-toggle="modal">등록</button>
				
						</div>
					</div>
					
				</div>
				<!-- END row -->

				<div class="fh5co-spacer fh5co-spacer-sm"></div>



			</div>
			<!-- END container -->
			
<!-- 팝업창시작 -->
<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title">알림!</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
            	<p>사용자 등록을 하시겠습니까?</p>
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