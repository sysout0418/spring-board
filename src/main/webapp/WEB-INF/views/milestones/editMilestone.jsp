<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp"/>
<div class="container-fluid">
<div class="row"><div id="col">
<div class="col-sm-2 col-md-2 sidebar">
   	<ul class="nav nav-sidebar" style="height: 30px; text-align: center;">
    	<li><a href="/">Go to DashBoard</a></li>
  	</ul>
    <ul class="nav nav-sidebar">
		<li><a href="/${uno}/${pno}">Project</a></li>
	</ul>
	<ul class="nav nav-sidebar">
		<li class="active"><a href="/${uno}/${pno}/milestones/open">Milestones</a></li>
	    <li><a href="/${uno}/${pno}/issues/open">Issues</a></li>
	    <li><a href="/${uno}/${pno}/labels">Labels</a></li>
	</ul>
 	<ul class="nav nav-sidebar">
    	<li><a href="">Settings</a></li>
    </ul>
</div></div>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<!-- Begin page content -->
	<div style="width:1200; margin:0 auto; background-color: #fff">
	    <h4>Edit Milestone</h4>  	
		<form:form method="post" action="/milestones/edit" commandName="milestones" enctype="multipart/form-data">
		<table class="table">
			<tr>
				<td>Title</td>
				<td><form:input path="mtitle" cssClass="form-control"/></td>
				<td rowspan="2">Due Date</td>
				<td rowspan="2"><form:hidden path="mduedate" id="date"/><div id="datepicker"></div></td>
			</tr>
			<tr>
				<td style="border-color: #fff">Description</td>
				<td style="border-color: #fff"><form:textarea path="mdescription" rows="8" cssClass="form-control"/>
					<c:forEach var="file" items="${fileList}" varStatus="var">
						<p>
							<input type="hidden" id="fno" name="fno" value="${file.fno}">
							<a href="#this" id="name_${file.fno}" name="name_${file.fno}">${file.originalName}</a>
							<input type="file" id="file_${file.fno}"
								name="file_${file.fno}"> (${file.fileSize}kb) <a
								href="#this" class="btn" id="delete_${file.fno}"
								name="delete_${file.fno}">삭제</a>
						</p>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="background-color : #faf9f9"><input class="btn btn-success" type="submit" value="Save changes"></td>
			</tr>
			<tr><td colspan="4"><form:hidden path="mno"/><input type="hidden" value="${uno}" name="uno"/><input type="hidden" value="${pno}" name="pno"/></td></tr>
		</table>
		</form:form>
	</div>
 </div>
 <script>
$(function() {
  $( "#datepicker" ).datepicker({
	 altField: "#datepicker",
	 onSelect: function(date){
		 $('#date').val(date);
	 }
  });
});

$(function(){
	var date = $('#date').val();
	console.log(date);
	$( "#datepicker" ).datepicker( "setDate", date);
});
</script>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>