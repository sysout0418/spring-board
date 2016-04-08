<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	Cookie[] cookies = request.getCookies();
	String uemail = null;
	if (cookies != null) {
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals("rememberId")) {
				uemail = cookie.getValue();
			}
		}
	}
	String checked = uemail == null? "" : "checked='checked'";
	uemail = uemail == null? "" : uemail;
%>
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
</head>
<body>
<div class="container">
	<c:url value="/login" var="login" />
    <form:form cssClass="form-signin" action="${login}" method="post">
    	<h2 class="form-signin-heading">Please sign in</h2>
		<label for="inputEmail" class="sr-only">Email address</label>
		<input type="text" id="uemail" name="uemail" class="form-control" 
				  placeholder="Email address" required autofocus value="<%= uemail %>">
		<label for="inputPassword" class="sr-only">Password</label>
		<input	type="password" id="upassword" name="upassword" class="form-control" placeholder="Password" required>
		<div class="checkbox">
			<label><input type="checkbox" id="rememberId" name="rememberId" value="t" <%= checked %>>Remember me</label>
		</div>
		<input type="submit" id="submit" name="submit" class="btn btn-primary" value="Sign in">
		<a href="/join" class="btn btn-success">Join Us</a>
      </form:form>
    </div> <!-- /container -->

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
     <script type="text/javascript" src="<c:url value="/resources/javascript/ie10-viewport-bug-workaround.js" />"></script>
  </body>
</html>