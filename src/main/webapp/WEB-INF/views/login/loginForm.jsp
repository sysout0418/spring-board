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

<!-- <button class="btn btn-success btn-lg" data-toggle="modal"
		data-target="#myModal">Launch Modal</button> -->

<!-- Modal -->
<!-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">로그인 실패!</h4>
			</div>
			<div class="modal-body">아이디 또는 비밀번호가 틀렸습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div> -->

<!-- Modal2 -->
<div class="layer">
	<div class="bg"></div>
	<div id="layer2" class="pop-layer">
		<div class="pop-container">
			<div class="pop-conts">
				<!--content //-->
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">LOGIN FAILED</h4>
				</div>
				<div class="modal-body">ID 또는 PASSWORD가 틀렸습니다.</div>
				<div class="modal-footer">
					<a href="#" class="btn btn-info" id="closeBtn">Close</a>
				</div>
				<!--// content-->
			</div>
		</div>
	</div>
</div>

<div class="layer3">
	<div class="bg2"></div>
	<div id="layer4" class="pop-layer">
		<div class="pop-container">
			<div class="pop-conts">
				<!--content //-->
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">LOGIN FAILED</h4>
				</div>
				<div class="modal-body">가입되지 않은 ID 입니다.</div>
				<div class="modal-footer">
					<a href="#" class="btn btn-info" id="closeBtn">Close</a>
				</div>
				<!--// content-->
			</div>
		</div>
	</div>
</div>


<div id="login-page">
	<div class="container">
		<c:url value="/login" var="login" />
		<form:form cssClass="form-login" action="${login}" method="post">
			<c:choose>
				<c:when test="${param.error != null}">
					<script type="text/javascript">
						$(document).ready(function() {
							console.log("들어오나?");
							//$('#myModal').modal('show');
							var el = 'layer2';
							var temp = $('#' + el);
							var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수

							if(bg){
								$('.layer').fadeIn();	//'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
							}else{
								temp.fadeIn();
							}

							// 화면의 중앙에 레이어를 띄운다.
							if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
							else temp.css('top', '0px');
							if (temp.outerWidth() < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
							else temp.css('left', '0px');

							temp.find('#closeBtn').click(function(e){
								if(bg){
									$('.layer').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
								}else{
									temp.fadeOut();
								}
								e.preventDefault();
							});
							
							$('.layer .bg').click(function(e){	//배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
								$('.layer').fadeOut();
								e.preventDefault();
							});
						});
					</script>
				</c:when>
				<c:when test="${param.error2 != null}">
					<script type="text/javascript">
						$(document).ready(function() {
							console.log("들어오나?");
							//$('#myModal').modal('show');
							var el = 'layer4';
							var temp = $('#' + el);
							var bg = temp.prev().hasClass('bg2');	//dimmed 레이어를 감지하기 위한 boolean 변수

							if(bg){
								$('.layer3').fadeIn();	//'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
							}else{
								temp.fadeIn();
							}

							// 화면의 중앙에 레이어를 띄운다.
							if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
							else temp.css('top', '0px');
							if (temp.outerWidth() < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
							else temp.css('left', '0px');

							temp.find('#closeBtn').click(function(e){
								if(bg){
									$('.layer3').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
								}else{
									temp.fadeOut();
								}
								e.preventDefault();
							});
							
							$('.layer3 .bg2').click(function(e){	//배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
								$('.layer3').fadeOut();
								e.preventDefault();
							});
						});
					</script>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			<h2 class="form-login-heading">sign in now</h2>
			<div class="login-wrap">
				<input type="text" id="uemail" name="uemail" class="form-control"
					placeholder="Email Address" required autofocus> <br> <input
					type="password" id="upassword" name="upassword"
					class="form-control" placeholder="Password"> <label
					class="checkbox"> <span class="pull-right"> <a
						data-toggle="modal" href="login.html#myModal"> Forgot
							Password?</a>
				</span>
				</label>
				<button class="btn btn-theme btn-block" type="submit">
					<i class="fa fa-lock"></i> SIGN IN
				</button>
				<hr>

				<div class="login-social-link centered">
					<p>or you can sign in via your social network</p>
					<button class="btn btn-facebook" type="submit">
						<i class="fa fa-facebook"></i> Facebook
					</button>
					<button class="btn btn-twitter" type="submit">
						<i class="fa fa-twitter"></i> Twitter
					</button>
				</div>
				<div class="registration">
					Don't have an account yet?<br /> <a class="" href="/join">
						Create an account </a>
				</div>

			</div>

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
						<div class="modal-body">
							<p>Enter your e-mail address below to reset your password.</p>
							<input type="text" name="email" placeholder="Email"
								autocomplete="off" class="form-control placeholder-no-fix">

						</div>
						<div class="modal-footer">
							<button data-dismiss="modal" class="btn btn-default"
								type="button">Cancel</button>
							<button class="btn btn-theme" type="button">Submit</button>
						</div>
					</div>
				</div>
			</div>
			<!-- modal -->

		</form:form>

	</div>
</div>

</body>
</html>