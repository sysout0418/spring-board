<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header2_header.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header3_menu_project.jsp" />
<style>
.timeline {
    list-style: none;
    padding: 20px 0 20px;
    position: relative;
}

    .timeline:before {
        top: 0;
        bottom: 0;
        position: absolute;
        content: " ";
        width: 3px;
        background-color: #eeeeee;
        left: 50%;
        margin-left: -1.5px;
    }

    .timeline > li {
        margin-bottom: 20px;
        position: relative;
    }

        .timeline > li:before,
        .timeline > li:after {
            content: " ";
            display: table;
        }

        .timeline > li:after {
            clear: both;
        }

        .timeline > li:before,
        .timeline > li:after {
            content: " ";
            display: table;
        }

        .timeline > li:after {
            clear: both;
        }

        .timeline > li > .timeline-panel {
            width: 46%;
            float: left;
            border: 1px solid #d4d4d4;
            border-radius: 2px;
            padding: 20px;
            position: relative;
            -webkit-box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
            box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
        }

            .timeline > li > .timeline-panel:before {
                position: absolute;
                top: 26px;
                right: -15px;
                display: inline-block;
                border-top: 15px solid transparent;
                border-left: 15px solid #ccc;
                border-right: 0 solid #ccc;
                border-bottom: 15px solid transparent;
                content: " ";
            }

            .timeline > li > .timeline-panel:after {
                position: absolute;
                top: 27px;
                right: -14px;
                display: inline-block;
                border-top: 14px solid transparent;
                border-left: 14px solid #fff;
                border-right: 0 solid #fff;
                border-bottom: 14px solid transparent;
                content: " ";
            }

        .timeline > li > .timeline-badge {
            color: #fff;
            width: 50px;
            height: 50px;
            line-height: 50px;
            font-size: 1.4em;
            text-align: center;
            position: absolute;
            top: 16px;
            left: 50%;
            margin-left: -25px;
            background-color: #999999;
            z-index: 100;
            border-top-right-radius: 50%;
            border-top-left-radius: 50%;
            border-bottom-right-radius: 50%;
            border-bottom-left-radius: 50%;
        }

        .timeline > li.timeline-inverted > .timeline-panel {
            float: right;
        }

            .timeline > li.timeline-inverted > .timeline-panel:before {
                border-left-width: 0;
                border-right-width: 15px;
                left: -15px;
                right: auto;
            }

            .timeline > li.timeline-inverted > .timeline-panel:after {
                border-left-width: 0;
                border-right-width: 14px;
                left: -14px;
                right: auto;
            }

.timeline-badge.primary {
    background-color: #2e6da4 !important;
}

.timeline-badge.success {
    background-color: #3f903f !important;
}

.timeline-badge.warning {
    background-color: #f0ad4e !important;
}

.timeline-badge.danger {
    background-color: #d9534f !important;
}

.timeline-badge.info {
    background-color: #5bc0de !important;
}

.timeline-title {
    margin-top: 0;
    color: inherit;
}

.timeline-body > p,
.timeline-body > ul {
    margin-bottom: 0;
}

    .timeline-body > p + p {
        margin-top: 5px;
    }

@media (max-width: 767px) {
    ul.timeline:before {
        left: 40px;
    }

    ul.timeline > li > .timeline-panel {
        width: calc(100% - 90px);
        width: -moz-calc(100% - 90px);
        width: -webkit-calc(100% - 90px);
    }

    ul.timeline > li > .timeline-badge {
        left: 15px;
        margin-left: 0;
        top: 16px;
    }

    ul.timeline > li > .timeline-panel {
        float: right;
    }

        ul.timeline > li > .timeline-panel:before {
            border-left-width: 0;
            border-right-width: 15px;
            left: -15px;
            right: auto;
        }

        ul.timeline > li > .timeline-panel:after {
            border-left-width: 0;
            border-right-width: 14px;
            left: -14px;
            right: auto;
        }
}
</style>
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-9 main-chart">
			<h3><i class="fa fa-angle-right"></i> Project #${pno} /${project.pname}</h3>
			<div class="row">
