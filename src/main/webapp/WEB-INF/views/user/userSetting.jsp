<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header2_header.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header3_menu_dash.jsp" />
	<link href="<c:url value="/resources/css/calendar/calendar.css" />"
	rel="stylesheet" type="text/css" />
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<section id="main-content">
	<section class="wrapper site-min-height">

		<div class="col-lg-12">
			<div class="row">
				<div class="col-lg-9 main-chart">
					<!-- BASIC FORM ELELEMNTS -->
					<h3>
						<i class="fa fa-angle-right"></i> Profile Settings
					</h3>
					<div class="col-lg-12">
		
			<div class="row">
				<div class="col-md-12">
					<div class="content-panel" id="isNoResult">
						<div class="row x_title">
                  <div class="col-md-6">
                    <h4>
							<i class="fa fa-angle-right"></i> Activity
						</h4>
                  </div>
                  <div class="col-md-6">
                    <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
                      <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                      <span>December 30, 2014 - January 28, 2015</span> <b class="caret"></b>
                    </div>
                  </div>
                </div>

						<div id="chart" style="height: 250px;"></div>
					</div>
					<!-- /content-panel -->
				</div>
				<!-- /col-md-12 -->
			</div>
			<!-- /row -->
		</div>
		<div class="col-lg-12">
					<!-- /row -->
					<div class="row mt">
						<div class="col-lg-12">
							<div class="content-panel">
							<h4><i class="fa fa-angle-right"></i> User Report</h4>
								<form action="profile" method="post" id="profile" class="form-horizontal style-form">
									<div class="form-group">
										<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" id="uemail" name="uemail"
												readonly="readonly" value="${userInfo.uemail}">
										</div>
									</div>
									<div class="form-group">
										<label for="inputName" class="col-lg-2 control-label">이름</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" id="uname"
												name="uname" value="${userInfo.uname}">
										</div>
									</div>
									<div class="form-group">
										<label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰
											번호</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" id="uphoneno"
												name="uphoneno" value="${userInfo.uphoneno}">
										</div>
									</div>
									<div class="form-group">
										<label for="select" class="col-lg-2 control-label">부서</label>
										<div class="col-lg-10">
											<select class="form-control" id="udepartment"
												name="udepartment">
												<c:forEach var="depart" items="${departmentList}">
													<option
														<c:if test="${userInfo.udepartment == depart.CODE_NAME}">selected="selected"</c:if>
														value="${depart.CODE}">${depart.CODE_NAME}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label">비밀번호</label>
										<div class="col-sm-10">
											<input type="password" class="form-control" id="password" name="password">
										</div>
									</div>
									<div class="form-group">
										<input class="btn btn-warning" type="submit" id="submit"
											value="Update Profile">
									</div>
								</form>
							</div>
							<!-- /content-panel -->
						</div>
						<!-- col-lg-12-->
					</div>
					<!-- /row -->
					</div>
				</div>
				<!-- /row -->
				<div class="col-lg-3 ds">
					<!--COMPLETED ACTIONS DONUTS CHART-->
					<h3>USER PROFILE</h3>
					<br>
					<div class="user-img">
						<div class="img"
							style="background-color: ${userInfo.profileBgColor}; width: 160px; height: 160px; line-height: 160px;">
							<span style="font-size: 15px; color: #E8E8E8;">${userInfo.theFirstLetterOfEmail}</span>
						</div>
					</div>
					<h2>${userInfo.uname}</h2>
					<i class="fa fa-map-marker" aria-hidden="true"></i>
					${userInfo.udepartment}
					<div style="height: 6px"></div>
					<i class="fa fa-sitemap" aria-hidden="true"></i>
					${userInfo.uphoneno}
					<div style="height: 6px"></div>
					<i class="fa fa-envelope-o" aria-hidden="true"></i>
					${userInfo.uemail} <br> <br>

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
		</div>
		<!-- /row -->
		</div>
	</section>
</section>
<!-- /MAIN CONTENT -->
<!--main content end-->
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />
<script type="text/javascript"
	src="<c:url value="/resources/javascript/calendar/moment.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/javascript/calendar/daterangepicker.js" />"></script>
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
<!-- bootstrap-daterangepicker -->
    <script>
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
          var startdate = picker.startDate.format('YYYY-MM-DD');
          var endDate = picker.endDate.format('YYYY-MM-DD');
          var param = { "startdate" : startdate, "endDate" : endDate};
          console.log(startdate);
          console.log(endDate);
          
          $.ajax({
  			type : "POST",
  			url : "/dataLoadByUno",
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
           var param = { "startdate" : date[0], "endDate" : date[1]};
           
           $.ajax({
   			type : "POST",
   			url : "/dataLoadByUno",
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
    </script>
    <!-- /bootstrap-daterangepicker -->