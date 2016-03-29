<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp" />
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
				<li><a href="/milestones">Milestones</a></li>
				<li class="active"><a href="/issues">Issues<span
						class="sr-only">(current)</span></a></li>
			</ul>
			<ul class="nav nav-sidebar">
				<li><a href="">Profile Settings</a></li>
			</ul>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<!-- Begin page content -->
			<div style="width: 1200; margin: 0 auto; background-color: #fff">
				<div role="tabpanel">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#open"
							aria-controls="home" role="tab" data-toggle="tab">Open</a></li>
						<li role="presentation"><a href="#closed"
							aria-controls="profile" role="tab" data-toggle="tab">Closed</a></li>
						<li role="presentation"><a href="#all"
							aria-controls="messages" role="tab" data-toggle="tab">All</a></li>
						<li style="position: absolute; right: 200px;"><a
							href="/issues/new" class="btn btn-success">+ New Issues</a></li>
					</ul>


					<!-- Tab panes -->
					<div class="tab-content well">
						<div class="checkbox" style="display: inline-block;">
							<label> <input type="checkbox">
							</label>
						</div>
						<div class="btn-group">
							<a href="#" class="btn btn-default">Author</a> <a href="#"
								class="btn btn-default dropdown-toggle" data-toggle="dropdown"
								aria-expanded="false"><span class="caret"
								style="height: 10px; margin-top: 10px;"></span></a>
							<ul class="dropdown-menu">
								<c:forEach var="users" items="${users }">
									<li><a href="${users.uno}">${users.uname}</a></li>
								</c:forEach>
							</ul>
						</div>
						<div class="btn-group">
							<a href="#" class="btn btn-default">Assignee</a> <a href="#"
								class="btn btn-default dropdown-toggle" data-toggle="dropdown"
								aria-expanded="false"><span class="caret"
								style="height: 10px; margin-top: 10px;"></span></a>
							<ul class="dropdown-menu">
								<c:forEach var="users" items="${users }">
									<li><a href="${users.uno}">${users.uname}</a></li>
								</c:forEach>
							</ul>
						</div>
						<div class="btn-group">
							<a href="#" class="btn btn-default">Milestone</a> <a href="#"
								class="btn btn-default dropdown-toggle" data-toggle="dropdown"
								aria-expanded="false"><span class="caret"
								style="height: 10px; margin-top: 10px;"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">1</a></li>
							</ul>
						</div>
						<div class="btn-group">
							<a href="#" class="btn btn-default">Label</a> <a href="#"
								class="btn btn-default dropdown-toggle" data-toggle="dropdown"
								aria-expanded="false"><span class="caret"
								style="height: 10px; margin-top: 10px;"></span></a>
							<ul class="dropdown-menu">
								<c:forEach var="labels" items="${labels }">
									<li><a href="${labels.lno}">${labels.ltitle}</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>

					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th><div class="checkboxAll">
										<label> <input type="checkbox" value="">
										</label>
									</div></th>
								<th>Issue Title</th>
								<th>Milestone Title</th>
								<th>Label</th>
								<th>Weight</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<jsp:include
			page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />