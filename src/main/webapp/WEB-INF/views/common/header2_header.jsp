<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<section id="container" style="">
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
		<a href="/" class="logo"><b>BIDDING</b></a>
		<!--logo end-->
		<div class="nav notify-row" id="top_menu">
			<!--  notification start -->
			<ul class="nav top-menu">
				<!-- settings start -->
				<li class="dropdown" data-toggle="tooltip" data-placement="bottom" title="Your Projects"><a data-toggle="dropdown"
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
						<li><a href="/${project.uno}/${project.pno}">
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
						<li class="external"><a href="/">See All Projects</a></li>
					</ul></li>
				<!-- settings end -->
				<!-- inbox dropdown start-->
				<li id="header_inbox_bar" class="dropdown" data-toggle="tooltip" data-placement="bottom" title="Requested projects"><a
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
									<div style="background-color: ${message.profileBgColor}; width:40px; height:40px; line-height:40px; display:inline-block; float: left; text-align:center;">
										<span style="font-size: 12px; color: #E8E8E8;">${message.theFirstLetterOfEmail}</span>
									</div>
									<div style="float:left; height: 3px; width:3px"></div>
									<div style="float: left;">
								<span class="subject">
									<span class="from">${message.uname}</span>
									<span class="time">${message.regDate}</span>
								</span>
								<span class="message">
								 <c:choose>
						           <c:when test="${fn:length(message.pname) > 2}">
						            <c:out value="${fn:substring(message.pname,0,2)}"/>....
						           </c:when>
						           <c:otherwise>
						            <c:out value="${message.pname}"/>
						           </c:otherwise> 
						          </c:choose>
						          에 참여를 요청하셨습니다.
								</span>
								</div>
							</a></li>
						</c:forEach>
						</c:if>
						<li><a href="/requestProject/requested">See all messages</a></li>
					</ul></li>
				<!-- inbox dropdown end -->
				<!--  
				<li style="color: #fff; font-size: 18px">우리는 N빵을 지향합니다.</li>
				-->
			</ul>
			<!--  notification end -->
		</div>
		<div class="top-menu">
			<!-- <a href="#" data-toggle="tooltip" title="Hooray!">Hover over me</a> -->
			<ul class="nav pull-right top-menu">
					<li><a href="http://redmine.nbreds.com:32/" target="_blank" style="margin-top: 15px;" data-toggle="tooltip" data-placement="bottom" title="Redmine"> <i class="fa fa-calendar-o" aria-hidden="true"></i></a></li>
					<li><a href="http://gitlab.nbreds.com:30" target="_blank" style="margin-top: 15px;" data-toggle="tooltip" data-placement="bottom" title="GitLab"> <i class="fa fa-git" aria-hidden="true"></i></a></li>
					<li><a href="http://192.168.0.7:5000/" target="_blank" style="margin-top: 15px;" data-toggle="tooltip" data-placement="bottom" title="NAS"> <i class="fa fa-hdd-o" aria-hidden="true"></i></a></li>
				<li><a class="logout" href="/logout">Logout</a></li>
			</ul>
		</div>
	</header>
	<!--header end-->