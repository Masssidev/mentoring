<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:url var="R" value="/" />
<div id="fh5co-main">
	<div class="container">
	    <div class="row">
	    	<div class="col-md-12 animate-box">
	    		<h2 class="fh5co-uppercase-heading-sm text-center" id="introduce">${board}</h2>
	    		<div class="fh5co-spacer fh5co-spacer-sm"></div>
	    	</div>
	    	<div class="col-md-12 animate-box">
	    		<div id="fh5co-tab-feature-center" class="fh5co-tab text-center">
	    			<ul id="intro_modi_list" class="resp-tabs-list hor_1">
	    				<c:forEach var="introduce" items="${ introduces }">
	    					<li>${introduce.title }<a href="${R}manager/introduce_delete?id=${introduce.id}" class="btn2 btn-primary btn-sm">x</a></li>
	    				</c:forEach>
	    				<li>+새 항목</li>
	    			</ul>
	    			<div class="resp-tabs-container hor_1">
	    				<c:forEach var="introduce" items="${ introduces }">
		    				<div>
		    					<form method="post" action="${R}manager/m_introduce_modi?id=${introduce.id}">
			    					<div class="row">
			    						<div class="form-group">
			    							<label for="tab">항목</label>
			    							<input name="title" placeholder="항목" id="tab" type="text" class="form-control input-lg" value="${introduce.title}"/>
			    						</div>
			    						<div class="form-group">
			    							<label for="introduce_content">내용</label>
			    							<textarea name="content" placeholder="내용" id="introduce_content" class="form-control input-lg" rows="10">${introduce.content}</textarea>
			    						</div>
			    					</div>
				    				<div class="col-md-12">
							    		<div class="form-group col-r">
							    			<input type="submit" class="btn btn-primary btn-lg" value="저장">
							    		</div>
							    	</div>
							    </form>
		    				</div>
	    				</c:forEach>
	    				<div>
	    					<form method="post" action="${R}manager/m_introduce_modi?id=0">
		    					<div class="row">
		    						<div class="form-group">
		    							<label for="tab">항목</label>
		    							<input name="title" placeholder="항목" id="tab" type="text" class="form-control input-lg"/>
		    						</div>
		    						<div class="form-group">
		    							<label for="introduce_content">내용</label>
		    							<textarea name="content" placeholder="내용" id="introduce_content" class="form-control input-lg" rows="10"></textarea>
		    						</div>
		    					</div>
			    				<div class="col-md-12">
						    		<div class="form-group col-r">
						    			<input type="submit" class="btn btn-primary btn-lg" value="저장">
						    		</div>
						    	</div>
						    </form>
	    				</div>
	    			</div>
	    		</div>
	    	</div>
	    </div>
	</div>
</div>
<!-- END fhtco-main -->