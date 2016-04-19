<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header_dash.jsp"/>
<!-- Begin page content -->
<div style="width:1200; margin:0 auto; background-color: #fff">
	<p class="text-center">
		<span style="font-size: 16px;">${project.pskill}</span><br>
		<span style="font-size: 23px; font-weight: bold;">${project.pname}</span>
	</p>
  		<table class="table">
  		<tr>
   		<td>필요 기술 : ${project.pskill}</td>
   		<td>프로젝트 인원 : ${userCnt} 명</td>
   		<td>담당자 : ${project.uname}</td>
  		</tr> 
   	<tr>
   		<td>등록일 : ${project.pregdate}</td>
   		<td>진행상황 : ${project.pprogress}</td>
   		<td>모집마감일 : ${project.pduedate}</td>
   	</tr>
   	<tr>
   		<td colspan="3" style="word-break:break-all">
   			<span style="font-size: 16px; font-weight: bold;">프로젝트 설명</span>
   			<br>
   			${project.pdetail}
   		</td>
   	</tr>
  		<tr><td colspan="3"></td></tr>
	</table>
	<div align="center">
		<a class="btn btn-default" href="/list" role="button">목록</a>
	</div>
</div>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>