<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header_project.jsp"/>
<!-- Begin page content -->
<div style="width:1200; margin:0 auto; background-color: #fff">
    <h4>New Milestones</h4>  	
	<form:form method="post" action="/milestones/regist" commandName="milestone" enctype="multipart/form-data">
	<table class="table">
		<tr>
			<td>Title</td>
			<td><form:input path="mtitle" cssClass="form-control"/></td>
			<td rowspan="2">Due Date</td>
			<td rowspan="2"><div id="datepicker"><form:hidden path="mduedate" id="date"/></div></td>
		</tr>
		<tr>
			<td style="border-color: #fff">Description</td>
			<td style="border-color: #fff"><form:textarea path="mdescription" rows="8" cssClass="form-control"/><input type="file" name="file" multiple="multiple"/></td>
		</tr>
		<tr>
			<td colspan="4"><input class="btn btn-success" type="submit" value="Create milestone"></td>
		</tr>
		<tr><td colspan="4"><input type="hidden" value="${uno}" name="uno"/><input type="hidden" value="${pno}" name="pno"/></td></tr>
	</table>
	</form:form>
</div>
 <script>
$(function() {
  $( "#datepicker" ).datepicker({
	 altField: "#date",
	 altFormat : "mm/dd/yy"
  });
});
</script>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>