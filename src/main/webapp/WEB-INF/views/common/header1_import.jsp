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

<!-- heart progressbar -->
<style>
[data-loader='heart']
{
    position: relative;

    width: 100px;
    height: 90px;

    -webkit-animation: heart infinite .85s linear;
       -moz-animation: heart infinite .85s linear;
         -o-animation: heart infinite .85s linear;
            animation: heart infinite .85s linear;
}
[data-loader='heart']:before,
[data-loader='heart']:after
{
    position: absolute;
    top: 0;
    left: 30px;

    width: 30px;
    height: 50px;

    content: '';
    -webkit-transform: rotate(-45deg);
       -moz-transform: rotate(-45deg);
        -ms-transform: rotate(-45deg);
         -o-transform: rotate(-45deg);
            transform: rotate(-45deg);
    -webkit-transform-origin: 0 100%;
       -moz-transform-origin: 0 100%;
        -ms-transform-origin: 0 100%;
         -o-transform-origin: 0 100%;
            transform-origin: 0 100%;

    -moz-border-radius: 30px 30px 0 0;
         border-radius: 30px 30px 0 0;
    background: #fff;
}
[data-loader='heart']:after
{
    left: 0;

    -webkit-transform: rotate(45deg);
       -moz-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
         -o-transform: rotate(45deg);
            transform: rotate(45deg);
    -webkit-transform-origin: 100% 100%;
       -moz-transform-origin: 100% 100%;
        -ms-transform-origin: 100% 100%;
         -o-transform-origin: 100% 100%;
            transform-origin: 100% 100%;
}
@-webkit-keyframes heart
{
    0%
    {
        -webkit-transform: scale(.8);
            -ms-transform: scale(.8);
             -o-transform: scale(.8);
                transform: scale(.8);
    }
    50%
    {
        -webkit-transform: scale(1);
            -ms-transform: scale(1);
             -o-transform: scale(1);
                transform: scale(1);
    }
    100%
    {
        -webkit-transform: scale(.8);
            -ms-transform: scale(.8);
             -o-transform: scale(.8);
                transform: scale(.8);
    }
}
@-moz-keyframes heart
{
    0%
    {
        -webkit-transform: scale(.8);
            -ms-transform: scale(.8);
             -o-transform: scale(.8);
                transform: scale(.8);
    }
    50%
    {
        -webkit-transform: scale(1);
            -ms-transform: scale(1);
             -o-transform: scale(1);
                transform: scale(1);
    }
    100%
    {
        -webkit-transform: scale(.8);
            -ms-transform: scale(.8);
             -o-transform: scale(.8);
                transform: scale(.8);
    }
}
@-o-keyframes heart
{
    0%
    {
        -webkit-transform: scale(.8);
            -ms-transform: scale(.8);
             -o-transform: scale(.8);
                transform: scale(.8);
    }
    50%
    {
        -webkit-transform: scale(1);
            -ms-transform: scale(1);
             -o-transform: scale(1);
                transform: scale(1);
    }
    100%
    {
        -webkit-transform: scale(.8);
            -ms-transform: scale(.8);
             -o-transform: scale(.8);
                transform: scale(.8);
    }
}
@keyframes heart
{
    0%
    {
        -webkit-transform: scale(.8);
            -ms-transform: scale(.8);
             -o-transform: scale(.8);
                transform: scale(.8);
    }
    50%
    {
        -webkit-transform: scale(1);
            -ms-transform: scale(1);
             -o-transform: scale(1);
                transform: scale(1);
    }
    100%
    {
        -webkit-transform: scale(.8);
            -ms-transform: scale(.8);
             -o-transform: scale(.8);
                transform: scale(.8);
    }
}
</style>
</head>

<body>