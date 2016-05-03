<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header2_header.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header3_menu_project.jsp" />
<!-- Begin page content -->
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper site-min-height">
		<h3>
			<i class="fa fa-angle-right"></i> New Milestones
		</h3>
		<form:form method="post" action="/milestones/regist"
			commandName="milestone" enctype="multipart/form-data">
			<table class="table">
				<tr>
					<td>Title</td>
					<td><form:input path="mtitle" cssClass="form-control"
							maxlength="50" required="required"/></td>
					<td rowspan="2">Due Date</td>
					<td rowspan="2"><div id="datepicker">
							<form:hidden path="mduedate" id="date" required="required"/>
						</div></td>
				</tr>
				<tr>
					<td style="border-color: #fff">Description</td>
					<td style="border-color: #fff"><form:textarea
							path="mdescription" rows="8" cssClass="form-control" required="required"/> <!-- File Upload -->
						<label class="control-label">Select File</label> <input
						id="input-1a" type="file" name="file" class="file"
						data-show-preview="false" data-show-upload="false"> <!-- // File Upload -->
					</td>
				</tr>
				<tr>
					<td colspan="4"><input class="btn btn-success" type="submit"
						value="Create milestone"></td>
				</tr>
				<tr>
					<td colspan="4"><input type="hidden" value="${uno}" name="uno" /><input
						type="hidden" value="${pno}" name="pno" /></td>
				</tr>
			</table>
		</form:form>
	</section>
</section>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />
<script>
	$(function() {
		$("#datepicker").datepicker({
			altField : "#date",
			altFormat : "mm/dd/yy",
			minDate : 0
		});
	});

	/* $('#fine-uploader-manual-trigger').fineUploader({
	 template: 'qq-template-manual-trigger',
	 request: {
	 endpoint: '/uploadFiles/milestone/${uno}',
	 // inputName: "fileup" + count
	 },
	 thumbnails: {
	 placeholders: {
	 waitingPath: '/resources/img/waiting-generic.png',
	 notAvailablePath: '/resources/img/not_available-generic.png'
	 }
	 },
	 autoUpload: true,
	 }); */

	/* $('#fine-uploader-manual-trigger').fineUploader({
	 template: 'qq-template-manual-trigger',
	 request: {
	 endpoint: '/uploadFiles/milestone/${uno}'
	 },
	 thumbnails: {
	 placeholders: {
	 waitingPath: '/resources/img/waiting-generic.png',
	 notAvailablePath: '/resources/img/not_available-generic.png'
	 }
	 },
	 validation: {
	 itemLimit: 1,
	 sizeLimit: 10240000
	 // 10mb = 10 * 1024 bytes
	 }
	 }); */
</script>