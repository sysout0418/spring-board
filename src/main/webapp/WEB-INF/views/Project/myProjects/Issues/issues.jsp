<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header2_header.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header3_menu_project.jsp" />
<link href="<c:url value="/resources/css/calendar/calendar.css" />" rel="stylesheet" type="text/css" />
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper site-min-height">
		<h3>
			<i class="fa fa-angle-right"></i> Project #${pno} / Issues
		</h3>
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
											href="/${uno}/${pno}/issues/open">Open <span class="badge">${issueOpenCnt}</span></a></li>
										<li <c:if test="${stat=='closed'}"> class="active"</c:if>><a
											href="/${uno}/${pno}/issues/closed">Closed <span class="badge">${issueClosedCnt}</span></a></li>
										<li <c:if test="${stat=='all'}"> class="active"</c:if>><a
											href="/${uno}/${pno}/issues/all">All <span class="badge">${issueAllCnt}</span></a></li>
										<div style="text-align: right">
										<li><a href="/${uno}/${pno}/issues/new"
											class="btn btn-success">New Issues</a></li>
										</div>
									</ul>
								</div>
							</div>

							<!-- Tab panes -->
							<form name="frm" id="frm" method="post">
								<c:choose>
									<c:when test="${!empty selectedUserName}">
										<input type="hidden" id="userNo" name="userNo"
											value="${searchUno}">
									</c:when>
									<c:otherwise>
										<input type="hidden" id="userNo" name="userNo" value="">
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${!empty selectedMilestone}">
										<input type="hidden" id="mno" name="mno" value="${mno}">
									</c:when>
									<c:otherwise>
										<input type="hidden" id="mno" name="mno" value="">
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${!empty selectedLabelName}">
										<input type="hidden" id="lno" name="lno" value="${lno}">
									</c:when>
									<c:otherwise>
										<input type="hidden" id="lno" name="lno" value="">
									</c:otherwise>
								</c:choose>
								<!-- update -->
								<input type="hidden" id="status" name="status" value="">
								<input type="hidden" id="userNo2" name="userNo2" value="">
								<input type="hidden" id="mno2" name="mno2" value="">
								<!-- //update -->
								
								<input type="checkbox" name="cbListAll"
									onclick="checkCbListAll()"
									style="position: absolute; top: 120px; left: 90px;">
								<div class="tab-content well" id="originalForm"
									style="display: block;">
									<div style="margin-left: 20px;">
										<div class="btn-group">
											<a href="#" class="btn btn-default"> <c:choose>
													<c:when test="${!empty selectedUserName}">
														<span id="selectedAssign">${selectedUserName}</span>
													</c:when>
													<c:otherwise>
														<span id="selectedAssign">Assignee</span>
													</c:otherwise>
												</c:choose>
											</a> <a href="#" class="btn btn-default dropdown-toggle"
												data-toggle="dropdown" aria-expanded="false"><span
												class="caret" style="height: 10px; margin-top: 10px;"></span></a>
											<ul class="dropdown-menu">
												<li class="userNo1"><a alt="" href="#">All</a></li>
												<c:forEach var="users" items="${userList}">
													<li class="userNo1"><a alt="${users.uno}" href="#">${users.uname}</a></li>
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
														href="#" style="color: ${label.lbgcolor}">${label.ltitle}</a></li>
												</c:forEach>
											</ul>
										</div>
										<a href="#" id="searchBtn" class="btn btn-warning">Search Issues</a>
									</div>
								</div>

								<div class="tab-content well" id="updateIssuesForm"
									style="display: none;">
									<div style="margin-left: 20px;">
										<div class="btn-group">
											<a href="#" class="btn btn-default"> <span
												id="selectedStatus">Status</span></a> <a href="#"
												class="btn btn-default dropdown-toggle"
												data-toggle="dropdown" aria-expanded="false"> <span
												class="caret" style="height: 10px; margin-top: 10px;"></span></a>
											<ul class="dropdown-menu">
												<li class="status"><a alt="" href="#">Status</a></li>
												<li class="status"><a alt="Open" href="#">Oepn</a></li>
												<li class="status"><a alt="Closed" href="#">Closed</a></li>
											</ul>
										</div>

										<div class="btn-group">
											<a href="#" class="btn btn-default"> <span
												id="selectedAssign2">Assignee</span>
											</a> <a href="#" class="btn btn-default dropdown-toggle"
												data-toggle="dropdown" aria-expanded="false"> <span
												class="caret" style="height: 10px; margin-top: 10px;"></span></a>
											<ul class="dropdown-menu">
												<li class="userNo2"><a alt="0" href="#">Unassigned</a></li>
												<c:forEach var="users" items="${userList}">
													<li class="userNo2"><a alt="${users.uno}" href="#">${users.uname}</a></li>
												</c:forEach>
											</ul>
										</div>

										<div class="btn-group">
											<a href="#" class="btn btn-default"> <span
												id="selectedMilestone2">Milestone</span>
											</a> <a href="#" class="btn btn-default dropdown-toggle"
												data-toggle="dropdown" aria-expanded="false"> <span
												class="caret" style="height: 10px; margin-top: 10px;"></span></a>
											<ul class="dropdown-menu">
												<li class="milestoneNo2"><a id="milestoneNo2" alt=""
													href="#">Milestone</a></li>
												<c:forEach var="milestone" items="${milestoneList}">
													<li class="milestoneNo2"><a id="milestoneNo2"
														alt="${milestone.mno}" href="#">${milestone.mtitle}</a></li>
												</c:forEach>
											</ul>
										</div>
										<a href="#" onclick="updateIssueList()" class="btn btn-success">Update Issues</a>
									</div>
								</div>

								<input type="hidden" name="isCheckCbListAll" value="F">

								<c:choose>
									<c:when test="${issuesList == 'none'}">
										<div style="height: 100px">
											<p style="text-align: center; vertical-align: middle;">
												No Issues to show</p>
										</div>
									</c:when>
									<c:otherwise>
										<ul class="list-group">
											<c:forEach var="issues" items="${issuesList}"
												varStatus="status">
												<input type="hidden" name="issueState"
													value="${issues.istatement }">
												<li class="list-group-item" id="liEvent" alt="/${issues.uno}/${issues.pno}/issue/${issues.ino}" style="cursor: pointer;"><span class="badge"><i
														class="fa fa-comment" aria-hidden="true"></i>
														${issues.commentCnt}</span> <input type="checkbox" name="cbList"
													value="${issues.ino}" onclick="openUpdateIssuesForm()">
														<span style="font-weight: bold; color: black;">${issues.ititle}</span>
												 / <span class="label color-label has_tooltip"
													style="background-color:
															${issues.lbgcolor}; color: #FFFFFF"
													title="" data-container="body" data-original-title="">${issues.ltitle}</span>&nbsp;&nbsp;
													<c:if test="${issues.isExpired}"><span style="color: #E50B00;">(Expired)</span></c:if><br>
													${issues.iregdate} / Assignee ${issues.uname} / <i
													class="fa fa-clock-o" aria-hidden="true"></i> <a
													href="/${issues.uno}/${issues.pno}/milestone/${issues.mno}">${issues.mtitle}</a>
												</li>
											</c:forEach>
										</ul>
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
	// graph
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
          var pno = '${pno}';
          var param = { "startDate" : startDate, "endDate" : endDate, "pno" : pno };
          
          $.ajax({
  			type : "POST",
  			url : "/getIssueData",
  			data : param,
  			success : function(data2) {
  				$('#chart').empty();
  				$('#chart').removeAttr('style');
  				var dateData = data2;
  				console.log("datas1 : " + dateData.length)
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
	  					labels : [ 'Issues' ],
	  				});
  				} else {
  					$('#chart').empty();
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
           var pno = '${pno}';
           var param = { "startDate" : date[0], "endDate" : date[1], "pno" : pno };
           
           $.ajax({
   			type : "POST",
   			url : "/getIssueData",
   			data : param,
   			success : function(data2) {
   				$('#chart').empty();
   				$('#chart').removeAttr('style');
   				var dateData = data2;
   				console.log("datas2 : " + dateData.length)
   				if (dateData.length > 0) {
   					$('#chart').empty();
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
	   					labels : [ 'Issues' ],
	   				});
   				} else {
   					$('#chart').empty();
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
        
        // li onclick 때문에 체크박스 이벤트 안먹는 현상 해결하는 자바스크립트
        $(document).on('click', '#liEvent', function() {
    		if (event.target.type == 'checkbox')
    			return;

    		location.href = $(this).attr('alt');
        });
        
      });
	/* $(document).ready(function() {
		$.ajax({
			type: "POST",
			url: "/getIssueCntByDate",
			success : function(data2) {
				var dateData = data2;
				
				new Morris.Line({
					element: 'chart',
					data: dateData,
					xkey: 'date',
					ykeys: ['value'],
					labels: ['이슈 개수'],
				});
			},
			error : function(xhr, status, error) {
				alert("에러발생");
			}
		});
	}); */

	// search
	$('.dropdown-menu > .userNo1 > a').bind('click', function() {
		var userName = $(this).text();
		var userNo = $(this).attr("alt");
		console.log(userNo);
		console.log(userName);
		$("#userNo").val(userNo);
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
	$('#searchBtn').click(
			function() {
				$('#searchBtn').attr(
						"href",
						"/${uno}/${pno}/issues/${stat}/search?userNo="
								+ $("#userNo").val() + "&mno="
								+ $("#mno").val() + "&lno=" + $("#lno").val());
			});
	
	// update
	$('.dropdown-menu > .status > a').bind('click', function() {
		var lTitle = $(this).text();
		var labelNo = $(this).attr("alt");
		console.log(labelNo);
		$("#status").val(labelNo);
		$("#selectedStatus").text(lTitle);
	});
	$('.dropdown-menu > .userNo2 > a').bind('click', function() {
		var userName = $(this).text();
		var userNo = $(this).attr("alt");
		console.log(userNo);
		console.log(userName);
		$("#userNo2").val(userNo);
		$("#selectedAssign2").text(userName);
	});
	$('.dropdown-menu > .milestoneNo2 > a').bind('click', function() {
		var mTitle = $(this).text();
		var milestoneNo = $(this).attr("alt");
		console.log(milestoneNo);
		$("#mno2").val(milestoneNo);
		$("#selectedMilestone2").text(mTitle);
	});

	//문자열 공백제거 함수
	String.prototype.stripspace = function() {
		return this.replace(/ /g, "");
	}

	//체크박스 전체선택
	function checkCbAll(cbList, isChecked) {
		if (cbList) {
			if (typeof (cbList.length) == "undefined") {
				if (!cbList.disabled)
					cbList.checked = isChecked;
			} else {
				for (var i = 0; i < cbList.length; i++) {
					if (cbList[i].type.toUpperCase() == 'CHECKBOX') {
						if (cbList[i].value.stripspace() != ""
								&& !cbList[i].disabled) {
							cbList[i].checked = isChecked;
						}
					}
				}
			}
		}
	}

	function checkCbListAll() {
		var f = document.frm;

		if (f.isCheckCbListAll.value != "T") {
			checkCbAll(f.cbList, true);
			f.cbListAll.checked = true;
			f.isCheckCbListAll.value = "T";
			openUpdateIssuesForm();
		} else {
			checkCbAll(f.cbList, false);
			f.cbListAll.checked = false;
			f.isCheckCbListAll.value = "F";
			closeUpdateIssuesForm();
		}

	}

	function updateIssueList() {
		var f = document.frm;
		var items = "";

		if (!f.cbList)
			return false;

		if (typeof (f.cbList.length) == "undefined") {
			if (f.cbList.checked)
				items = f.cbList.value;
		} else {
			for (var i = 0; i < f.cbList.length; i++) {
				if (f.cbList[i].checked) {
					items += ((items) ? "," : "") + f.cbList[i].value;
				}
			}
		}

		if (items == "") {
			alert("업데이트 할 이슈를 선택하세요.");
			return false;
		}

		if (confirm("선택한 이슈를 설정한 값으로 업데이트 하시겠습니까?")) {
			f.action = "/issues/directEdit/${uno}/${pno}";
			f.submit();
		}
	}
	
	function openUpdateIssuesForm() {
		var chk = document.getElementsByName("cbList");
		var len = chk.length; 	// 체크박스의 전체 개수
		var checkCnt = 0;		// 체크된 체크박스의 개수
		for(var i = 0; i < len; i++) {
			if(chk[i].checked == true) {
				checkCnt++;
			}
		}
		if (checkCnt != 0 && checkCnt > 0) {
			$('#originalForm').attr('style', 'display: none;');
			$('#updateIssuesForm').attr('style', 'display: block;');
		} else {
			$('#updateIssuesForm').attr('style', 'display: none;');
			$('#originalForm').attr('style', 'display: block;');
		}
	}

	function closeUpdateIssuesForm() {
		$('#updateIssuesForm').attr('style', 'display: none;');
		$('#originalForm').attr('style', 'display: block;');
	}
</script>