<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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

		<div class="col-lg-12">
			<div class="row">
				<div class="col-lg-9 main-chart">
					<!-- BASIC FORM ELELEMNTS -->
					<h3>
						<i class="fa fa-angle-right"></i> Profile Settings
					</h3>
					<div class="row mt">
						<div class="col-lg-12">
							<div class="content-panel">
								<h4><i class="fa fa-angle-right"></i> Chart Example 1</h4>
                              	<div id="chart" style="height: 250px;"></div>
							</div>
							<!-- /content-panel -->
						</div>
						<!-- col-lg-12-->
					</div>
					<!-- /row -->
					<div class="row mt">
						<div class="col-lg-12">
							<div class="content-panel">
								<form action="profile" method="post" id="profile" class="form-horizontal style-form">
									<div class="form-group">
										<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" id="uemail"
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
											<input type="password" class="form-control" id="password">
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
        new Morris.Line({
        	  // ID of the element in which to draw the chart.
        	  element: 'chart',
        	  // Chart data records -- each entry in this array corresponds to a point on
        	  // the chart.
        	  data: [
        	    { year: '2008', value: 100 },
        	    { year: '2009', value: 10 },
        	    { year: '2010', value: 5 },
        	    { year: '2011', value: 5 },
        	    { year: '2012', value: 20 }
        	  ],
        	  // The name of the data record attribute that contains x-values.
        	  xkey: 'year',
        	  // A list of names of data record attributes that contain y-values.
        	  ykeys: ['value'],
        	  // Labels for the ykeys -- will be displayed when you hover over the
        	  // chart.
        	  labels: ['Value']
        	});
</script>