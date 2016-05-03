<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header2_header.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header3_menu_project.jsp" />
<style>
#unstarted1, #unstarted2, #completed {
	border: 1px solid #eee;
	width: 370px;
	min-height: 20px;
	list-style-type: none;
	margin: 0;
	padding: 5px 0 0 0;
	float: left;
	margin-right: 30px;
}

#unstarted1 li, #unstarted2 li, #completed li {
	margin: 0 5px 5px 5px;
	padding: 5px;
	font-size: 0.9em;
	width: 360px;
	height: 35px;
}
</style>
<!-- Begin page content -->
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<section id="main-content">
	<section class="wrapper site-min-height">
		<h3>
			<i class="fa fa-angle-right"></i> Project #${pno} / Milestone
			#${milestone.mno}_${milestone.mtitle}
		</h3>
		<div class="col-lg-12">
			<div class="row">
				<div class="col-md-12">
					<div class="content-panel">
						<table class="table">
							<tbody>
								<tr>
									<td><c:if test="${milestone.mstatement=='000'}">
											<span class="label label-success">Open</span>
										</c:if> <c:if test="${milestone.mstatement=='001'}">
											<span class="label label-danger">Closed</span>
										</c:if> Milestone #${mno} expires at ${milestone.mduedate}
										<div style="float: right;">
											<a href="/milestones/edit/${uno}/${pno}/${milestone.mno}"
												class="btn btn-default">Edit</a>
											<c:if test="${milestone.mstatement=='000'}">
												<a
													href="/milestones/closeMilestone/${uno}/${pno}/${milestone.mno}"
													class="btn btn-warning">Close Milestone</a>
											</c:if>
											<c:if test="${milestone.mstatement=='001'}">
												<a
													href="/milestones/reopenMilestone/${uno}/${pno}/${milestone.mno}"
													class="btn btn-default">Reopen Milestone</a>
											</c:if>
											<a href="/milestones/remove/${uno}/${pno}/${milestone.mno}"
												class="btn btn-danger">Remove</a>
										</div></td>
								</tr>
								<tr>
									<td>
										<h4>${milestone.mtitle}</h4> ${milestone.mdescription} <c:forEach
											var="file" items="${fileList}">
											<input type="hidden" id="fno" value="${file.fno }">
											<a href="/issue/downloadFile/${file.fno}"
												style="color: #4d94c4">${file.originalName }</a> 
						(${file.fileSize}kb)
					</c:forEach>
									</td>
								</tr>
								<tr>
									<td>
										<h4>Progress</h4> ${countIssues} issues: ${countOpenIssues}
										open and <fmt:formatNumber value="${countClosedIssues}"
											maxIntegerDigits="1" /> closed ${completeIssuePercent}%
										complete
										<div style="float: right;">
											<a href="#" class="btn btn-default" id="goNewIssueByMno">New Issue</a>
											<a href="/${uno}/${pno}/issues/open/search?userNo=&mno=${milestone.mno}&lno=" class="btn btn-default">Browse Issue</a>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="progress">
											<div class="progress-bar progress-bar-success"
												role="progressbar" aria-valuenow="60" aria-valuemin="0"
												aria-valuemax="100" style="width: ${completeIssuePercent}%;"></div>
										</div>
									</td>
								</tr>
								<input type="hidden" id="uno" value="${uno}" />
							</tbody>
						</table>
							<div role="tabpanel">
								<!-- Nav tabs -->
								<div class="tabbable-panel">
								<div class="tabbable-line">
									<ul class="nav nav-tabs">
									<li class="active"><a href="#issues"
										aria-controls="home" role="tab" data-toggle="tab">Issues <span
											class="badge">${countIssues}</span>
									</a></li>
										</div>
									</ul>
								</div>
							</div>

								<!-- Tab panes -->
								<div class="tab-content">
									<div role="tabpanel" class="tab-pane active" id="issues">
										<ul id="unstarted1" class="connectedSortable">
											<li class="ui-state-default ui-state-disabled">Unstarted
												Issues (open and unassigned)</li>
											<li class="ui-state-default ui-state-disabled">Drag and
												drop available</li>
											<c:forEach var="issue" items="${issues}">
												<c:if test="${issue.istatement == '000' && issue.uno == ''}">
													<li class="ui-state-default" id="${issue.ino}">${issue.ititle}</li>
												</c:if>
											</c:forEach>
										</ul>

										<ul id="unstarted2" class="connectedSortable">
											<li class="ui-state-default ui-state-disabled">Unstarted
												Issues (open and assigned)</li>
											<li class="ui-state-default ui-state-disabled">Drag and
												drop available</li>
											<c:forEach var="issue" items="${issues}">
												<c:if test="${issue.istatement == '000' && issue.uno != ''}">
													<li class="ui-state-default" id="${issue.ino}">${issue.ititle}</li>
												</c:if>
											</c:forEach>
										</ul>

										<ul id="completed" class="connectedSortable">
											<li class="ui-state-default ui-state-disabled">Completed
												Issues (closed)</li>
											<li class="ui-state-default ui-state-disabled">Drag and
												drop available</li>
											<c:forEach var="issue" items="${issues}">
												<c:if test="${issue.istatement == '001'}">
													<li class="ui-state-default" id="${issue.ino}">${issue.ititle}</li>
												</c:if>
											</c:forEach>
										</ul>
								</div>
								</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</section>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />
<script>
	$(function() {
		$("#unstarted1, #unstarted2, #completed").sortable({
			items : "li:not(.ui-state-disabled)",
			connectWith : ".connectedSortable",
			cursor : "move",
			placeholder : "ui-state-highlight",
			receive : function(event, ui) {
				var item = ui.item.attr("id");
				var place = $(this).attr('id');
				var uno = $('#uno').val();
				$.ajax({
					type : "POST",
					url : '/milestones/ajax',
					data : {
						"item" : item,
						"place" : place,
						"uno" : uno
					}
				});
			}
		}).disableSelection();
	});
	
	// 동적 form으로 mno 넘기기
	$('#goNewIssueByMno').click( function() {
		var $form = $('<form></form>');
		$form.attr('action', '/${uno}/${pno}/issues/new');
		$form.attr('method', 'post');
		//$form.attr('target', 'iFrm');
		$form.appendTo('body');
     
		var mno = $('<input type="hidden" value="${milestone.mno}" name="mno" id="mno">');
		var mtitle = $('<input type="hidden" value="${milestone.mtitle}" name="mtitle" id="mtitle">');
 
		$form.append(mno).append(mtitle);
		$form.submit();
	});
</script>