<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!-- **********************************************************************************************************************************************************
MAIN SIDEBAR MENU
*********************************************************************************************************************************************************** -->
<!--sidebar start-->
<style>
.align-center { text-align: center; }
</style>
<aside>
	<div id="sidebar" class="nav-collapse ">
		<!-- sidebar menu start-->
		<ul class="sidebar-menu" id="nav-accordion">
			<div class="user-img">
				<div class="img-circle" style="background-color: ${profileBgColor}; width:60px; height:60px; line-height:60px;">
					<span style="font-size: 15px; color: #E8E8E8;">${theFirstLetterOfEmail}</span>
				</div>
			</div>
			<sec:authentication var="user" property="principal" />
			<h5 class="centered">${user.username}</h5>
			<li class="mt"><a href="/"> <i class="fa fa-th"></i> <span>My
						Projects</span>
			</a></li>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')">
				<li class="sub-menu"><a href="/regist"> <i
						class="fa fa-pencil-square-o custom"></i> <span>Regist</span>
				</a></li>
			</sec:authorize>
			<li class="sub-menu"><a href="/search"> <i
					class="fa fa-desktop"></i> <span>Projects</span>
			</a></li>
			<li class="sub-menu"><a href="/milestones/open"> <i
					class="fa fa-dashboard"></i> <span>Milestones</span>
			</a></li>
			<li class="sub-menu"><a href="/issues/open"> <i
					class="fa fa-tasks"></i> <span>Issues</span>
			</a></li>
			<li class="sub-menu"><a href="/profile"> <i
					class="fa fa-cogs"></i> <span>Profile Settings</span>
			</a></li>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<li class="sub-menu"><a href="/admin"> <i
						class="fa fa-cogs"></i> <span>Admin</span>
				</a></li>
			</sec:authorize>
		</ul>
		<!-- sidebar menu end-->
	</div>
</aside>
<!--sidebar end-->