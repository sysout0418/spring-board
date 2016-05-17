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
.progress {
	height: 10px;
	margin-bottom: 3px;
}
</style>
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true"
	style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">Warning</h4>
			</div>
			<div class="modal-body">
				<p>정말로 이 프로젝트를 삭제 하시겠습니까?</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" id="okBtn" class="btn btn-primary"
					data-dismiss="modal">Yes</button>
			</div>
		</div>
	</div>
</div>

<section id="main-content">
	<section class="wrapper site-min-height">
		<h3>
			<i class="fa fa-angle-right"></i> My Projects
		</h3>
		<div class="col-lg-12">
			<div class="row">
				<div class="col-md-12">
					<div class="content-panel">
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
											projects to show</td>
									</tr>
								</c:if>
								<c:if test="${list != 'none'}">
									<c:forEach var="project" items="${list}">
										<tr id="trEvent" alt="/${project.uno}/${project.pno}" style="cursor: pointer;">
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
											<td><a
												href="/${project.uno}/${project.pno}"
												class="btn btn-success btn-xs" role="button"><i
													class="fa fa-check"></i></a> <a href="/update/${project.pno}"
												class="btn btn-primary btn-xs" role="button"><i
													class="fa fa-pencil"></i></a>
												<button type="button" class="btn btn-danger btn-xs" id="projectDelBtn" data-toggle="modal" data-target="#myModal"
													alt="/DeleteProject?pno=${project.pno}">
													<i class="fa fa-trash-o"></i>
												</button></td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
					<!-- /content-panel -->
				</div>
				<!-- /col-md-12 -->
			</div>
			<!-- /row -->
		</div>
	</section>
</section>
<!-- /MAIN CONTENT -->
<!--main content end-->
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />
<script>
	$(document).on('click', '#trEvent', function() {
		var url = $(this).attr('alt');
		$target = $(event.target);
		if (event.target.type == 'button') {
			return;
		} else if ($target.is('i')) {
			return;
		}
		
		location.href = url;
	});
	
	$(document).on('click', '#projectDelBtn', function() {
		var delUrl = $(this).attr('alt');
		$("#okBtn").click(function() {
			location.href = delUrl;
		});
	});
</script>