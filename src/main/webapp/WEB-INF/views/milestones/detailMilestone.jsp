<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp"/>
<div class="container-fluid">
<div class="row"><div id="col">
<div class="col-sm-2 col-md-2 sidebar">
   	<ul class="nav nav-sidebar" style="height: 30px; text-align: center;">
    	<li><a href="/">Go to DashBoard</a></li>
  	</ul>
    <ul class="nav nav-sidebar">
		<li><a href="/${uno}/${pno}">Project</a></li>
	</ul>
	<ul class="nav nav-sidebar">
		<li class="active"><a href="/${uno}/${pno}/milestones/open">Milestones</a></li>
	    <li><a href="/${uno}/${pno}/issues/open">Issues</a></li>
	    <li><a href="/${uno}/${pno}/labels">Labels</a></li>
	</ul>
 	<ul class="nav nav-sidebar">
    	<li><a href="">Settings</a></li>
    </ul>
</div></div>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
<!-- Begin page content -->
<div style="width:1200; margin:0 auto; background-color: #fff">
<table class="table">
<tr><td>
<c:if test="${milestone.mstatement=='000'}"><span class="label label-success">Open</span></c:if>
<c:if test="${milestone.mstatement=='001'}"><span class="label label-danger">Closed</span></c:if>
Milestone #${mno} expires at ${milestone.mduedate}
<div style="float: right;">
<a href="/milestones/edit/${uno}/${pno}/${milestone.mno}" class="btn btn-default">Edit</a>
<c:if test="${milestone.mstatement=='000'}">
<a href="/milestones/closeMilestone/${uno}/${pno}/${milestone.mno}" class="btn btn-warning">Close Milestone</a>
</c:if>
<c:if test="${milestone.mstatement=='001'}">
<a href="/milestones/reopenMilestone/${uno}/${pno}/${milestone.mno}" class="btn btn-default">Reopen Milestone</a>
</c:if>
<a href="/milestones/remove/${uno}/${pno}/${milestone.mno}" class="btn btn-danger">Remove</a>
</div>
</td></tr>
<tr><td>
<h4>${milestone.mtitle}</h4>  	
${milestone.mdescription}
<c:forEach var="file" items="${fileList}">
	<input type="hidden" id="fno" value="${file.fno }">
	<a href="/issue/downloadFile/${file.fno}" style="color:#4d94c4">${file.originalName }</a> 
	(${file.fileSize}kb)
</c:forEach>
</td></tr>
<tr><td>
<h4>Progress</h4>  	
${countIssues} issues: ${countOpenIssues} open and <fmt:formatNumber value="${countClosedIssues}" maxIntegerDigits="1"/> closed ${completeIssuePercent}% complete
<div style="float: right;">
<a href="/${uno}/${pno}/issues/new" class="btn btn-default">New Issue</a>
<a href="/${uno}/${pno}/issues/open" class="btn btn-default" >Browse Issue</a>
</div>
</td></tr>
<tr><td>
<div class="progress"><div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: ${completeIssuePercent}%;"></div></div>
</td></tr>
</table>
<input type="hidden" id="uno" value="${uno}"/>
<div role="tabpanel">
<!-- Nav tabs -->
<ul class="nav nav-tabs" role="tablist">
	<li role="presentation" class="active"><a href="#issues" aria-controls="home" role="tab" data-toggle="tab">Issues <span class="badge">${countIssues}</span></a></li>
	<li role="presentation"><a href="#participants" aria-controls="home" role="tab" data-toggle="tab">Participants <span class="badge">${unameSize}</span></a></li>
</ul>

<!-- Tab panes -->
<div class="tab-content">
	<div role="tabpanel" class="tab-pane active" id="issues">
		<ul id="unstarted1" class="connectedSortable">
		  <li style="background-color: #f7f8fa">Unstarted Issues (open and unassigned)</li>
		  <li>Drag and drop available</li>
		  <c:forEach  var="issue" items="${issues}">
		  <c:if test="${issue.istatement == '000' && issue.uno == ''}">
		  <li class="ui-state-default" id="${issue.ino}">${issue.ititle}</li>
		  </c:if>
		  </c:forEach>
		</ul>
		 
		<ul id="unstarted2" class="connectedSortable">
		  <li style="background-color: #f7f8fa">Unstarted Issues (open and assigned)</li>
		  <li>Drag and drop available</li>
		  <c:forEach  var="issue" items="${issues}">
		  <c:if test="${issue.istatement == '000' && issue.uno != ''}">
		  <li class="ui-state-default" id="${issue.ino}">${issue.ititle}</li>
		  </c:if>
		  </c:forEach>
		</ul>
		
		<ul id="completed" class="connectedSortable">
		  <li style="background-color: #f7f8fa">Completed Issues (closed)</li>
		  <li>Drag and drop available</li>
		  <c:forEach  var="issue" items="${issues}">
		  <c:if test="${issue.istatement == '001'}">
		  <li class="ui-state-default" id="${issue.ino}">${issue.ititle}</li>
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
  #unstarted1, #unstarted2, #completed {
    border: 1px solid #eee;
    width: 370px;
    min-height: 20px;
    list-style-type: none;
    margin: 0;
    padding: 5px 0 0 0;
    float: left;
    margin-right: 30px;
  }
  #unstarted1 li, #unstarted2 li, #completed li {
    margin: 0 5px 5px 5px;
    padding: 5px;
    font-size: 0.9em;
    width: 360px;
    height: 35px;
  }
  </style>
  <script>
  $(function() {
    $( "#unstarted1, #unstarted2, #completed" ).sortable({
      connectWith: ".connectedSortable",
      cursor: "move",
      placeholder: "ui-state-highlight",
      receive: function(event, ui){
    	  var item = ui.item.attr("id");
    	  var place = $(this).attr('id');
    	  var uno = $('#uno').val();
    	  $.ajax({      
    	        type:"POST",  
    	        url:'/milestones/ajax',      
    	        data:{"item" : item, "place" : place, "uno" : uno}
    	    });  
      }
    }).disableSelection();
  });
  </script>
</div>
 </div>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>