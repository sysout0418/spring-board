<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header_dash.jsp" />
	<!-- Begin page content -->
	<div style="width: 1200; margin: 0 auto; background-color: #fff">
	<h4>Issues</h4>  
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
				<c:choose>
					<c:when test="${!empty selectedUserName}">
						<input type="hidden" id="uno" name="uno" value="${uno}">
					</c:when>
					<c:otherwise>
						<input type="hidden" id="uno" name="uno" value="">
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${!empty selectedMilestone}">
						<input type="hidden" id="mno" name="mno" value="${mno}">
					</c:when>
					<c:otherwise>
						<input type="hidden" id="mno" name="mno" value="">
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${!empty selectedLabelName}">
						<input type="hidden" id="lno" name="lno" value="${lno}">
					</c:when>
					<c:otherwise>
						<input type="hidden" id="lno" name="lno" value="">
					</c:otherwise>
				</c:choose>
				<div class="btn-group">
					<a href="#" class="btn btn-default">
						<c:choose>
							<c:when test="${!empty selectedUserName}">
								<span id="selectedAssign">${selectedUserName}</span>
							</c:when>
							<c:otherwise>
								<span id="selectedAssign">Assignee</span>
							</c:otherwise>
						</c:choose>
					</a>
					<a href="#" class="btn btn-default dropdown-toggle"
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
					<a href="#" class="btn btn-default">
						<c:choose>
							<c:when test="${!empty selectedMilestone}">
								<span id="selectedMilestone">${selectedMilestone}</span>
							</c:when>
							<c:otherwise>
								<span id="selectedMilestone">Milestone</span>
							</c:otherwise>
						</c:choose>
					</a> 
					<a href="#"
						class="btn btn-default dropdown-toggle" data-toggle="dropdown"
						aria-expanded="false"><span class="caret"
						style="height: 10px; margin-top: 10px;"></span></a>
					<ul class="dropdown-menu">
						<li class="milestoneNo"><a id="milestoneNo" alt="" href="#">Any</a></li>
						<c:forEach var="milestone" items="${milestoneList}">
							<li class="milestoneNo"><a id="milestoneNo"
								alt="${milestone.mno}" href="#">${milestone.mtitle}</a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="btn-group">
					<a href="#" class="btn btn-default">
						<c:choose>
							<c:when test="${!empty selectedLabelName}">
								<span id="selectedLabel">${selectedLabelName}</span>
							</c:when>
							<c:otherwise>
								<span id="selectedLabel">Weight</span>
							</c:otherwise>
						</c:choose>
					</a>
					<a href="#" class="btn btn-default dropdown-toggle"
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
				<%-- <div class="btn-group">
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
				</div> --%>
				<a href="#" id="searchBtn" class="btn btn-success">Search</a>
			</div>

			<form name="frm" id="frm" method="post">
				<table class="table">
					<tr class="active">
						<td>Issue Title</td>
						<td>Milestone Title</td>
						<!-- <td>Label</td> -->
						<td>Weight</td>
					</tr>
					<c:forEach var="issues" items="${issuesList}" varStatus="status">
						<input type="hidden" name="issueState"
							value="${issues.istatement }">
						<tr>
							<td><a
								href="/${issues.uno}/${issues.pno}/issue/${issues.ino}">${issues.ititle}</a><br>
								${issues.idescription }</td>
							<td><a
								href="/${issues.uno}/${issues.pno}/milestone/${issues.mno}">${issues.mtitle}</a></td>

							<td><span class="label color-label has_tooltip"
										style="background-color:
									${issues.lbgcolor}; color: #FFFFFF"
										title="" data-container="body" data-original-title="">${issues.ltitle}</span>
							</td>

							<%-- <td>${issues.iweight}</td> --%>
						</tr>
					</c:forEach>
					<tr><td colspan="5"></td></tr>
				</table>
			</form>
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
				+ "&lno=" + $("#lno").val());
	});
</script>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />