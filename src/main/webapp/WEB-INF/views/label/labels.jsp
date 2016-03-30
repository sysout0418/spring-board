<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp" />
<div class="container-fluid">
<div class="row">
<div class="col-sm-2 col-md-2 sidebar">
	<ul class="nav nav-sidebar" style="height: 30px; text-align: center;">
		<li><a href="/">Go to DashBoard</a></li>
	</ul>
	<ul class="nav nav-sidebar">
		<li><a href="/${uno}/${pno}">Project</a></li>
	</ul>
	<ul class="nav nav-sidebar">
		<li><a href="/${uno}/${pno}/milestones/open">Milestones</a></li>
		<li><a href="/${uno}/${pno}/issues/open">Issues</a></li>
		<li class="active"><a href="/${uno}/${pno}/labels">Labels</a></li>
	</ul>
	<ul class="nav nav-sidebar">
		<li><a href="">Settings</a></li>
	</ul>
</div>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
<!-- Begin page content -->
<style type="text/css">
.Label{
	font-size: 15px;
	font-weight: normal;
	color: #fff;
	padding:5px;
	border-radius: 5px;
}
</style>
<div style="width: 1200; margin: 0 auto; background-color: #fff">
<table class="table">
<tr><td><h4>Labels</h4></td><td style="text-align: right"><a href="/${uno}/${pno}/label/new" class="btn btn-success">New Label</a></td></tr>
<c:forEach var="label" items="${list}">
<tr>
	<td><span class="Label" style="background-color: ${label.lbgcolor}">${label.ltitle}</span></td>
	<td style="text-align: right">0 open issues  
	<a href="/label/edit/${uno}/${pno}/${label.lno}" class="btn btn-default" >Edit</a>
	<a href="/label/edit/${uno}/${pno}/${label.lno}" class="btn btn-danger" >Remove</a>
	</td>
</tr>
</c:forEach>
</table>
</div>
</div>
</div>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />