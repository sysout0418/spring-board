<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header2_header.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header3_menu_dash.jsp" />

<style>
/* Tabs panel */
.tabbable-panel {
  border:1px solid #eee;
  padding: 10px;
}

/* Default mode */
.tabbable-line > .nav-tabs {
  border: none;
  margin: 0px;
}
.tabbable-line > .nav-tabs > li {
  margin-right: 2px;
}
.tabbable-line > .nav-tabs > li > a {
  border: 0;
  margin-right: 0;
  color: #737373;
}
.tabbable-line > .nav-tabs > li > a > i {
  color: #a6a6a6;
}
.tabbable-line > .nav-tabs > li.open, .tabbable-line > .nav-tabs > li:hover {
  border-bottom: 4px solid #fbcdcf;
}
.tabbable-line > .nav-tabs > li.open > a, .tabbable-line > .nav-tabs > li:hover > a {
  border: 0;
  background: none !important;
  color: #333333;
}
.tabbable-line > .nav-tabs > li.open > a > i, .tabbable-line > .nav-tabs > li:hover > a > i {
  color: #a6a6a6;
}
.tabbable-line > .nav-tabs > li.open .dropdown-menu, .tabbable-line > .nav-tabs > li:hover .dropdown-menu {
  margin-top: 0px;
}
.tabbable-line > .nav-tabs > li.active {
  border-bottom: 4px solid #f3565d;
  position: relative;
}
.tabbable-line > .nav-tabs > li.active > a {
  border: 0;
  color: #333333;
}
.tabbable-line > .nav-tabs > li.active > a > i {
  color: #404040;
}
.tabbable-line > .tab-content {
  margin-top: -3px;
  background-color: #fff;
  border: 0;
  border-top: 1px solid #eee;
  padding: 15px 0;
}
.portlet .tabbable-line > .tab-content {
  padding-bottom: 0;
}
</style>
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper site-min-height">
   		<h3><i class="fa fa-angle-right"></i> Milestones</h3>
   		<div class="col-lg-12">
    			<div class="row">
            		<div class="col-md-12">
                		<div class="content-panel">
<div role="tabpanel">
<!-- Nav tabs -->
<div class="tabbable-panel">
	<div class="tabbable-line">
<ul class="nav nav-tabs">
	<li<c:if test="${stat=='open'}"> class="active"</c:if>><a href="/milestones/open">Open</a></li>
	<li<c:if test="${stat=='closed'}"> class="active"</c:if>><a href="/milestones/closed">Closed</a></li>
	<li<c:if test="${stat=='all'}"> class="active"</c:if>><a href="/milestones/all">All</a></li>
</ul>
</div>
</div>
</div>
<table class="table">
<c:forEach var="milestone" items="${list}">
<tr>
	<td<c:if test="${milestone.mstatement == '001'}"> style="background-color : #f9f9f9"</c:if>>
		<a href="/milestone/${milestone.mno}">${milestone.mtitle}</a><br/>
		${milestone.countIssues} Issues<br/>
		<mark style="background-color: #f8fafc"><span style="font-size: 0.8em">${milestone.uname} / ${milestone.pname}</span></mark>
	</td>
	<td<c:if test="${milestone.mstatement == '001'}"> style="background-color : #f9f9f9"</c:if>>
		<div style="text-align: right">${milestone.completeIssuePercent}% complete</div>
		<div class="progress"><div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: ${milestone.completeIssuePercent}%;"></div></div>
	</td>
</tr>
</c:forEach>
</table>
</div><!-- /content-panel -->
              </div><!-- /col-md-12 -->
          </div><!-- /row -->
       </div>		
	</section><!--wrapper -->
</section><!-- /MAIN CONTENT -->
<!--main content end-->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />