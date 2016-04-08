<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<!-- Bootstrap core CSS -->
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet"  type="text/css" />
	
	<!-- Custom styles for this template -->
	<link href="<c:url value="/resources/css/signin.css" />" rel="stylesheet"  type="text/css" />
	
	<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
	<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
	<script type="text/javascript" src="<c:url value="/resources/javascript/ie-emulation-modes-warning.js " />"></script>
	
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script type="text/javascript" src="<c:url value="/resources/javascript/ie10-viewport-bug-workaround.js" />"></script>
	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript" src="<c:url value="http://code.jquery.com/jquery-latest.min.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap.min.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/javascript/ie-emulation-modes-warning.js " />"></script>
</head>
<script type="text/javascript">
function checkId() {
	if ($("#uemail").val() == '') {
		$("#checkResult").html("<p style='color: red;'>E-MAIL 형식을 확인해주세요.</p>");
		$("#uemail").focus();
		return;
	} else {
		$.ajax({
			type: "POST",
			url: "/checkId",
			data: {
				"uemail": $('#uemail').val()
			},
			success: function(data) {
				if ($.trim(data) == 'Y') {
					$("#checkResult").html("<p style='color: red;'>이미 사용중인 E-MAIL 입니다.</p>");
					$("#uemail").val("");
					$("#uemail").focus();
					return;
				} else if ($.trim(data) == 'N2') {
					$("#checkResult").html("<p style='color: red;'>E-MAIL 형식을 확인해주세요.</p>");
					$("#uemail").val("");
					$("#uemail").focus();
					return;
				} else if ($.trim(data) == 'N') {
					$("#checkResult").html("<p style='color: blue;'>사용 가능한 E-MAIL 입니다.</p>");
				} 
			}
		});
	}
}
</script>
<body>
<div class="container">
<form:form cssClass="form-signin" method="post" action="/join" commandName="UserInfo">
	<h2 class="form-signin-heading">Sign up</h2>
	<label for="inputEmail" class="sr-only">Email</label>
	<input type="email" id="uemail" name="uemail" class="form-control" placeholder="Email" onblur="checkId()" required autofocus>
	<span id="checkResult"></span>
	<label for="input" class="sr-only">Name</label>
	<input type="text" class="form-control" id="uname" name="uname" placeholder="Name" required>
	<label for="input" class="sr-only">Phone</label>
	<input type="text" class="form-control" id="uphoneno" name="uphoneno" placeholder="Phone Number" required>
	<label for="inputPassword" class="sr-only">Password</label>
	<input type="password" id="upassword" name="upassword" class="form-control" placeholder="Password" required>
	<button class="btn btn-lg btn-primary btn-block" type="submit" id="submit">Sign up</button>
</form:form>
</div> <!-- /container -->

</body>
</html>