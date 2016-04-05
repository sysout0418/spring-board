<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp"/>
<div class="container-fluid">
<div class="row">
<div id="col">
<div class="col-sm-2 col-md-2 sidebar">
	<ul class="nav nav-sidebar">
		<li class="active"><a href="/">MyProjects<span class="sr-only">(current)</span></a></li>
	    <li><a href="/regist">Regist</a></li>
	    <li><a href="/search">Search</a></li>
	    <li><a href="/list">Projects</a></li>
	</ul>
	<ul class="nav nav-sidebar">
		<li><a href="/milestones/open">Milestones</a></li>
	    <li><a href="/issues/open">Issues</a></li>
	</ul>
	<ul class="nav nav-sidebar">
	    <li><a href="">Profile Settings</a></li>
	</ul>
</div>
</div>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<!-- Begin page content -->
	<div style="width:1200; margin:0 auto; background-color: #fff">	
	<table class="table" style="font-size: 0.9em">
		<tr><td><h4>Projects</h4></td><td style="text-align: right"><a href="/regist" class="btn btn-success" >New Project</a></td></tr>
		<c:forEach var="project" items="${list}">
		<tr><td style="color:##334"><a href="/${project.uno}/${project.pno}" style="color: #223"><b>${project.uname} / ${project.pname}</b></a><br>
		<c:choose>
			<c:when test="${fn:length(project.pdetail) > 20}">
				<c:out value="${fn:substring(project.pdetail,0,20)}"/>....
			</c:when>
			<c:otherwise>
				<c:out value="${project.pdetail}"/>
			</c:otherwise>
		</c:choose>
		</td><td></td></tr>
		</c:forEach>
	  	<tr><td></td></tr>
  	</table>
  	<a href="/logout">logout</a>
	</div>
</div>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>