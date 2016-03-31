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
				<li><a href="/milestones/open">Milestones</a></li>
				<li class="active"><a href="/issues/open">Issues<span
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
						<li role="presentation"
							<c:if test="${stat=='open'}"> class="active"</c:if>><a
							href="/issues/open">Open</a></li>
						<li role="presentation"
							<c:if test="${stat=='closed'}"> class="active"</c:if>><a
							href="/issues/closed">Closed</a></li>
						<li role="presentation"
							<c:if test="${stat=='all'}"> class="active"</c:if>><a
							href="/issues/all">All</a></li>
					</ul>


					<!-- Tab panes -->
					<div class="tab-content well">
						<input type="hidden" id="uno" name="uno" value="">
						<input type="hidden" id="mno" name="mno" value="">
						<input type="hidden" id="lno" name="lno" value="">
						<input type="hidden" id="weight" name="weight" value="">
						<div class="btn-group">
							<a href="#" class="btn btn-default"><span id="selectedAssign">Assignee</span></a>
							<a href="#" class="btn btn-default dropdown-toggle"
								data-toggle="dropdown" aria-expanded="false"><span
								class="caret" style="height: 10px; margin-top: 10px;"></span></a>
							<ul class="dropdown-menu">
								<li class="uno1"><a alt="0" href="#">UnAssigned</a></li>
								<c:forEach var="users" items="${userList}">
									<li class="uno1"><a alt="${users.uno}" href="#">${users.uname}</a></li>
								</c:forEach>
							</ul>
						</div>
						<!-- <div class="btn-group">
							<a href="#" class="btn btn-default">Assignee</a> <a href="#"
								class="btn btn-default dropdown-toggle" data-toggle="dropdown"
								aria-expanded="false"><span class="caret"
								style="height: 10px; margin-top: 10px;"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li class="divider"></li>
								<li><a href="#">4</a></li>
							</ul>
						</div> -->
						<div class="btn-group">
							<a href="#" class="btn btn-default"><span
								id="selectedMilestone">Milestone</span></a> <a href="#"
								class="btn btn-default dropdown-toggle" data-toggle="dropdown"
								aria-expanded="false"><span class="caret"
								style="height: 10px; margin-top: 10px;"></span></a>
							<ul class="dropdown-menu">
								<c:forEach var="milestone" items="${allMilestoneList}">
									<li class="milestoneNo"><a id="milestoneNo"
										alt="${milestone.mno}" href="#">${milestone.mtitle}</a></li>
								</c:forEach>
							</ul>
						</div>
						<div class="btn-group">
							<a href="#" class="btn btn-default"><span id="selectedLabel">Label</span></a>
							<a href="#" class="btn btn-default dropdown-toggle"
								data-toggle="dropdown" aria-expanded="false"><span
								class="caret" style="height: 10px; margin-top: 10px;"></span></a>
							<ul class="dropdown-menu">
								<c:forEach var="label" items="${allLabelList}">
									<li class="labelNo"><a id="labelNo" alt="${label.lno}"
										href="#" style="text-color: ${label.lbgcolor}">${label.ltitle}</a></li>
								</c:forEach>
							</ul>
						</div>
						<div class="btn-group">
							<a href="#" class="btn btn-default"><span id="selectedWeight">Weight</span></a>
							<a href="#" class="btn btn-default dropdown-toggle"
								data-toggle="dropdown" aria-expanded="false"><span
								class="caret" style="height: 10px; margin-top: 10px;"></span></a>
							<ul class="dropdown-menu">
								<%
									for (int i = 1; i < 10; i++) {
								%>
								<li class="weight"><a href="#"><%=i%></a></li>
								<%
									}
								%>
							</ul>
						</div>
						<a href="#" id="searchBtn" class="btn btn-info">Search</a>
					</div>

					<form name="frm" id="frm" method="post">
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>Issue Title</th>
									<th>Milestone Title</th>
									<th>Label</th>
									<th>Weight</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="issues" items="${issuesList}" varStatus="status">
									<input type="hidden" name="issueState"
										value="${issues.istatement }">
									<tr class="warning">
										<td><a
											href="/${issues.uno}/${issues.pno}/issue/${issues.ino}">${issues.ititle}</a><br>
											${issues.idescription }</td>
										<td><a
											href="/${issues.uno}/${issues.pno}/milestone/${issues.mno}">${issues.mtitle}</a></td>

										<td><c:forEach var="labels" items="${issues.labels}">
												<a href="#"><span class="label color-label has_tooltip"
													style="background-color:
												${labels.lbgcolor}; color: #FFFFFF"
													title="" data-container="body" data-original-title="">${labels.ltitle}</span></a>
											</c:forEach></td>

										<td>${issues.iweight}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$('.dropdown-menu > .uno1 > a').bind('click', function() {
				var userName = $(this).text();
				var userNo = $(this).attr("alt");
				console.log(userNo);
				$("#uno").val(userNo);
				$("#selectedAssign").text(userName);
			});
			$('.dropdown-menu > .milestoneNo > a').bind('click', function() {
				var mTitle = $(this).text();
				var milestoneNo = $(this).attr("alt");
				console.log(milestoneNo);
				$("#mno").val(milestoneNo);
				$("#selectedMilestone").text(mTitle);
			});
			$('.dropdown-menu > .labelNo > a').bind('click', function() {
				var lTitle = $(this).text();
				var labelNo = $(this).attr("alt");
				console.log(labelNo);
				$("#lno").val(labelNo);
				$("#selectedLabel").text(lTitle);
			});
			$('.dropdown-menu > .weight > a').bind('click', function() {
				var weight = $(this).text();
				console.log(weight);
				$("#weight").val(weight);
				$("#selectedWeight").text(weight);
			});
		
			$('#searchBtn').click(function() {
				$('#searchBtn').attr("href", "/issues/${stat}/search?uno=" 
						+ $("#uno").val() + "&mno=" + $("#mno").val()
						+ "&lno=" + $("#lno").val() + "&weight=" + $("#weight").val());
			});
		</script>
		<jsp:include
			page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />