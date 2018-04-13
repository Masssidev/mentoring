<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="fh5co-main">
			<div class="container">
				<div class="col-md-12" id="fh5co-features">
					<div class="row">
						<div class="col-md-12 animate-box">
							<h2 class="fh5co-uppercase-heading-sm text-center">보고서</h2>
							<div class="fh5co-spacer fh5co-spacer-sm"></div>
						</div>
						<div class="col-md-12 animate-box">
							<label for="report_subject">멘토링 진행률 <span class="fh5co-uppercase-heading-sm">&nbsp;&nbsp;8회 남았습니다.</span></label>
							<div class="progress">
								<div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>
							</div>	
							<div class="panel panel-default">
								<table class="table board">
  									<thead>
									    <tr>
									      <th style="padding-left:4px;"><input id="allcheck" type="checkbox"></th>
									      <th>번호</th>
									      <th>스터디진도</th>
									      <th>장소</th>
									      <th>작성일</th>
									      <th>파일</th>
									    </tr>
								  	</thead>
									<tbody>
									    <tr data-url="report_detail">
									      <td><input type="checkbox" name="checkbox"></td>
									      <th scope="row">1</th>
									      <td>데이터타입 및 변수선언</td>
									      <td>6202</td>
									      <td>2017-09-17</td>
									      <td><a href="#"><img src="images\file.png" border="0"></a></td>
									    </tr>
									    <tr data-url="report_detail">
									      <td><input type="checkbox" name="checkbox"></td>
									      <th scope="row">2</th>
									      <td>배열</td>
									      <td>6202</td>
									      <td>2017-09-17</td>
									      <td><a href="#"><img src="images\file.png" border="0"></a></td>
									    </tr>
									    <tr data-url="report_detail">
									   	  <td><input type="checkbox" name="checkbox"></td>
									      <th scope="row">3</th>
									      <td>클래스및 패키지</td>
									      <td>6202</td>
									      <td>2017-09-17</td>
									      <td><a href="#"><img src="images\file.png" border="0"></a></td>
									    </tr>
									</tbody>
								</table>
							</div>

							<div class="col-r">
								<a href="report_create" class="btn btn-primary btn-lg">보고서 작성</a>
								<a href="#" class="btn btn-primary btn-lg">다운로드</a>
							</div>
						</div>
				 	</div>
 					<div class="fh5co-spacer fh5co-spacer-md"></div>
				</div>
			</div>
		</div>