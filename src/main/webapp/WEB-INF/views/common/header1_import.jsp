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
<link
	href="<c:url value="/resources/css/reset.css" />"
	rel="stylesheet" type="text/css" />
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
<link
	href="<c:url value="/resources/css/bootstrap-theme-dashgum/to-do.css" />"
	rel="stylesheet" type="text/css" />

<script
	src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/chart-master/Chart.js" />"></script>

<!--  jquery -ui -->
<link href="<c:url value="/resources/css/jquery-ui/jquery-ui.css" />"
	rel="stylesheet" type="text/css" />

<link href="<c:url value="/resources/css/tappanel.css" />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/timeline.css" />"
	rel="stylesheet" type="text/css" />

<!-- color picker -->
<link
	href="<c:url value="/resources/css/colorpicker/jquery.minicolors.css" />"
	rel="stylesheet" type="text/css" />

<!-- circle progressbar -->
<link
	href="<c:url value="/resources/css/circle-progress/circle-scale.css" />"
	rel="stylesheet" type="text/css" />

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
     <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
     <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
   <![endif]-->

<!-- content-panel에 패딩 주기 -->
<style>
.content-panel {
	padding: 30px;
}
</style>

<style type="text/css">
html {
	overflow-y: scroll;
}

.user-img {
	text-align: center;
}

.img-circle {
	display: inline-block;
	height: 60px;
	line-height: 60px;
}
</style>

<!-- timer progressbar -->
<style>
[data-loader='timer']
{
    position: relative;

    width: 24px;
    height: 24px;

    border: 2px solid #fff;
    border-radius: 50%;
    background-color: transparent;
}
[data-loader='timer']:after,
[data-loader='timer']:before
{
    position: absolute;

    content: '';

    background-color: #fff;
}
[data-loader='timer']:after
{
    top: 11px;
    left: 11px;

    width: 10px;
    height: 2px;

    -webkit-transform-origin: 1px 1px;
       -moz-transform-origin: 1px 1px;
            transform-origin: 1px 1px;
    -webkit-animation: timerhand 2s linear infinite;
       -moz-animation: timerhand 2s linear infinite;
            animation: timerhand 2s linear infinite;
}

[data-loader='timer']:before
{
    top: 11px;
    left: 11px;

    width: 8px;
    height: 2px;

    -webkit-transform-origin: 1px 1px;
       -moz-transform-origin: 1px 1px;
            transform-origin: 1px 1px;
    -webkit-animation: timerhand 8s linear infinite;
       -moz-animation: timerhand 8s linear infinite;
            animation: timerhand 8s linear infinite;
}

@-webkit-keyframes timerhand
{
    0%
    {
        -webkit-transform: rotate(0deg);
    }
    100%
    {
        -webkit-transform: rotate(360deg);
    }
}
@-moz-keyframes timerhand
{
    0%
    {
        -webkit-transform: rotate(0deg);
    }
    100%
    {
        -webkit-transform: rotate(360deg);
    }
}
@-o-keyframes timerhand
{
    0%
    {
        -webkit-transform: rotate(0deg);
    }
    100%
    {
        -webkit-transform: rotate(360deg);
    }
}
@keyframes timerhand
{
    0%
    {
        -webkit-transform: rotate(0deg);
    }
    100%
    {
        -webkit-transform: rotate(360deg);
    }
}
</style>

<!-- face loader -->
<style>
.pace {
  -webkit-pointer-events: none;
  pointer-events: none;
  -webkit-user-select: none;
  -moz-user-select: none;
  user-select: none;
}
.pace-inactive {
  display: none;
}
.pace .pace-progress {
  background: #1abb9c;
  position: fixed;
  z-index: 2000;
  top: 0;
  right: 100%;
  width: 100%;
  height: 2px;
}
</style>
</head>

<body>