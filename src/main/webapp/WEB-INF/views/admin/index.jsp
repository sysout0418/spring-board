<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header_dash.jsp"/>
<!-- Begin page content -->
<div style="width:1200; margin:0 auto; background-color: #fff">
<h4>Admin</h4>
신규 가입회원<br>
총 회원 수 ${countUsers}명
<table class="table">
<tr class="active">
	<td>name</td>
	<td>phone number</td>
	<td>department</td>
	<td>email</td>
	<td>regdate</td>
</tr>
<c:forEach items="${user}" var="user">
<tr>
	<td>${user.uname}</td>
	<td>${user.uphoneno}</td>
	<td>${user.udepartment}</td>
	<td>${user.uemail}</td>
	<td>${user.uregdate}</td>
</tr>
</c:forEach>
<tr><td></td></tr>
</table>
<a class="btn btn-primary" href="/admin/users" role="button">회원 전체보기</a>
<br><br>
신규 프로젝트<br>
총 프로젝트 수 ${countProjects}명
<table class="table">
<tr class="active">
	<td>프로젝트명</td>
	<td>등록일</td>
	<td>만기일</td>
	<td>담당자</td>
</tr>
<c:forEach items="${project}" var="project">
<tr>
	<td>${project.pname}</td>
	<td>${project.pregdate}</td>
	<td>${project.pduedate}</td>
	<td>${project.uname}</td>
</tr>
</c:forEach>
<tr><td></td></tr>
</table>
<a class="btn btn-primary" href="/admin/projects" role="button">프로젝트 전체보기</a>
</div>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>