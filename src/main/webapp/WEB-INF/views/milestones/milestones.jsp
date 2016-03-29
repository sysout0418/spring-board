<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp"/>
<div class="container-fluid">
<div class="row">
<div class="col-sm-2 col-md-2 sidebar">
	<ul class="nav nav-sidebar">
		<li><a href="/">MyProjects</a></li>
	    <li><a href="/regist">Regist</a></li>
	    <li><a href="/search">Search</a></li>
	    <li><a href="/list">Projects</a></li>
	</ul>
	<ul class="nav nav-sidebar">
		<li class="active"><a href="/milestones/open">Milestones</a></li>
	    <li><a href="/issues">Issues</a></li>
	</ul>
	<ul class="nav nav-sidebar">
	    <li><a href="">Profile Settings</a></li>
	</ul>
</div>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
<!-- Begin page content -->
<div style="width:1200; margin:0 auto; background-color: #fff">
<h4 class="page-header">Milestones</h4>  	
<div role="tabpanel">
<!-- Nav tabs -->
<ul class="nav nav-tabs" role="tablist">
	<li role="presentation"<c:if test="${stat=='open'}"> class="active"</c:if>><a href="/${uno}/${pno}/milestones/open">Open</a></li>
	<li role="presentation"<c:if test="${stat=='closed'}"> class="active"</c:if>><a href="/${uno}/${pno}/milestones/closed">Closed</a></li>
	<li role="presentation"<c:if test="${stat=='all'}"> class="active"</c:if>><a href="/${uno}/${pno}/milestones/all">All</a></li>
	<li style="width:1000px;"><div style="float: right;"><a href="/${uno}/${pno}/milestones/new" class="btn btn-success">New Milestone</a></div></li>
</ul>
</div>
<table class="table">
<c:forEach var="milestone" items="${list}">
<tr>
	<td<c:if test="${milestone.mstatement == '001'}"> style="background-color : #f9f9f9"</c:if>><a href="/${uno}/${pno}/milestone/${milestone.mno}">${milestone.mtitle}</a><br/>0 Issues</td>
	<td<c:if test="${milestone.mstatement == '001'}"> style="background-color : #f9f9f9"</c:if>>
		0% complete<br/>
		<div class="progress"><div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div></div>
	</td>
</tr>
</c:forEach>
</table>
</div>
 </div>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>