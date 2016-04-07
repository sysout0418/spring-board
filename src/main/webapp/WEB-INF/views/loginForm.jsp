<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp" />
<%
	Cookie[] cookies = request.getCookies();
	String uemail = null;
	if (cookies != null) {
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals("rememberId")) {
				uemail = cookie.getValue();
			}
		}
	}
	String checked = uemail == null? "" : "checked='checked'";
	uemail = uemail == null? "" : uemail;
%>
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
		<div class="container" style="width: 300px;">
			<c:url value="/login" var="login" />
			<form:form action="${login}" method="post">
				<h2 class="form-signin-heading">Please sign in</h2>
				<label for="inputEmail" class="sr-only">Email address</label> <input
					type="text" id="uemail" name="uemail" class="form-control"
					placeholder="Email address" required="" autofocus="" value="<%= uemail %>"> <label
					for="inputPassword" class="sr-only">Password</label> <input
					type="password" id="upassword" name="upassword" class="form-control"
					placeholder="Password" required="">
				<div class="checkbox">
					<label><input type="checkbox" id="rememberId" name="rememberId" value="t" <%= checked %>>
						Remember me
					</label>
				</div>
				<input type="submit" id="submit" name="submit" class="btn btn-primary" value="Login">
				<a href="/join" class="btn btn-success">Join Us</a>
			</form:form>
		</div>
		
		<script type="text/javascript">
			
		</script>
		
		<jsp:include
			page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />