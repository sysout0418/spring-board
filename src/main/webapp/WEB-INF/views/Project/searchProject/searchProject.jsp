<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header2_header.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header3_menu_dash.jsp" />
<jsp:useBean id="pageBean"
	class="com.nbreds.projectPlanning.common.util.PageBean" scope="request" />
<% String[] pdatas = (String[]) request.getAttribute("pdatas"); %>
<style>
.progress {
   height: 10px;
   margin-bottom: 3px;
}
</style>
<!-- Begin page content -->
<form name="search" id="search" method="POST">
	<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
	<!--main content start-->
	<section id="main-content">
		<section class="wrapper site-min-height">
			<h3>
				<i class="fa fa-angle-right"></i> Search
			</h3>
			<div class="col-lg-12">
				<div class="row">
					<div class="col-md-12">
						<div class="content-panel">
							<div id="search">
								<input type="hidden" name="pageNo" id="pageNo"
									value="${pageBean.pageNo}" /> <input type="hidden"
									name="pdata" id="pdata" value="" />
								<table class="table">
									<tr>
										<td
											style="width: 230px; text-align: center; vertical-align: middle;"
											class="active">개발분야</td>
										<td colspan="3"><c:forEach var="dev"
												items="${development}">
												<input type="checkbox" value="${dev.CODE_TYPE}${dev.CODE}"
													name="checked" style="margin-left: 2px">${dev.CODE_NAME}
										</c:forEach></td>
									</tr>
									<tr>
										<td
											style="width: 230px; text-align: center; vertical-align: middle;"
											class="active">디자인/퍼블리싱 분야</td>
										<td colspan="3"><c:forEach var="des" items="${design}">
												<input type="checkbox" value="${des.CODE_TYPE}${des.CODE}"
													name="checked" style="margin-left: 2px">${des.CODE_NAME}
										</c:forEach></td>
									</tr>
									<tr>
										<td
											style="width: 230px; text-align: center; vertical-align: middle;"
											class="active">기획/컨설턴트 분야</td>
										<td colspan="3"><c:forEach var="plan" items="${planning}">
												<input type="checkbox" value="${plan.CODE_TYPE}${plan.CODE}"
													name="checked" style="margin-left: 2px">${plan.CODE_NAME}
										</c:forEach></td>
									</tr>
									<tr>
										<td colspan="4"></td>
									</tr>
								</table>
							</div>

							<a href="javascript:pagelist(1)" class="btn btn-success"
								style="position: relative; left: 200px; top: -30px;">Search</a>

							<table class="table table-hover">
								<thead>
									<tr>
										<th>#</th>
										<th><i class="fa fa-bullhorn"></i> 프로젝트명</th>
										<th><i class="fa fa-question-circle"></i> 프로젝트 진행도</th>
										<th><i class="fa fa-bookmark"></i> 상태</th>
										<th><i class="fa fa-edit"></i> 담당자</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${list == 'none'}">
											<tr style="height: 100px">
												<td colspan="6"
													style="text-align: center; vertical-align: middle;">
													No projects to show</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="project" items="${list}">
												<tr onclick="location.href='/DetailProject/${project.pno}'"
													style="cursor: pointer;">
													<td>${project.rowNum}</td>
													<td><a href="#">${project.pname}</a><br>
													<small>Closing date ${project.pduedate}</small></td>
													<td class="hidden-phone">
														<div class="progress">
															<div class="progress-bar progress-bar-success"
																role="progressbar" aria-valuenow="40" aria-valuemin="0"
																aria-valuemax="100" style="width: ${project.pprogress}%"></div>
														</div> <small>${project.pprogress}% Complete</small>
													</td>
													<td><span class="label label-warning label-mini"
														style="background-color: ${project.lbgcolor}">${project.ltitle}</span></td>
													<td>${project.uname}</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>

							<!-- 페이징 -->
							<div align="center">${pageBean.pagelink}</div>
							
						</div>
					</div>
				</div>
			</div>
		</section>
	</section>
</form>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />
<script type="text/javascript">
function pagelist(page) {
	$("#pageNo").val(page);
	selectChkRow();
	$("#search").get(0).action = "/search";
	$("#search").get(0).submit();
}

function selectChkRow() {
	var chk = document.getElementsByName("checked"); // 체크박스객체를 담는다
	var len = chk.length;	// 체크박스의 전체 개수
	var checkRow = '';		// 체크된 체크박스의 value를 담기위한 변수
	var checkCnt = 0;		// 체크된 체크박스의 개수
	var checkLast = '';		// 체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
	var rowid = '';			// 체크된 체크박스의 모든 value 값을 담는다
	var cnt = 0;                 

	for(var i=0; i<len; i++) {
		if(chk[i].checked == true) {
			checkCnt++;        //체크된 체크박스의 개수
			checkLast = i;     //체크된 체크박스의 인덱스
		}
	} 

	for(var i=0; i<len; i++) {
		if(chk[i].checked == true) {			//체크가 되어있는 값 구분
			checkRow = chk[i].value;
			if (checkCnt == 1) {				//체크된 체크박스의 개수가 한 개 일때,
				rowid += checkRow;				// value의 형태 (뒤에 ,(콤마)가 붙지않게)
			} else if(i == checkLast) {			//체크된 체크박스 중 마지막 체크박스일 때,
				rowid += checkRow;  			//value의 형태 (뒤에 ,(콤마)가 붙지않게)
			} else {
				rowid += checkRow + ",";		//value,의 형태 (뒤에 ,(콤마)가 붙게)
			}
		}
		cnt++;
		checkRow = '';	//checkRow초기화.
	}
	$('#pdata').val(rowid);
}

$(function() {
	var chk = document.getElementsByName("checked"); // 체크박스 객체
	for (var i = 0; i < chk.length; i++) {
		<% if (pdatas != null) {
				for (int j = 0; j < pdatas.length; j++) { %>
					if ('<%= pdatas[j] %>' == chk[i].value) {
						chk[i].checked = true;
					}
		<% 		}
			} %>
	}
	});
</script>