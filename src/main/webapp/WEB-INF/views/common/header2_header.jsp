<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section id="container">
	<!-- **********************************************************************************************************************************************************
TOP BAR CONTENT & NOTIFICATIONS
*********************************************************************************************************************************************************** -->
	<!--header start-->
	<header class="header black-bg">
		<div class="sidebar-toggle-box">
			<div class="fa fa-bars tooltips" data-placement="right"
				data-original-title="Toggle Navigation"></div>
		</div>
		<!--logo start-->
		<a href="/" class="logo"><b>DASHBOARD</b></a>
		<!--logo end-->
		<div class="nav notify-row" id="top_menu">
			<!--  notification start -->
			<ul class="nav top-menu">
				<!-- settings start -->
				<li class="dropdown"><a data-toggle="dropdown"
					class="dropdown-toggle" href="#"> <i class="fa fa-tasks"></i>
				</a>
					<ul class="dropdown-menu extended tasks-bar">
						<div class="notify-arrow notify-arrow-green"></div>
						<li>
							<p class="green">Your projects</p>
						</li>
						<c:if test="${projects == 'none'}">
						<li style="text-align: center;"><a href="#"><span class="subject"> <span class="from">No milestones to show</span></span></a></li>
						</c:if>
						<c:if test="${projects != 'none'}">
						<c:forEach var="project" items="${projects}">
						<li><a href="index.html#">
								<div class="task-info">
									<div class="desc">${project.pname}</div>
									<div class="percent">${project.completeIssuePercent}%</div>
								</div>
								<div class="progress progress-striped">
									<div class="progress-bar progress-bar-success"
										role="progressbar" aria-valuenow="40" aria-valuemin="0"
										aria-valuemax="100" style="width: ${project.completeIssuePercent}%">
										<span class="sr-only">${project.completeIssuePercent}% Complete (success)</span>
									</div>
								</div>
						</a></li>
						</c:forEach>
						</c:if>
						<li class="external"><a href="/milestones/open">See All Tasks</a></li>
					</ul></li>
				<!-- settings end -->
				<!-- inbox dropdown start-->
				<li id="header_inbox_bar" class="dropdown"><a
					data-toggle="dropdown" class="dropdown-toggle" href="#"> <i
						class="fa fa-envelope-o"></i> <c:if test="${req > 0}">
							<span class="badge bg-theme">${req}</span>
						</c:if>
				</a>
					<ul class="dropdown-menu extended inbox">
						<div class="notify-arrow notify-arrow-green"></div>
						<li>
							<p class="green">You have ${req} new messages</p>
						</li>
						<c:if test="${message == 'none'}">
						<li style="text-align: center;"><a href="#"><span class="subject"> <span class="from">No requests to show</span></span></a></li>
						</c:if>
						<c:if test="${message != 'none'}">
						<c:forEach var="message" items="${message}">
						<li>
							<a href="/requestProject/requested">
								<span class="photo"><img alt="avatar" src="<c:url value="/resources/img/ui-sam.jpg" />"></span>
								<span class="subject">
									<span class="from">${message.uname}</span>
									<span class="time">${message.regDate}</span>
								</span>
								<span class="message">${message.pname}에 참여를 요청하셨습니다.</span>
							</a></li>
						</c:forEach>
						</c:if>
						<li><a href="/requestProject/requested">See all messages</a></li>
					</ul></li>
				<!-- inbox dropdown end -->
			</ul>
			<!--  notification end -->
		</div>
		<div class="top-menu">
			<ul class="nav pull-right top-menu">
				<li><a class="logout" href="/logout">Logout</a></li>
			</ul>
		</div>
	</header>
	<!--header end-->