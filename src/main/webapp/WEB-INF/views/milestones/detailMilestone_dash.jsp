<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header2_header.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header3_menu_dash.jsp" />
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

#sortable1 li, #sortable2 li {
	margin: 0 5px 5px 5px;
	padding: 5px;
	font-size: 0.9em;
	width: 520px;
}
</style>
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<section id="main-content">
	<section class="wrapper site-min-height">
		<h3>
			<i class="fa fa-angle-right"></i> Milestone #${milestone.mno} / ${milestone.mtitle}
		</h3>
		<div class="col-lg-12">
			<div class="row">
				<div class="col-md-12">
					<div class="content-panel">
						<table class="table">
							<tr>
								<td><c:if test="${milestone.mstatement=='000'}">
										<span class="label label-success">Open</span>
									</c:if> <c:if test="${milestone.mstatement=='001'}">
										<span class="label label-danger">Closed</span>
									</c:if> Milestone ${milestone.mtitle}</td>
							</tr>
							<tr>
								<td colspan="4" style="background-color: #faf9f9">
									<h3>${milestone.mtitle}</h3>
								</td>
							</tr>
							<tr style="background-color: #faf9f9">
								<td>Project</td>
								<td>Open issues</td>
								<td>State</td>
								<td>Due date</td>
							</tr>
							<tr>
								<td onclick="location.href='/${uno}/${milestone.pno}/milestone/${milestone.mno}'" style="cursor: pointer;"><a
									href="/${uno}/${milestone.pno}/milestone/${milestone.mno}">${milestone.uname}
										/ ${milestone.pname}</a></td>
								<td>${countOpenIssues}</td>
								<td><c:if test="${milestone.mstatement=='000'}">Open</c:if>
									<c:if test="${milestone.mstatement=='001'}">Closed</c:if></td>
								<td>${milestone.mduedate}</td>
							<tr>
								<td colspan="4">
									<h4>Progress</h4> ${countIssues} issues: ${countOpenIssues}
									open and <fmt:formatNumber value="${countClosedIssues}"
										maxIntegerDigits="1" /> closed ${completeIssuePercent}%
									complete
									<div style="float: right;">
										<a href="/${uno}/${milestone.pno}/issues/open"
											class="btn btn-default">Browse Issue</a>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<div class="progress">
										<div class="progress-bar progress-bar-success"
											role="progressbar" aria-valuenow="60" aria-valuemin="0"
											aria-valuemax="100" style="width: ${completeIssuePercent}%;"></div>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
</section>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />