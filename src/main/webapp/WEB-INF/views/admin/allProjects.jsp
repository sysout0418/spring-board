<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header_dash.jsp"/>
<!-- Begin page content -->
<div style="width:1200; margin:0 auto; background-color: #fff">
<h4>Projects</h4>
총 프로젝트 수 ${countProjects}명<br>
<form class="form-inline">
<select class="form-control">
  <option>프로젝트명</option>
  <option>담당자</option>
</select>
<input type="text" class="form-control" placeholder="Text input">
<button type="button" class="btn btn-primary">검색</button>
</form>
<form action="/admin/projects/delete" method="post">
<table class="table">
<tr class="active">
	<td><input type="checkbox" value="" id="allCheck"></td>
	<td>프로젝트명</td>
	<td>등록일</td>
	<td>만기일</td>
	<td>담당자</td>
	<td>관리</td>
</tr>
<c:forEach items="${project}" var="project">
<tr>
	<td><input type="checkbox" value="${project.pno}" id="pno" name="pno"></td>
	<td><a href="/${project.uno}/${project.pno}">${project.pname}</a></td>
	<td>${project.pregdate}</td>
	<td>${project.pduedate}</td>
	<td>${project.uname}</td>
	<td><a href="/update?pno=${project.pno}">수정</a></td>
</tr>
</c:forEach>
<tr><td></td></tr>
</table>
<button class="btn btn-primary">선택삭제</button>
</form>
</div>
<script type="text/javascript">
	$(function(){
		$("#allCheck").click(function(){
			if($("#allCheck").prop("checked")) {
				$("input[type=checkbox]").prop("checked",true);
			} else {
				$("input[type=checkbox]").prop("checked",false);
			}
		})
	})
</script>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>