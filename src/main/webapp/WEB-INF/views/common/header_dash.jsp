<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>DashBoard</title>

<!-- Bootstrap core CSS -->
<link href="<c:url value="/resources/css/bootstrap/bootstrap.min.css" />" rel="stylesheet"  type="text/css" />
<!-- Custom styles for this template -->
<link href="<c:url value="/resources/css/bootstrap/dashboard.css" />" rel="stylesheet"  type="text/css" />
<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap/ie-emulation-modes-warning.js " />"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<!-- Bootstrap core JavaScript
 ================================================== -->
 <!-- Placed at the end of the document so the pages load faster -->
 <script type="text/javascript" src="<c:url value="http://code.jquery.com/jquery-latest.min.js" />"></script>
 <script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap/bootstrap.min.js" />"></script>
 <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
 <script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap/ie10-viewport-bug-workaround.js" />"></script>

<!-- jquery-ui -->
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/jquery-ui/jquery-ui.min.css" />">
<script type="text/javascript" src="<c:url value="/resources/javascript/jquery-ui/jquery-ui.min.js " />"></script>

<!-- validate JavaScript -->
<script type="text/javascript" src="/resources/javascript/validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="/resources/javascript/validation/additional-methods.min.js"></script>
<script type="text/javascript" src="/resources/javascript/validation/messages_ko.min.js"></script>
<style type="text/css">
body {
    background-color: #fff;
}
.table {
	font-size: 14px;
}
label{
	font-weight: normal;
}

#col a{
	color:#c5d0de;
}
#col a:hover{
  background-color: #24272d;
}

a{
	color:#333C47;
}
a:hover{
	color:#333C47;
}
</style>
<script type="text/javascript">
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
</script>
</head>
<body>
<%@ page contentType="text/html; charset=UTF-8"%>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/">DashBoard</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav navbar-right">
       	<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')">
       		<li><a href="/regist" data-toggle="tooltip" data-placement="bottom" title="New Project"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></a></li>
      	</sec:authorize>
      	<li><a href="/requestProject/requested" data-toggle="tooltip" data-placement="bottom" title="Request"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span><c:if test="${req > 0}"><span class="badge">${req}</span></c:if></a></li>
        <li><a href="/logout" data-toggle="tooltip" data-placement="bottom" title="Sign Out"><span class="glyphicon glyphicon-log-in" aria-hidden="true"></span></a></li>
      </ul>
    </div>
  </div>
</nav>
<div class="container-fluid">
<div class="row">
<div id="col">
<div class="col-sm-2 col-md-2 sidebar">
	<ul class="nav nav-sidebar">
		<li><a href="/"><span class="glyphicon glyphicon-home" aria-hidden="true" style="padding-right: 10px"></span>MyProjects</a></li>
		 <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')">
	    	<li><a href="/regist"><span class="glyphicon glyphicon-plus" aria-hidden="true" style="padding-right: 10px"></span>Regist</a></li>
	     </sec:authorize>
	    <li><a href="/search"><span class="glyphicon glyphicon-zoom-in" aria-hidden="true" style="padding-right: 10px"></span>Search</a></li>
	    <li><a href="/list"><span class="glyphicon glyphicon-book" aria-hidden="true" style="padding-right: 10px"></span>Projects</a></li>
	</ul>
	<ul class="nav nav-sidebar">
		<li><a href="/milestones/open"><span class="glyphicon glyphicon-time" aria-hidden="true" style="padding-right: 10px"></span>Milestones</a></li>
	    <li><a href="/issues/open"><span class="glyphicon glyphicon-alert" aria-hidden="true" style="padding-right: 10px"></span>Issues</a></li>
	</ul>
	<ul class="nav nav-sidebar">
		<sec:authorize access="hasRole('ROLE_ADMIN')">
	    	<li><a href="/admin"><span class="glyphicon glyphicon-wrench" aria-hidden="true" style="padding-right: 10px"></span>Admin</a></li>
	    </sec:authorize>
	</ul>
</div>
</div>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">