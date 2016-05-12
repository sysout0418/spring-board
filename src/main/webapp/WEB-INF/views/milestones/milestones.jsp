<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
		<h3>
			<i class="fa fa-angle-right"></i> Milestones
		</h3>
		<div class="col-lg-12">
			<div class="row">
				<div class="col-md-12">
					<div class="content-panel">
						<div class="row">
						<div class="col-xs-2">
						<h4>
							<i class="fa fa-angle-right"></i> Activity
						</h4>
						</div>
						
						<div class="col-sm-2 pull-right">
							<fieldset>
								<div class="control-groupZ pull-right">
									<div class="controls pull-right">
										<div class="input-prepend input-group">
										<div class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i></div>
											<input type="text" style="width: 200px" name="reservation"
												id="reservation" class="form-control"
												value="03/18/2013 - 03/23/2013" />
										</div>
									</div>
								</div>
							</fieldset>
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
			<div class="row">
				<div class="col-md-12">
					<div class="content-panel">
						<h4>
							<i class="fa fa-angle-right"></i> Milestones
						</h4>
						<div role="tabpanel">
							<!-- Nav tabs -->
							<div class="tabbable-panel">
								<div class="tabbable-line">
									<ul class="nav nav-tabs">
										<li <c:if test="${stat=='open'}"> class="active"</c:if>><a
											href="/milestones/open">Open</a></li>
										<li <c:if test="${stat=='closed'}"> class="active"</c:if>><a
											href="/milestones/closed">Closed</a></li>
										<li <c:if test="${stat=='all'}"> class="active"</c:if>><a
											href="/milestones/all">All</a></li>
									</ul>
								</div>
							</div>
						</div>
						<table class="table table-hover">
							<c:if test="${list == 'none'}">
								<tr style="height: 100px">
									<td colspan="6"
										style="text-align: center; vertical-align: middle;">No
										milestones to show</td>
								</tr>
							</c:if>
							<c:if test="${list != 'none'}">
								<c:forEach var="milestone" items="${list}">
									<tr onclick="location.href='/milestone/${milestone.mno}'"
										style="cursor: pointer;">
										<td
											<c:if test="${milestone.mstatement == '001'}"> style="background-color : #f9f9f9"</c:if>>
											<a href="/milestone/${milestone.mno}">${milestone.mtitle}</a>&nbsp;&nbsp;
											<c:if test="${milestone.isExpired}">
												<span style="color: #E50B00;">(Expired)</span>
											</c:if> <br /> ${milestone.countIssues} Issues<br /> <mark
												style="background-color: #f8fafc">
												<span style="font-size: 0.8em">${milestone.uname} /
													${milestone.pname}</span>
											</mark>
										</td>
										<td
											<c:if test="${milestone.mstatement == '001'}"> style="background-color : #f9f9f9"</c:if>>
											<div style="text-align: right">${milestone.completeIssuePercent}%
												complete</div>
											<div class="progress">
												<div class="progress-bar progress-bar-success"
													role="progressbar" aria-valuenow="60" aria-valuemin="0"
													aria-valuemax="100"
													style="width: ${milestone.completeIssuePercent}%;"></div>
											</div>
										</td>
									</tr>
								</c:forEach>
							</c:if>
						</table>
					</div>
					<!-- /content-panel -->
				</div>
				<!-- /col-md-12 -->
			</div>
			<!-- /row -->
		</div>
	</section>
	<!--wrapper -->
</section>
<!-- /MAIN CONTENT -->
<!--main content end-->
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />
<script type="text/javascript"
	src="<c:url value="/resources/javascript/calendar/moment.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/javascript/calendar/daterangepicker.js" />"></script>
<!-- datepicker -->
<script type="text/javascript">
	$(document)
			.ready(
					function() {
				
						var cb = function(start, end, label) {
							console.log("1");
							console.log(start.toISOString(), end.toISOString(),
									label);
							$('#reportrange_right span').html(
									start.format('MMMM D, YYYY') + ' - '
											+ end.format('MMMM D, YYYY'));
							//alert("Callback has fired: [" + start.format('MMMM D, YYYY') + " to " + end.format('MMMM D, YYYY') + ", label = " + label + "]");
						}

						var optionSet1 = {
								console.log("2");
							startDate : moment().subtract(29, 'days'),
							endDate : moment(),
							minDate : '01/01/2012',
							maxDate : '12/31/2015',
							dateLimit : {
								days : 60
							},
							showDropdowns : true,
							showWeekNumbers : true,
							timePicker : false,
							timePickerIncrement : 1,
							timePicker12Hour : true,
							ranges : {
								'Today' : [ moment(), moment() ],
								'Yesterday' : [ moment().subtract(1, 'days'),
										moment().subtract(1, 'days') ],
								'Last 7 Days' : [ moment().subtract(6, 'days'),
										moment() ],
								'Last 30 Days' : [
										moment().subtract(29, 'days'), moment() ],
								'This Month' : [ moment().startOf('month'),
										moment().endOf('month') ],
								'Last Month' : [
										moment().subtract(1, 'month').startOf(
												'month'),
										moment().subtract(1, 'month').endOf(
												'month') ]
							},
							opens : 'right',
							buttonClasses : [ 'btn btn-default' ],
							applyClass : 'btn-small btn-primary',
							cancelClass : 'btn-small',
							format : 'MM/DD/YYYY',
							separator : ' to ',
							locale : {
								applyLabel : 'Submit',
								cancelLabel : 'Clear',
								fromLabel : 'From',
								toLabel : 'To',
								customRangeLabel : 'Custom',
								daysOfWeek : [ 'Su', 'Mo', 'Tu', 'We', 'Th',
										'Fr', 'Sa' ],
								monthNames : [ 'January', 'February', 'March',
										'April', 'May', 'June', 'July',
										'August', 'September', 'October',
										'November', 'December' ],
								firstDay : 1
							}
						};

						$('#reportrange_right span').html(
								moment().subtract(29, 'days').format(
										'MMMM D, YYYY')
										+ ' - '
										+ moment().format('MMMM D, YYYY'));

						$('#reportrange_right').daterangepicker(optionSet1, cb);

						$('#reportrange_right').on('show.daterangepicker',
								function() {
									console.log("show event fired");
								});
						$('#reportrange_right').on('hide.daterangepicker',
								function() {
									console.log("hide event fired");
								});
						$('#reportrange_right')
								.on(
										'apply.daterangepicker',
										function(ev, picker) {
											console.log("3");
											console
													.log("apply event fired, start/end dates are "
															+ picker.startDate
																	.format('MMMM D, YYYY')
															+ " to "
															+ picker.endDate
																	.format('MMMM D, YYYY'));
										});
						$('#reportrange_right').on('cancel.daterangepicker',
								function(ev, picker) {
									console.log("cancel event fired");
								});

						$('#options1').click(
								function() {
									$('#reportrange_right').data(
											'daterangepicker').setOptions(
											optionSet1, cb);
								});

						$('#options2').click(
								function() {
									$('#reportrange_right').data(
											'daterangepicker').setOptions(
											optionSet2, cb);
								});

						$('#destroy').click(
								function() {
									$('#reportrange_right').data(
											'daterangepicker').remove();
								});

					});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#reservation').daterangepicker(null, function(start, end, label) {
			console.log(start.toISOString(), end.toISOString(), label);
		});
	});
</script>
<!-- /datepicker -->
<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			type : "POST",
			url : "/test",
			success : function(data2) {
				var dateData = data2;

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
					labels : [ 'Value' ],
				});
			},
			error : function(xhr, status, error) {
				alert("에러발생");
			}
		});
	});
</script>