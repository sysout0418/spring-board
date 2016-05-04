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
			<i class="fa fa-angle-right"></i> Edit Milestone
		</h3>
		<div class="col-lg-12">
			<div class="row">
				<div class="col-md-12">
					<div class="content-panel">
		<form:form method="post" action="/milestones/edit"
			commandName="milestones" enctype="multipart/form-data">
			<table class="table">
				<tr>
					<td>Title</td>
					<td><form:input path="mtitle" cssClass="form-control"
							maxlength="50" /></td>
					<td rowspan="2">Due Date</td>
					<td rowspan="2"><form:hidden path="mduedate" id="date" />
						<div id="datepicker"></div></td>
				</tr>
				<tr>
					<td style="border-color: #fff">Description</td>
					<td style="border-color: #fff"><form:textarea
							path="mdescription" rows="8" cssClass="form-control" /> 
						<c:choose>
							<c:when test="${!empty fileList}">
								<c:forEach var="file" items="${fileList}" varStatus="var">
									<p>
										<input type="hidden" id="fno" name="fno" value="${file.fno}">
										<a href="#this" id="name_${file.fno}" name="name_${file.fno}"><i class="fa fa-paperclip" aria-hidden="true"></i>${file.originalName}</a>
										(${file.fileSize}kb) <a href="#this" class="btn"
											id="delete_${file.fno}" name="delete_${file.fno}">삭제</a>
										<input type="file" id="file_${file.fno}" name="file_${file.fno}">
									</p>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<span class="help-block">파일 첨부는 최대 1개 입니다.</span>
								<!-- File Upload -->
								<label class="control-label">Select File</label>
								<input id="input-1a" type="file" name="file" class="file" data-show-preview="false" data-show-upload="false">
								<!-- // File Upload -->
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td colspan="4" style="background-color: #faf9f9"><input
						class="btn btn-success" type="submit" value="Save changes"></td>
				</tr>
				<tr>
					<td colspan="4"><form:hidden path="mno" /><input type="hidden"
						value="${uno}" name="uno" /><input type="hidden" value="${pno}"
						name="pno" /></td>
				</tr>
			</table>
		</form:form>
		</div>
		</div>
		</div>
		</div>
	</section>
</section>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />
<script>
	$(function() {
		$("#datepicker").datepicker({
			altField : "#datepicker",
			minDate : 0,
			onSelect : function(date) {
				$('#date').val(date);
			}
		});
	});

	$(function() {
		var date = $('#date').val();
		console.log(date);
		$("#datepicker").datepicker("setDate", date);
	});

	$(document).ready(function() {
		$("a[name^='delete']").on("click", function(e) { //삭제 버튼
			e.preventDefault();
			$(this).parent().remove();
		});
	});
</script>