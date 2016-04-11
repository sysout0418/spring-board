<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp"/>
<div class="container-fluid">
<div class="row">
<div id="col">
<div class="col-sm-2 col-md-2 sidebar">
	<ul class="nav nav-sidebar">
		<li><a href="/">MyProjects</a></li>
	    <li><a href="/regist">Regist</a></li>
	    <li><a href="/search">Search</a></li>
	    <li><a href="/list">Projects</a></li>
	</ul>
	<ul class="nav nav-sidebar">
		<li class="active"><a href="/milestones/open">Milestones</a></li>
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
<table class="table">
<tr><td>
<c:if test="${milestone.mstatement=='000'}"><span class="label label-success">Open</span></c:if>
<c:if test="${milestone.mstatement=='001'}"><span class="label label-danger">Closed</span></c:if>
Milestone ${milestone.mtitle}
</td></tr>
<tr><td colspan="4" style="background-color: #faf9f9">
<h3>${milestone.mtitle}</h3>
</td></tr>
<tr style="background-color: #faf9f9">
	<td>Project</td>
	<td>Open issues</td>
	<td>State</td>
	<td>Due date</td>
</tr>
<tr>
	<td><a href="/${uno}/${milestone.pno}/milestone/${milestone.mno}">${milestone.uname} / ${milestone.pname}</a></td>
	<td>${countOpenIssues}</td>
	<td><c:if test="${milestone.mstatement=='000'}">Open</c:if><c:if test="${milestone.mstatement=='001'}">Closed</c:if></td>
	<td>${milestone.mduedate}</td>
<tr>
<td colspan="4">
<h4>Progress</h4>  	
${countIssues} issues: ${countOpenIssues} open and <fmt:formatNumber value="${countClosedIssues}" maxIntegerDigits="1"/> closed ${completeIssuePercent}% complete
<div style="float: right;">
<a href="/${uno}/${milestone.pno}/issues/open" class="btn btn-default">Browse Issue</a>
</div>
</td></tr>
<tr><td colspan="4">
<div class="progress"><div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: ${completeIssuePercent}%;"></div></div>
</td></tr>
</table>
<div role="tabpanel">
<!-- Nav tabs -->
<ul class="nav nav-tabs" role="tablist">
	<li role="presentation" class="active"><a href="#issues" aria-controls="home" role="tab" data-toggle="tab">Issues <span class="badge">${countIssues}</span></a></li>
	<li role="presentation"><a href="#participants" aria-controls="home" role="tab" data-toggle="tab">Participants <span class="badge">${unameSize}</span></a></li>
</ul>

<!-- Tab panes -->
<div class="tab-content">
	<div role="tabpanel" class="tab-pane active" id="issues">
		<ul id="sortable1" class="connectedSortable">
		  <li style="background-color: #f7f8fa">Open</li>
		  <c:forEach  var="issue" items="${issues}">
		  <c:if test="${issue.istatement == '000'}">
		  <li class="ui-state-default">${issue.ititle}</li>
		  </c:if>
		  </c:forEach>
		</ul>
		 
		<ul id="sortable2" class="connectedSortable">
		  <li style="background-color: #f7f8fa">Closed</li>
		  <c:forEach  var="issue" items="${issues}">
		  <c:if test="${issue.istatement == '001'}">
		  <li class="ui-state-default">${issue.ititle}</li>
		  </c:if>
		  </c:forEach>
		</ul>
	</div>
	<div role="tabpanel" class="tab-pane" id="participants">
		<table class="table">
		<c:forEach  var="uname" items="${uname}">
		<tr><td>${uname}</td></tr>
		</c:forEach>
		</table>
	</div>
</div>
</div>
<style>
#sortable1, #sortable2 {
  border: 1px solid #eee;
  width: 570px;
  min-height: 20px;
  list-style-type: none;
  margin: 0;
  padding: 5px 0 0 0;
  float: left;
  margin-right: 30px;
}
#sortable1 li, #sortable2 li{
  margin: 0 5px 5px 5px;
  padding: 5px;
  font-size: 0.9em;
  width: 520px;
}
</style>
</div>
 </div>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>