<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="R" value="/" />

<div id="fh5co-main">

	<div class="container">

		<div class="row" id="fh5co-works">
			<h2 class="fh5co-uppercase-heading-sm text-center" id="contact">멘토 선정</h2>
			<div
				class="col-md-8 col-md-offset-2 text-center fh5co-section-heading work-box">
				<h4 class="fh5co-lead">사진을 클릭하면 상세보기로 이동합니다.</h4>
				<div class="fh5co-spacer fh5co-spacer-sm"></div>
			</div>
				<c:forEach var="mentor" items="${ mentors }">
				<div
					class="col-md-4 col-sm-6 col-xs-6 col-xxs-12 text-center fh5co-work-item work-box"
					style="border: 1px ridge; padding:7px;">
					<figure>
						<a href="${R}manager/m_contact_detail?id=${ mentor.id }"><img
							class="img-responsive"
							src="${R}manager/getImage?id=${ mentor.apply_f_intro_fk }" alt=""
							style="width: 275px; height: 183px; margin-left:auto; margin-right:auto;"></a>
					</figure>
					<h3>팀명:&nbsp;${ mentor.group_name }</h3>
					<p>주제:&nbsp;${ mentor.subject }</p>
					<p>멘토:&nbsp;${ mentor.name }</p>
					<c:if test="${ period ne 2 }">
					<c:choose>
						<c:when test="${ mentor.type == 1}">
							<a href="mentor_update.do?id=${ mentor.id }"
								class="btn btn-primary btm-md m_submitbtn">멘토선정</a>
						</c:when>
						<c:when test="${ mentor.type == 3 }">
							<a href="mentor_update.do?id=${ mentor.id }"
								class="btn btn-cancel btm-md m_submitbtn">선정취소</a>
						</c:when>
					</c:choose>
					</c:if>
				</div>
				</c:forEach>
		</div>
		<!-- END row -->

	</div>

</div>