<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp"/>
<jsp:useBean id="pageBean" class="com.nbreds.projectPlanning.common.util.PageBean" scope="request" />
<div class="container-fluid">
<div class="row">
<div id="col">
<div class="col-sm-2 col-md-2 sidebar">
	<ul class="nav nav-sidebar">
		<li><a href="/">MyProjects</a></li>
	    <li><a href="/regist">Regist</a></li>
	    <li class="active"><a href="/search">Search<span class="sr-only">(current)</span></a></li>
	    <li><a href="/list">Projects</a></li>
	</ul>
	<ul class="nav nav-sidebar">
		<li><a href="/milestones/open">Milestones</a></li>
	    <li><a href="/issues/open">Issues</a></li>
	</ul>
	<ul class="nav nav-sidebar">
	    <li><a href="">Profile Settings</a></li>
	</ul>
</div>
</div>

<form:form commandName="project" name="search" id="search" method="POST">
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<!-- Begin page content -->
	<div style="width:1200; height:1200; margin:0 auto; background-color: #fff">
	<div id="search" style="float: left">
		<h4>Search</h4>
		<input type="hidden" name="pageNo" id="pageNo" value="${pageBean.pageNo}" />
		<table class="table">
		<tr>
			<td style="width:230px; text-align: center; vertical-align: middle;" class="active">개발분야</td>
			<td colspan="3"><form:checkboxes path="pdevelopment" items="${development}" itemValue="CODE" itemLabel="CODE_NAME" cssStyle="margin-left : 2px"/></td>
		</tr>
		<tr>
			<td style="width:230px; text-align: center; vertical-align: middle;"  class="active">디자인/퍼블리싱 분야</td>
			<td colspan="3"><form:checkboxes path="pdesign" items="${design}" itemValue="CODE" itemLabel="CODE_NAME" cssStyle="margin : 2px"/></td>
		</tr>
		<tr>
			<td style="width:230px; text-align: center; vertical-align: middle;"  class="active">기획/컨설턴트 분야</td>
			<td colspan="3"><form:checkboxes path="pplanning" items="${planning}" itemValue="CODE" itemLabel="CODE_NAME" cssStyle="margin : 2px"/></td>
		</tr>
		<tr>
			<td style="width:230px; text-align: center; vertical-align: middle;"  class="active">전문분야/특별경험</td>
			<td colspan="3"><form:checkboxes path="pexperience" items="${experience}" itemValue="CODE" itemLabel="CODE_NAME" cssStyle="margin : 2px"/></td>
		</tr>
		<tr>
			<td style="width:230px; text-align: center; vertical-align: middle;"  class="active">등급</td>
			<td style="width:300px"><form:checkboxes path="plevel" items="${level}" itemValue="CODE" itemLabel="CODE_NAME" cssStyle="margin : 2px"/></td>
			<td></td>
			<td></td>
		</tr>
		<tr><td colspan="4"></td></tr>
		</table>
		<div align="center">
			<!-- <input type="submit" class="btn btn-success" value="Search"> -->
			<a href="javascript:pagelist(1)" class="btn btn-success">Search</a>
		</div>
	</div>
	<div id="searchResult">
		<table class="table">
		<tr class="active">
			<td style="width:500px; text-align: center;">프로젝트</td>
		   	<td>등급</td>
		   	<td>모집분야</td>
		   	<td>마감일</td>
		   	<td>담당자</td>
		</tr>
	   	<c:forEach var="project" items="${list}">
	    <tr>
		    <td>
			    <a href="/DetailProject/${project.pno}">${project.pname}</a><br>
				<c:choose>
					<c:when test="${fn:length(project.pdetail) > 20}">
						<c:out value="${fn:substring(project.pdetail,0,20)}"/>....
					</c:when>
					<c:otherwise>
						<c:out value="${project.pdetail}"/>
					</c:otherwise>
				</c:choose>
		  	</td>
  			<td>${project.plevel["0"]}</td>
  			<td>${project.pskill}</td>
  			<td>${project.pduedate}</td>
  			<td>${project.uname}</td>
  		</tr>
	  	</c:forEach>
		<tr><td colspan="5"></td></tr>
	</table>
	
	<!-- 페이징 -->
	<div align="center">
		${pageBean.pagelink}
		<%-- <ul class="pagination">
	  		<li><a href="search?pageNo=1">처음</a></li>
	  		<c:if test="${groupNo >1 }">
	    	<li><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
	   		</c:if>
		    <c:forEach var="i" begin="${startPageNo}" end = "${endPageNo}">
		    <li <c:if test="${pageNo ==i}">class="active"</c:if>><a href="search?pageNo=${i}">${i}</a></li>
		    </c:forEach>
	    	<c:if test="${groupNo < totalGroupNo }">
	    	<li><a href="search?pageNo=${endPageNo+1}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
	    	</c:if>
	    	<li><a href="?pageNo=${totalPageNo}">맨끝</a></li>
	  	</ul> --%>
	</div>
</div>
</div>
</div>
</form:form>
<script type="text/javascript">
function pagelist(page) {
	$("#pageNo").val(page);
	$("#search").get(0).action = "/search";
	$("#search").get(0).submit();
}
</script>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>