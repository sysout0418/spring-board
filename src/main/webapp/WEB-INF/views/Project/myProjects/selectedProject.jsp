<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header2_header.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header3_menu_project.jsp" />
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-9 main-chart">
			<h3><i class="fa fa-angle-right"></i> Project</h3>
			<div class="row mt">
                      <!--CUSTOM CHART START -->
                      <div class="border-head">
                          <h3>PROJECT PROGRESS BAR</h3>
                      </div>
                      <div class="custom-bar-chart">
                          <ul class="y-axis">
                              <li><span>10.000</span></li>
                              <li><span>8.000</span></li>
                              <li><span>6.000</span></li>
                              <li><span>4.000</span></li>
                              <li><span>2.000</span></li>
                              <li><span>0</span></li>
                          </ul>
                          <div class="bar">
                              <div class="title">JAN</div>
                              <div class="value tooltips" data-original-title="8.500" data-toggle="tooltip" data-placement="top" style="height: 85%;"></div>
                          </div>
                          <div class="bar ">
                              <div class="title">FEB</div>
                              <div class="value tooltips" data-original-title="5.000" data-toggle="tooltip" data-placement="top" style="height: 50%;"></div>
                          </div>
                          <div class="bar ">
                              <div class="title">MAR</div>
                              <div class="value tooltips" data-original-title="6.000" data-toggle="tooltip" data-placement="top" style="height: 60%;"></div>
                          </div>
                          <div class="bar ">
                              <div class="title">APR</div>
                              <div class="value tooltips" data-original-title="4.500" data-toggle="tooltip" data-placement="top" style="height: 45%;"></div>
                          </div>
                          <div class="bar">
                              <div class="title">MAY</div>
                              <div class="value tooltips" data-original-title="3.200" data-toggle="tooltip" data-placement="top" style="height: 32%;"></div>
                          </div>
                          <div class="bar ">
                              <div class="title">JUN</div>
                              <div class="value tooltips" data-original-title="6.200" data-toggle="tooltip" data-placement="top" style="height: 62%;"></div>
                          </div>
                          <div class="bar">
                              <div class="title">JUL</div>
                              <div class="value tooltips" data-original-title="7.500" data-toggle="tooltip" data-placement="top" style="height: 75%;"></div>
                          </div>
                      </div>
                      <!--custom chart end-->
					</div>
			   <div class="row">
	          	<div class="col-md-12">
	             	<div class="content-panel">
	                	<h4><i class="fa fa-angle-right"></i> Recent Activity</h4><hr><table class="table table-hover">
                        <tbody>
	                        <tr>
	                            <td>
	                            
	                            </td>
	                        </tr>
                       </tbody>
                   </table>
	           </div><!-- --/content-panel ---->
	       </div><!-- /col-md-12 -->
		</div>
</div>
<div class="col-lg-3 ds">
	<h3>PROJECT DESCRIPTION</h3>
	<!-- First Action -->
	<div class="desc">
		<div class="details">
			<h4 class="green"><i class="fa fa-paint-brush"></i> ${project.pname}</h4>
			${project.pdetail}<br/><br/>
			<p>
				<b>프로젝트 등록일</b><br/>
				${project.pregdate}<br/>
			</p>
			<p>
				<b>프로젝트 만기일</b><br/>
				${project.pduedate}<br/>
			</p>
			<p>
				<b>담당자</b><br/>
				${project.uname}<br/>
			</p>
			${project.ltitle}<br/>
			${project.lbgcolor}<br/>
			${project.pdata}<br/>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')">
				<a id="add-regular" class="btn btn-default btn-sm" href="/update?pno=${project.pno}">EDIT</a>
				<a id="add-regular" class="btn btn-default btn-sm" href="/DeleteProject?pno=${project.pno}">DELETE</a>
			</sec:authorize>
		</div>
	</div>
<!-- USERS ONLINE SECTION -->
<h3>TEAM MEMBERS</h3>
<c:forEach var="list" items="${request}">
<div class="desc">
	<div class="thumb">
		<img class="img-circle" src="<c:url value="/resources/img/ui-sam.jpg" />" width="35px" height="35px" align="">
    </div>
<div class="details">
	<p><a href="#">${list.uname}</a><br>
		<c:if test="${list.stat == '002'}">
			<muted>${list.CODE_NAME}</muted><a class="btn btn-primary" href="/updateStat/${project.pno}/000" role="button">재요청</a>
         </c:if>
		<c:if test="${list.stat != '002'}">
			${list.CODE_NAME}
		</c:if>
	</p>
</div>
</div>
</c:forEach>
</div>
</div>
</section>
</section>
<!--main content end-->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />