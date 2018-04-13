<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="R" value="/" />	
<div id="fh5co-main">
			<div class="container">
				<div class="col-md-12" id="fh5co-features">
					<div class="row">
						<div class="col-md-12 animate-box">
							<h2 class="fh5co-uppercase-heading-sm text-center">멘토방 정보</h2>
							<div class="fh5co-spacer fh5co-spacer-sm"></div>
						</div>
						
						<div class="col-md-12 animate-box">
							<div class="fh5co-spacer fh5co-spacer-md"></div>
							
						
							<h2>1조</h2>	
							<div class="panel panel-default">
								<table class="table board">
  									<thead>
									    <tr>
									      <th>번호</th>
									      <th>이름</th>
									      <th>학과</th>
									      <th>구분</th>
							
									    </tr>
								  	</thead>
									<tbody>
									    <tr data-url="${R}user/report_detail">
									      <th scope="row">1</th>
									      <td>마재희</td>
									      <td>소프트웨어공학과</td>
									      <td>멘토</td>
							
									    </tr>
									    <tr data-url="${R}user/report_detail">
									      <th scope="row">2</th>
									      <td>이혜민</td>
									      <td>소프트웨어공학과</td>
									      <td>멘티</td>
								
									    </tr>
									    <tr data-url="${R}user/report_detail">
									      <th scope="row">3</th>
									      <td>최윤경</td>
									      <td>소프트웨어공학과</td>
									      <td>멘티</td>
									    </tr>
									      <tr data-url="${R}user/report_detail">
									      <th scope="row">3</th>
									      <td>남하영</td>
									      <td>소프트웨어공학과</td>
									      <td>멘티</td>
									    </tr>
									</tbody>
								</table>
							</div>
							<div class="fh5co-spacer fh5co-spacer-sm"></div>
							
							
							<h2>보고서</h2>	
							<div class="panel panel-default">
								<table class="table board" id="r_table1">
  									<thead>
									    <tr>
									      <th style="padding-left:4px;"><input type="checkbox" onclick="selectAllCheckBox(this,'r_table1','cb')"></th>
									      <th>번호</th>
									      <th>조</th>
									      <th>스터디진도</th>
									      <th>장소</th>
									      <th>작성일</th>
									      
									    </tr>
								  	</thead>
									<tbody>
									    <tr>
									     <td><input type="checkbox" name="checkbox" id="cb_1"></td>
									      <th scope="row">1</th>
									      <td>1</td>
									      <td data-url="${R}user/report_detail">배열</td>
									      <td>6202</td>
									      <td>2017-09-24</td>
									      
									    </tr>
									    <tr>
									     <td><input type="checkbox" name="checkbox" id="cb_2"></td>
									      <th scope="row">2</th>
									      <td>1</td>
									      <td data-url="${R}user/report_detail">링크와 멀티미디어</td>
									      <td>6202</td>
									      <td>2017-09-24</td>
									      
									    </tr>
									    <tr>
									      <td><input type="checkbox" name="checkbox" id="cb_3"></td>
									      <th scope="row">3</th>
									      <td>1</td>
									      <td data-url="${R}user/report_detail">집합</td>
									      <td>6202</td>
									      <td>2017-09-24</td>
									      
									    </tr>
									</tbody>
								</table>
								
							</div>
							<div class="col-r">
								<a href="#" class="btn btn-primary btn-lg">다운로드</a>
							</div>
							<div class="fh5co-spacer fh5co-spacer-sm"></div>
								<h2>학습자료</h2>	
							<div class="panel panel-default">
								<table class="table board">
  									<thead>
									    <tr>
									      <th>번호</th>
									      <th>제목</th>
									      <th>작성일</th>
									      <th>파일</th>
									    </tr>
								  	</thead>
									<tbody>
									    <tr data-url="${R}user/report_detail">
									      <th scope="row">1</th>
									      <td>배열</td>
									      <td>2017-09-24</td>
									      <td><a href="#"><img src="${R}images\file.png" border="0"></a></td>
									    </tr>
									    <tr data-url="${R}user/report_detail">
									      <th scope="row">2</th>
									      <td>링크와 멀티미디어</td>
									      <td>2017-09-24</td>
									      <td><a href="#"><img src="${R}images\file.png" border="0"></a></td>
									    </tr>
									    <tr data-url="${R}user/report_detail">
									      <th scope="row">3</th>
									      <td>집합</td>
									      <td>2017-09-24</td>
									      <td><a href="#"><img src="${R}images\file.png" border="0"></a></td>
									    </tr>
									</tbody>
								</table>
							</div>
							<div class="fh5co-spacer fh5co-spacer-sm"></div>
							
					

							
							</div>
						
							
							
						</div>	
						</div>
						<!--내용 box 끝-->
				 	</div>
 					<div class="fh5co-spacer fh5co-spacer-md"></div>
				</div>
