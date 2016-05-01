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

			<p class="centered">
				<a href="#"> <%-- <img src="<c:url value="/resources/img/ui-sam.jpg" />" class="img-circle" width="60"> --%>
					<canvas id="cv" width="60" height="60"></canvas>
					<canvas id="cv2" width="60" height="60" style="position: absolute; left: 75px; text-align: center;"></canvas>
				</a>
			</p>
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
					class="fa fa-desktop"></i> <span>Search</span>
			</a></li>
			<li class="sub-menu"><a href="/list"> <i class="fa fa-book"></i>
					<span>Projects</span>
			</a></li>
			<li class="sub-menu"><a href="/milestones/open"> <i
					class="fa fa-dashboard"></i> <span>Milestones</span>
			</a></li>
			<li class="sub-menu"><a href="/issues/open"> <i
					class="fa fa-tasks"></i> <span>Issues</span>
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
<script type="text/javascript">
	var canvas = document.getElementById("cv");	//canvas의 DOM 객체를 얻는다
	var context = canvas.getContext("2d"); //DOM 객체로부터 2D 컨텍스트를 얻는다
	context.beginPath(); //패스 그리기 시작    
	context.arc(30, 30, 30, 0, 2*Math.PI, true); //원 그리기  
	context.fillStyle = "${profileBgColor}";
	context.fill();
	
	var canvas2 = document.getElementById("cv2");	//canvas의 DOM 객체를 얻는다
	var context2 = canvas2.getContext("2d"); //DOM 객체로부터 2D 컨텍스트를 얻는다
	var msg = "${theFirstLetterOfEmail}"; // 텍스트
	context2.font = "15px sans-serif"; // 폰트 크기 및 글자체
	context2.textAlign = "center";
	context2.textBaseline = "middle";
	//context2.strokeStyle = "white";
	//context2.strokeText(msg, 12, 45); // 텍스트 윤곽만 그리기
	context2.fillStyle = "#E8E8E8";
	context2.fillText(msg, canvas2.width/2, canvas2.height/2); // 텍스트 채우기
</script>