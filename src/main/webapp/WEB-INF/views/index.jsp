<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

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
    			<div class="row">
            		<div class="col-md-12">
                		<div class="content-panel">
                    	<table class="table table-striped table-advance table-hover">
                        <thead>
	                        <tr>
	                        	<th> #</th>
	                        	<th><i class="fa fa-bullhorn"></i> 프로젝트명</th>
	                            <th><i class="fa fa-question-circle"></i> 프로젝트 진행도</th>
	                            <th><i class="fa fa-bookmark"></i>  상태</th>
	                            <th><i class="fa fa-edit"></i> 담당자</th>
	                            <th></th>
	                        </tr>
                        </thead>
                        <tbody>
	                        <c:forEach var="project" items="${list}">
	                       	<tr>
	                       		<td>${project.rownum}</td>
	                           	<td><a href="/${project.uno}/${project.pno}">${project.pname}</a><br/><small>Created ${fn:substring(project.pregdate,0,10)}</small></td>
	                           	<td class="hidden-phone">
	                              	<div class="progress">
	                      				<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${project.completeIssuePercent}%"></div>
			  						</div>
			  						<small>${project.completeIssuePercent}% Complete</small>
				  				</td>
                             	<td><span class="label label-warning label-mini" style="background-color: ${project.lbgcolor}">${project.ltitle}</span></td>
                             	<td>
	                               	<a href="/${project.uno}/${project.pno}" class="btn btn-success btn-xs" role="button"><i class="fa fa-check"></i></a>
                                 	<a href="/update?pno=${project.pno}" class="btn btn-primary btn-xs" role="button"><i class="fa fa-pencil"></i></a>
                                 	<a href="/DeleteProject?pno=${project.pno}" class="btn btn-danger btn-xs" role="button"><i class="fa fa-trash-o "></i></a>
                            	</td>
                            	<td>${project.uname}</td>
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
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />