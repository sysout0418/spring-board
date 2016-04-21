<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header2_header.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header3_menu_dash.jsp" />
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper site-min-height">
		<h3>
			<i class="fa fa-angle-right"></i> ${pname} / Issues
		</h3>
		<div role="tabpanel">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation"
					<c:if test="${stat=='open'}"> class="active"</c:if>><a
					href="/${uno}/${pno}/issues/open">Open</a></li>
				<li role="presentation"
					<c:if test="${stat=='closed'}"> class="active"</c:if>><a
					href="/${uno}/${pno}/issues/closed">Closed</a></li>
				<li role="presentation"
					<c:if test="${stat=='all'}"> class="active"</c:if>><a
					href="/${uno}/${pno}/issues/all">All</a></li>
				<li style="width: 1000px;"><div style="float: right;">
						<a href="/${uno}/${pno}/issues/new" class="btn btn-success">New
							Issues</a>
					</div></li>
			</ul>

			<!-- Tab panes -->
			<div class="tab-content well">
				<c:choose>
					<c:when test="${!empty selectedUserName}">
						<input type="hidden" id="userNo" name="userNo"
							value="${searchUno}">
					</c:when>
					<c:otherwise>
						<input type="hidden" id="userNo" name="userNo" value="">
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${!empty selectedMilestone}">
						<input type="hidden" id="mno" name="mno" value="${mno}">
					</c:when>
					<c:otherwise>
						<input type="hidden" id="mno" name="mno" value="">
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${!empty selectedLabelName}">
						<input type="hidden" id="lno" name="lno" value="${lno}">
					</c:when>
					<c:otherwise>
						<input type="hidden" id="lno" name="lno" value="">
					</c:otherwise>
				</c:choose>
				<div class="btn-group">
					<a href="#" class="btn btn-default"> <c:choose>
							<c:when test="${!empty selectedUserName}">
								<span id="selectedAssign">${selectedUserName}</span>
							</c:when>
							<c:otherwise>
								<span id="selectedAssign">Assignee</span>
							</c:otherwise>
						</c:choose>
					</a> <a href="#" class="btn btn-default dropdown-toggle"
						data-toggle="dropdown" aria-expanded="false"><span
						class="caret" style="height: 10px; margin-top: 10px;"></span></a>
					<ul class="dropdown-menu">
						<li class="userNo1"><a alt="" href="#">Any</a></li>
						<c:forEach var="users" items="${userList}">
							<li class="userNo1"><a alt="${users.uno}" href="#">${users.uname}</a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="btn-group">
					<a href="#" class="btn btn-default"> <c:choose>
							<c:when test="${!empty selectedMilestone}">
								<span id="selectedMilestone">${selectedMilestone}</span>
							</c:when>
							<c:otherwise>
								<span id="selectedMilestone">Milestone</span>
							</c:otherwise>
						</c:choose>
					</a> <a href="#" class="btn btn-default dropdown-toggle"
						data-toggle="dropdown" aria-expanded="false"><span
						class="caret" style="height: 10px; margin-top: 10px;"></span></a>
					<ul class="dropdown-menu">
						<li class="milestoneNo"><a id="milestoneNo" alt="" href="#">Any</a></li>
						<c:forEach var="milestone" items="${milestoneList}">
							<li class="milestoneNo"><a id="milestoneNo"
								alt="${milestone.mno}" href="#">${milestone.mtitle}</a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="btn-group">
					<a href="#" class="btn btn-default"> <c:choose>
							<c:when test="${!empty selectedLabelName}">
								<span id="selectedLabel">${selectedLabelName}</span>
							</c:when>
							<c:otherwise>
								<span id="selectedLabel">Weight</span>
							</c:otherwise>
						</c:choose>
					</a> <a href="#" class="btn btn-default dropdown-toggle"
						data-toggle="dropdown" aria-expanded="false"><span
						class="caret" style="height: 10px; margin-top: 10px;"></span></a>
					<ul class="dropdown-menu">
						<li class="labelNo"><a id="labelNo" alt="" href="#">Any</a></li>
						<c:forEach var="label" items="${allLabelList}">
							<li class="labelNo"><a id="labelNo" alt="${label.lno}"
								href="#" style="color: ${label.lbgcolor}">${label.ltitle}</a></li>
						</c:forEach>
					</ul>
				</div>
				<%-- <div class="btn-group">
					<a href="#" class="btn btn-default"><span id="selectedWeight">Weight</span></a> <a href="#"
						class="btn btn-default dropdown-toggle" data-toggle="dropdown"
						aria-expanded="false"><span class="caret"
						style="height: 10px; margin-top: 10px;"></span></a>
					<ul class="dropdown-menu">
						<% for (int i = 1; i < 10; i++) { %>
							<li class="weight"><a href="#"><%= i %></a></li>
						<% } %>
					</ul>
				</div> --%>
				<a href="#" id="searchBtn" class="btn btn-warning">Search</a>
			</div>
			<form name="frm" id="frm" method="post">
				<input type="hidden" name="isCheckCbListAll" value="F">

				<table class="table">
					<tr class="active">
						<td><div class="checkboxAll">
								<label> <input type="checkbox" name="cbListAll"
									onclick="checkCbListAll()">
								</label>
							</div></td>
						<td>Issue Title</td>
						<td>Milestone Title</td>
						<td>Weight</td>
						<td>Due Date</td>
						<!-- <td>Weight</td> -->
					</tr>
					<c:forEach var="issues" items="${issuesList}" varStatus="status">
						<input type="hidden" name="issueState"
							value="${issues.istatement }">
						<tr>
							<td><div class="checkbox">
									<label> <input type="checkbox" name="cbList"
										value="${issues.ino }">
									</label>
								</div></td>
							<td><a
								href="/${issues.uno}/${issues.pno}/issue/${issues.ino}">${issues.ititle}</a><br>
								${issues.idescription }</td>
							<td><c:choose>
									<c:when test="${!empty issues.mtitle}">
										<a href="/${issues.uno}/${issues.pno}/milestone/${issues.mno}">${issues.mtitle}</a>
									</c:when>
									<c:otherwise>
											No Milestone
										</c:otherwise>
								</c:choose></td>

							<td><span class="label color-label has_tooltip"
								style="background-color:
									${issues.lbgcolor}; color: #FFFFFF"
								title="" data-container="body" data-original-title="">${issues.ltitle}</span>
							</td>

							<td>${issues.iduedate}</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="5"></td>
					</tr>
				</table>
			</form>
		</div>
	</section>
</section>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />
<script type="text/javascript">
	$('.dropdown-menu > .userNo1 > a').bind('click', function() {
		var userName = $(this).text();
		var userNo = $(this).attr("alt");
		console.log(userNo);
		console.log(userName);
		$("#userNo1").val(userNo);
		$("#selectedAssign").text(userName);
	});
	$('.dropdown-menu > .milestoneNo > a').bind('click', function() {
		var mTitle = $(this).text();
		var milestoneNo = $(this).attr("alt");
		console.log(milestoneNo);
		$("#mno").val(milestoneNo);
		$("#selectedMilestone").text(mTitle);
	});
	$('.dropdown-menu > .labelNo > a').bind('click', function() {
		var lTitle = $(this).text();
		var labelNo = $(this).attr("alt");
		console.log(labelNo);
		$("#lno").val(labelNo);
		$("#selectedLabel").text(lTitle);
	});
	/* $('.dropdown-menu > .weight > a').bind('click', function() {
		var weight = $(this).text();
		console.log(weight);
		$("#weight").val(weight);
		$("#selectedWeight").text(weight);
	}); */

	$('#searchBtn').click(
			function() {
				$('#searchBtn').attr(
						"href",
						"/${uno}/${pno}/issues/${stat}/search?userNo="
								+ $("#userNo").val() + "&mno="
								+ $("#mno").val() + "&lno=" + $("#lno").val());
			});

	//문자열 공백제거 함수
	String.prototype.stripspace = function() {
		return this.replace(/ /g, "");
	}

	//체크박스 전체선택
	function checkCbAll(cbList, isChecked) {
		if (cbList) {
			if (typeof (cbList.length) == "undefined") {
				if (!cbList.disabled)
					cbList.checked = isChecked;
			} else {
				for (var i = 0; i < cbList.length; i++) {
					if (cbList[i].type.toUpperCase() == 'CHECKBOX') {
						if (cbList[i].value.stripspace() != ""
								&& !cbList[i].disabled) {
							cbList[i].checked = isChecked;
						}
					}
				}
			}
		}
	}

	function checkCbListAll() {
		var f = document.frm;

		if (f.isCheckCbListAll.value != "T") {
			checkCbAll(f.cbList, true);
			f.cbListAll.checked = true;
			f.isCheckCbListAll.value = "T";
		} else {
			checkCbAll(f.cbList, false);
			f.cbListAll.checked = false;
			f.isCheckCbListAll.value = "F";
		}
	}

	function delList() {
		var f = document.frm;
		var items = "";

		if (!f.cbList)
			return false;

		if (typeof (f.cbList.length) == "undefined") {
			if (f.cbList.checked)
				items = f.cbList.value;
		} else {
			for (var i = 0; i < f.cbList.length; i++) {
				if (f.cbList[i].checked) {
					items += ((items) ? "," : "") + f.cbList[i].value;
				}
			}
		}

		if (items == "") {
			alert("삭제 선택");
			return false;
		}

		if (confirm("삭제?")) {
			f.action = "URL";
			f.submit();
		}
	}
</script>