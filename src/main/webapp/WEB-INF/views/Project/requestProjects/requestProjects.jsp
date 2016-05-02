<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header2_header.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header3_menu_dash.jsp" />
<style>
.progress{
 height:10px;
 margin-bottom: 3px;
}
</style>
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<section id="main-content">
	<section class="wrapper site-min-height">
		<h3>
			<i class="fa fa-angle-right"></i> Request Projects
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
										<li <c:if test="${stat=='requested'}"> class="active"</c:if>><a
											href="/requestProject/requested">Requested</a></li>
										<li <c:if test="${stat=='accepted'}"> class="active"</c:if>><a
											href="/requestProject/accepted">Accepted</a></li>
										<li <c:if test="${stat=='declined'}"> class="active"</c:if>><a
											href="/requestProject/declined">Declined</a></li>
									</ul>
								</div>
							</div>
						</div>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>#</th>
									<th><i class="fa fa-bullhorn"></i> 프로젝트명</th>
									<th><i class="fa fa-question-circle"></i> 프로젝트 진행도</th>
									<th><i class="fa fa-bookmark"></i> 상태</th>
									<th><i class="fa fa-edit"></i> 담당자</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${list == 'none'}">
									<tr style="height: 100px">
										<td colspan="6"
											style="text-align: center; vertical-align: middle;">No
											requests to show</td>
									</tr>
								</c:if>
								<c:if test="${list != 'none'}">
									<c:forEach var="project" items="${list}">
										<tr onclick="location.href='/DetailProject/${project.pno}'"
											style="cursor: pointer;">
											<td>${project.rownum}</td>
											<td><a href="/${project.uno}/${project.pno}">${project.pname}</a><br />
											<small>Created ${fn:substring(project.pregdate,0,10)}</small></td>
											<td class="hidden-phone">
												<div class="progress">
													<div class="progress-bar progress-bar-success"
														role="progressbar" aria-valuenow="40" aria-valuemin="0"
														aria-valuemax="100"
														style="width: ${project.completeIssuePercent}%"></div>
												</div> <small>${project.completeIssuePercent}% Complete</small>
											</td>
											<td><span class="label label-warning label-mini"
												style="background-color: ${project.lbgcolor}">${project.ltitle}</span></td>
											<td>${project.uname}</td>
											<td style="text-align: right;"><c:if
													test="${stat=='requested' || stat=='declined'}">
														<a href="/updateStat/${project.pno}/001" class="btn btn-theme"><i class="fa fa-check"></i> Accept</a>
												</c:if> <c:if test="${stat=='requested' || stat=='accepted'}">
													<a href="/updateStat/${project.pno}/002"
														class="btn btn-default"><i class="fa fa-trash-o fa-fw"></i>Decline</a>
												</c:if></td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
</section>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />