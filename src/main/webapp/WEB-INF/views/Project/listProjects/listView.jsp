<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header2_header.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header3_menu_dash.jsp" />
<!-- Begin page content -->
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper site-min-height">
		<h3><i class="fa fa-angle-right"></i> Projects</h3>
		<table class="table">
			<tr class="active">
				<td style="width: 500px; text-align: center;">프로젝트</td>
				<td>모집분야</td>
				<td>마감일</td>
				<td>등록일</td>
				<td>담당자</td>
			</tr>
			<c:forEach var="project" items="${list}">
				<tr>
					<td><a href="/DetailProject/${project.pno}">${project.pname}</a><br>
						<c:choose>
							<c:when test="${fn:length(project.pdetail) > 20}">
								<c:out value="${fn:substring(project.pdetail,0,20)}" />....
				</c:when>
							<c:otherwise>
								<c:out value="${project.pdetail}" />
							</c:otherwise>
						</c:choose></td>
					<td>${project.pskill}</td>
					<td>${project.pduedate}</td>
					<td>${project.pregdate}</td>
					<td>${project.uname}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5"></td>
			</tr>

			<!-- 페이징 -->
		</table>
		<div align="center">
			<ul class="pagination">
				<li><a href="list?pageNo=1">처음</a></li>
				<c:if test="${groupNo >1 }">
					<li><a href="#" aria-label="Previous"><span
							aria-hidden="true">&laquo;</span></a></li>
				</c:if>
				<c:forEach var="i" begin="${startPageNo}" end="${endPageNo}">
					<li <c:if test="${pageNo ==i}">class="active"</c:if>><a
						href="list?pageNo=${i}">${i}</a></li>
				</c:forEach>
				<c:if test="${groupNo < totalGroupNo }">
					<li><a href="list?pageNo=${endPageNo+1}" aria-label="Next"><span
							aria-hidden="true">&raquo;</span></a></li>
				</c:if>
				<li><a href="?pageNo=${totalPageNo}">맨끝</a></li>
			</ul>
		</div>
	</section>
</section>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />