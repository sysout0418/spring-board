<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!-- **********************************************************************************************************************************************************
MAIN SIDEBAR MENU
*********************************************************************************************************************************************************** -->
<!--sidebar start-->
<aside>
	<div id="sidebar" class="nav-collapse ">
		<!-- sidebar menu start-->
		<ul class="sidebar-menu" id="nav-accordion">
			<p class="centered">
				<a href="#">
					<%-- <img src="<c:url value="/resources/img/ui-sam.jpg" />" class="img-circle" width="60"> --%>
					<canvas id="cv" width="60" height="60"></canvas>
					<canvas id="cv2" width="60" height="60" style="position: absolute; left: 75px;"></canvas>
				</a>
			</p>
			<sec:authentication var="user" property="principal" />
			<h5 class="centered">${user.username}</h5>
			<li class="mt">
				<center>
					<a href="/"> <span>Go to dashBoard</span>
					</a>
				</center>
			</li>
			<li class="sub-menu"><a href="/${uno}/${pno}"> <i
					class="fa fa-th"></i> <span>Project</span>
			</a></li>
			<li class="sub-menu"><a href="/${uno}/${pno}/milestones/open"">
					<i class="fa fa-dashboard"></i> <span>Milestones</span>
			</a></li>
			<li class="sub-menu"><a href="/${uno}/${pno}/issues/open"> <i
					class="fa fa-tasks"></i> <span>Issues</span>
			</a></li>
		</ul>
		<!-- sidebar menu end-->
	</div>
</aside>
<!--sidebar end-->