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
<section id="main-content">
	<section class="wrapper site-min-height">
		<h3>
			<i class="fa fa-angle-right"></i> Request Project
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
						<table class="table" style="font-size: 1.0em">
							<c:forEach var="project" items="${list}">
								<tr>
									<td><a href="/${project.uno}/${project.pno}"
										style="color: #223"><b>${project.uname} /
												${project.pname}</b></a><br></td>
									<td style="text-align: right;"><c:if
											test="${stat=='requested' || stat=='declined'}">
											<a href="/updateStat/${project.pno}/001"
												class="btn btn-primary">Accept</a>
										</c:if> <c:if test="${stat=='requested' || stat=='accepted'}">
											<a href="/updateStat/${project.pno}/002"
												class="btn btn-default">Decline</a>
										</c:if></td>
								</tr>
							</c:forEach>
							<tr>
								<td></td>
								<td></td>
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