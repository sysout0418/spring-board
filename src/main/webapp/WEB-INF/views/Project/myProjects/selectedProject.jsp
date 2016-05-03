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
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-9 main-chart">
				<h3>
					<i class="fa fa-angle-right"></i> Project #${pno} / ${project.pname}
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
							<p>
								<img src="<c:url value="/resources/img/ui-sam.jpg" />"
									class="img-circle" width="80">
							</p>
							<p>
								<b>${project.uname}</b>
							</p>
							<p>
								<b>${project.udepartment}</b>
							</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="content-panel" style="overflow:scroll;overflow-x:hidden;height:800px; padding:10px;">
							<h4>
								<i class="fa fa-angle-right"></i> Recent Activity
							</h4>
							<hr>
							<ul class="timeline"><c:set var="i" value="0"/>
							<c:forEach var="activity" items="${activity}">
							<li<c:if test='${i==0}'> class='timeline-inverted'</c:if>>
								<div class="timeline-badge warning">
									<i class="glyphicon glyphicon-ok"></i>
								</div>
								<div class="timeline-panel">
									<div class="timeline-heading">
										<h4 class="timeline-title">${activity.tableName} '${activity.title}' 등록</h4>
									</div>
									<p>
										<small class="text-muted"><i
											class="glyphicon glyphicon-time"></i> Created ${activity.regdate}</small>
									</p>
									<div class="timeline-body">
										<p>${activity.uname}님이 ${activity.title}을(를) 등록하셨습니다.</p>
									</div>
								</div>
							</li>
							<c:choose>
								<c:when test="${i==0}"><c:set var="i" value="1"/></c:when>
								<c:when test="${i==1}"><c:set var="i" value="0"/></c:when>
							</c:choose>
							</c:forEach>
								<li class="timeline-inverted">
									<div class="timeline-badge success">
										<i class="glyphicon glyphicon-home"></i>
									</div>
									<div class="timeline-panel">
										<div class="timeline-heading">
											<h4 class="timeline-title">Project '${project.pname}' 등록</h4>
											<p>
												<small class="text-muted"><i
													class="glyphicon glyphicon-time"></i> Created ${project.pregdate}</small>
											</p>
										</div>
										<div class="timeline-body">
											<p>${project.uname}님이 ${project.pname}을(를) 등록했습니다..</p>
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
					<div class="details">
						<h4 class="green">
							<i class="fa fa-paint-brush"></i> ${project.pname}
						</h4>
						${project.pdetail}<br />
						<br />
						<p>
							<b>프로젝트 등록일</b><br /> ${project.pregdate}<br />
						</p>
						<p>
							<b>프로젝트 만기일</b><br /> ${project.pduedate}<br />
						</p>
						<p>
							<b>담당자</b><br /> ${project.uname}<br />
						</p>
						<p>
							<b>필요 기술</b><br />
							<c:forEach var="code" items="${pdatas}">
				${code} /
				</c:forEach>
							<br />
						</p>
						<span class="label label-default"
							style="background-color: ${project.lbgcolor};">${project.ltitle}</span><br/><br/>
						<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')">
							<a id="add-regular" class="btn btn-default btn-sm"
								href="/update/${project.pno}">EDIT</a>
							<a id="add-regular" class="btn btn-default btn-sm"
								href="/DeleteProject?pno=${project.pno}">DELETE</a>
						</sec:authorize>
					</div>
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
								<img class="img-circle"
									src="<c:url value="/resources/img/ui-sam.jpg" />" width="35px"
									height="35px" align="">
							</div>
							<div class="details">
								<p>
									<a href="#">${list.uname}</a><br>
									<c:if test="${list.stat == '002'}">
										<muted>${list.CODE_NAME}</muted>
										<a class="btn btn-primary"
											href="/updateStat/${project.pno}/000" role="button">재요청</a>
									</c:if>
									<c:if test="${list.stat != '002'}">
				${list.CODE_NAME}
			</c:if>
								</p>
							</div>
						</div>
					</c:forEach>
				</c:if>
				<div id="calendar" class="mb">
					<div class="panel green-panel no-margin">
						<div class="panel-body">
							<div id="date-popover" class="popover top"
								style="cursor: pointer; margin-left: 33%; margin-top: -50px; width: 175px; display: none;"
								data-original-title="" title="">
								<div class="arrow"></div>
								<h3 class="popover-title" style="disadding: none;"></h3>
								<div id="date-popover-content" class="popover-content"></div>
							</div>
							<div id="zabuto_calendar_1rkp">
								<div class="zabuto_calendar" id="zabuto_calendar_1rkp">
									<table class="table">
										<tbody>
											<tr class="calendar-month-header">
												<th><div class="calendar-month-navigation"
														id="zabuto_calendar_1rkp_nav-prev">
														<span><span
															class="fa fa-chevron-left text-transparent"></span></span>
													</div></th>
												<th colspan="5"><span>May 2016</span></th>
												<th><div class="calendar-month-navigation"
														id="zabuto_calendar_1rkp_nav-next">
														<span><span
															class="fa fa-chevron-right text-transparent"></span></span>
													</div></th>
											</tr>
											<tr class="calendar-dow-header">
												<th>Mon</th>
												<th>Tue</th>
												<th>Wed</th>
												<th>Thu</th>
												<th>Fri</th>
												<th>Sat</th>
												<th>Sun</th>
											</tr>
											<tr class="calendar-dow">
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td id="zabuto_calendar_1rkp_2016-05-01"
													class="dow-clickable"><div
														id="zabuto_calendar_1rkp_2016-05-01_day" class="day">1</div></td>
											</tr>
											<tr class="calendar-dow">
												<td id="zabuto_calendar_1rkp_2016-05-02"
													class="dow-clickable"><div
														id="zabuto_calendar_1rkp_2016-05-02_day" class="day">2</div></td>
												<td id="zabuto_calendar_1rkp_2016-05-03"
													class="dow-clickable"><div
														id="zabuto_calendar_1rkp_2016-05-03_day" class="day">3</div></td>
												<td id="zabuto_calendar_1rkp_2016-05-04"
													class="dow-clickable"><div
														id="zabuto_calendar_1rkp_2016-05-04_day" class="day">4</div></td>
												<td id="zabuto_calendar_1rkp_2016-05-05"
													class="dow-clickable"><div
														id="zabuto_calendar_1rkp_2016-05-05_day" class="day">5</div></td>
												<td id="zabuto_calendar_1rkp_2016-05-06"
													class="dow-clickable"><div
														id="zabuto_calendar_1rkp_2016-05-06_day" class="day">6</div></td>
												<td id="zabuto_calendar_1rkp_2016-05-07"
													class="dow-clickable"><div
														id="zabuto_calendar_1rkp_2016-05-07_day" class="day">7</div></td>
												<td id="zabuto_calendar_1rkp_2016-05-08"
													class="dow-clickable"><div
														id="zabuto_calendar_1rkp_2016-05-08_day" class="day">8</div></td>
											</tr>
											<tr class="calendar-dow">
												<td id="zabuto_calendar_1rkp_2016-05-09"
													class="dow-clickable"><div
														id="zabuto_calendar_1rkp_2016-05-09_day" class="day">9</div></td>
												<td id="zabuto_calendar_1rkp_2016-05-10"
													class="dow-clickable"><div
														id="zabuto_calendar_1rkp_2016-05-10_day" class="day">10</div></td>
												<td id="zabuto_calendar_1rkp_2016-05-11"
													class="dow-clickable"><div
														id="zabuto_calendar_1rkp_2016-05-11_day" class="day">11</div></td>
												<td id="zabuto_calendar_1rkp_2016-05-12"
													class="dow-clickable"><div
														id="zabuto_calendar_1rkp_2016-05-12_day" class="day">12</div></td>
												<td id="zabuto_calendar_1rkp_2016-05-13"
													class="dow-clickable"><div
														id="zabuto_calendar_1rkp_2016-05-13_day" class="day">13</div></td>
												<td id="zabuto_calendar_1rkp_2016-05-14"
													class="dow-clickable"><div
														id="zabuto_calendar_1rkp_2016-05-14_day" class="day">14</div></td>
												<td id="zabuto_calendar_1rkp_2016-05-15"
													class="dow-clickable"><div
														id="zabuto_calendar_1rkp_2016-05-15_day" class="day">15</div></td>
											</tr>
											<tr class="calendar-dow">
												<td id="zabuto_calendar_1rkp_2016-05-16"
													class="dow-clickable"><div
														id="zabuto_calendar_1rkp_2016-05-16_day" class="day">16</div></td>
												<td id="zabuto_calendar_1rkp_2016-05-17"
													class="dow-clickable"><div
														id="zabuto_calendar_1rkp_2016-05-17_day" class="day">17</div></td>
												<td id="zabuto_calendar_1rkp_2016-05-18"
													class="dow-clickable"><div
														id="zabuto_calendar_1rkp_2016-05-18_day" class="day">18</div></td>
												<td id="zabuto_calendar_1rkp_2016-05-19"
													class="dow-clickable"><div
														id="zabuto_calendar_1rkp_2016-05-19_day" class="day">19</div></td>
												<td id="zabuto_calendar_1rkp_2016-05-20"
													class="dow-clickable"><div
														id="zabuto_calendar_1rkp_2016-05-20_day" class="day">20</div></td>
												<td id="zabuto_calendar_1rkp_2016-05-21"
													class="dow-clickable"><div
														id="zabuto_calendar_1rkp_2016-05-21_day" class="day">21</div></td>
												<td id="zabuto_calendar_1rkp_2016-05-22"
													class="dow-clickable"><div
														id="zabuto_calendar_1rkp_2016-05-22_day" class="day">22</div></td>
											</tr>
											<tr class="calendar-dow">
												<td id="zabuto_calendar_1rkp_2016-05-23"
													class="dow-clickable"><div
														id="zabuto_calendar_1rkp_2016-05-23_day" class="day">23</div></td>
												<td id="zabuto_calendar_1rkp_2016-05-24"
													class="dow-clickable"><div
														id="zabuto_calendar_1rkp_2016-05-24_day" class="day">24</div></td>
												<td id="zabuto_calendar_1rkp_2016-05-25"
													class="dow-clickable"><div
														id="zabuto_calendar_1rkp_2016-05-25_day" class="day">25</div></td>
												<td id="zabuto_calendar_1rkp_2016-05-26"
													class="dow-clickable"><div
														id="zabuto_calendar_1rkp_2016-05-26_day" class="day">26</div></td>
												<td id="zabuto_calendar_1rkp_2016-05-27"
													class="dow-clickable"><div
														id="zabuto_calendar_1rkp_2016-05-27_day" class="day">27</div></td>
												<td id="zabuto_calendar_1rkp_2016-05-28"
													class="dow-clickable"><div
														id="zabuto_calendar_1rkp_2016-05-28_day" class="day">28</div></td>
												<td id="zabuto_calendar_1rkp_2016-05-29"
													class="dow-clickable"><div
														id="zabuto_calendar_1rkp_2016-05-29_day" class="day">29</div></td>
											</tr>
											<tr class="calendar-dow">
												<td id="zabuto_calendar_1rkp_2016-05-30"
													class="dow-clickable"><div
														id="zabuto_calendar_1rkp_2016-05-30_day" class="day">30</div></td>
												<td id="zabuto_calendar_1rkp_2016-05-31"
													class="dow-clickable"><div
														id="zabuto_calendar_1rkp_2016-05-31_day" class="day">31</div></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</table>
									<div class="legend" id="zabuto_calendar_1rkp_legend">
										<span class="legend-text"><span
											class="badge badge-event">00</span> Special event</span><span
											class="legend-block"><ul class="legend">
												<li class="event"></li>
												<span>Regular event</span>
											</ul></span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<script type="application/javascript">
					
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
                },
                ajax: {
                    url: "show_data.php?action=1",
                    modal: true
                },
                legend: [
                    {type: "text", label: "Special event", badge: "00"},
                    {type: "block", label: "Regular event", }
                ]
            });
        });
        
        
        function myNavFunction(id) {
            $("#date-popover").hide();
            var nav = $("#" + id).data("navigation");
            var to = $("#" + id).data("to");
            console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
        }
    
				</script>
			</div>
		</div>
	</section>
</section>
<!--main content end-->
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />