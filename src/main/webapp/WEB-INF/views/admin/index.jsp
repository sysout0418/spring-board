<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header2_header.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header3_menu_dash.jsp" />

<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper site-min-height">
   		<h3><i class="fa fa-angle-right"></i> Admin</h3>
    		<div class="col-lg-12">
    			<div class="row">
            		<div class="col-md-12">
                		<div class="content-panel">
				<h4><i class="fa fa-angle-right"></i>신규 가입회원</h4>
				&nbsp;총 회원 수 ${countUsers}명
				<hr>
				<table class="table table-hover">
				<thead>
				<tr>
					<th>#</th>
					<th>이름</th>
					<th>휴대폰 번호</th>
					<th>부서</th>
					<th>이메일</th>
					<th>가입일</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${user}" var="user">
				<tr>
					<td>#</td>
					<td>${user.uname}</td>
					<td>${user.uphoneno}</td>
					<td>${user.udepartmentName}</td>
					<td>${user.uemail}</td>
					<td>${user.uregdate}</td>
				</tr>
				</c:forEach>
				</tbody>
				</table>
				&nbsp;<a class="btn btn-theme03" href="/admin/users" role="button">View all users</a>
				 </div><!-- /content-panel -->
				 </div><!-- /col-md-12 -->
				 <div class="col-md-12 mt">
				 <div class="content-panel">
				 <h4><i class="fa fa-angle-right"></i> 신규 프로젝트</h4>
				  &nbsp;총 프로젝트 수 ${countProjects}개				
				 <hr>
				<table class="table table-hover">
				<thead>
				<tr>
					<th>#</th>
					<th>프로젝트명</th>
					<th>등록일</th>
					<th>만기일</th>
					<th>담당자</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${project}" var="project">
				<tr>
					<td>#</td>
					<td>${project.pname}</td>
					<td>${project.pregdate}</td>
					<td>${project.pduedate}</td>
					<td>${project.uname}</td>
				</tr>
				</c:forEach>
				</tbody>
				</table>
				&nbsp;<a class="btn btn-theme03" href="/admin/projects" role="button">View all projects</a>
				 </div><!-- /content-panel -->
             </div><!-- /col-md-12 -->
         </div><!-- /row -->
      </div>		
</section><! --/wrapper -->
</section><!-- /MAIN CONTENT -->

<!--main content end-->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />