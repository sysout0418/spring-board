<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header2_header.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header3_menu_dash.jsp" />
<script type="text/javascript" src="<c:url value="/resources/javascript/jquery/jquery-1.12.1.min.js" />"></script>
<link href="<c:url value="/resources/css/calendar/calendar.css" />"
	rel="stylesheet" type="text/css" />
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<section id="main-content">
	<section class="wrapper site-min-height">
		<h3>
			<i class="fa fa-angle-right"></i> Profile Settings
		</h3>

		<div class="col-lg-12">
			<div class="row">
				<div class="col-lg-9 main-chart">
					<!-- BASIC FORM ELELEMNTS -->
					<div class="col-lg-12">
						<!-- /row -->
						<div class="row">
							<div class="col-lg-12">
								<div class="content-panel">
									<h4>
										<i class="fa fa-angle-right"></i> User Report
									</h4>
									<form name="profile" id="profile" method="post"
										class="form-horizontal style-form">
										<%-- <c:choose>
											<c:when test="${param.result == 'Y'}">
												<script type="text/javascript">
													// 현재 비밀번호도 맞고 새로운 비밀번호도 서로 일치하는 경우
													$(document).ready(function() {
														$('#myModal1').modal('show');
													});
												</script>
											</c:when>
											<c:when test="${param.result ==  'N1'}">
												<script type="text/javascript">
													// 새로운 비번이 서로 일치하지 않는 경우
													$(document).ready(function() {
														$('#myModal2').modal('show');
													});
												</script>
											</c:when>
											<c:when test="${param.result == 'N2'}">
												<script type="text/javascript">
													// 현재 비밀번호가 일치하지 않는 경우
													$(document).ready(function() {
														$('#myModal3').modal('show');
													});
												</script>
											</c:when>
										</c:choose> --%>
										<div class="form-group">
											<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
											<div class="col-lg-10">
												<input type="text" class="form-control" id="uemail"
													name="uemail" readonly="readonly"
													value="${userInfo.uemail}">
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
													name="uphoneno" value="${userInfo.uphoneno}"
													required="required">
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
											<label class="col-sm-2 col-sm-2 control-label">현재
												비밀번호</label>
											<div class="col-sm-10">
												<input type="password" class="form-control" id="oldpassword"
													name="oldpassword" required="required">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 col-sm-2 control-label">새 비밀번호</label>
											<div class="col-sm-10">
												<input type="password" class="form-control"
													id="newpassword1" name="newpassword1" required="required">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 col-sm-2 control-label">새 비밀번호
												확인</label>
											<div class="col-sm-10">
												<input type="password" class="form-control"
													id="newpassword2" name="newpassword2" required="required">
											</div>
										</div>
										<div class="form-group">
											<input type="submit" class="btn btn-warning" id="profileUpdateBtn" value="Update Profile">
											<!-- <input type="button" class="btn btn-danger" id="profileExpireBtn" value="Withdraw This Site"> -->
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
					<div style="width: 150px; position: absolute; top: 100px; right: 50px;">
						<h2>${userInfo.uname}</h2>
						<i class="fa fa-map-marker" aria-hidden="true"></i>
						${userInfo.udepartment}
						<div style="height: 6px"></div>
						<i class="fa fa-sitemap" aria-hidden="true"></i>
						${userInfo.uphoneno}
						<div style="height: 6px"></div>
						<i class="fa fa-envelope-o" aria-hidden="true"></i>
						${userInfo.uemail} <br> <br>
					</div>

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
	</section>
</section>
<!-- /MAIN CONTENT -->
<!--main content end-->

<!-- Modal -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">CHECK YOUR PASSWORD</h4>
			</div>
			<div class="modal-body">회원정보가 수정 되었습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal"
					id="closeBtn2">Close</button>
			</div>
		</div>
	</div>
</div>

<!-- Modal2 -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">CHECK YOUR NEW
					PASSWORD</h4>
			</div>
			<div class="modal-body">입력하신 새로운 비밀번호가 서로 일치하지 않습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal"
					id="closeBtn">Close</button>
			</div>
		</div>
	</div>
</div>

<!-- Modal3 -->
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">CHECK YOUR PASSWORD</h4>
			</div>
			<div class="modal-body">입력하신 기존 비밀번호가 틀렸습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal"
					id="closeBtn2">Close</button>
			</div>
		</div>
	</div>
</div>

<!-- Modal4 -->
<!-- <div class="modal fade" id="myModal4" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">WARNING</h4>
			</div>
			<div class="modal-body">
				탈퇴 처리는 3일 ~ 7일 정도가 소요 됩니다.<br>
				정말로 이 사이트를 탈퇴 하시겠습니까?
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal"
					id="closeBtn2">Close</button>
			</div>
		</div>
	</div>
</div> -->

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
		
		$('#closeBtn').click(function() {
			$('#newpassword1').val('');
			$('#newpassword2').val('');
			$('#newpassword1').focus();
		});

		$('#closeBtn2').click(function() {
			$('#oldpassword').val('');
			$('#oldpassword').focus();
		});
		
		$("#profileUpdateBtn").click(function() {
			$('#profile').validate({
				submitHandler: function() {
					var uEmail = $('#uemail').val();
					var uName = $('#uname').val();
					var uPhoneNo = $('#uphoneno').val();
					var uDepartment = $('#udepartment').val();
					var oldPw = $('#oldpassword').val();
					var newPw1 = $('#newpassword1').val();
					var newPw2 = $('#newpassword2').val();
					
					var allData = {
							"uemail" : uEmail,
							"uname" : uName,
							"uphoneno" : uPhoneNo,
							"udepartment" : uDepartment,
							"oldpassword" : oldPw,
							"newpassword1" : newPw1,
							"newpassword2" : newPw2
					};
					
					$.ajax({
						type : "POST",
						url : "/profile",
						data : allData,
						success : function(data) {
							if ($.trim(data) == 'Y') {
								$('#myModal1').modal('show');
								$('#oldpassword').val('');
								$('#newpassword1').val('');
								$('#newpassword2').val('');
							} else if ($.trim(data) == 'N1') {
								$('#myModal2').modal('show');
								$('#newpassword1').val('');
								$('#newpassword2').val('');
								$('#newpassword1').focus();
							} else if ($.trim(data) == 'N2') {
								$('#myModal3').modal('show');
								$('#oldpassword').val('');
								$('#oldpassword').focus();
							}
							return true;
						},
						error : function(xhr, status, error) {
			   				console.log("server error");
			   			}
					});
	            }
			});
		});
		
		$('#profileExpireBtn').click(function() {
			console.log("탈퇴버튼");
		});
		
	});
	
	function myNavFunction(id) {
		$("#date-popover").hide();
		var nav = $("#" + id).data("navigation");
		var to = $("#" + id).data("to");
		console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year + '/' + to.day);
	}
</script>