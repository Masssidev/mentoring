<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="R" value="/" />		
		<div id="fh5co-main">
	
			<div class="container">
				
			    <div class="row" id="fh5co-works">
			    	<h2 class="fh5co-uppercase-heading-sm text-center" id="select">멘토링 신청</h2>
			        <div class="col-md-8 col-md-offset-2 text-center fh5co-section-heading work-box">
						<h4 class="fh5co-lead">사진을 클릭하면 상세보기로 이동합니다.</h4>
						<div class="fh5co-spacer fh5co-spacer-sm"></div>
					</div>
					
					<c:forEach var="mentor" items="${ mentors }">
					<div class="col-md-4 col-sm-6 col-xs-6 col-xxs-12 text-center fh5co-work-item work-box"
					style="border: 1px ridge; padding:7px;">
						<figure><a href="${R}user/menteeapply_detail?id=${ mentor.id }"><img class="img-responsive" src="${R}user/getImage?id=${ mentor.apply_f_intro_fk }" alt=""
						style="width: 275px; height: 183px; margin-left:auto; margin-right:auto;"></a></figure>
						<h3>팀명:&nbsp;${ mentor.group_name }</h3>
						<p>주제:&nbsp;${ mentor.subject }</p>
						<p>멘토:&nbsp;${ mentor.name }</p>
						
						<c:if test="${ mentor.mentee_count eq mentor.count }">
						<p>신청인원:<strong style=color:red>&nbsp;${ mentor.mentee_count }/${ mentor.count }</strong></p>
						</c:if>
						<c:if test="${ mentor.mentee_count ne mentor.count }">
						<p>신청인원:&nbsp;${ mentor.mentee_count }/${ mentor.count }</p>
						</c:if>
						
						<c:choose>
						<c:when test="${ mentor.state == 0 }">
						<a href="mentee_update.do?id=${ mentor.id }" class="btn btn-primary btm-md mt_submit">신청</a>
						</c:when>
						<c:when test="${ mentor.state == 1 }">
						<a href="mentee_update.do?id=${ mentor.id }" class="btn btn-cancel btm-md mt_submit" onclick="return deleteApply();">신청취소</a>
						</c:when>
						<c:when test="${ mentor.state == 2 }">
						<input type=button class="btn btn-outline btm-md mt_submit" value="신청불가" disabled>
						</c:when>
						</c:choose>
						</div>
					</c:forEach>
				</div>
				<!-- END row -->
			    
			</div>
            
        </div>
		
