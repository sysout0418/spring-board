<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header_dash.jsp"/>
<!-- Begin page content -->
<div style="width:1200; margin:0 auto; background-color: #fff">
<h4>Projects</h4>
총 프로젝트 수 ${countProjects}명<br>
<form class="form-inline" action="/admin/projects/search" method="get">
<select class="form-control" id="group" name="group">
  <option>프로젝트명</option>
  <option>담당자</option>
</select>
<input type="text" class="form-control" id="item" name="item">
<button type="submit" class="btn btn-primary">검색</button>
</form>
<form action="/admin/projects/delete" method="post">
<table class="table">
<tr class="active">
	<td><input type="checkbox" id="allCheck"></td>
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
<tr><td><button class="btn btn-primary">선택삭제</button></td></tr>
</table>
<div align="center">
	<ul class="pagination">
  		<li><a href="list?pageNo=1">처음</a></li>
  		<c:if test="${groupNo >1 }">
		<li><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
		</c:if>
		<c:forEach var="i" begin="${startPageNo}" end = "${endPageNo}">
			<li <c:if test="${pageNo ==i}">class="active"</c:if>><a href="list?pageNo=${i}">${i}</a></li>
		</c:forEach>
		<c:if test="${groupNo < totalGroupNo }">
			<li><a href="list?pageNo=${endPageNo+1}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
		</c:if>
		<li><a href="?pageNo=${totalPageNo}">맨끝</a></li>
  	</ul>
</div>
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