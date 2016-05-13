<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<!-- js placed at the end of the document so the pages load faster -->
<script type="text/javascript"
	src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/jquery.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/javascript/bootstrap/bootstrap.min.js" />"></script>

<!--BACKSTRETCH-->
<!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
<script type="text/javascript"
	src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/jquery.backstretch.min.js" />"></script>
<script>
	$.backstretch("<c:url value="/resources/img/login-bg.jpg" />", {
		speed : 500
	});
</script>

<style type="text/css">
.layer {
	display: none;
	position: fixed;
	_position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 100;
}

.layer .bg {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: #000;
	opacity: .5;
	filter: alpha(opacity = 50);
}

.layer .pop-layer {
	display: block;
}

.pop-layer {
	display: none;
	position: absolute;
	top: 30%;
	left: 50%;
	width: 410px;
	height: auto;
	background-color: #fff;
	border: 5px solid #3571B5;
	z-index: 10;
}

.pop-layer .pop-container {
	padding: 20px 25px;
}

.pop-layer p.ctxt {
	color: #666;
	line-height: 25px;
}

.pop-layer .btn-r {
	width: 100%;
	margin: 10px 0 20px;
	padding-top: 10px;
	border-top: 1px solid #DDD;
	text-align: right;
}

a.cbtn {
	display: inline-block;
	height: 25px;
	padding: 0 14px 0;
	border: 1px solid #304a8a;
	background-color: #3f5a9d;
	font-size: 13px;
	color: #fff;
	line-height: 25px;
}

a.cbtn:hover {
	border: 1px solid #091940;
	background-color: #1f326a;
	color: #fff;
}
</style>

<!-- Modal -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">LOGIN FAILED</h4>
			</div>
			<div class="modal-body">이미 탈퇴한 회원입니다. 관리자에게 문의하세요.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
				<h4 class="modal-title" id="myModalLabel">LOGIN FAILED</h4>
			</div>
			<div class="modal-body">가입 승인되지 않은 ID 입니다. 관리자에게 문의하세요.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
				<h4 class="modal-title" id="myModalLabel">LOGIN FAILED</h4>
			</div>
			<div class="modal-body">ID 또는 PASSWORD가 틀렸습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<!-- Modal4 -->
<div class="modal fade" id="myModal4" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">LOGIN FAILED</h4>
			</div>
			<div class="modal-body">등록되지 않은 사용자 입니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<div id="login-page">
	<div class="container">
		<c:url value="/login" var="login" />
		<form id="frm" name="frm" method="post" class="form-login">
			<c:choose>
				<c:when test="${param.error1 != null}">
					<script type="text/javascript">
						// 가입 승인 안된 경우
						$(document).ready(function() {
							$('#myModal1').modal('show');
						});
					</script>
				</c:when>
				<c:when test="${param.error2 != null}">
					<script type="text/javascript">
						// 탈퇴한 유저인 경우
						$(document).ready(function() {
							$('#myModal2').modal('show');
						});
					</script>
				</c:when>
				<c:when test="${param.error3 != null}">
					<script type="text/javascript">
						// 암호 틀린 경우
						$(document).ready(function() {
							$('#myModal3').modal('show');
						});
					</script>
				</c:when>
				<c:when test="${param.error4 != null}">
					<script type="text/javascript">
						// 아이디 존재하지 않는 경우
						$(document).ready(function() {
							$('#myModal4').modal('show');
						});
					</script>
				</c:when>
			</c:choose>
			<h2 class="form-login-heading">sign in now</h2>
			<div class="login-wrap">
				<input type="text" id="uemail" name="uemail" class="form-control"
					placeholder="Email Address" required="required" autofocus> <br> 
					<input type="password" id="upassword" name="upassword"
					class="form-control" placeholder="Password" required="required"> <label
					class="checkbox"> <span class="pull-right"> <a
						data-toggle="modal" href="login.html#myModal"> Forgot
							Password?</a>
				</span>
				</label>
				<button class="btn btn-theme btn-block" type="button" id="signIn">
					<i class="fa fa-lock"></i> SIGN IN
				</button>
				<hr>

				<div class="login-social-link centered">
					<p>or you can sign in via your social network</p>
					<button class="btn btn-facebook" type="button" id="goFacebookLogin">
						<i class="fa fa-facebook"></i> Facebook
					</button>
					<!-- <button class="btn btn-twitter" type="submit">
						<i class="fa fa-twitter"></i> Twitter
					</button> -->
				</div>
	
				<div class="registration">
					Don't have an account yet?<br /> <a class="" href="/join">
						Create an account </a>
				</div>

			</div>
			</form>
			
			<!-- Modal -->
			<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
				tabindex="-1" id="myModal" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title">Forgot Password ?</h4>
						</div>
						<form:form action="/email/send" method="post">
						<div class="modal-body">
							<p>Enter your e-mail address below to reset your password.</p>
							<input type="text" name="address" id="address" placeholder="Email"
								autocomplete="off" class="form-control placeholder-no-fix">

						</div>
						<div class="modal-footer">
							<button data-dismiss="modal" class="btn btn-default"
								type="button">Cancel</button>
							<button class="btn btn-theme" type="submit">Submit</button>
						</div>
						</form:form>
					</div>
				</div>
			</div>
			<!-- modal -->

		

	</div>
</div>
</body>
<script>
	$(document).ready(function() {
		var f = document.frm;
		
		$('#signIn').click(function() {
			f.action = "/login";
			f.submit();
		});
		
		$('#goFacebookLogin').click(function() {
			f.action = "/signin/facebook";
			f.submit();
		});
	});
</script>
</html>