<div class="col-md-4 col-sm-4 mb">
                      		<div class="grey-panel pn donut-chart">
                      			<div class="grey-header">
						  			<h5>PROGRESS BAR</h5>
                      			</div>
								<canvas id="serverstatus01" height="120" width="120" style="width: 120px; height: 120px;"></canvas>
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
										<p>Project<br>Progress:</p>
									</div>
									 <div class="col-sm-6 col-xs-6">
									 	<h2>${project.completeIssuePercent}%</h2>
									 </div>
	                      		</div>
	                      	</div><!-- --/grey-panel ---->
                      	</div>
                      	<div class="col-lg-4 col-md-4 col-sm-4 mb">
							<!-- INSTAGRAM PANEL -->
							<div class="instagram-panel pn">
								<i class="fa fa-tasks fa-4x"></i>
								<p>${project.pname}<br>
									${project.pregdate}
								</p>
								<p><i class="fa fa-comment"></i> 18 | <i class="fa fa-heart"></i> 49</p>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-4 mb">
							<!-- WHITE PANEL - TOP USER -->
							<div class="white-panel pn">
								<div class="white-header">
									<h5>PROJECT MANAGER</h5>
								</div>
								<p><img src="<c:url value="/resources/img/ui-sam.jpg" />" class="img-circle" width="80"></p>
								<p><b>${project.uname}</b></p>
								<p><b>${project.udepartment}</b></p>
							</div>
						</div>
			</div>
			   <div class="row">
	          	<div class="col-md-12">
	             	<div class="content-panel">
	                	<h4><i class="fa fa-angle-right"></i> Recent Activity</h4><hr>
	                	<ul class="timeline">
        <li>
          <div class="timeline-badge"><i class="glyphicon glyphicon-check"></i></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4 class="timeline-title">Mussum ipsum cacilds</h4>
              <p><small class="text-muted"><i class="glyphicon glyphicon-time"></i> 11 hours ago via Twitter</small></p>
            </div>
            <div class="timeline-body">
              <p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo. Manduma pindureta quium dia nois paga. Sapien in monti palavris qui num significa nadis i pareci latim. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.</p>
            </div>
          </div>
        </li>
        <li class="timeline-inverted">
          <div class="timeline-badge warning"><i class="glyphicon glyphicon-credit-card"></i></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4 class="timeline-title">Mussum ipsum cacilds</h4>
            </div>
            <div class="timeline-body">
              <p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo. Manduma pindureta quium dia nois paga. Sapien in monti palavris qui num significa nadis i pareci latim. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.</p>
              <p>Suco de cevadiss, é um leite divinis, qui tem lupuliz, matis, aguis e fermentis. Interagi no mé, cursus quis, vehicula ac nisi. Aenean vel dui dui. Nullam leo erat, aliquet quis tempus a, posuere ut mi. Ut scelerisque neque et turpis posuere pulvinar pellentesque nibh ullamcorper. Pharetra in mattis molestie, volutpat elementum justo. Aenean ut ante turpis. Pellentesque laoreet mé vel lectus scelerisque interdum cursus velit auctor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ac mauris lectus, non scelerisque augue. Aenean justo massa.</p>
            </div>
          </div>
        </li>
        <li>
          <div class="timeline-badge danger"><i class="glyphicon glyphicon-credit-card"></i></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4 class="timeline-title">Mussum ipsum cacilds</h4>
            </div>
            <div class="timeline-body">
              <p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo. Manduma pindureta quium dia nois paga. Sapien in monti palavris qui num significa nadis i pareci latim. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.</p>
            </div>
          </div>
        </li>
        <li class="timeline-inverted">
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4 class="timeline-title">Mussum ipsum cacilds</h4>
            </div>
            <div class="timeline-body">
              <p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo. Manduma pindureta quium dia nois paga. Sapien in monti palavris qui num significa nadis i pareci latim. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.</p>
            </div>
          </div>
        </li>
        <li>
          <div class="timeline-badge info"><i class="glyphicon glyphicon-floppy-disk"></i></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4 class="timeline-title">Mussum ipsum cacilds</h4>
            </div>
            <div class="timeline-body">
              <p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo. Manduma pindureta quium dia nois paga. Sapien in monti palavris qui num significa nadis i pareci latim. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.</p>
              <hr>
              <div class="btn-group">
                <button type="button" class="btn btn-primary btn-sm dropdown-toggle" data-toggle="dropdown">
                  <i class="glyphicon glyphicon-cog"></i> <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="#">Action</a></li>
                  <li><a href="#">Another action</a></li>
                  <li><a href="#">Something else here</a></li>
                  <li class="divider"></li>
                  <li><a href="#">Separated link</a></li>
                </ul>
              </div>
            </div>
          </div>
        </li>
        <li>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4 class="timeline-title">Mussum ipsum cacilds</h4>
            </div>
            <div class="timeline-body">
              <p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo. Manduma pindureta quium dia nois paga. Sapien in monti palavris qui num significa nadis i pareci latim. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.</p>
            </div>
          </div>
        </li>
        <li class="timeline-inverted">
          <div class="timeline-badge success"><i class="glyphicon glyphicon-thumbs-up"></i></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4 class="timeline-title">Mussum ipsum cacilds</h4>
            </div>
            <div class="timeline-body">
              <p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo. Manduma pindureta quium dia nois paga. Sapien in monti palavris qui num significa nadis i pareci latim. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.</p>
            </div>
          </div>
        </li>
    </ul>
	           </div><!-- --/content-panel ---->
	       </div><!-- /col-md-12 -->
		</div>
</div>
<div class="col-lg-3 ds">
	<h3>PROJECT DESCRIPTION</h3>
	<div class="desc">
		<div class="details">
			<h4 class="green"><i class="fa fa-paint-brush"></i> ${project.pname}</h4>
			${project.pdetail}<br/><br/>
			<p>
				<b>프로젝트 등록일</b><br/>
				${project.pregdate}<br/>
			</p>
			<p>
				<b>프로젝트 만기일</b><br/>
				${project.pduedate}<br/>
			</p>
			<p>
				<b>담당자</b><br/>
				${project.uname}<br/>
			</p>
			${project.ltitle}<br/>
			${project.lbgcolor}<br/>
			${project.pdata}<br/>
			<c:if test="${project.uno == uno}">
				<a id="add-regular" class="btn btn-default btn-sm" href="/update?pno=${project.pno}">EDIT</a>
				<a id="add-regular" class="btn btn-default btn-sm" href="/DeleteProject?pno=${project.pno}">DELETE</a>
			</c:if>
		</div>
	</div>
<!-- USERS ONLINE SECTION -->
<h3>TEAM MEMBERS</h3>
<c:if test="${request == 'none'}">
	<div class="desc" style="text-align: center;">
			No members to show
	</div>
</c:if>
<c:if test="${request != 'none'}">
	<c:forEach var="list" items="${request}">
	<div class="desc">
		<div class="thumb">
			<img class="img-circle" src="<c:url value="/resources/img/ui-sam.jpg" />" width="35px" height="35px" align="">
	    </div>
	<div class="details">
		<p><a href="#">${list.uname}</a><br>
			<c:if test="${list.stat == '002'}">
				<muted>${list.CODE_NAME}</muted><a class="btn btn-primary" href="/updateStat/${project.pno}/000" role="button">재요청</a>
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
         <div id="date-popover" class="popover top" style="cursor: pointer; margin-left: 33%; margin-top: -50px; width: 175px; display: none;" data-original-title="" title="">
             <div class="arrow"></div>
             <h3 class="popover-title" style="disadding: none;"></h3>
                <div id="date-popover-content" class="popover-content"></div>
            </div>
            <div id="zabuto_calendar_1rkp"><div class="zabuto_calendar" id="zabuto_calendar_1rkp"><table class="table"><tbody><tr class="calendar-month-header"><th><div class="calendar-month-navigation" id="zabuto_calendar_1rkp_nav-prev"><span><span class="fa fa-chevron-left text-transparent"></span></span></div></th><th colspan="5"><span>May 2016</span></th><th><div class="calendar-month-navigation" id="zabuto_calendar_1rkp_nav-next"><span><span class="fa fa-chevron-right text-transparent"></span></span></div></th></tr><tr class="calendar-dow-header"><th>Mon</th><th>Tue</th><th>Wed</th><th>Thu</th><th>Fri</th><th>Sat</th><th>Sun</th></tr><tr class="calendar-dow"><td></td><td></td><td></td><td></td><td></td><td></td><td id="zabuto_calendar_1rkp_2016-05-01" class="dow-clickable"><div id="zabuto_calendar_1rkp_2016-05-01_day" class="day">1</div></td></tr><tr class="calendar-dow"><td id="zabuto_calendar_1rkp_2016-05-02" class="dow-clickable"><div id="zabuto_calendar_1rkp_2016-05-02_day" class="day">2</div></td><td id="zabuto_calendar_1rkp_2016-05-03" class="dow-clickable"><div id="zabuto_calendar_1rkp_2016-05-03_day" class="day">3</div></td><td id="zabuto_calendar_1rkp_2016-05-04" class="dow-clickable"><div id="zabuto_calendar_1rkp_2016-05-04_day" class="day">4</div></td><td id="zabuto_calendar_1rkp_2016-05-05" class="dow-clickable"><div id="zabuto_calendar_1rkp_2016-05-05_day" class="day">5</div></td><td id="zabuto_calendar_1rkp_2016-05-06" class="dow-clickable"><div id="zabuto_calendar_1rkp_2016-05-06_day" class="day">6</div></td><td id="zabuto_calendar_1rkp_2016-05-07" class="dow-clickable"><div id="zabuto_calendar_1rkp_2016-05-07_day" class="day">7</div></td><td id="zabuto_calendar_1rkp_2016-05-08" class="dow-clickable"><div id="zabuto_calendar_1rkp_2016-05-08_day" class="day">8</div></td></tr><tr class="calendar-dow"><td id="zabuto_calendar_1rkp_2016-05-09" class="dow-clickable"><div id="zabuto_calendar_1rkp_2016-05-09_day" class="day">9</div></td><td id="zabuto_calendar_1rkp_2016-05-10" class="dow-clickable"><div id="zabuto_calendar_1rkp_2016-05-10_day" class="day">10</div></td><td id="zabuto_calendar_1rkp_2016-05-11" class="dow-clickable"><div id="zabuto_calendar_1rkp_2016-05-11_day" class="day">11</div></td><td id="zabuto_calendar_1rkp_2016-05-12" class="dow-clickable"><div id="zabuto_calendar_1rkp_2016-05-12_day" class="day">12</div></td><td id="zabuto_calendar_1rkp_2016-05-13" class="dow-clickable"><div id="zabuto_calendar_1rkp_2016-05-13_day" class="day">13</div></td><td id="zabuto_calendar_1rkp_2016-05-14" class="dow-clickable"><div id="zabuto_calendar_1rkp_2016-05-14_day" class="day">14</div></td><td id="zabuto_calendar_1rkp_2016-05-15" class="dow-clickable"><div id="zabuto_calendar_1rkp_2016-05-15_day" class="day">15</div></td></tr><tr class="calendar-dow"><td id="zabuto_calendar_1rkp_2016-05-16" class="dow-clickable"><div id="zabuto_calendar_1rkp_2016-05-16_day" class="day">16</div></td><td id="zabuto_calendar_1rkp_2016-05-17" class="dow-clickable"><div id="zabuto_calendar_1rkp_2016-05-17_day" class="day">17</div></td><td id="zabuto_calendar_1rkp_2016-05-18" class="dow-clickable"><div id="zabuto_calendar_1rkp_2016-05-18_day" class="day">18</div></td><td id="zabuto_calendar_1rkp_2016-05-19" class="dow-clickable"><div id="zabuto_calendar_1rkp_2016-05-19_day" class="day">19</div></td><td id="zabuto_calendar_1rkp_2016-05-20" class="dow-clickable"><div id="zabuto_calendar_1rkp_2016-05-20_day" class="day">20</div></td><td id="zabuto_calendar_1rkp_2016-05-21" class="dow-clickable"><div id="zabuto_calendar_1rkp_2016-05-21_day" class="day">21</div></td><td id="zabuto_calendar_1rkp_2016-05-22" class="dow-clickable"><div id="zabuto_calendar_1rkp_2016-05-22_day" class="day">22</div></td></tr><tr class="calendar-dow"><td id="zabuto_calendar_1rkp_2016-05-23" class="dow-clickable"><div id="zabuto_calendar_1rkp_2016-05-23_day" class="day">23</div></td><td id="zabuto_calendar_1rkp_2016-05-24" class="dow-clickable"><div id="zabuto_calendar_1rkp_2016-05-24_day" class="day">24</div></td><td id="zabuto_calendar_1rkp_2016-05-25" class="dow-clickable"><div id="zabuto_calendar_1rkp_2016-05-25_day" class="day">25</div></td><td id="zabuto_calendar_1rkp_2016-05-26" class="dow-clickable"><div id="zabuto_calendar_1rkp_2016-05-26_day" class="day">26</div></td><td id="zabuto_calendar_1rkp_2016-05-27" class="dow-clickable"><div id="zabuto_calendar_1rkp_2016-05-27_day" class="day">27</div></td><td id="zabuto_calendar_1rkp_2016-05-28" class="dow-clickable"><div id="zabuto_calendar_1rkp_2016-05-28_day" class="day">28</div></td><td id="zabuto_calendar_1rkp_2016-05-29" class="dow-clickable"><div id="zabuto_calendar_1rkp_2016-05-29_day" class="day">29</div></td></tr><tr class="calendar-dow"><td id="zabuto_calendar_1rkp_2016-05-30" class="dow-clickable"><div id="zabuto_calendar_1rkp_2016-05-30_day" class="day">30</div></td><td id="zabuto_calendar_1rkp_2016-05-31" class="dow-clickable"><div id="zabuto_calendar_1rkp_2016-05-31_day" class="day">31</div></td><td></td><td></td><td></td><td></td><td></td></tr></tbody></table><div class="legend" id="zabuto_calendar_1rkp_legend"><span class="legend-text"><span class="badge badge-event">00</span> Special event</span><span class="legend-block"><ul class="legend"><li class="event"></li><span>Regular event</span></ul></span></div></div></div>
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
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />