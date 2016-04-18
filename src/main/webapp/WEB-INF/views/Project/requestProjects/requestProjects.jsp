<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header_dash.jsp" />
<!-- Begin page content -->
<div style="width: 1200; margin: 0 auto; background-color: #fff">
	<h4>Request Project</h4>
	<div role="tabpanel">
	<!-- Nav tabs -->
	<ul class="nav nav-tabs" role="tablist">
		<li role="presentation"<c:if test="${stat=='requested'}"> class="active"</c:if>><a href="/requestProject/requested">Requested</a></li>
		<li role="presentation"<c:if test="${stat=='accepted'}"> class="active"</c:if>><a href="/requestProject/accepted">Accepted</a></li>
		<li role="presentation"<c:if test="${stat=='declined'}"> class="active"</c:if>><a href="/requestProject/declined">Declined</a></li>
	</ul>
	</div>
	<table class="table" style="font-size: 1.0em">
	<c:forEach var="project" items="${list}">
	<tr>
		<td><a href="/${project.uno}/${project.pno}" style="color: #223"><b>${project.uname} / ${project.pname}</b></a><br></td>
		<td style="text-align: right;">
		<c:if test="${stat=='requested' || stat=='declined'}">
			<a href="/updateStat/${project.pno}/001" class="btn btn-primary">Accept</a>
		</c:if>
		<c:if test="${stat=='requested' || stat=='accepted'}">
			<a href="/updateStat/${project.pno}/002" class="btn btn-default">Decline</a>
		</c:if>
		</td>
	</tr>
	</c:forEach>
	<tr><td></td><td></td></tr>
</table>
</div>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />