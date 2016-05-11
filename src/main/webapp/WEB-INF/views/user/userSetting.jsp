<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header2_header.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header3_menu_dash.jsp" />

<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<section id="main-content">
	<section class="wrapper site-min-height">

		<div class="col-lg-12">
			<div class="row">
				<div class="col-lg-9 main-chart">
					<h3>
						<i class="fa fa-angle-right"></i> Profile Settings
					</h3>
<div class="row mt">
                      <!--CUSTOM CHART START -->
                      <div class="border-head">
                          <h3>VISITS</h3>
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
					<!-- BASIC FORM ELELEMNTS -->
					<h3>
						<i class="fa fa-angle-right"></i> Profile Settings
					</h3>
					<div class="row mt">
						<div class="col-lg-12">
							<div class="content-panel">
								<form class="form-horizontal style-form" method="get">
									<div class="form-group">
										<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" id="uemail"
												readonly="readonly" value="${userInfo.uemail}">
										</div>
									</div>
									<div class="form-group">
										<label for="inputName" class="col-lg-2 control-label">이름</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" id="uname"
												name="uname" value="${userInfo.uname}">
										</div>
									</div>
									<div class="form-group">
										<label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰
											번호</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" id="uphoneno"
												name="uphoneno" value="${userInfo.uphoneno}">
										</div>
									</div>
									<div class="form-group">
										<label for="select" class="col-lg-2 control-label">부서</label>
										<div class="col-lg-10">
											<select class="form-control" id="udepartment"
												name="udepartment">
												<c:forEach var="depart" items="${departmentList}">
													<option
														<c:if test="${userInfo.udepartmentName == depart.CODE_NAME}">selected="selected"</c:if>
														value="${depart.CODE}">${depart.CODE_NAME}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 col-sm-2 control-label">Password</label>
										<div class="col-sm-10">
											<input type="password" class="form-control" placeholder="">
										</div>
									</div>
									<div class="form-group">
										<input class="btn btn-warning" type="submit" id="submit"
											value="Create Project">
									</div>
								</form>
							</div>
							<!-- /content-panel -->
						</div>
						<!-- col-lg-12-->
					</div>
					<!-- /row -->
				</div>
				<!-- /row -->
				<div class="col-lg-3 ds">
					<!--COMPLETED ACTIONS DONUTS CHART-->
					<h3>USER PROFILE</h3>
					<br>
					<div class="user-img">
						<div class="img"
							style="background-color: #000; width: 160px; height: 160px; line-height: 160px;">
							<span style="font-size: 15px; color: #E8E8E8;">S</span>
						</div>
					</div>
					<h2>Samuel Doe</h2>
					<i class="fa fa-map-marker" aria-hidden="true"></i> San Francisco,
					California, USA<br> <i class="fa fa-sitemap"
						aria-hidden="true"></i> Software Engineer<br> <i
						class="fa fa-envelope-o" aria-hidden="true"></i> www.kimlabs.com<br>
					<br>

					<!-- CALENDAR-->
					<div id="calendar" class="mb">
						<div class="panel green-panel no-margin">
							<div class="panel-body">
								<div id="date-popover" class="popover top"
									style="cursor: pointer; margin-left: 33%; margin-top: -50px; width: 175px; display: none;"
									data-original-title="" title="">
									<div class="arrow"></div>
									<h3 class="popover-title" style="disadding: none;"></h3>
									<div id="date-popover-content" class="popover-content"></div>
								</div>
								<div id="zabuto_calendar_196o">
									<div class="zabuto_calendar" id="zabuto_calendar_196o">
										<table class="table">
											<tbody>
												<tr class="calendar-month-header">
													<th><div class="calendar-month-navigation"
															id="zabuto_calendar_196o_nav-prev">
															<span><span
																class="fa fa-chevron-left text-transparent"></span></span>
														</div></th>
													<th colspan="5"><span>May 2016</span></th>
													<th><div class="calendar-month-navigation"
															id="zabuto_calendar_196o_nav-next">
															<span><span
																class="fa fa-chevron-right text-transparent"></span></span>
														</div></th>
												</tr>
												<tr class="calendar-dow-header">
													<th>Mon</th>
													<th>Tue</th>
													<th>Wed</th>
													<th>Thu</th>
													<th>Fri</th>
													<th>Sat</th>
													<th>Sun</th>
												</tr>
												<tr class="calendar-dow">
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td id="zabuto_calendar_196o_2016-05-01"
														class="dow-clickable"><div
															id="zabuto_calendar_196o_2016-05-01_day" class="day">1</div></td>
												</tr>
												<tr class="calendar-dow">
													<td id="zabuto_calendar_196o_2016-05-02"
														class="dow-clickable"><div
															id="zabuto_calendar_196o_2016-05-02_day" class="day">2</div></td>
													<td id="zabuto_calendar_196o_2016-05-03"
														class="dow-clickable"><div
															id="zabuto_calendar_196o_2016-05-03_day" class="day">3</div></td>
													<td id="zabuto_calendar_196o_2016-05-04"
														class="dow-clickable"><div
															id="zabuto_calendar_196o_2016-05-04_day" class="day">4</div></td>
													<td id="zabuto_calendar_196o_2016-05-05"
														class="dow-clickable"><div
															id="zabuto_calendar_196o_2016-05-05_day" class="day">5</div></td>
													<td id="zabuto_calendar_196o_2016-05-06"
														class="dow-clickable"><div
															id="zabuto_calendar_196o_2016-05-06_day" class="day">6</div></td>
													<td id="zabuto_calendar_196o_2016-05-07"
														class="dow-clickable"><div
															id="zabuto_calendar_196o_2016-05-07_day" class="day">7</div></td>
													<td id="zabuto_calendar_196o_2016-05-08"
														class="dow-clickable"><div
															id="zabuto_calendar_196o_2016-05-08_day" class="day">8</div></td>
												</tr>
												<tr class="calendar-dow">
													<td id="zabuto_calendar_196o_2016-05-09"
														class="dow-clickable"><div
															id="zabuto_calendar_196o_2016-05-09_day" class="day">9</div></td>
													<td id="zabuto_calendar_196o_2016-05-10"
														class="dow-clickable"><div
															id="zabuto_calendar_196o_2016-05-10_day" class="day">10</div></td>
													<td id="zabuto_calendar_196o_2016-05-11"
														class="dow-clickable"><div
															id="zabuto_calendar_196o_2016-05-11_day" class="day">11</div></td>
													<td id="zabuto_calendar_196o_2016-05-12"
														class="dow-clickable"><div
															id="zabuto_calendar_196o_2016-05-12_day" class="day">12</div></td>
													<td id="zabuto_calendar_196o_2016-05-13"
														class="dow-clickable"><div
															id="zabuto_calendar_196o_2016-05-13_day" class="day">13</div></td>
													<td id="zabuto_calendar_196o_2016-05-14"
														class="dow-clickable"><div
															id="zabuto_calendar_196o_2016-05-14_day" class="day">14</div></td>
													<td id="zabuto_calendar_196o_2016-05-15"
														class="dow-clickable"><div
															id="zabuto_calendar_196o_2016-05-15_day" class="day">15</div></td>
												</tr>
												<tr class="calendar-dow">
													<td id="zabuto_calendar_196o_2016-05-16"
														class="dow-clickable"><div
															id="zabuto_calendar_196o_2016-05-16_day" class="day">16</div></td>
													<td id="zabuto_calendar_196o_2016-05-17"
														class="dow-clickable"><div
															id="zabuto_calendar_196o_2016-05-17_day" class="day">17</div></td>
													<td id="zabuto_calendar_196o_2016-05-18"
														class="dow-clickable"><div
															id="zabuto_calendar_196o_2016-05-18_day" class="day">18</div></td>
													<td id="zabuto_calendar_196o_2016-05-19"
														class="dow-clickable"><div
															id="zabuto_calendar_196o_2016-05-19_day" class="day">19</div></td>
													<td id="zabuto_calendar_196o_2016-05-20"
														class="dow-clickable"><div
															id="zabuto_calendar_196o_2016-05-20_day" class="day">20</div></td>
													<td id="zabuto_calendar_196o_2016-05-21"
														class="dow-clickable"><div
															id="zabuto_calendar_196o_2016-05-21_day" class="day">21</div></td>
													<td id="zabuto_calendar_196o_2016-05-22"
														class="dow-clickable"><div
															id="zabuto_calendar_196o_2016-05-22_day" class="day">22</div></td>
												</tr>
												<tr class="calendar-dow">
													<td id="zabuto_calendar_196o_2016-05-23"
														class="dow-clickable"><div
															id="zabuto_calendar_196o_2016-05-23_day" class="day">23</div></td>
													<td id="zabuto_calendar_196o_2016-05-24"
														class="dow-clickable"><div
															id="zabuto_calendar_196o_2016-05-24_day" class="day">24</div></td>
													<td id="zabuto_calendar_196o_2016-05-25"
														class="dow-clickable"><div
															id="zabuto_calendar_196o_2016-05-25_day" class="day">25</div></td>
													<td id="zabuto_calendar_196o_2016-05-26"
														class="dow-clickable"><div
															id="zabuto_calendar_196o_2016-05-26_day" class="day">26</div></td>
													<td id="zabuto_calendar_196o_2016-05-27"
														class="dow-clickable"><div
															id="zabuto_calendar_196o_2016-05-27_day" class="day">27</div></td>
													<td id="zabuto_calendar_196o_2016-05-28"
														class="dow-clickable"><div
															id="zabuto_calendar_196o_2016-05-28_day" class="day">28</div></td>
													<td id="zabuto_calendar_196o_2016-05-29"
														class="dow-clickable"><div
															id="zabuto_calendar_196o_2016-05-29_day" class="day">29</div></td>
												</tr>
												<tr class="calendar-dow">
													<td id="zabuto_calendar_196o_2016-05-30"
														class="dow-clickable"><div
															id="zabuto_calendar_196o_2016-05-30_day" class="day">30</div></td>
													<td id="zabuto_calendar_196o_2016-05-31"
														class="dow-clickable"><div
															id="zabuto_calendar_196o_2016-05-31_day" class="day">31</div></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
											</tbody>
										</table>
										<div class="legend" id="zabuto_calendar_196o_legend">
											<span class="legend-text"><span
												class="badge badge-event">00</span> Special event</span><span
												class="legend-block"><ul class="legend">
													<li class="event"></li>
													<span>Regular event</span>
												</ul></span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- / calendar -->

				</div>
			</div>
		</div>
		<!-- /row -->
		</div>
	</section>
</section>
<!-- /MAIN CONTENT -->
<!--main content end-->
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />