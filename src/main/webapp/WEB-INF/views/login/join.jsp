<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">CHECK YOUR E-MAIL</h4>
			</div>
			<div class="modal-body">E-MAIL 형식을 확인해주세요.</div>
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
				<h4 class="modal-title" id="myModalLabel">CHECK YOUR E-MAIL</h4>
			</div>
			<div class="modal-body">이미 사용 중인 E-MAIL 입니다.</div>
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
			<div class="modal-body">사용 가능한 E-MAIL 입니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<div id="login-page">
	<div class="container">
		<form:form cssClass="form-login" method="post" action="/join" commandName="UserInfo">
			<h2 class="form-login-heading">sign up</h2>
			<div class="login-wrap">
				<input type="email" id="uemail" name="uemail" class="form-control"
					placeholder="Email" onblur="checkId()" maxlength="20" required
					autofocus><br> 
				<input type="text" class="form-control" id="uname" name="uname"
					placeholder="Name" maxlength="20" required><br>
				<input type="text" class="form-control" id="uphoneno" name="uphoneno"
					placeholder="Phone Number" maxlength="20" required><br>
				<input type="password" id="upassword" name="upassword"
					class="form-control" placeholder="Password" maxlength="20" required>
				<br>
				<!-- <button type="button" class="btn btn-theme" type="submit"><i class="fa fa-lock"></i> SIGN UP</button> -->
				<div class="login-social-link centered">
					<button class="btn btn-theme" type="submit" style="width: 100px;">
						<i class="fa fa-lock"></i> SIGN UP
					</button>
					<button type="button" class="btn btn-theme04" onclick="history.back(-1);" style="width: 100px;">
						<i class="fa fa-share" aria-hidden="true"></i> BACK
					</button>
				</div>
			</div>
		</form:form>
	</div>
</div>

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

<script type="text/javascript">
	function checkId() {
		// email 정규표현식
		var checkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
		if ($("#uemail").val() == '') {
			//$("#checkResult").html("<p style='color: red;'>E-MAIL 형식을 확인해주세요.</p>");
			$('#myModal').modal('show');
			$("#uemail").focus();
			return;
		} else if (!checkEmail.test($('#uemail').val())) {
			//$("#checkResult").html("<p style='color: red;'>E-MAIL 형식을 확인해주세요.</p>");
			$('#myModal').modal('show');
			$("#uemail").val("");
			$("#uemail").focus();
			return;
		} else {
			$.ajax({
				type : "POST",
				url : "/checkId",
				data : {
					"uemail" : $('#uemail').val()
				},
				success : function(data) {
					if ($.trim(data) == 'Y') {
						//$("#checkResult").html("<p style='color: red;'>이미 사용중인 E-MAIL 입니다.</p>");
						//$("#uemail").val("");
						$('#myModal2').modal('show');
						$("#uemail").val('');
						return;
					} else if ($.trim(data) == 'N2') {
						//$("#checkResult").html("<p style='color: red;'>E-MAIL 형식을 확인해주세요.</p>");
						//$("#uemail").val("");
						$('#myModal').modal('show');
						$("#uemail").val('');
						return;
					} else if ($.trim(data) == 'N') {
						$('#myModal3').modal('show');
						//$("#checkResult").html("<p style='color: blue;'>사용 가능한 E-MAIL 입니다.</p>");
						return;
					}
				}
			});
		}
	}
</script>
</body>
</html>