<%@page import="com.nbreds.projectPlanning.Project.VO.ProjectMemberStat"%>
<%@page import="com.nbreds.projectPlanning.HomeController"%>
<%@page import="com.nbreds.projectPlanning.common.VO.User"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	List<User> userInfoList = HomeController.USER_INFO;
	List<ProjectMemberStat> participatedUserList = (List<ProjectMemberStat>) request.getAttribute("participatedUserList");
%>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header2_header.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header3_menu_dash.jsp" />

<!-- Begin page content -->
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper site-min-height">
		<h3>
			<i class="fa fa-angle-right"></i> Edit Project
		</h3>
		<div class="col-lg-12">
			<div class="row">
				<div class="col-md-12">
					<div class="content-panel">
						<p>
							<strong>담당자 정보</strong>
						</p>
						<table class="table">
							<tr>
								<td style="width: 200px;" class="active">담당자명</td>
								<td style="width: 350px">${user.uname}</td>
								<td style="width: 200px;" class="active">부서</td>
								<td>${user.udepartment}</td>
							</tr>
							<tr>
								<td class="active">담당자 연락처</td>
								<td>${user.uphoneno}</td>
								<td class="active">담당자 이메일</td>
								<td>${user.uemail}</td>
							</tr>
							<tr>
								<td colspan="4"></td>
							</tr>
						</table>

						<p>
							<strong>프로젝트 키워드</strong>
						</p>
						<form:form method="POST" action="/update" commandName="project">
							<%
								String userNos = "";
									String userNames = "";
									for (int i = 0; i < participatedUserList.size(); i++) {
										if (participatedUserList.size() == 1) { //체크된 체크박스의 개수가 한 개 일때,
											userNos += participatedUserList.get(i).getUno();
											userNames += participatedUserList.get(i).getUname();
										} else if (i == participatedUserList.size() - 1) { //체크된 체크박스 중 마지막 체크박스일 때,
											userNos += participatedUserList.get(i).getUno();
											userNames += participatedUserList.get(i).getUname();
										} else {
											userNos += participatedUserList.get(i).getUno() + ",";
											userNames += participatedUserList.get(i).getUname() + ",";
										}
									}
							%>
							<input type="hidden" id="requestUserNoList"
								name="requestUserNoList" value="<%=userNos%>">
							<input type="hidden" id="requestUserNameList"
								name="requestUserNameList" value="<%=userNames%>">
							<table class="table">
								<tr>
									<td colspan="2"
										style="width: 500px; vertical-align: middle; text-align: center;"
										class="active">프로젝트 명</td>
									<td style="width: 300px" colspan="2"><form:input
											path="pname" class="form-control" required="required" /></td>
								</tr>
								<tr>
									<td rowspan="3"
										style="width: 100px; vertical-align: middle; text-align: center;"
										class="active">기본분야</td>
									<td
										style="width: 200px; vertical-align: middle; text-align: center;"
										class="active">개발</td>
									<td colspan="2"><form:checkboxes path="pdevelopment"
											items="${development}" itemValue="CODE" itemLabel="CODE_NAME" />
									</td>
								</tr>
								<tr>
									<td class="active"
										style="vertical-align: middle; text-align: center;">디자인/퍼블리싱</td>
									<td colspan="2"><form:checkboxes path="pdesign"
											items="${design}" itemValue="CODE" itemLabel="CODE_NAME" /></td>
								</tr>
								<tr>
									<td class="active"
										style="vertical-align: middle; text-align: center;">기획/컨설턴트</td>
									<td colspan="2"><form:checkboxes path="pplanning"
											items="${planning}" itemValue="CODE" itemLabel="CODE_NAME" /></td>
								</tr>
								<tr>
									<td colspan="2" class="active"
										style="vertical-align: middle; text-align: center;">상세내용</td>
									<td colspan="2"><form:textarea path="pdetail"
											cssClass="form-control" cssStyle="height:400px"
											required="required" /></td>
								</tr>
								<tr>
									<td colspan="2" class="active"
										style="vertical-align: middle; text-align: center;">모집마감일자</td>
									<td><form:input path="pduedate" id="datepicker"
											name="datepicker" required="required" /></td>
								</tr>
								<tr>
									<td colspan="2" class="active"
										style="vertical-align: middle; text-align: center;">프로젝트 요청</td>
									<td>
										<div>
											<a href="#" class="btn btn-primary btn-xs"
												data-toggle="modal" data-target="#myModal"> 변경</a>
											<div class="selectedUserList">
												<c:forEach var="participate" items="${participatedUserList}">
													<span class="btn btn-warning btn-xs">${participate.uname}</span>&nbsp;
												</c:forEach>
											</div>
										</div>
										
										<!-- Modal -->
										<div class="modal fade" id="myModal" tabindex="-1"
											role="dialog" aria-labelledby="myModalLabel"
											aria-hidden="true" style="display: none;">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-hidden="true">×</button>
														<h4 class="modal-title" id="myModalLabel">프로젝트 요청</h4>
													</div>
													<div class="modal-body">
														<ul class="nav nav-tabs">
															<li class="
															<c:choose>
																<c:when test="${index == 0}">active</c:when>
																<c:when test="${empty index}">active</c:when>
															</c:choose>
															"><a href="#a" data-toggle="tab"
																aria-expanded="true">전체</a></li>
															<li class="<c:if test="${index == 1}">active</c:if>"><a href="#b" data-toggle="tab"
																aria-expanded="false">경영지원팀</a></li>
															<li class="<c:if test="${index == 2}">active</c:if>"><a href="#c" data-toggle="tab"
																aria-expanded="false">SCBS사업팀</a></li>
															<li class="<c:if test="${index == 3}">active</c:if>"><a href="#d" data-toggle="tab"
																aria-expanded="false">SCBS전략팀</a></li>
															<li class="<c:if test="${index == 4}">active</c:if>"><a href="#e" data-toggle="tab"
																aria-expanded="false">SCBS해외사업팀</a></li>
															<li class="<c:if test="${index == 5}">active</c:if>"><a href="#f" data-toggle="tab"
																aria-expanded="false">Hardware개발팀</a></li>
															<li class="<c:if test="${index == 6}">active</c:if>"><a href="#g" data-toggle="tab"
																aria-expanded="false">중국지사</a></li>
															<li class="<c:if test="${index == 7}">active</c:if>"><a href="#h" data-toggle="tab"
																aria-expanded="false">Software개발팀</a></li>
															<li class="<c:if test="${index == 8}">active</c:if>"><a href="#i" data-toggle="tab"
																aria-expanded="false">서비스기획팀</a></li>
															<li class="<c:if test="${index == 9}">active</c:if>"><a href="#j" data-toggle="tab"
																aria-expanded="false">UI/UX팀</a></li>
														</ul>
														<c:set var="doneLoop" value="false" />
														<div id="myTabContent" class="tab-content">
															<!-- 유저 리스트 -->
															<div class="tab-pane fade 
															<c:choose>
																<c:when test="${index == 0}">active in</c:when>
																<c:when test="${empty index}">active in</c:when>
															</c:choose>" id="a">
																<c:forEach var="user" items="${allUserList}">
																	<div class="checkbox">
																		<label> <input type="checkbox" name="userName"
																			value="${user.uno}" alt="${user.uname}"
																			<c:if test="${user.isChecked}">
																					checked="checked"
																				</c:if>>${user.uname}
																		</label>
																	</div>
																</c:forEach>
															</div>
															<div class="tab-pane fade <c:if test="${index == 1}">active in</c:if>" id="b">
																<c:forEach var="user" items="${allUserList}">
																	<c:choose>
																		<c:when test="${user.udepartment == 000}">
																			<div class="checkbox">
																				<label> <input type="checkbox"
																					name="userName" value="${user.uno}"
																					alt="${user.uname}"
																					<c:if test="${user.isChecked}">
																							checked="checked"
																						</c:if>>${user.uname}
																				</label>
																			</div>
																		</c:when>
																	</c:choose>
																</c:forEach>
															</div>
															<div class="tab-pane fade <c:if test="${index == 2}">active in</c:if>" id="c">
																<c:forEach var="user" items="${allUserList}">
																	<c:choose>
																		<c:when test="${user.udepartment == 001}">
																			<div class="checkbox">
																				<label> <input type="checkbox"
																					name="userName" value="${user.uno}"
																					alt="${user.uname}"
																					<c:if test="${user.isChecked}">
																							checked="checked"
																						</c:if>>${user.uname}
																				</label>
																			</div>
																		</c:when>
																	</c:choose>
																</c:forEach>
															</div>
															<div class="tab-pane fade <c:if test="${index == 3}">active in</c:if>" id="d">
																<c:forEach var="user" items="${allUserList}">
																	<c:choose>
																		<c:when test="${user.udepartment == 002}">
																			<div class="checkbox">
																				<label> <input type="checkbox"
																					name="userName" value="${user.uno}"
																					alt="${user.uname}"
																					<c:if test="${user.isChecked}">
																							checked="checked"
																						</c:if>>${user.uname}
																				</label>
																			</div>
																		</c:when>
																	</c:choose>
																</c:forEach>
															</div>
															<div class="tab-pane fade <c:if test="${index == 4}">active in</c:if>" id="e">
																<c:forEach var="user" items="${allUserList}">
																	<c:choose>
																		<c:when test="${user.udepartment == 003}">
																			<div class="checkbox">
																				<label> <input type="checkbox"
																					name="userName" value="${user.uno}"
																					alt="${user.uname}"
																					<c:if test="${user.isChecked}">
																							checked="checked"
																						</c:if>>${user.uname}
																				</label>
																			</div>
																		</c:when>
																	</c:choose>
																</c:forEach>
															</div>
															<div class="tab-pane fade <c:if test="${index == 5}">active in</c:if>" id="f">
																<c:forEach var="user" items="${allUserList}">
																	<c:choose>
																		<c:when test="${user.udepartment == 004}">
																			<div class="checkbox">
																				<label> <input type="checkbox"
																					name="userName" value="${user.uno}"
																					alt="${user.uname}"
																					<c:if test="${user.isChecked}">
																							checked="checked"
																						</c:if>>${user.uname}
																				</label>
																			</div>
																		</c:when>
																	</c:choose>
																</c:forEach>
															</div>
															<div class="tab-pane fade <c:if test="${index == 6}">active in</c:if>" id="g">
																<c:forEach var="user" items="${allUserList}">
																	<c:choose>
																		<c:when test="${user.udepartment == 005}">
																			<div class="checkbox">
																				<label> <input type="checkbox"
																					name="userName" value="${user.uno}"
																					alt="${user.uname}"
																					<c:if test="${user.isChecked}">
																							checked="checked"
																						</c:if>>${user.uname}
																				</label>
																			</div>
																		</c:when>
																	</c:choose>
																</c:forEach>
															</div>
															<div class="tab-pane fade <c:if test="${index == 7}">active in</c:if>" id="h">
																<c:forEach var="user" items="${allUserList}">
																	<c:choose>
																		<c:when test="${user.udepartment == 006}">
																			<div class="checkbox">
																				<label> <input type="checkbox"
																					name="userName" value="${user.uno}"
																					alt="${user.uname}"
																					<c:if test="${user.isChecked}">
																							checked="checked"
																						</c:if>>${user.uname}
																				</label>
																			</div>
																		</c:when>
																	</c:choose>
																</c:forEach>
															</div>
															<div class="tab-pane fade <c:if test="${index == 8}">active in</c:if>" id="i">
																<c:forEach var="user" items="${allUserList}">
																	<c:choose>
																		<c:when test="${user.udepartment == 007}">
																			<div class="checkbox">
																				<label> <input type="checkbox"
																					name="userName" value="${user.uno}"
																					alt="${user.uname}"
																					<c:if test="${user.isChecked}">
																							checked="checked"
																						</c:if>>${user.uname}
																				</label>
																			</div>
																		</c:when>
																	</c:choose>
																</c:forEach>
															</div>
															<div class="tab-pane fade <c:if test="${index == 9}">active in</c:if>" id="j">
																<c:forEach var="user" items="${allUserList}">
																	<c:choose>
																		<c:when test="${user.udepartment == 008}">
																			<div class="checkbox">
																				<label> <input type="checkbox"
																					name="userName" value="${user.uno}"
																					alt="${user.uname}"
																					<c:if test="${user.isChecked}">
																							checked="checked"
																						</c:if>>${user.uname}
																				</label>
																			</div>
																		</c:when>
																	</c:choose>
																</c:forEach>
															</div>
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">Close</button>
														<button type="button" id="okBtn" class="btn btn-primary"
															data-dismiss="modal">OK</button>
													</div>
												</div>
											</div>
										</div>


									</td>
								</tr>
								<tr>
									<td colspan="3"><input type="hidden" id="pno" name="pno"
										value="${project.pno}" /> <%-- <input type="hidden" id="pprogress" name="pprogress" value="${project.pprogress}" /> --%></td>
								</tr>
							</table>
							<input class="btn btn-warning" type="submit" id="submit"
								value="Save Changes">
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</section>
</section>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />
<script type="text/javascript">
	var index = 0;
	$(document).on('change', 'input[name="userName"]', function() {
		console.log($(this).val());
		console.log($(this).is(':checked'));

		if ($(this).is(':checked') == false) {
			var chk = document.getElementsByName("userName");
			for (var i = 0; i < chk.length; i++) {
				if ($(this).val() == chk[i].value) {
					console.log("chk[i].value : " + chk[i].value);
					chk[i].checked = false;
				}
			}
		} else if ($(this).is(':checked') == true) {
			// name이 같은 체크박스의 값들을 배열에 담는다.
			var checkboxValues = [];
			$('input[name="userName"]:checked').each(function(i) {
				checkboxValues.push($(this).val());
			});

			// 유니크한 체크값
			var uniqueCheckboxValues = checkboxValues.reduce(function(a, b) {
				if (a.indexOf(b) < 0)
					a.push(b);
				return a;
			}, []);

			// 어떤 부서를 선택헀는지 index 조사
			$(document).on('click', '.nav-tabs > li', function() {
				index = $(this).index();
				console.log('클래스 있는 div index? : ' + index);
			});

			// 체크박스 값들(배열)을 name/value 형태로 담는다.
			console.log("uniqueCheckboxValues" + uniqueCheckboxValues);
			var allData = {
				"index" : index,
				"checkArray" : uniqueCheckboxValues
			};

			$.ajax({
				url : "/getUserList",
				type : 'GET',
				data : allData,
				success : function(data) {
					$('#myTabContent').empty();
					$('#myTabContent').append(data);
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("에러 발생이군? \n" + textStatus + " : " + errorThrown);
				}
			});
		}
	});

	$(function() {
		$( "#datepicker" ).datepicker({
			altField: "#datepicker",
			minDate: 0,
			onSelect: function(date){
				$('#date').val(date);
			}
		});
		
		var chk = document.getElementsByName("userName"); // 체크박스 객체
		for (var i = 0; i < chk.length; i++) {
			<%if (participatedUserList != null) {
				for (int j = 0; j < participatedUserList.size(); j++) {%>
					if ('<%=participatedUserList.get(j).getUname()%>' == chk[i].alt) {
						chk[i].checked = true;
					}
				<%}
			}%>
		}
	
	});
	 
	$('#okBtn').click(function() {
		selectChkRow();
		if ($('#requestUserList').val() != '' && $('#requestUserNameList').val() != '') {
			$('.selectedUserList').empty();
			var userName = $('#requestUserNameList').val().split(",");
			for (var i = 0; i < userName.length; i++) {
				$('.selectedUserList').append(
						'<span class="btn btn-warning btn-xs">'
								+ userName[i] + '</span>&nbsp;&nbsp;');
			}
		} else {
			$('.selectedUserList').empty();
		} 
	});

	function selectChkRow() {
		var chk = document.getElementsByName("userName"); // 체크박스객체를 담는다
		var len = chk.length; // 체크박스의 전체 개수
		var checkRow = ''; // 체크된 체크박스의 value를 담기위한 변수
		var checkText = ''; // 체크된 체크박스의 text를 담기위한 변수
		var checkCnt = 0; // 체크된 체크박스의 개수
		var checkLast = ''; // 체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
		var rowId = ''; // 체크된 체크박스의 모든 value 값을 담는다
		var rowName = ''; // 체크된 체크박스의 모든 text 값을 담는다
		
		for (var i = 0; i < len; i++) {
			if (chk[i].checked == true) {
				checkCnt++; //체크된 체크박스의 개수
				checkLast = i; //체크된 체크박스의 인덱스
			}
		}

		for (var i = 0; i < len; i++) {
			if (chk[i].checked == true) { //체크가 되어있는 값 구분
				checkRow = chk[i].value;
				checkText = chk[i].alt;

				if (checkCnt == 1) { //체크된 체크박스의 개수가 한 개 일때,
					rowId += checkRow; // value의 형태 (뒤에 ,(콤마)가 붙지않게)
					rowName += checkText;
				} else if (i == checkLast) { //체크된 체크박스 중 마지막 체크박스일 때,
					rowId += checkRow; //value의 형태 (뒤에 ,(콤마)가 붙지않게)
					rowName += checkText;
				} else {
					rowId += checkRow + ","; //value,의 형태 (뒤에 ,(콤마)가 붙게)
					rowName += checkText + ",";
				}

			}
			checkRow = ''; // checkRow초기화.
			checkText = ''; // checkText초기화.
		}

		var rowIds = rowId.split(",");
		var rowNames = rowName.split(",");

		var uniqueRowId = rowIds.reduce(function(a, b) {
			if (a.indexOf(b) < 0)
				a.push(b);
			return a;
		}, []);

		var uniqueRowName = rowNames.reduce(function(a, b) {
			if (a.indexOf(b) < 0)
				a.push(b);
			return a;
		}, []);

		console.log(uniqueRowId);
		console.log(uniqueRowName);

		rowId = '';
		rowName = '';
		for (var i = 0; i < uniqueRowId.length; i++) {
			rowId += uniqueRowId[i] + ",";
			rowName += uniqueRowName[i] + ",";
		}

		console.log(rowId.substring(0, rowId.length - 1));
		console.log(rowName.substring(0, rowName.length - 1));
		$('#requestUserNoList').val(rowId.substring(0, rowId.length - 1));
		$('#requestUserNameList').val(rowName.substring(0, rowName.length - 1));
	}
</script>