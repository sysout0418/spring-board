<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header2_header.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header3_menu_project.jsp" />
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper site-min-height">
		<h3>
			<i class="fa fa-angle-right"></i> Project #${pno} / Milestone
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
											href="/${uno}/${pno}/milestones/open">Open <span class="badge">${milestoneOpenCnt}</span></a></li>
										<li <c:if test="${stat=='closed'}"> class="active"</c:if>><a
											href="/${uno}/${pno}/milestones/closed">Closed <span class="badge">${milestoneClosedCnt}</span></a></li>
										<li <c:if test="${stat=='all'}"> class="active"</c:if>><a
											href="/${uno}/${pno}/milestones/all">All <span class="badge">${milestoneAllCnt}</span></a></li>
										<div style="text-align: right">
											<li><a href="/${uno}/${pno}/milestones/new"
											class="btn btn-success">New Milestone</a></li>
										</div>
									</ul>
								</div>
							</div>
						</div>
						<table class="table table-hover">
							<c:if test="${list == 'none'}">
                        	<tr style="height: 100px"><td colspan="6" style="text-align: center; vertical-align: middle;">
                        	No milestones to show
                        	</td></tr>
                        	</c:if>
                        	<c:if test="${list != 'none'}">
							<c:forEach var="milestone" items="${list}">
								<tr onclick="location.href='/${uno}/${pno}/milestone/${milestone.mno}'" style="cursor: pointer;">
									<td
										<c:if test="${milestone.mstatement == '001'}"> style="background-color : #f9f9f9"</c:if>>
										<a href="/${uno}/${pno}/milestone/${milestone.mno}">${milestone.mtitle}</a><br />
										${milestone.countIssues} Issues<br /> 
										<c:choose>
											<c:when test="${milestone.isExpired}">
												<span style="color: red;">(Expired)</span>
												<span style="color: #adad85">expired at ${milestone.mduedate}</span>
											</c:when>
											<c:otherwise>
												<span style="color: #adad85">expires at ${milestone.mduedate}</span>
											</c:otherwise>
										</c:choose>
									</td>
									<td
										<c:if test="${milestone.mstatement == '001'}"> style="background-color : #f9f9f9"</c:if>>
										${milestone.completeIssuePercent}% complete<br />
										<div class="progress">
											<div class="progress-bar progress-bar-success"
												role="progressbar" aria-valuenow="60" aria-valuemin="0"
												aria-valuemax="100"
												style="width: ${milestone.completeIssuePercent}%;"></div>
										</div> <c:if test="${milestone.mstatement == '000'}">
											<a href="/milestones/edit/${uno}/${pno}/${milestone.mno}"
												class="btn btn-default">Edit</a>
											<a
												href="/milestones/closeMilestone/${uno}/${pno}/${milestone.mno}"
												class="btn btn-warning">Close Milestone</a>
											<a href="/milestones/remove/${uno}/${pno}/${milestone.mno}"
												class="btn btn-danger">Remove</a>
										</c:if>
									</td>
								</tr>
							</c:forEach>
							</c:if>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
</section>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />