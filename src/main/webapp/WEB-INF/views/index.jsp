<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header_dash.jsp"/>
<!-- Begin page content -->
<div style="width:1200; margin:0 auto; background-color: #fff">
<h4>MyProjects</h4>
<table class="table table-striped" style="font-size: 1.0em">
	<tr>
		<td><input type="email" class="form-control" id="exampleInputEmail2" placeholder="Filter by name" style="width:1050px;" onkeydown="filter();"></td>
		<td><a href="/regist" class="btn btn-success" style="width:120px"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;New Project</a></td>
	</tr>
		<c:forEach var="project" items="${list}">
		<tr><td><a href="/${project.uno}/${project.pno}" style="color: #223"><b>${project.uname} / ${project.pname}</b></a><br>
		<c:choose>
			<c:when test="${fn:length(project.pdetail) > 20}">
				<c:out value="${fn:substring(project.pdetail,0,20)}"/>....
			</c:when>
			<c:otherwise>
				<c:out value="${project.pdetail}"/>
			</c:otherwise>
		</c:choose>
		</td><td></td></tr>
		</c:forEach>
	<tr><td></td><td></td></tr>
</table>
</div>
<script type="text/javascript">
function filter(){
	console.log("assd");
}
</script>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>