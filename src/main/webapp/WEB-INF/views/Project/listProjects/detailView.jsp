<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<h3><i class="fa fa-angle-right"></i> Detail Project</h3>
		<p class="text-center">
			<span style="font-size: 16px;">${project.pskill}</span><br> <span
				style="font-size: 23px; font-weight: bold;">${project.pname}</span>
		</p>
		<table class="table">
			<tr>
				<td>필요 기술 : ${project.pskill}</td>
				<td>프로젝트 인원 : ${userCnt} 명</td>
				<td>담당자 : ${project.uname}</td>
			</tr>
			<tr>
				<td>진행상황 : ${project.pprogress}</td>
				<td>등록일 : ${project.pregdate}</td>
				<td>모집마감일 : ${project.pduedate}</td>
			</tr>
			<tr>
				<td colspan="3" style="word-break: break-all"><span
					style="font-size: 16px; font-weight: bold;">프로젝트 설명</span> <br>
					${project.pdetail}</td>
			</tr>
			<tr>
				<td colspan="3"></td>
			</tr>
		</table>
		<div align="center">
			<a class="btn btn-default" href="/list" role="button">목록</a>
		</div>
	</section>
</section>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />