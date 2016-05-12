<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header2_header.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header3_menu_dash.jsp" />
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
				<h4><i class="fa fa-angle-right"></i> Basic Table</h4>
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
					<h4><i class="fa fa-angle-right"></i> Basic Table</h4>
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
                        	<tr style="height: 100px"><td colspan="6" style="text-align: center; vertical-align: middle;">
                        	No milestones to show
                        	</td></tr>
                        	</c:if>
                        	<c:if test="${list != 'none'}">
							<c:forEach var="milestone" items="${list}">
								<tr onclick="location.href='/milestone/${milestone.mno}'" style="cursor: pointer;">
									<td
										<c:if test="${milestone.mstatement == '001'}"> style="background-color : #f9f9f9"</c:if>>
										<a href="/milestone/${milestone.mno}">${milestone.mtitle}</a>&nbsp;&nbsp;
										<c:if test="${milestone.isExpired}">
											<span style="color: #E50B00;">(Expired)</span>
										</c:if>
										<br />
										${milestone.countIssues} Issues<br /> <mark
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
<script type="text/javascript">
$(document).ready(function() {
	var date = [];
	var value = [];
	
	$.ajax({
		type: "POST",
		url: "/test",
		dataType: "JSON",
		success : function(data) {
			console.log(data[0].date);
			console.log(data[0].value);
			for (var i = 0; i < data.length; i++) {
				date.push(data[i].date.substring(0, 4));
				value.push(data[i].value);
			}
			console.log("date[] : " + date);
			console.log("value[] : " + value);
		},
		error : function(xhr, status, error) {
			alert("에러발생");
		}
	});
	
	new Morris.Line({
		// ID of the element in which to draw the chart.
		element: 'chart',
		// Chart data records -- each entry in this array corresponds to a point on
		// the chart.
		data: [
			{ "date": date[0], "value": value[0] }
		],
		// The name of the data record attribute that contains x-values.
		xkey: 'date',
		// A list of names of data record attributes that contain y-values.
		ykeys: ['value'],
		// Labels for the ykeys -- will be displayed when you hover over the
		// chart.
		labels: ['Value'],
	});
});

/* new Morris.Line({
	  // ID of the element in which to draw the chart.
	  element: 'chart',
	  // Chart data records -- each entry in this array corresponds to a point on
	  // the chart.
	  data: [
	    { "date": '2012', "value": 20 },
	    { "date": '2013', "value": 10 },
	    { "date": '2014', "value": 5 },
	    { "date": '2015', "value": 5 },
	    { "date": '2016', "value": 20 }
	  ],
	  // The name of the data record attribute that contains x-values.
	  xkey: 'date',
	  // A list of names of data record attributes that contain y-values.
	  ykeys: ['value'],
	  // Labels for the ykeys -- will be displayed when you hover over the
	  // chart.
	  labels: ['Value'],
	}); */
	
	$.ajax(this.href, {
	    success: function(data) {
	    	console.log("ajax success");
	    },
	    error: function() {
	    	console.log("ajax failed");
	    }
	 });
	
	/* $(document).ready(function() {
		$.ajax({
			type: "POST",
			url: "/test",
			dataType: "JSON",
			success : function(data) {
				console.log(data[0].date);
				console.log(data[0].value);
			},
			error : function(xhr, status, error) {
				alert("에러발생");
			}
		});
	}); */
</script>