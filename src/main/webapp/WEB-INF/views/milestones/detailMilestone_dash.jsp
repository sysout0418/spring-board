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
	<td><a href="/${uno}/${milestone.pno}/milestone/${milestone.mno}">${uname} / ${pname}</a></td>
	<td>0</td>
	<td><c:if test="${milestone.mstatement=='000'}">Open</c:if><c:if test="${milestone.mstatement=='001'}">Closed</c:if></td>
	<td>${milestone.mduedate}</td>
<tr>
<td colspan="4">
<h4>Progress</h4>  	
0 issues: 0 open and 0 closed 0% complete
<div style="float: right;">
<button type="button" class="btn btn-default">Browse Issue</button>
</div>
</td></tr>
<tr><td colspan="4">
<div class="progress"><div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div></div>
</td></tr>
</table>
<div role="tabpanel">
<!-- Nav tabs -->
<ul class="nav nav-tabs" role="tablist">
	<li role="presentation" class="active"><a href="#issues" aria-controls="home" role="tab" data-toggle="tab">Issues <span class="badge">0</span></a></li>
	<li role="presentation"><a href="#participants" aria-controls="home" role="tab" data-toggle="tab">Participants <span class="badge">0</span></a></li>
</ul>

<!-- Tab panes -->
<div class="tab-content">
	<div role="tabpanel" class="tab-pane active" id="issues">
		<ul id="sortable1" class="connectedSortable">
		  <li>Unstarted Issues (open and unassigned)</li>
		  <li class="ui-state-default">Item 1</li>
		</ul>
		 
		<ul id="sortable2" class="connectedSortable">
		  <li>Unstarted Issues (open and unassigned)</li>
		  <li class="ui-state-highlight">Item 2</li>
		</ul>
		
		<ul id="sortable3" class="connectedSortable">
		  <li>Completed Issues (closed)</li>
		  <li class="ui-state-highlight">Item3</li>
		</ul>
	</div>
	<div role="tabpanel" class="tab-pane" id="participants">2</div>
	<div role="tabpanel" class="tab-pane" id="labels">3</div>
</div>
</div>
  <style>
  #sortable1, #sortable2, #sortable3 {
    border: 1px solid #eee;
    width: 370px;
    min-height: 20px;
    list-style-type: none;
    margin: 0;
    padding: 5px 0 0 0;
    float: left;
    margin-right: 30px;
  }
  #sortable1 li, #sortable2 li, #sortable3 li {
    margin: 0 5px 5px 5px;
    padding: 5px;
    font-size: 0.9em;
    width: 360px;
  }
  </style>
  <script>
  $(function() {
    $( "#sortable1, #sortable2, #sortable3" ).sortable({
      connectWith: ".connectedSortable"
    }).disableSelection();
  });
  </script>
</div>
 </div>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>