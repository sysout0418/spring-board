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
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet"  type="text/css" />
<!-- Custom styles for this template -->
<link href="<c:url value="/resources/css/dashboard.css" />" rel="stylesheet"  type="text/css" />
<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script type="text/javascript" src="<c:url value="/resources/javascript/ie-emulation-modes-warning.js " />"></script>


<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<!-- Bootstrap core JavaScript
 ================================================== -->
 <!-- Placed at the end of the document so the pages load faster -->
 <script type="text/javascript" src="<c:url value="http://code.jquery.com/jquery-latest.min.js" />"></script>
 <script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap.min.js" />"></script>
 <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
 <script type="text/javascript" src="<c:url value="/resources/javascript/ie10-viewport-bug-workaround.js" />"></script>
 
<!-- jquery-ui -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

<!-- autocomplete CSS -->
<link href="<c:url value="/resources/css/textext.core.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/textext.plugin.tags.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/textext.plugin.autocomplete.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/textext.plugin.focus.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/textext.plugin.prompt.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/textext.plugin.arrow.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/textext.plugin.clear.css" />" rel="stylesheet" type="text/css">

<!-- autocomplete JavaScript -->
<script type="text/javascript" src="<c:url value="/resources/javascript/textext.core.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/textext.plugin.tags.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/textext.plugin.autocomplete.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/textext.plugin.filter.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/textext.plugin.ajax.js" />"></script>

<!-- validate JavaScript -->
<script type="text/javascript" src="/resources/javascript/jquery.validate.min.js"></script>
<script type="text/javascript" src="/resources/javascript/additional-methods.min.js"></script>
<script type="text/javascript" src="/resources/javascript/messages_ko.min.js"></script>
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
        <li><a href="/logout">Sign Out</a></li>
      </ul>
    </div>
  </div>
</nav>