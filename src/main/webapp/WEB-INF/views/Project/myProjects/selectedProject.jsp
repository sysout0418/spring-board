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
			<div class="row mtbox">
            	<div class="col-md-2 col-sm-2 col-md-offset-1 box0">
                	<div class="box1">
			  			<span class="li_user"></span>
			  			<h3>${project.uname}</h3>
                	</div>
			  		<p>${project.pname}의 담당자</p>
                </div>
                <div class="col-md-2 col-sm-2 box0">
                	<div class="box1">
			  			<span class="li_eye"></span>
			  			<h3>+48</h3>
                	</div>
			  		<p>프로젝트 진행도</p>
                </div>
                <div class="col-md-2 col-sm-2 box0">
                	<div class="box1">
			  			<span class="li_data"></span>
			  			<h3>23</h3>
                	</div>
			  		<p>프로젝트 참여 인원</p>
                </div>
                <div class="col-md-2 col-sm-2 box0">
                	<div class="box1">
			  			<span class="li_tag"></span>
			  			<h3>표준</h3>
                	</div>
			  		<p>프로젝트 상태</p>
                </div>
                <div class="col-md-2 col-sm-2 box0">
                	<div class="box1">
			  			<span class="li_calendar"></span>
			  			<h3>${project.pduedate}</h3>
                	</div>
			  		<p>프로젝트 마감일</p>
                </div>
              </div>
              <div class="row">
	          	<div class="col-md-12">
	             	<div class="content-panel">
	                	<h4><i class="fa fa-angle-right"></i> ${project.pname}</h4><hr><table class="table table-hover">
	                    <thead>
	                        <tr>
	                            <th>#</th>
	                            <th>First Name</th>
	                            <th>Last Name</th>
	                            <th>Username</th>
	                        </tr>
	                        </thead>
                        <tbody>
	                        <tr>
	                            <td>1</td>
	                            <td>Mark</td>
	                            <td>Otto</td>
	                            <td>@mdo</td>
	                        </tr>
	                        <tr>
	                            <td>2</td>
	                            <td>Jacob</td>
	                            <td>Thornton</td>
	                            <td>@fat</td>
	                        </tr>
	                        <tr>
	                            <td>3</td>
	                            <td>Simon</td>
	                            <td>Mosa</td>
	                            <td>@twitter</td>
	                        </tr>
                       </tbody>
                   </table>
	           </div><!-- --/content-panel ---->
	       </div><!-- /col-md-12 -->
		</div>
	<p class="text-center">
		<span style="font-size: 16px;">${project.pskill}</span><br>
		<span style="font-size: 23px; font-weight: bold;">${project.pname}</span>
	</p>
  		<table class="table">
  		<tr>
   		<td>필요 기술 : ${project.pskill}</td>
   		<td>프로젝트 인원 : ${userCnt} 명</td>
   		<td>담당자 : ${project.uname}</td>
  		</tr> 
   	<tr>
   		<td>진행상황 : ${project.pprogress}</td>
   		<td>등록일 : ${project.pregdate}</td>
   		<td>모집마감일 : ${project.pduedate}</td>
   	</tr>
   	<tr>
   		<td colspan="3" style="word-break:break-all">
   			<span style="font-size: 16px; font-weight: bold;">프로젝트 설명</span>
   			<br>
   			${project.pdetail}
   		</td>
   	</tr>
  		<tr><td colspan="3">
  		<c:forEach var="list" items="${request}">
  		${list.uname}
			<c:if test="${list.stat == '002'}">
				${list.CODE_NAME}<a class="btn btn-primary" href="/updateStat/${project.pno}/000" role="button">재요청</a>
			</c:if>
			<c:if test="${list.stat != '002'}">
				${list.CODE_NAME}
			</c:if>
  		</c:forEach>
  		</td></tr>
	</table>
	<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')">
	<div align="center">
		<a class="btn btn-default" href="/update?pno=${project.pno}" role="button">수정</a>
		<a class="btn btn-default" href="/DeleteProject?pno=${project.pno}" role="button">삭제</a>
	</div>
	</sec:authorize>
</div>
<div class="col-lg-3 ds">
                    <!--COMPLETED ACTIONS DONUTS CHART-->
						<h3>NOTIFICATIONS</h3>
                                        
                      <!-- First Action -->
                      <div class="desc">
                      	<div class="thumb">
                      		<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                      	</div>
                      	<div class="details">
                      		<p><muted>2 Minutes Ago</muted><br>
                      		   <a href="#">James Brown</a> subscribed to your newsletter.<br>
                      		</p>
                      	</div>
                      </div>
                      <!-- Second Action -->
                      <div class="desc">
                      	<div class="thumb">
                      		<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                      	</div>
                      	<div class="details">
                      		<p><muted>3 Hours Ago</muted><br>
                      		   <a href="#">Diana Kennedy</a> purchased a year subscription.<br>
                      		</p>
                      	</div>
                      </div>
                      <!-- Third Action -->
                      <div class="desc">
                      	<div class="thumb">
                      		<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                      	</div>
                      	<div class="details">
                      		<p><muted>7 Hours Ago</muted><br>
                      		   <a href="#">Brandon Page</a> purchased a year subscription.<br>
                      		</p>
                      	</div>
                      </div>
                      <!-- Fourth Action -->
                      <div class="desc">
                      	<div class="thumb">
                      		<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                      	</div>
                      	<div class="details">
                      		<p><muted>11 Hours Ago</muted><br>
                      		   <a href="#">Mark Twain</a> commented your post.<br>
                      		</p>
                      	</div>
                      </div>
                      <!-- Fifth Action -->
                      <div class="desc">
                      	<div class="thumb">
                      		<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                      	</div>
                      	<div class="details">
                      		<p><muted>18 Hours Ago</muted><br>
                      		   <a href="#">Daniel Pratt</a> purchased a wallet in your store.<br>
                      		</p>
                      	</div>
                      </div>

                       <!-- USERS ONLINE SECTION -->
						<h3>TEAM MEMBERS</h3>
                      <!-- First Member -->
                      <div class="desc">
                      	<div class="thumb">
                      		<img class="img-circle" src="assets/img/ui-divya.jpg" width="35px" height="35px" align="">
                      	</div>
                      	<div class="details">
                      		<p><a href="#">DIVYA MANIAN</a><br>
                      		   <muted>Available</muted>
                      		</p>
                      	</div>
                      </div>
                      <!-- Second Member -->
                      <div class="desc">
                      	<div class="thumb">
                      		<img class="img-circle" src="assets/img/ui-sherman.jpg" width="35px" height="35px" align="">
                      	</div>
                      	<div class="details">
                      		<p><a href="#">DJ SHERMAN</a><br>
                      		   <muted>I am Busy</muted>
                      		</p>
                      	</div>
                      </div>
                      <!-- Third Member -->
                      <div class="desc">
                      	<div class="thumb">
                      		<img class="img-circle" src="assets/img/ui-danro.jpg" width="35px" height="35px" align="">
                      	</div>
                      	<div class="details">
                      		<p><a href="#">DAN ROGERS</a><br>
                      		   <muted>Available</muted>
                      		</p>
                      	</div>
                      </div>
                      <!-- Fourth Member -->
                      <div class="desc">
                      	<div class="thumb">
                      		<img class="img-circle" src="assets/img/ui-zac.jpg" width="35px" height="35px" align="">
                      	</div>
                      	<div class="details">
                      		<p><a href="#">Zac Sniders</a><br>
                      		   <muted>Available</muted>
                      		</p>
                      	</div>
                      </div>
                      <!-- Fifth Member -->
                      <div class="desc">
                      	<div class="thumb">
                      		<img class="img-circle" src="assets/img/ui-sam.jpg" width="35px" height="35px" align="">
                      	</div>
                      	<div class="details">
                      		<p><a href="#">Marcel Newman</a><br>
                      		   <muted>Available</muted>
                      		</p>
                      	</div>
                      </div>
                  </div>
                  </div>
                  </section>
                  </section>
<!--main content end-->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />