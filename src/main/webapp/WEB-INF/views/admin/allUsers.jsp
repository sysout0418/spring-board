<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header_dash.jsp"/>
<!-- Begin page content -->
<div style="width:1200; margin:0 auto; background-color: #fff">
<h4>Admin</h4>
신규 가입회원<br>
총 회원수 0명
<table class="table">
<tr class="active">
	<td>name</td>
	<td>phone number</td>
	<td>department</td>
	<td>uemail</td>
</tr>
</table>
<button type="button" class="btn btn-primary">회원 전체보기</button>
<br><br>
신규 프로젝트<br>
<table class="table">
<tr class="active">
	<td>프로젝트명</td>
	<td>등록일</td>
	<td>만기일</td>
	<td>담당자</td>
</tr>
</table>
<button type="button" class="btn btn-primary">프로젝트 전체보기</button>
</div>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>