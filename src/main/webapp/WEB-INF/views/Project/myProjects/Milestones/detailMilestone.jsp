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
.ui-state-disabled,
.ui-widget-content .ui-state-disabled,
.ui-widget-header .ui-state-disabled {
	background-color: #2a3f54 !important;
	text-align: center;
	color : #eee
}
#unstarted1, #unstarted2, #completed {
	border: 1px solid #eee;
	width: 330px;
	min-height: 20px;
	list-style-type: none;
	margin: 0px 0px 0px 5px;
	padding: 5px 0 0 0;
	float: left;
}

#unstarted1 li, #unstarted2 li, #completed li {
	margin: 0 5px 5px 5px;
	padding: 8px;
	font-size: 0.9em;
	width: 320px;
	height: 35px;
}
</style>
<!-- Begin page content -->
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
				<p>정말로 이 마일스톤을 Close 하시겠습니까?</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" id="okBtn" class="btn btn-primary"
					data-dismiss="modal">Yes</button>
			</div>
		</div>
	</div>
</div>
<!-- Modal2 -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
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
				<p>정말로 이 마일스톤을 Open 하시겠습니까?</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" id="okBtn2" class="btn btn-primary"
					data-dismiss="modal">Yes</button>
			</div>
		</div>
	</div>
</div>
<!-- Modal3 -->
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog"
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
				<p>정말로 이 마일스톤을 삭제 하시겠습니까?</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" id="okBtn3" class="btn btn-primary"
					data-dismiss="modal">Yes</button>
			</div>
		</div>
	</div>
</div>
<section id="main-content">
	<section class="wrapper site-min-height">
		<h3>
			<i class="fa fa-angle-right"></i> Project #${pno} / Milestone
			#${milestone.mno} / ${milestone.mtitle}
		</h3>
		<div class="col-lg-12">
			<div class="row">
				<div class="col-md-12">
					<div class="content-panel" style="border-radius: 18px 18px 0px 0px; padding: 25px;">
						<table class="table">
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
											<button type="button" id="milestoneCloseBtn" alt="/milestones/closeMilestone/${uno}/${pno}/${milestone.mno}"
												data-toggle="modal" data-target="#myModal"
												class="btn btn-warning">Close Milestone</button>
										</c:if>
										<c:if test="${milestone.mstatement=='001'}">
											<button type="button" id="milestoneOpenBtn" alt="/milestones/reopenMilestone/${uno}/${pno}/${milestone.mno}"
												data-toggle="modal" data-target="#myModal2"
												class="btn btn-default">Reopen Milestone</button>
										</c:if>
										<button type="button" id="milestoneDelBtn" alt="/milestones/remove/${uno}/${pno}/${milestone.mno}"
											data-toggle="modal" data-target="#myModal3"
											class="btn btn-danger">Remove</button>
									</div></td>
							</tr>
							<tr>
								<td>
									<h4>${milestone.mtitle}</h4> ${milestone.mdescription} <c:forEach
										var="file" items="${fileList}">
										<input type="hidden" id="fno" value="${file.fno }">
										<a href="/issue/downloadFile/${file.fno}"
											style="color: #4d94c4"><i class="fa fa-paperclip" aria-hidden="true"></i>${file.originalName }</a> 
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
										<a href="#" class="btn btn-default" id="goNewIssueByMno">New
											Issue</a> <a href="/${uno}/${pno}/issues/open"
											class="btn btn-default">Browse Issue</a>
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
						</table>
					</div>
					<div class="content-panel" style="border-radius: 0px 0px 18px 18px; padding: 25px;">
						<table class="table">
							<tr><td><h4>Issues</h4></td></tr>
							<tr><td>
							<div id="issues">
								<ul id="unstarted1" class="connectedSortable">
									<li class="ui-state-default ui-state-disabled">Unstarted
										Issues (open and unassigned)</li>
									<c:forEach var="issue" items="${issues}">
										<c:if test="${issue.istatement == '000' && issue.uno == ''}">
											<li class="ui-state-default" id="${issue.ino}"><span class="label label-warning label-mini" style="background-color: ${issue.lbgcolor}">${issue.ltitle}</span> ${issue.ititle}</li>
										</c:if>
									</c:forEach>
								</ul>

								<ul id="unstarted2" class="connectedSortable">
									<li class="ui-state-default ui-state-disabled">Unstarted
										Issues (open and assigned)</li>
									<c:forEach var="issue" items="${issues}">
										<c:if test="${issue.istatement == '000' && issue.uno != ''}">
											<li class="ui-state-default" id="${issue.ino}"><span class="label label-warning label-mini" style="background-color: ${issue.lbgcolor}">${issue.ltitle}</span> ${issue.ititle}</li>
										</c:if>
									</c:forEach>
								</ul>

								<ul id="completed" class="connectedSortable">
									<li class="ui-state-default ui-state-disabled">Completed
										Issues (closed)</li>
									<c:forEach var="issue" items="${issues}">
										<c:if test="${issue.istatement == '001'}">
											<li class="ui-state-default" id="${issue.ino}"><span class="label label-warning label-mini" style="background-color: ${issue.lbgcolor}">${issue.ltitle}</span> ${issue.ititle}</li>
										</c:if>
									</c:forEach>
								</ul>
							</div>
							</td></tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
</section>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />
<script>
	$("#okBtn").click(function() {
		location.href = $('#milestoneCloseBtn').attr('alt');
	});
	
	$("#okBtn2").click(function() {
		location.href = $('#milestoneOpenBtn').attr('alt');
	});
	
	$("#okBtn3").click(function() {
		location.href = $('#milestoneDelBtn').attr('alt');
	});


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
		$form.appendTo('body');
	
		var mno = $('<input type="hidden" value="${milestone.mno}" name="mno" id="mno">');
		var mtitle = $('<input type="hidden" value="${milestone.mtitle}" name="mtitle" id="mtitle">');
	
		$form.append(mno).append(mtitle);
		$form.submit();
	});
</script>