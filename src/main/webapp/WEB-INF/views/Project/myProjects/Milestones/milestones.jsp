<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header_project.jsp"/>
<!-- Begin page content -->
<div style="width:1200; margin:0 auto; background-color: #fff">
<h4 class="page-header">${pname} / Milestones</h4>  	
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
	<td
		<c:if test="${milestone.mstatement == '001'}"> style="background-color : #f9f9f9"</c:if>>
		<a href="/${uno}/${pno}/milestone/${milestone.mno}">${milestone.mtitle}</a><br/>
		${milestone.countIssues} Issues<br/>
		<span style="color: #adad85">expires at ${milestone.mduedate}</span>
	</td>
	<td<c:if test="${milestone.mstatement == '001'}"> style="background-color : #f9f9f9"</c:if>>
		${milestone.completeIssuePercent}% complete<br/>
		<div class="progress"><div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: ${milestone.completeIssuePercent}%;"></div></div>
		<c:if test="${milestone.mstatement == '000'}">
		<a href="/milestones/edit/${uno}/${pno}/${milestone.mno}" class="btn btn-default" >Edit</a>
		<a href="/milestones/closeMilestone/${uno}/${pno}/${milestone.mno}" class="btn btn-warning">Close Milestone</a>
		<a href="/milestones/remove/${uno}/${pno}/${milestone.mno}" class="btn btn-danger">Remove</a>
		</c:if>
	</td>
</tr>
</c:forEach>
</table>
</div>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>