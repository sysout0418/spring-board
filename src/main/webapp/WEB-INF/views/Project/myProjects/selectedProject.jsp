<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header2_header.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header3_menu_project.jsp" />
<style>
.desc>.details {
	margin-left: 20px;
}

#reconfirmBtn {
	position: absolute;
	right: 30px;
}

#li-hover:hover {
	background: #f2f2f2;
}
</style>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true"
	style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">Warning</h4>
			</div>
			<div class="modal-body">
				<p>정말로 이 프로젝트를 삭제 하시겠습니까?</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" id="okBtn" class="btn btn-primary"
					data-dismiss="modal">Yes</button>
			</div>
		</div>
	</div>
</div>
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-9 main-chart">
				<h3>
					<i class="fa fa-angle-right"></i> Project #${pno} /
					${project.pname}
				</h3>
				<div class="row">
					<div class="col-md-4 col-sm-4 mb">
						<div class="grey-panel pn donut-chart">
							<div class="grey-header">
								<h5>PROGRESS BAR</h5>
							</div>
							<canvas id="serverstatus01" height="120" width="120"
								style="width: 120px; height: 120px;"></canvas>
							<script>
									var doughnutData = [
											{
												value: ${project.completeIssuePercent},
												color:"#FF6B6B"
											},
											{
												value : 100-${project.completeIssuePercent},
												color : "#fdfdfd"
											}
										];
										var myDoughnut = new Chart(document.getElementById("serverstatus01").getContext("2d")).Doughnut(doughnutData);
								</script>
							<div class="row">
								<div class="col-sm-6 col-xs-6 goleft">
									<p>
										Project<br>Progress:
									</p>
								</div>
								<div class="col-sm-6 col-xs-6">
									<h2>${project.completeIssuePercent}%</h2>
								</div>
							</div>
						</div>
						<!-- --/grey-panel ---->
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4 mb">
						<!-- INSTAGRAM PANEL -->
						<div class="instagram-panel pn">
							<i class="fa fa-tasks fa-4x"></i>
							<p>${project.pname}<br> Created ${project.pregdate}
							</p>
							<p>
								<i class="fa fa-dashboard"></i> ${countAllMilestone} | <i
									class="fa fa-tasks"></i> ${countAllIssue}
							</p>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4 mb">
						<!-- WHITE PANEL - TOP USER -->
						<div class="white-panel pn">
							<div class="white-header">
								<h5>PROJECT MANAGER</h5>
							</div>
							<div class="user-img">
								<div class="img-circle"
									style="background-color: ${project.profileBgColor}; width:80px; height:80px; line-height:80px;">
									<span style="font-size: 15px; color: #E8E8E8;">${project.theFirstLetterOfEmail}</span>
								</div>
							</div>
							<div>
								<div style="height: 10px"></div>
								<b>${project.uname}</b><br />
								<div style="height: 5px"></div>
								<b>${project.udepartment}</b>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="content-panel"
							style="overflow: scroll; overflow-x: hidden; height: 800px; padding: 10px;">
							<h4>
								<i class="fa fa-angle-right"></i> Timeline
							</h4>
							<hr>
							<ul class="timeline">
								<c:set var="i" value="0" />
								<c:forEach var="activity" items="${activity}">
									<!-- onclick="location.href='/DetailProject/${project.pno}'" style="cursor: pointer;" -->
									<li id="li-hover"
										<c:if test='${i==0}'> class='timeline-inverted'</c:if> 
										<c:choose>
											<c:when test='${activity.tableName == "Issue"}'> 
												onclick="location.href='/${activity.uno}/${pno}/issue/${activity.identificationNo}'"
											</c:when>
											<c:when test='${activity.tableName == "Milestone"}'> 
												onclick="location.href='/${activity.uno}/${pno}/milestone/${activity.identificationNo}'"
											</c:when>
										</c:choose> style="cursor: pointer;">
										<div class="timeline-badge warning">
											<i class="glyphicon glyphicon-ok"></i>
										</div>
										<div class="timeline-panel">
											<div class="timeline-heading">
												<h4 class="timeline-title">${activity.tableName}
													'${activity.title}'</h4>
											</div>
											<p>
												<small class="text-muted"><i
													class="glyphicon glyphicon-time"></i> Created
													${activity.regdate}</small>
											</p>
											<div class="timeline-body">
												<p>${activity.uname}님이${activity.title}을(를) 등록하셨습니다.</p>
											</div>
										</div>
									</li>
									<c:choose>
										<c:when test="${i==0}">
											<c:set var="i" value="1" />
										</c:when>
										<c:when test="${i==1}">
											<c:set var="i" value="0" />
										</c:when>
									</c:choose>
								</c:forEach>
								<li class="timeline-inverted">
									<div class="timeline-badge success">
										<i class="glyphicon glyphicon-home"></i>
									</div>
									<div class="timeline-panel">
										<div class="timeline-heading">
											<h4 class="timeline-title">Project '${project.pname}'</h4>
											<p>
												<small class="text-muted"><i
													class="glyphicon glyphicon-time"></i> Created
													${project.pregdate}</small>
											</p>
										</div>
										<div class="timeline-body">
											<p>${project.uname}님이${project.pname}을(를) 등록했습니다..</p>
										</div>
									</div>
								</li>
							</ul>
						</div>
						<!-- --/content-panel ---->
					</div>
					<!-- /col-md-12 -->
				</div>
			</div>
			<div class="col-lg-3 ds">
				<h3>PROJECT DESCRIPTION</h3>
				<div class="desc">
						<h4 class="green">
							<i class="fa fa-paint-brush"></i> ${project.pname}
						</h4>
						${project.pdetail}<br /> <br />
						<p>
							<b>프로젝트 등록일</b><br /> ${project.pregdate}<br />
						</p>
						<p>
							<b>프로젝트 만기일</b><br /> ${project.pduedate}<br />
						</p>
						<p>
							<b>담당자</b><br /> ${project.uname}<br />
						</p>
						<c:if test="${pdatas != null}">
							<p>
								<b>필요 기술</b><br />
								<c:forEach var="code" items="${pdatas}">
							${code} /
							</c:forEach>
								<br />
							</p>
						</c:if>
						<p>
							<b>상태</b><br /> <span class="label label-default"
								style="background-color: ${project.lbgcolor};">${project.ltitle}</span><br />
							<br />
						</p>
						<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')">
							<a class="btn btn-default btn-sm" href="/update/${project.pno}">EDIT</a>
							<a class="btn btn-default btn-sm" href="#"
								alt="/DeleteProject?pno=${project.pno}" id="projectDelBtn"
								data-toggle="modal" data-target="#myModal">DELETE</a>
						</sec:authorize>
				</div>
				<!-- USERS ONLINE SECTION -->
				<h3>TEAM MEMBERS</h3>
				<c:if test="${request == 'none'}">
					<div class="desc" style="text-align: center;">No members to
						show</div>
				</c:if>
				<c:if test="${request != 'none'}">
					<c:forEach var="list" items="${request}">
						<div class="desc">
							<div class="thumb">
								<div class="user-img">
									<div class="img-circle"
										style="background-color: ${list.profileBgColor}; width:35px; height:35px; line-height:35px;">
										<span style="font-size: 12px; color: #E8E8E8;">${list.theFirstLetterOfEmail}</span>
									</div>
								</div>
							</div>
							<div class="details">
								<p>
									<c:choose>
										<c:when test="${list.stat == '002'}">
											<sec:authorize
												access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')">
												<a href="/updateStat/${list.uno}/${project.pno}/000"
													class="btn btn-default btn-sm" id="reconfirmBtn">재요청</a>
											</sec:authorize>
											<a href="#">${list.uname}</a>
											<br>
											${list.CODE_NAME}
										</c:when>
										<c:when test="${list.stat != '002'}">
											<a href="#">${list.uname}</a>
											<br>
											${list.CODE_NAME}
										</c:when>
									</c:choose>
								</p>
							</div>
						</div>
					</c:forEach>
				</c:if>
				<!-- CALENDAR-->
				<div id="calendar" class="mb">
					<div class="panel green-panel no-margin">
						<div class="panel-body">
							<!-- <div id="date-popover" class="popover top" style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">
                                        <div class="arrow"></div>
                                        <h3 class="popover-title" style="disadding: none;"></h3>
                                        <div id="date-popover-content" class="popover-content"></div>
                                    </div> -->
							<div id="my-calendar"></div>
						</div>
					</div>
				</div>
				<!-- / calendar -->
			</div>
		</div>
	</section>
</section>
<!--main content end-->
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />
<script type="application/javascript">
	
		$("#okBtn").click(function() {
			location.href = $('#projectDelBtn').attr('alt');
		});
	
        $(document).ready(function () {
            $("#date-popover").popover({html: true, trigger: "manual"});
            $("#date-popover").hide();
            $("#date-popover").click(function (e) {
                $(this).hide();
            });
        
            $("#my-calendar").zabuto_calendar({
                action: function () {
                    return myDateFunction(this.id, false);
                },
                action_nav: function () {
                    return myNavFunction(this.id);
                }
            });
        });
        
        
        function myNavFunction(id) {
            $("#date-popover").hide();
            var nav = $("#" + id).data("navigation");
            var to = $("#" + id).data("to");
            console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year + '/' + to.day);
        }
    
</script>