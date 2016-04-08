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
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div style="width: 1200; margin: 0 auto; background-color: #fff">
			</div>
		</div>
		
		<script type="text/javascript">
			
		</script>
		
		<jsp:include
			page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />