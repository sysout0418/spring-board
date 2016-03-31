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
				<li class="active"><a href="/${uno}/${pno}/issues/open">Issues</a></li>
			</ul>
			<ul class="nav nav-sidebar">
				<li><a href="">Settings</a></li>
			</ul>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<!-- Begin page content -->
			<div style="width: 1200; margin: 0 auto; background-color: #fff">
				<form class="form-horizontal">
					<fieldset>
						<legend>
							<a href="/issues/close/${uno}/${pno}/${ino}"
								class="btn btn-warning"
								style="position: absolute; right: 260px;">Close Issue</a> <a
								href="/issues/edit/${uno}/${pno}/${ino}" class="btn btn-info"
								style="position: absolute; right: 200px;">Edit</a>
							<h3>Issue Detail</h3>
						</legend>
						<div class="jumbotron">
							<div>
								<c:choose>
									<c:when test="${issues.istatement == '000' }">
										<span class="label label-success">Open</span> Issue
								</c:when>
									<c:when test="${issues.istatement == '001' }">
										<span class="label label-success">Closed</span> Issue
								</c:when>
								</c:choose>
								#${issues.ino}
							</div>
							<h2>${issues.ititle}</h2>
							<p>${issues.idescription}</p>
						</div>

						<div class="panel panel-danger">
						  <div class="panel-heading">
						    <h3 class="panel-title">Assignee</h3>
						  </div>
						  <div class="panel-body">
						    ${issues.uname}
						  </div>
						</div>
						
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">Milestone</h3>
							</div>
							<div class="panel-body">${issues.mtitle}</div>
						</div>

						<div class="panel panel-success">
							<div class="panel-heading">
								<h3 class="panel-title">Labels</h3>
							</div>
							<div class="panel-body">
								<c:forEach var="labels" items="${issues.labels}">
									<span class="label color-label has_tooltip"
										style="background-color:${labels.lbgcolor}; color: #FFFFFF"
										title="" data-container="body" data-original-title="">${labels.ltitle}</span>
								</c:forEach>
							</div>
						</div>

						<div class="panel panel-warning">
							<div class="panel-heading">
								<h3 class="panel-title">Weight</h3>
							</div>
							<div class="panel-body">${issues.iweight}</div>
						</div>

						<ul class="nav nav-tabs">
							<li class="active"><a href="#home" data-toggle="tab"
								aria-expanded="true">Write</a></li>
							<li class=""><a href="#profile" data-toggle="tab"
								aria-expanded="false">Preview</a></li>
						</ul>
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane fade active in" id="home">
								<textarea class="form-control" rows="3" id="textArea"></textarea>
							</div>
							<div class="tab-pane fade" id="profile">
								<p>preview</p>
							</div>
						</div>
						<a href="#" class="btn btn-success">Comment</a>
					</fieldset>
				</form>
			</div>
			<jsp:include
				page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />