<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp"/>
<div class="container-fluid">
<div class="row">
<div class="col-sm-2 col-md-2 sidebar">
	<ul class="nav nav-sidebar">
		<li><a href="/">MyProjects</a></li>
	    <li><a href="/regist">Regist</a></li>
	    <li><a href="/search">Search</a></li>
	    <li class="active"><a href="/list">Projects<span class="sr-only">(current)</span></a></li>
	</ul>
	<ul class="nav nav-sidebar">
		<li><a href="/milestones/open">Milestones</a></li>
	    <li><a href="/issues/open">Issues</a></li>
	</ul>
	<ul class="nav nav-sidebar">
	    <li><a href="">Profile Settings</a></li>
	</ul>
</div>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<!-- Begin page content -->
	<div style="width:1200; margin:0 auto; background-color: #fff">
		<h4>Projects</h4>
		<table class="table">
		<tr class="active">
			<td style="width:500px; text-align: center;">프로젝트</td>
			<td>등급</td>
			<td>모집분야</td>
			<td>마감일</td>
			<td>담당자</td>
		</tr>
		<c:forEach var="project" items="${list}">
		<tr>
			<td>
				<a href="/DetailProject/${project.pno}">${project.pname}</a><br>
				<c:choose>
					<c:when test="${fn:length(project.pdetail) > 20}">
						<c:out value="${fn:substring(project.pdetail,0,20)}"/>....
					</c:when>
					<c:otherwise>
						<c:out value="${project.pdetail}"/>
					</c:otherwise>
				</c:choose>
			</td>
			<td>${project.plevel["0"]}</td>
			<td>${project.pskill}</td>
			<td>${project.pduedate}</td>
			<td>${project.uname}</td>
		</tr>
		</c:forEach>
		<tr><td colspan="5"></td></tr>
		
		<!-- 페이징 -->
		</table>
		<div align="center">
			<ul class="pagination">
		  		<li><a href="list?pageNo=1">처음</a></li>
		  		<c:if test="${groupNo >1 }">
					<li><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
				</c:if>
				<c:forEach var="i" begin="${startPageNo}" end = "${endPageNo}">
					<li <c:if test="${pageNo ==i}">class="active"</c:if>><a href="list?pageNo=${i}">${i}</a></li>
				</c:forEach>
				<c:if test="${groupNo < totalGroupNo }">
					<li><a href="list?pageNo=${endPageNo+1}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
				</c:if>
				<li><a href="?pageNo=${totalPageNo}">맨끝</a></li>
		  	</ul>
		</div>
	</div>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>