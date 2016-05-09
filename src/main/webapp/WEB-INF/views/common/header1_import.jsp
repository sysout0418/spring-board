<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword"
	content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

<title>BIDDING</title>

<!-- Bootstrap core CSS -->
<link
	href="<c:url value="/resources/css/bootstrap/bootstrap.min.css" />"
	rel="stylesheet" type="text/css" />
<!--external css-->
<link
	href="<c:url value="/resources/css/bootstrap-theme-dashgum/font-awesome/css/font-awesome.css" />"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/bootstrap-theme-dashgum/zabuto_calendar.css"/>">
	
<!-- Custom styles for this template -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/lineicons/style.css" />">
<link
	href="<c:url value="/resources/css/bootstrap-theme-dashgum/style.css" />"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value="/resources/css/bootstrap-theme-dashgum/style-responsive.css" />"
	rel="stylesheet" type="text/css" />

<script
	src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/chart-master/Chart.js" />"></script>
	
<!--  jquery -ui -->
<link
	href="<c:url value="/resources/css/jquery-ui/jquery-ui.min.css" />"
	rel="stylesheet" type="text/css" />

<link href="<c:url value="/resources/css/tappanel.css" />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/timeline.css" />"
rel="stylesheet" type="text/css" />

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
     <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
     <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
   <![endif]-->


<!-- content-panel에 라운드 주기 일단 보류 -->
<style>
.content-panel {
	border-radius: 18px;
	padding: 25px;
}
</style>

<style type="text/css">
html { 
	overflow-y:scroll; 
}
.user-img{
	text-align: center;
}
.img-circle{
	display:inline-block;
	height:60px; line-height:60px;
}
</style>
</head>

<body>