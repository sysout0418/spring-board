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
												name="uname" value="${userInfo.uname}" required="required">
										</div>
									</div>
									<div class="form-group">
										<label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰
											번호</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" id="uphoneno"
												name="uphoneno" value="${userInfo.uphoneno}" required="required">
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
										<label class="col-sm-2 col-sm-2 control-label">현재 비밀번호</label>
										<div class="col-sm-10">
											<input type="password" class="form-control" id="oldpassword" name="oldpassword" required="required">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label">새 비밀번호</label>
										<div class="col-sm-10">
											<input type="password" class="form-control" id="newpassword1" name="newpassword1" required="required">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label">새 비밀번호 확인</label>
										<div class="col-sm-10">
											<input type="password" class="form-control" id="newpassword2" name="newpassword2" required="required">
										</div>
									</div>
									<div class="form-group">
										<button class="btn btn-warning"
											>Update Profile</button>
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
<script type="text/javascript">
$(function(){
    $("#profile").validate()({
    	rules: {
    		newpassword1: {
                required : true
            },
    		newpassword2: {
                required : true,
                equalTo : newpassword1
            },
        },
        messages : {
            password: {
                required : "필수로입력하세요",
            },
            repassword: {
                required : "필수로입력하세요",
                equalTo : "비밀번호가 일치하지 않습니다."
            }
    }
    });
});
</script>