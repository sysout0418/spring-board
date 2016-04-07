<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp" />
<div class="container-fluid">
	<div class="row">
		<div id="col">
			<div class="col-sm-2 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li class="active"><a href="/">MyProjects</a></li>
					<li><a href="/regist">Regist</a></li>
					<li><a href="/search">Search</a></li>
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
		<%-- <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<!-- Begin page content -->
			<div style="width: 1200; margin: 0 auto; background-color: #fff">
				<c:if test="${user_no == null}">
					<a href="login/39">39로그인</a>
					<a href="login/40">40로그인</a>
					<a href="login/41">41로그인</a>
				</c:if>
				<c:if test="${user_no != null}">
					<a href="/logout">로그아웃</a>
				</c:if>
			</div>
		</div> --%>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div style="width: 1200; margin: 0 auto; background-color: #fff">
				<%-- <c:choose>
					<c:when test="${user_no != null }">
						<a href="/logout">로그아웃</a>
					</c:when>
					<c:when test="${pageContext.request.userPrincipal.name != null}">
						${pageContext.request.userPrincipal.name}님 반갑습니다.
						<a href="/logout">로그아웃</a>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose> --%>
						<a href="/loginForm">로그인</a>
			</div>
		</div>
		
		<script type="text/javascript">
			
		</script>
		
		<jsp:include
			page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />