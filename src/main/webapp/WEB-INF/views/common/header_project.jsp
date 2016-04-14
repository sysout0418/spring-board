<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<!-- autocomplete CSS -->
<link href="<c:url value="/resources/css/autocomplete/textext.core.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/autocomplete/textext.plugin.tags.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/autocomplete/textext.plugin.autocomplete.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/autocomplete/textext.plugin.focus.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/autocomplete/textext.plugin.prompt.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/autocomplete/textext.plugin.arrow.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/autocomplete/textext.plugin.clear.css" />" rel="stylesheet" type="text/css">

<!-- autocomplete JavaScript -->
<script type="text/javascript" src="<c:url value="/resources/javascript/autocomplete/textext.core.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/autocomplete/textext.plugin.tags.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/autocomplete/textext.plugin.autocomplete.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/autocomplete/textext.plugin.filter.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/autocomplete/textext.plugin.ajax.js" />"></script>

<!-- validate JavaScript -->
<script type="text/javascript" src="/resources/javascript/validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="/resources/javascript/validation/additional-methods.min.js"></script>
<script type="text/javascript" src="/resources/javascript/validation/messages_ko.min.js"></script>

<!-- Fine Uploader New/Modern CSS file -->
<link href="<c:url value="/resources/css/file_css/fine-uploader-new.min.css" />" rel="stylesheet">

<!-- Fine Uploader jQuery JS file -->
<script src="<c:url value="/resources/javascript/file_js/jquery.fine-uploader.min.js" />"></script>

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
      	<li><a href="/regist" data-toggle="tooltip" data-placement="bottom" title="New Project"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></a></li>
      	<li><a href="/requestProject" data-toggle="tooltip" data-placement="bottom" title="Request"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span><c:if test="${req > 0}"><span class="badge">${req}</span></c:if></a></li>
        <li><a href="/logout" data-toggle="tooltip" data-placement="bottom" title="Sign Out"><span class="glyphicon glyphicon-log-in" aria-hidden="true"></span></a></li>
      </ul>
    </div>
  </div>
</nav>
<div class="container-fluid">
<div class="row">
<div id="col">
<div class="col-sm-2 col-md-2 sidebar">
   	<ul class="nav nav-sidebar" style="height: 30px; text-align: center;">
    	<li><a href="/">Go to DashBoard</a></li>
  	</ul>
    <ul class="nav nav-sidebar">
		<li><a href="/${uno}/${pno}"><span class="glyphicon glyphicon-home" aria-hidden="true" style="padding-right: 10px"></span>Project</a></li>
	</ul>
	<ul class="nav nav-sidebar">
		<li><a href="/${uno}/${pno}/milestones/open"><span class="glyphicon glyphicon-time" aria-hidden="true" style="padding-right: 10px"></span>Milestones</a></li>
	    <li><a href="/${uno}/${pno}/issues/open"><span class="glyphicon glyphicon-alert" aria-hidden="true" style="padding-right: 10px"></span>Issues</a></li>
	   	<li><a href="/${uno}/${pno}/labels"><span class="glyphicon glyphicon-tag" aria-hidden="true" style="padding-right: 10px"></span>Labels</a></li>
	</ul>
 	<ul class="nav nav-sidebar">
    	<li><a href=""><span class="glyphicon glyphicon-cog" aria-hidden="true" style="padding-right: 10px"></span>Settings</a></li>
    </ul>
</div>
</div>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">