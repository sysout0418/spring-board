<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<% int i = 0; %>
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
			<!-- Begin page content -->
			<div style="width: 1200; margin: 0 auto; background-color: #fff">
				<form:form class="form-horizontal" method="post"
					action="/issues/edit" commandName="Issues">
					<input type="hidden" value="${ino}" name="ino" id="ino">
					<input type="hidden" value="${issues.uno}" name="uno" id="uno">
					<input type="hidden" value="${pno}" name="pno" id="pno">
					<input type="hidden" value="${issues.iweight}" name="iweight" id="iweight">
					<fieldset>
						<legend class="page-header">
							<h3>Edit Issue</h3>
						</legend>
						<div class="form-group">
							<label for="inputTitle" class="col-lg-2 control-label">Title</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" id="ititle"
									name="ititle" placeholder="Issue Title" value="${issues.ititle}">
							</div>
						</div>

						<div class="form-group">
							<label for="inputDesc" class="col-lg-2 control-label">Description</label>
							<div class="col-lg-10">
								<textarea class="form-control" rows="8" id="idescription"
									name="idescription">${issues.idescription}</textarea>
								<span class="help-block">help 설명</span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputAssignee" class="col-lg-2 control-label">Assignee</label>
							<div class="btn-group">
								<a href="#" class="btn btn-default btn-width"
									style="text-align: left; margin-left: 15px;"><span id="selectedAssign">select
									assignee</span></a> <a href="#" class="btn btn-default dropdown-toggle"
									data-toggle="dropdown"><span class="caret"
									style="height: 10px; margin-top: 10px;"></span></a>
								<ul class="dropdown-menu">
									<c:forEach var="users" items="${userList}">
										<li class="userNo1"><a href="#" alt="${users.uno}">${users.uname}</a></li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class="form-group">
							<label for="inputMilestone" class="col-lg-2 control-label">Milestone</label>
							<div class="btn-group">
								<a href="#" class="btn btn-default btn-width"
									style="text-align: left; margin-left: 15px;">select
									milestone</a> <a href="#" class="btn btn-default dropdown-toggle"
									data-toggle="dropdown"><span class="caret"
									style="height: 10px; margin-top: 10px;"></span></a>
								<ul class="dropdown-menu">
									<c:forEach var="milestone" items="${milestoneList}">
										<li class="milestonNo"><a href="#" alt="${milestone.mno}">${milestone.mtitle}</a></li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class="form-group">
							<label for="inputWeight" class="col-lg-2 control-label">Weight</label>
							<div class="btn-group">
								<a href="#" class="btn btn-default btn-width"
									style="text-align: left; margin-left: 15px;"><span
									id="selectedWeight">select weight</span></a> <a href="#"
									class="btn btn-default dropdown-toggle" data-toggle="dropdown"><span
									class="caret" style="height: 10px; margin-top: 10px;"></span></a>
								<ul class="dropdown-menu">
									<% for (i = 1; i < 10; i++) {%>
										<li class="weight"><a href="#" id="weight<%= i %>"><%= i %></a></li>
									<% } %>
								</ul>
							</div>
						</div>
						<div class="form-group">
							<label for="inputLabels" class="col-lg-2 control-label">Labels</label>
							<div class="btn-group">
								<a href="#" class="btn btn-default btn-width"
									style="text-align: left; margin-left: 15px;">select labels</a><a
									href="#" class="btn btn-default dropdown-toggle"
									data-toggle="dropdown"><span class="caret"
									style="height: 10px; margin-top: 10px;"></span></a>
								<ul class="dropdown-menu">
									<c:forEach var="labels" items="${labelList}">
										<li class="labelNo"><a href="#" alt="${labels.lno}">${labels.ltitle}</a></li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<button type="reset" class="btn btn-default">Cancel</button>
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
						</div>
					</fieldset>
				</form:form>
			</div>
		</div>
		<script type="text/javascript">
			$(function() {
				$('#selectedWeight').text($('#iweight').val());
				
				$('#weight0').click(function() {
					$('#selectedWeight').text($('#weight0').text());
					//$('#weight').val($('#selectedWeight').text());
				});
				$('#weight1').click(function() {
					$('#selectedWeight').text($('#weight1').text());
					$('#iweight').val($('#selectedWeight').text());
				});
				$('#weight2').click(function() {
					$('#selectedWeight').text($('#weight2').text());
					$('#iweight').val($('#selectedWeight').text());
				});
				$('#weight3').click(function() {
					$('#selectedWeight').text($('#weight3').text());
					$('#iweight').val($('#selectedWeight').text());
				});
				$('#weight4').click(function() {
					$('#selectedWeight').text($('#weight4').text());
					$('#iweight').val($('#selectedWeight').text());
				});
				$('#weight5').click(function() {
					$('#selectedWeight').text($('#weight5').text());
					$('#iweight').val($('#selectedWeight').text());
				});
				$('#weight6').click(function() {
					$('#selectedWeight').text($('#weight6').text());
					$('#iweight').val($('#selectedWeight').text());
				});
				$('#weight7').click(function() {
					$('#selectedWeight').text($('#weight7').text());
					$('#iweight').val($('#selectedWeight').text());
				});
				$('#weight8').click(function() {
					$('#selectedWeight').text($('#weight8').text());
					$('#iweight').val($('#selectedWeight').text());
				});
				$('#weight9').click(function() {
					$('#selectedWeight').text($('#weight9').text());
					$('#iweight').val($('#selectedWeight').text());
				});
			});
		</script>
		<jsp:include
			page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />