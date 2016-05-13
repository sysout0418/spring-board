<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header2_header.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header3_menu_dash.jsp" />
<link href="<c:url value="/resources/css/calendar/calendar.css" />" rel="stylesheet" type="text/css" />
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<!--main content start-->
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper site-min-height">
		<h3>
			<i class="fa fa-angle-right"></i> Issues
		</h3>
		<div class="col-lg-12">
			<div class="row">
				<div class="col-md-12">
					<div class="content-panel">
						<div class="row x_title">
							<div class="col-md-6">
								<h4>
									<i class="fa fa-angle-right"></i> Activity
								</h4>
							</div>
							<div class="col-md-6">
								<div id="reportrange" class="pull-right"
									style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
									<i class="glyphicon glyphicon-calendar fa fa-calendar"></i> <span>December
										30, 2014 - January 28, 2015</span> <b class="caret"></b>
								</div>
							</div>
						</div>

						<div id="chart" style="height: 250px;"></div>
					</div>
					<!-- /content-panel -->
				</div>
				<!-- /col-md-12 -->
				
				<div class="col-md-12 mt">
					<div class="content-panel">
						<div role="tabpanel">
							<!-- Nav tabs -->
							<div class="tabbable-panel">
								<div class="tabbable-line">
									<ul class="nav nav-tabs">
										<li <c:if test="${stat=='open'}"> class="active"</c:if>><a
											href="/issues/open">Open</a></li>
										<li <c:if test="${stat=='closed'}"> class="active"</c:if>><a
											href="/issues/closed">Closed</a></li>
										<li <c:if test="${stat=='all'}"> class="active"</c:if>><a
											href="/issues/all">All</a></li>
									</ul>
								</div>
							</div>

							<!-- Tab panes -->
							<div class="tab-content well">
								<c:choose>
									<c:when test="${!empty selectedUserName and selectedUserName != ''}">
										<input type="hidden" id="uno" name="uno" value="${uno}">
									</c:when>
									<c:when test="${!empty userName and userName != ''}">
										<input type="hidden" id="uno" name="uno" value="${user_no}">
									</c:when>
									<c:otherwise>
										<input type="hidden" id="uno" name="uno" value="">
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${!empty selectedMilestone and selectedMilestone != ''}">
										<input type="hidden" id="mno" name="mno" value="${mno}">
									</c:when>
									<c:otherwise>
										<input type="hidden" id="mno" name="mno" value="">
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${!empty selectedLabelName and selectedLabelName != ''}">
										<input type="hidden" id="lno" name="lno" value="${lno}">
									</c:when>
									<c:otherwise>
										<input type="hidden" id="lno" name="lno" value="">
									</c:otherwise>
								</c:choose>
								<div class="btn-group">
									<a href="#" class="btn btn-default"> <c:choose>
											<c:when test="${!empty selectedUserName and selectedUserName != ''}">
												<span id="selectedAssign">${selectedUserName}</span>
											</c:when>
											<c:when test="${!empty userName and userName != ''}">
												<span id="selectedAssign">${userName}</span>
											</c:when>
											<c:otherwise>
												<span id="selectedAssign">Assignee</span>
											</c:otherwise>
										</c:choose>
									</a> <a href="#" class="btn btn-default dropdown-toggle"
										data-toggle="dropdown" aria-expanded="false"><span
										class="caret" style="height: 10px; margin-top: 10px;"></span></a>
									<ul class="dropdown-menu">
										<li class="uno1"><a alt="" href="#">All</a></li>
										<li class="uno1"><a alt="0" href="#">UnAssigned</a></li>
										<c:forEach var="users" items="${userList}">
											<li class="uno1"><a alt="${users.uno}" href="#">${users.uname}</a></li>
										</c:forEach>
									</ul>
								</div>
								<div class="btn-group">
									<a href="#" class="btn btn-default"> <c:choose>
											<c:when test="${!empty selectedMilestone}">
												<span id="selectedMilestone">${selectedMilestone}</span>
											</c:when>
											<c:otherwise>
												<span id="selectedMilestone">Milestone</span>
											</c:otherwise>
										</c:choose>
									</a> <a href="#" class="btn btn-default dropdown-toggle"
										data-toggle="dropdown" aria-expanded="false"><span
										class="caret" style="height: 10px; margin-top: 10px;"></span></a>
									<ul class="dropdown-menu">
										<li class="milestoneNo"><a id="milestoneNo" alt=""
											href="#">All</a></li>
										<c:forEach var="milestone" items="${milestoneList}">
											<li class="milestoneNo"><a id="milestoneNo"
												alt="${milestone.mno}" href="#">${milestone.mtitle}</a></li>
										</c:forEach>
									</ul>
								</div>
								<div class="btn-group">
									<a href="#" class="btn btn-default"> <c:choose>
											<c:when test="${!empty selectedLabelName}">
												<span id="selectedLabel">${selectedLabelName}</span>
											</c:when>
											<c:otherwise>
												<span id="selectedLabel">Weight</span>
											</c:otherwise>
										</c:choose>
									</a> <a href="#" class="btn btn-default dropdown-toggle"
										data-toggle="dropdown" aria-expanded="false"><span
										class="caret" style="height: 10px; margin-top: 10px;"></span></a>
									<ul class="dropdown-menu">
										<li class="labelNo"><a id="labelNo" alt="" href="#">All</a></li>
										<c:forEach var="label" items="${allLabelList}">
											<li class="labelNo"><a id="labelNo" alt="${label.lno}"
												href="#" style="text-color: ${label.lbgcolor}">${label.ltitle}</a></li>
										</c:forEach>
									</ul>
								</div>
								<a href="#" id="searchBtn" class="btn btn-warning">SEARCH ISSUES</a>
							</div>
						</div>
						<form name="frm" id="frm" method="post">
							<c:choose>
								<c:when test="${issuesList == 'none'}">
									<div style="height: 100px">
										<p style="text-align: center; vertical-align: middle;">
											No Issues to show</p>
									</div>
								</c:when>
								<c:otherwise>
									<c:forEach var="project" items="${projectInfo}">
										<div style="background-color: #EAEAEA; height: 30px;">
											<div>
												<a href="/${project.uno}/${project.pno}"
													style="float: left; margin-left: 15px; margin-top: 5px;">
													${project.uname} / ${project.pname}</a> 
													<a href="/${project.uno}/${project.pno}/issues/open"
													style="float: right; margin-right: 15px; margin-top: 5px;">
													show all</a>
											</div>
										</div>

										<ul class="list-group">
											<c:forEach var="issues" items="${issuesList}"
												varStatus="status">
												<c:if test="${project.pno == issues.pno}">
													<input type="hidden" name="issueState"
														value="${issues.istatement }">
													<li class="list-group-item"
														onclick="location.href='/${user_no}/${issues.pno}/issue/${issues.ino}'"
														style="cursor: pointer;"><span class="badge"><i
															class="fa fa-comment" aria-hidden="true"></i>
															${issues.commentCnt}</span> <span
														style="font-weight: bold; color: black;">${issues.ititle}</span>
														/ <span class="label color-label has_tooltip"
														style="background-color:
														${issues.lbgcolor}; color: #FFFFFF"
														title="" data-container="body" data-original-title="">${issues.ltitle}</span>&nbsp;&nbsp;
														<c:if test="${issues.isExpired}"><span style="color: #E50B00;">(Expired)</span></c:if><br>
														${issues.iregdate} by ${issues.uname} / <i
														class="fa fa-clock-o" aria-hidden="true"></i> <a
														href="/${issues.uno}/${issues.pno}/milestone/${issues.mno}">${issues.mtitle}</a>
													</li>
												</c:if>
											</c:forEach>
										</ul>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
</section>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />
<script type="text/javascript" src="<c:url value="/resources/javascript/calendar/moment.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/calendar/daterangepicker.js" />"></script>
<script type="text/javascript">
//graph
$(document).ready(function() {

    var cb = function(start, end, label) {
      console.log(start.toISOString(), end.toISOString(), label);
      $('#reportrange span').html(start.format('YYYY-MM-DD') + ' - ' + end.format('YYYY-MM-DD'));
    };

    var optionSet1 = {
      startDate: moment().subtract(29, 'days'),
      endDate: moment(),
      minDate: '01/01/2013',
      maxDate: '12/31/2020',
      dateLimit: {
        days: 60
      },
      showDropdowns: true,
      showWeekNumbers: true,
      timePicker: false,
      timePickerIncrement: 1,
      timePicker12Hour: true,
      ranges: {
        //'Today': [moment(), moment()],
        //'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
        'Last 7 Days': [moment().subtract(6, 'days'), moment()],
        'Last 30 Days': [moment().subtract(29, 'days'), moment()],
        'This Month': [moment().startOf('month'), moment().endOf('month')],
        'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
      },
      opens: 'left',
      buttonClasses: ['btn btn-default'],
      applyClass: 'btn-small btn-primary',
      cancelClass: 'btn-small',
      format: 'MM/DD/YYYY',
      separator: ' to ',
      locale: {
        applyLabel: 'Apply',
        cancelLabel: 'Clear',
        fromLabel: 'From',
        toLabel: 'To',
        customRangeLabel: 'Custom',
        daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
        monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
        firstDay: 1
      }
    };
    $('#reportrange span').html(moment().subtract(29, 'days').format('YYYY-MM-DD') + ' - ' + moment().format('YYYY-MM-DD'));
    $('#reportrange').daterangepicker(optionSet1, cb);
    /*
    $('#reportrange').on('show.daterangepicker', function() {
      console.log("show event fired");
    });
    $('#reportrange').on('hide.daterangepicker', function() {
      console.log("hide event fired");
    });
    */
    
    $('#reportrange').on('apply.daterangepicker', function(ev, picker) {
      var startDate = picker.startDate.format('YYYY-MM-DD');
      var endDate = picker.endDate.format('YYYY-MM-DD');
      var param = { "startDate" : startDate, "endDate" : endDate };
      
      $.ajax({
			type : "POST",
			url : "/getIssueData",
			data : param,
			success : function(data2) {
				$('#chart').empty();
				var dateData = data2;
				console.log("datas : " + dateData.length)
				if (dateData.length > 0) {
  				new Morris.Line({
  					// ID of the element in which to draw the chart.
  					element : 'chart',
  					// Chart data records -- each entry in this array corresponds to a point on
  					// the chart.
  					data : dateData,
  					// The name of the data record attribute that contains x-values.
  					xkey : 'date',
  					// A list of names of data record attributes that contain y-values.
  					ykeys : [ 'value' ],
  					// Labels for the ykeys -- will be displayed when you hover over the
  					// chart.
  					labels : [ 'Milestones' ],
  				});
			} else {
					$('#chart').attr("style", "height: 250px; text-align: center; line-height:250px");
					$('#chart').append('No activity to show');
				}
			},
			error : function(xhr, status, error) {
				console.log("data load failed");
			}
		});
    
    });
    
    $('#reportrange').ready(function() {
       var date = $('#reportrange span').html().split( ' - ');
       var param = { "startDate" : date[0], "endDate" : date[1] };
       
       $.ajax({
			type : "POST",
			url : "/getIssueData",
			data : param,
			success : function(data2) {
				var dateData = data2;
				console.log("datas : " + dateData.length)
				if (dateData.length > 0) {
   				new Morris.Line({
   					// ID of the element in which to draw the chart.
   					element : 'chart',
   					// Chart data records -- each entry in this array corresponds to a point on
   					// the chart.
   					data : dateData,
   					// The name of the data record attribute that contains x-values.
   					xkey : 'date',
   					// A list of names of data record attributes that contain y-values.
   					ykeys : [ 'value' ],
   					// Labels for the ykeys -- will be displayed when you hover over the
   					// chart.
   					labels : [ 'Milestones' ],
   				});
				} else {
					$('#chart').attr("style", "height: 250px; text-align: center; line-height:250px");
					$('#chart').append('No activity to show');
				}
			},
			error : function(xhr, status, error) {
				console.log("data load failed");
			}
		});
     
     });
    $('#reportrange').on('cancel.daterangepicker', function(ev, picker) {
      console.log("cancel event fired");
    });
    $('#options1').click(function() {
      $('#reportrange').data('daterangepicker').setOptions(optionSet1, cb);
    });
    $('#options2').click(function() {
      $('#reportrange').data('daterangepicker').setOptions(optionSet2, cb);
    });
    $('#destroy').click(function() {
      $('#reportrange').data('daterangepicker').remove();
    });
  });

	$('.dropdown-menu > .uno1 > a').bind('click', function() {
		var userName = $(this).text();
		var userNo = $(this).attr("alt");
		console.log(userNo);
		$("#uno").val(userNo);
		$("#selectedAssign").text(userName);
	});
	$('.dropdown-menu > .milestoneNo > a').bind('click', function() {
		var mTitle = $(this).text();
		var milestoneNo = $(this).attr("alt");
		console.log(milestoneNo);
		$("#mno").val(milestoneNo);
		$("#selectedMilestone").text(mTitle);
	});
	$('.dropdown-menu > .labelNo > a').bind('click', function() {
		var lTitle = $(this).text();
		var labelNo = $(this).attr("alt");
		console.log(labelNo);
		$("#lno").val(labelNo);
		$("#selectedLabel").text(lTitle);
	});
	$('.dropdown-menu > .weight > a').bind('click', function() {
		var weight = $(this).text();
		console.log(weight);
		$("#weight").val(weight);
		$("#selectedWeight").text(weight);
	});

	$('#searchBtn').click(
			function() {
				$('#searchBtn').attr("href", "/issues/${stat}/search?uno=" 
						+ $("#uno").val()
						+ "&mno=" + $("#mno").val() + "&lno="
						+ $("#lno").val());
			});
</script>