<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp"/>
<div class="container-fluid">
<div class="row">
<div id="col">
<div class="col-sm-2 col-md-2 sidebar">
   	<ul class="nav nav-sidebar" style="height: 30px; text-align: center;">
    	<li><a href="/">Go to DashBoard</a></li>
  	</ul>
    <ul class="nav nav-sidebar">
		<li class="active"><a href="/${uno}/${pno}">Project<span class="sr-only">(current)</span></a></li>
	</ul>
	<ul class="nav nav-sidebar">
		<li><a href="/${uno}/${pno}/milestones/open">Milestones</a></li>
	    <li><a href="/${uno}/${pno}/issues/open">Issues</a></li>
	   	<li><a href="/${uno}/${pno}/labels">Labels</a></li>
	</ul>
 	<ul class="nav nav-sidebar">
    	<li><a href="">Settings</a></li>
    </ul>
</div>
</div>
      
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
<!-- Begin page content -->
<div style="width:1200; margin:0 auto; background-color: #fff">
	<p class="text-center">
		<span style="font-size: 16px;">${project.pskill}</span><br>
		<span style="font-size: 23px; font-weight: bold;">${project.pname}</span>
	</p>
  		<table class="table">
  		<tr>
   		<td>필요 기술 : ${project.pskill}</td>
   		<td>프로젝트 인원 : ${project.pmember}</td>
   		<td>담당자 : ${project.uname}</td>
  		</tr> 
   	<tr>
   		<td>난이도 : ${project.plevel["0"]}</td>
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
		<a class="btn btn-default" href="/update?pno=${project.pno}" role="button">수정</a>
		<a class="btn btn-default" href="/DeleteProject?pno=${project.pno}" role="button">삭제</a>
	</div>
</div>
</div>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>