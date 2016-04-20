<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header2_header.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header3_menu_dash.jsp" />
<style>
.progress{
 height:10px;
 margin-bottom: 3px;
}
</style>
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper site-min-height">
   		<h3><i class="fa fa-angle-right"></i> My Projects</h3>
    		<div class="col-lg-12">
    			<div class="row mt">
            		<div class="col-md-12">
                		<div class="content-panel">
                    	<table class="table table-striped table-advance table-hover">
                        <thead>
	                        <tr>
	                        	<th> #</th>
	                        	<th><i class="fa fa-bullhorn"></i> Project Name</th>
	                            <th><i class="fa fa-question-circle"></i> Project Progress</th>
	                            <th><i class="fa fa-bookmark"></i> Status</th>
	                            <th></th>
	                        </tr>
                        </thead>
                        <tbody>
	                        <c:forEach var="project" items="${list}">
	                       	<tr>
	                       		<td>#</td>
	                           	<td><a href="/${project.uno}/${project.pno}">${project.pname}</a><br/><small>Created 01.01.2015</small></td>
	                           	<td class="hidden-phone">
	                              	<div class="progress">
	                      				<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%"></div>
			  						</div>
			  						<small>57% Complete</small>
				  				</td>
                             	<td><span class="label label-warning label-mini">Due</span></td>
                             	<td>
	                               	<a href="/${project.uno}/${project.pno}" class="btn btn-success btn-xs" role="button"><i class="fa fa-check"></i></a>
                                 	<a href="/update?pno=${project.pno}" class="btn btn-primary btn-xs" role="button"><i class="fa fa-pencil"></i></a>
                                 	<a href="/DeleteProject?pno=${project.pno}" class="btn btn-danger btn-xs" role="button"><i class="fa fa-trash-o "></i></a>
                            	</td>
                          </tr>
                          </c:forEach>
                      	</tbody>
                      </table>
                  </div><!-- /content-panel -->
              </div><!-- /col-md-12 -->
          </div><!-- /row -->
       </div>		
	</section><! --/wrapper -->
</section><!-- /MAIN CONTENT -->

<!--main content end-->
<!--footer start-->
<footer class="site-footer">
    <div class="text-center">
        2014 - Alvarez.is
        <a href="/#" class="go-top">
            <i class="fa fa-angle-up"></i>
        </a>
    </div>
</footer>
<!--footer end-->
</section>

  <!-- js placed at the end of the document so the pages load faster -->
<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/jquery.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap/bootstrap.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/jquery-ui-1.9.2.custom.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/jquery.ui.touch-punch.min.js" />"></script>
<script class="include" type="text/javascript" src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/jquery.dcjqaccordion.2.7.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/jquery.scrollTo.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/jquery.nicescroll.js" />"></script>


<!--common script for all pages-->
<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/common-scripts.js" />"></script>

<!--script for this page-->
  
<script>
  //custom select box

  $(function(){
      $('select.styled').customSelect();
  });

</script>

</body>
</html>