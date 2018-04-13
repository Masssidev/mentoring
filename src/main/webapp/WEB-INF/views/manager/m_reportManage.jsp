<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<%@ page import="net.skhu.dto.Report"%>
<%@ page import="net.skhu.service.ReportDAO"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%
   List<Report> list = ReportDAO.findAll();
%>

<div id="fh5co-main">
   <div class="container">
      <div class="col-md-12" id="fh5co-features">

         <div class="row">
            <div class="col-md-12 animate-box">
               <h2 class="fh5co-uppercase-heading-sm text-center"
                  id="fh5co-tab-feature-center3report">보고서 관리</h2>
               <div class="fh5co-spacer fh5co-spacer-sm"
                  id="fh5co-tab-feature-center5report"></div>
            </div>

            <div class="col-md-12 animate-box">
               <div id="fh5co-tab-feature-center" class="fh5co-tab text-center">
                  <ul class="resp-tabs-list hor_1">
                     <li>조별</li>
                     <li>주별</li>
                     <li>전체</li>
                     <li>제출현황</li>
                     <li>검색 및 삭제</li>
                  </ul>

                  <div class="resp-tabs-container hor_1">

                     <div>

                        <div class="row">
                           <!--조별-->
                           <%
                              int n = 1;
                           %>
                           <c:forEach var="teamReports" items="${ teamReports }">

                              <h2>${ teamReports.group_name }</h2>
                              <!--  
                              <label for="report_subject">멘토링 진행률 <span
                                 class="fh5co-uppercase-heading-sm">&nbsp;&nbsp;8회
                                    남았습니다.</span></label>
                              <div class="progress">
                                 <div class="progress-bar" role="progressbar"
                                    style="width: 25%;" aria-valuenow="25" aria-valuemin="0"
                                    aria-valuemax="100">25%</div>
                              </div>
                              -->

                              <div class="panel panel-default">
                                 <table class="table board" id="r_table<%=n%>">
                                    <thead>
                                       <tr>
                                          <th style="padding-left: 4px;"><input type="checkbox"
                                             onclick="selectAllCheckBox(this,'r_table<%=n%>','cb')"></th>
                                          <th>번호</th>
                                          <th>스터디주제</th>
                                          <th>장소</th>
                                          <th>작성일</th>
                                       </tr>
                                    </thead>
                                    <tbody>
                                       <c:forEach var="reports" items="${ teamReports.reports }"
                                          varStatus="status">
                                          <tr>
                                             <td><input type="checkbox" name="teamCheckbox"
                                                id="cb_1" value="${ reports.id }"></td>
                                             <th scope="row">${ status.index+1 }</th>
                                             <td data-url="report_detail?id=${ reports.id }">${ reports.subject }</td>
                                             <td>${ reports.place }</td>
                                             <td>${ reports.create_date }</td>
                                          </tr>
                                       </c:forEach>
                                    </tbody>
                                 </table>
                              </div>
                              <div class="col-md-12">
                                 <input type="submit"
                                    class="btn btn-primary btn-lg col-md-offset-11"
                                    onclick="mdown('teamCheckbox')" value="다운로드" />
                              </div>
                              <div class="fh5co-spacer fh5co-spacer-sm"></div>
                              <%
                                 n++;
                              %>
                           </c:forEach>

                           <!--조별 끝-->
                        </div>

                     </div>

                     <div>
                        <div class="row">
                           <!--주차-->
                           <%
                              Object startSM = request.getAttribute("startSM");
                              String start_sm = startSM.toString();

                              Calendar startCalendar = Calendar.getInstance();
                              Calendar deadCalendar = Calendar.getInstance();
                              Calendar currentCalendar = Calendar.getInstance();
                              Calendar reportCalendar = Calendar.getInstance();

                              startCalendar.set(Calendar.YEAR, Integer.parseInt(start_sm.substring(0, 4)));
                              startCalendar.set(Calendar.MONTH, Integer.parseInt(start_sm.substring(4, 6)) - 1);
                              startCalendar.set(Calendar.DATE, Integer.parseInt(start_sm.substring(6)));

                              deadCalendar.set(Calendar.YEAR, Integer.parseInt(start_sm.substring(0, 4)));
                              deadCalendar.set(Calendar.MONTH, Integer.parseInt(start_sm.substring(4, 6)) - 1);
                              deadCalendar.set(Calendar.DATE, Integer.parseInt(start_sm.substring(6)));

                              deadCalendar.add(Calendar.DATE, 6);

                              int week = 0;
                              while (startCalendar.before(currentCalendar) || startCalendar.equals(currentCalendar)) {
                           %>

                           <h2><%=week + 1%>주차
                           </h2>
                           <div class="panel panel-default">
                              <table class="table board" id="r_table<%=n%>">
                                 <thead>
                                    <tr>
                                       <th style="padding-left: 4px;"><input type="checkbox"
                                          onclick="selectAllCheckBox(this,'r_table<%=n%>','cb')"></th>
                                       <th>번호</th>
                                       <th>팀명</th>
                                       <th>스터디내용</th>
                                       <th>장소</th>
                                       <th>작성일</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <%
                                       int j = 0;
                                          for (Report report : list) {

                                             String rep_date = (report.getCreate_date()).replaceAll("-", "");

                                             reportCalendar.set(Calendar.YEAR, Integer.parseInt(rep_date.substring(0, 4)));
                                             reportCalendar.set(Calendar.MONTH, Integer.parseInt(rep_date.substring(4, 6)) - 1);
                                             reportCalendar.set(Calendar.DATE, Integer.parseInt(rep_date.substring(6)));

                                             if ((reportCalendar.equals(startCalendar) || startCalendar.before(reportCalendar))
                                                   && ((reportCalendar.equals(deadCalendar) || reportCalendar.before(deadCalendar)))) {
                                    %>
                                    <tr>
                                       <td><input type="checkbox" name="weekCheckbox"
                                          id="cb_1" value="<%=report.getId()%>"></td>
                                       <th scope="row"><%=j + 1%></th>
                                       <td><%=report.getGroup_name()%></td>
                                       <td data-url="report_detail?id=<%=report.getId()%>"><%=report.getSubject()%></td>
                                       <td><%=report.getPlace()%></td>
                                       <td><%=report.getCreate_date()%></td>
                                    </tr>
                                    <%
                                       j++;
                                             }

                                          }

                                          n++;
                                    %>
                                 </tbody>
                              </table>
                           </div>

                           <div class="col-md-12">
                              <input type="submit"
                                 class="btn btn-primary btn-lg col-md-offset-11"
                                 onclick="mdown('weekCheckbox')" value="다운로드" />
                           </div>
                           <div class="fh5co-spacer fh5co-spacer-sm"></div>
                           <%
                              startCalendar.add(Calendar.DATE, 7);
                                 deadCalendar.add(Calendar.DATE, 7);
                                 week++;
                              }
                           %>

                           <!--주차 끝-->
                        </div>
                     </div>
                     <div>
                        <div class="row">

                           <!--전체-->

                           <h2>전체보고서</h2>
                           <div class="col-md-12 animate-box">
                              <div class="pull-right">
                                 <form:form action="m_reportManage" method="post"
                                    modelAttribute="reportPagination" class="form-inline mb5">
                                    <form:hidden path="pg" value="1" />

                                    <span>정렬:</span>
                                    <form:select path="ob" class="form-control autosubmit"
                                       itemValue="value" itemLabel="label" items="${ orderBy }" />

                                    <span class="ml30">페이지 크기:</span>
                                    <form:select path="sz" class="form-control autosubmit">
                                       <form:option value="10" />
                                       <form:option value="15" />
                                       <form:option value="20" />
                                       <form:option value="100" />
                                    </form:select>

                                 </form:form>
                                 <div class="fh5co-spacer fh5co-spacer-sm"></div>
                              </div>

                              <div class="col-md-12" style="padding: 0px;">

                                 <div class="panel panel-default">
                                    <table class="table board" id="r_table<%=n%>">
                                       <thead>
                                          <tr>
                                             <th style="padding-left: 4px;"><input
                                                type="checkbox"
                                                onclick="selectAllCheckBox(this,'r_table<%=n%>','cb')"></th>
                                             <th>번호</th>
                                             <th>팀명</th>
                                             <th>스터디내용</th>
                                             <th>장소</th>
                                             <th>작성일</th>

                                          </tr>
                                       </thead>
                                       <tbody>
                                          <c:forEach var="report" items="${ list }"
                                             varStatus="status">
                                             <tr>
                                                <td><input type="checkbox" name="allCheckbox"
                                                   value="${ report.id }" id="cb_1"></td>
                                                <th scope="row">${ status.index+1 }</th>
                                                <td>${ report.group_name }</td>
                                                <td data-url="report_detail?id=${ report.id }">${ report.study_content }</td>
                                                <td>${ report.place }</td>
                                                <td>${ report.create_date }</td>
                                             </tr>
                                          </c:forEach>
                                       </tbody>
                                    </table>
                                 </div>
                              </div>
                           </div>
                           <my:reportpagination pageSize="${ reportPagination.sz }"
                              recordCount="${ reportPagination.recordCount }" />

                           <div class="col-md-12">
                              <input type="submit"
                                 class="btn btn-primary btn-lg col-md-offset-11"
                                 onclick="mdown('allCheckbox')" value="다운로드" />
                           </div>
                           <div class="fh5co-spacer fh5co-spacer-sm"></div>
                           <!--전체 끝-->

                        </div>
                     </div>
                     <!--제출현황-->
                     <div>
                        <div class="row">
                           <c:forEach var="conditionReports" items="${ conditionReports }">
                              <!--미제출-->
                              <h2>${ conditionReports.group_name }<span
                                    class="fh5co-uppercase-heading-sm">&nbsp;&nbsp;멘토 :
                                    ${ conditionReports.name }</span>
                              </h2>
                              <label for="report_subject">멘토링 진행률 <span
                                 class="fh5co-uppercase-heading-sm">&nbsp;&nbsp;${ totalReport }회
                                    중 ${ totalReport-conditionReports.reportCount }회 남았습니다.</span></label>
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

                              <div class="fh5co-spacer fh5co-spacer-sm"></div>
                           </c:forEach>
                        </div>
                     </div>
                     <!--제출현황 끝-->

                     <!-- 검색 및 삭제 시작 -->
                     <div>
                        <div class="row">
                           <div class="fh5co-spacer fh5co-spacer-sm"></div>
                           <p align="center">보고서 목록을 학기별로 검색할 수
                              있으며,&nbsp;&nbsp;&nbsp;3년이상 지난 보고서만 삭제할 수 있습니다.</p>
                           <p align="center">삭제되는 보고서는 영구적으로 삭제됩니다.</p>

                           <div class="col-md-12 animate-box">
                              <div class="fh5co-spacer fh5co-spacer-sm"></div>

                              <form action="m_searchReport" method="post" class="row" name="reportForm" onsubmit="return checkReportSearch();">
                                 <!-- 정렬조건 -->
                                 <div class="col-md-8" style="margin-left: 250px;">
                                    <div class="col-md-2" style="padding: 0px;">
                                       <div class="form-group">
                                          <label for="year" class="sr-only">년도</label> <input
                                             placeholder="YYYY" id="year" name="year" type="text"
                                             class="form-control" value="${year}" />
                                       </div>

                                    </div>
                                    <div class="col-md-1" style="padding: 0px; margin-top: 5px;">
                                       <b>년도</b>
                                    </div>
                                    <div class="col-md-2" style="padding: 0px;">
                                       <div class="form-group">
                                          <label for="semester" class="sr-only">학기</label> <select
                                             class="form-control" id="semester" name="semester">
                                             <option value=0>--학기</option>
                                             <option value=1
                                                <c:if test="${semester eq '1'}">selected</c:if>>1</option>
                                             <option value=2
                                                <c:if test="${semester eq '2'}">selected</c:if>>2</option>
                                          </select>
                                       </div>

                                    </div>
                                    <div class="col-md-1" style="padding: 0px; margin-top: 5px;">
                                       <b>학기</b>
                                    </div>
                                    <div class="col-md-2" style="padding: 0px;">
                                       <div class="form-group">
                                          <input type="submit" class="btn btn-primary" value="검색">

                                       </div>
                                    </div>
                                 </div>
                                 <!-- 정렬조건 끝 -->
                              </form>
                           </div>

                           <!-- 
               ///////////////////////////////////
               검색 결과
               ///////////////////////////////////
               -->
                           <%
                              Object keyword = null;
                              if (request.getAttribute("year") != null) {
                                 keyword = request.getAttribute("year");
                              }
                              if (keyword == null) {
                           %>
                           <div class="animate-box col-md-12" style="display: none">
                              <%
                                 } else {
                              %>
                              <div class="animate-box col-md-12" style="display: block">
                                 <%
                                    }
                                    int k = 0;
                                 %>
                                 <c:if test="${!empty searchReports}">
                                    <form id="form1" name="form1" method="post"
                                       action="deleteReport">
                                       <div class="panel panel-default">

                                          <table class="table" id="r_table<%=k%>">
                                             <thead>
                                                <tr>
                                                   <th style="padding-left: 4px;"><input
                                                      type="checkbox"
                                                      onclick="selectAllCheckBox(this,'r_table<%=k%>','cb')"></th>
                                                   <th>번호</th>
                                                   <th>팀명</th>
                                                   <th>스터디내용</th>
                                                   <th>장소</th>
                                                   <th>작성일</th>
                                                </tr>
                                             </thead>
                                             <tbody>
                                                <c:forEach var="searchReports"
                                                   items="${ searchReports }" varStatus="status">
                                                   <tr>
                                                      <td><input type="checkbox"
                                                         name="semesterCheckbox" value="${ searchReports.id }"
                                                         id="cb_1"></td>
                                                      <th scope="row">${ status.index+1 }</th>
                                                      <td>${ searchReports.group_name }</td>
                                                      <td data-url="report_detail?id=${ searchReports.id }">${ searchReports.study_content }</td>
                                                      <td>${ searchReports.place }</td>
                                                      <td>${ searchReports.create_date }</td>
                                                   </tr>
                                                </c:forEach>
                                             </tbody>
                                          </table>
                                       </div>
                                       <%
                                          if (Integer.parseInt((String) keyword) + 3 < currentCalendar.get(Calendar.YEAR)) {
                                       %>

                                       <div class="col-md-12">
                                       <input type="hidden" name="year" value="${year}"/>
                                       <input type="hidden" name="semester" value="${semester}"/>
                                          <input type="button"
                                             class="btn btn-primary btn-lg col-md-offset-8"
                                             onclick="mdown('semesterCheckbox')" value="다운로드" /> <input
                                             type="submit"
                                             class="btn btn-warning btn-lg col-md-offset-0"
                                             onclick="return delete_report();" value="삭제" />
                                       </div>
                                       <%
                                          } else {
                                       %>
                                       <div class="col-md-12">
                                          <input type="button"
                                             class="btn btn-primary btn-lg col-md-offset-11"
                                             onclick="mdown('semesterCheckbox')" value="다운로드" />
                                       </div>
                                       <%
                                          }
                                       %>
                                    </form>
                                 </c:if>
                                 <c:if test="${empty searchReports }">
                                    <div class="fh5co-spacer fh5co-spacer-sm"></div>
                                    <div class="col-md-12 text-center">
                                       <p>해당학기 작성된 보고서가 없습니다.</p>
                                    </div>
                                 </c:if>
                              </div>
                              <div class="fh5co-spacer fh5co-spacer-sm"></div>

                           </div>

                        </div>
                     </div>
                     <!--검색 및 삭제 끝-->
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>