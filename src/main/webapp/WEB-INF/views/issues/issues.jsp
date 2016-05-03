<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header2_header.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header3_menu_dash.jsp" />
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<!--main content start-->
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper site-min-height">
		<h3>
			<i class="fa fa-angle-right"></i> Issues
		</h3>
		<div class="col-lg-12">
			<div class="row">
				<div class="col-md-12">
					<div class="content-panel">
						<div role="tabpanel">
							<!-- Nav tabs -->
							<div class="tabbable-panel">
								<div class="tabbable-line">
									<ul class="nav nav-tabs">
										<li <c:if test="${stat=='open'}"> class="active"</c:if>><a
											href="/issues/open">Open</a></li>
										<li <c:if test="${stat=='closed'}"> class="active"</c:if>><a
											href="/issues/closed">Closed</a></li>
										<li <c:if test="${stat=='all'}"> class="active"</c:if>><a
											href="/issues/all">All</a></li>
									</ul>
								</div>
							</div>

							<!-- Tab panes -->
							<div class="tab-content well">
								<c:choose>
									<c:when test="${!empty selectedUserName and selectedUserName != ''}">
										<input type="hidden" id="uno" name="uno" value="${uno}">
									</c:when>
									<c:when test="${!empty userName and userName != ''}">
										<input type="hidden" id="uno" name="uno" value="${user_no}">
									</c:when>
									<c:otherwise>
										<input type="hidden" id="uno" name="uno" value="">
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${!empty selectedMilestone and selectedMilestone != ''}">
										<input type="hidden" id="mno" name="mno" value="${mno}">
									</c:when>
									<c:otherwise>
										<input type="hidden" id="mno" name="mno" value="">
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${!empty selectedLabelName and selectedLabelName != ''}">
										<input type="hidden" id="lno" name="lno" value="${lno}">
									</c:when>
									<c:otherwise>
										<input type="hidden" id="lno" name="lno" value="">
									</c:otherwise>
								</c:choose>
								<div class="btn-group">
									<a href="#" class="btn btn-default"> <c:choose>
											<c:when test="${!empty selectedUserName and selectedUserName != ''}">
												<span id="selectedAssign">${selectedUserName}</span>
											</c:when>
											<c:when test="${!empty userName and userName != ''}">
												<span id="selectedAssign">${userName}</span>
											</c:when>
											<c:otherwise>
												<span id="selectedAssign">Assignee</span>
											</c:otherwise>
										</c:choose>
									</a> <a href="#" class="btn btn-default dropdown-toggle"
										data-toggle="dropdown" aria-expanded="false"><span
										class="caret" style="height: 10px; margin-top: 10px;"></span></a>
									<ul class="dropdown-menu">
										<li class="uno1"><a alt="" href="#">Any</a></li>
										<li class="uno1"><a alt="0" href="#">UnAssigned</a></li>
										<c:forEach var="users" items="${userList}">
											<li class="uno1"><a alt="${users.uno}" href="#">${users.uname}</a></li>
										</c:forEach>
									</ul>
								</div>
								<div class="btn-group">
									<a href="#" class="btn btn-default"> <c:choose>
											<c:when test="${!empty selectedMilestone}">
												<span id="selectedMilestone">${selectedMilestone}</span>
											</c:when>
											<c:otherwise>
												<span id="selectedMilestone">Milestone</span>
											</c:otherwise>
										</c:choose>
									</a> <a href="#" class="btn btn-default dropdown-toggle"
										data-toggle="dropdown" aria-expanded="false"><span
										class="caret" style="height: 10px; margin-top: 10px;"></span></a>
									<ul class="dropdown-menu">
										<li class="milestoneNo"><a id="milestoneNo" alt=""
											href="#">Any</a></li>
										<c:forEach var="milestone" items="${milestoneList}">
											<li class="milestoneNo"><a id="milestoneNo"
												alt="${milestone.mno}" href="#">${milestone.mtitle}</a></li>
										</c:forEach>
									</ul>
								</div>
								<div class="btn-group">
									<a href="#" class="btn btn-default"> <c:choose>
											<c:when test="${!empty selectedLabelName}">
												<span id="selectedLabel">${selectedLabelName}</span>
											</c:when>
											<c:otherwise>
												<span id="selectedLabel">Weight</span>
											</c:otherwise>
										</c:choose>
									</a> <a href="#" class="btn btn-default dropdown-toggle"
										data-toggle="dropdown" aria-expanded="false"><span
										class="caret" style="height: 10px; margin-top: 10px;"></span></a>
									<ul class="dropdown-menu">
										<li class="labelNo"><a id="labelNo" alt="" href="#">Any</a></li>
										<c:forEach var="label" items="${allLabelList}">
											<li class="labelNo"><a id="labelNo" alt="${label.lno}"
												href="#" style="text-color: ${label.lbgcolor}">${label.ltitle}</a></li>
										</c:forEach>
									</ul>
								</div>
								<a href="#" id="searchBtn" class="btn btn-warning">SEARCH ISSUES</a>
							</div>
						</div>
						<form name="frm" id="frm" method="post">
							<c:choose>
								<c:when test="${issuesList == 'none'}">
									<div style="height: 100px">
										<p style="text-align: center; vertical-align: middle;">
											No Issues to show</p>
									</div>
								</c:when>
								<c:otherwise>
									<c:forEach var="project" items="${projectInfo}">
										<div style="background-color: #EAEAEA; height: 30px;">
											<div>
												<a href="/${project.uno}/${project.pno}"
													style="float: left; margin-left: 15px; margin-top: 5px;">
													${project.uname} / ${project.pname}</a> 
													<a href="/${project.uno}/${project.pno}/issues/open"
													style="float: right; margin-right: 15px; margin-top: 5px;">
													show all</a>
											</div>
										</div>

										<ul class="list-group">
											<c:forEach var="issues" items="${issuesList}"
												varStatus="status">
												<c:if test="${project.pno == issues.pno}">
													<input type="hidden" name="issueState"
														value="${issues.istatement }">
													<li class="list-group-item"
														onclick="location.href='/${user_no}/${issues.pno}/issue/${issues.ino}'"
														style="cursor: pointer;"><span class="badge"><i
															class="fa fa-comment" aria-hidden="true"></i>
															${issues.commentCnt}</span> <span
														style="font-weight: bold; color: black;">${issues.ititle}</span>
														/ <span class="label color-label has_tooltip"
														style="background-color:
														${issues.lbgcolor}; color: #FFFFFF"
														title="" data-container="body" data-original-title="">${issues.ltitle}</span><br>
														${issues.iregdate} by ${issues.uname} / <i
														class="fa fa-clock-o" aria-hidden="true"></i> <a
														href="/${issues.uno}/${issues.pno}/milestone/${issues.mno}">${issues.mtitle}</a>
													</li>
												</c:if>
											</c:forEach>
										</ul>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
</section>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />
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

	$('#searchBtn').click(
			function() {
				$('#searchBtn').attr("href", "/issues/${stat}/search?uno=" 
						+ $("#uno").val()
						+ "&mno=" + $("#mno").val() + "&lno="
						+ $("#lno").val());
			});
</script>