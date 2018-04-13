<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url var="R" value="/" />
<div id="fh5co-main">
	<div class="container">
		<div class="col-md-12" id="fh5co-features">
			<div class="row">
				<div class="col-md-12 animate-box">
					<h2 class="fh5co-uppercase-heading-sm text-center" id="report">보고서</h2>
					<div class="fh5co-spacer fh5co-spacer-sm"></div>
				</div>
				<div class="col-md-12 animate-box">
					<label for="report_subject">멘토링 진행률 <span
						class="fh5co-uppercase-heading-sm">&nbsp;&nbsp;${ totalReport }회 중 ${ totalReport-conditionReports.reportCount }회
							남았습니다.</span></label>
					<div class="progress">
						<div class="progress-bar" role="progressbar"
							style="width: ${ conditionReports.reportCount/totalReport*100 }%;"
							aria-valuenow="${ conditionReports.reportCount/totalReport*100 }%"
							aria-valuemin="0" aria-valuemax="100">
							<fmt:parseNumber integerOnly="true"
								value="${ conditionReports.reportCount/totalReport*100 }" />
							%
						</div>
					</div>
					<c:if test="${!empty teamReports}">
						<div class="panel panel-default">
							<table class="table board" id="r_table1">
								<thead>
									<tr>
										<th>번호</th>
										<th>스터디진도</th>
										<th>장소</th>
										<th>작성일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="teamReports" items="${ teamReports }"
										varStatus="status">
										<tr>
											<th scope="row">${ status.index+1 }</th>
											<td class="w_45"
												data-url="report_detail?id=${ teamReports.id }">${ teamReports.subject }</td>
											<td>${ teamReports.place }</td>
											<td>${ teamReports.create_date }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</c:if>
					<c:if test="${empty teamReports}">
						<p>작성한 보고서가 없습니다.</p>
					</c:if>

					<%
						Object userType = null;
						if (request.getAttribute("userType") != null) {
							userType = request.getAttribute("userType");
							Integer t = (Integer) userType;
							if (t == 3) {
					%>
					<div class="col-r">
						<a href="${R}user/report_create" class="btn btn-primary btn-lg">보고서
							작성</a>
					</div>
					<%
						}
						}
					%>
				</div>
			</div>
			<div class="fh5co-spacer fh5co-spacer-md"></div>
		</div>
	</div>
</div>