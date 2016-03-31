<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp" />
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-2 col-md-2 sidebar">
			<ul class="nav nav-sidebar" style="height: 30px; text-align: center;">
				<li><a href="/">Go to DashBoard</a></li>
			</ul>
			<ul class="nav nav-sidebar">
				<li><a href="/${uno}/${pno}">Project</a></li>
			</ul>
			<ul class="nav nav-sidebar">
				<li><a href="/${uno}/${pno}/milestones/open">Milestones</a></li>
				<li class="active"><a href="/${uno}/${pno}/issues/open">Issues<span
						class="sr-only">(current)</span></a></li>
				<li><a href="/${uno}/${pno}/labels">Labels</a></li>
			</ul>
			<ul class="nav nav-sidebar">
				<li><a href="">Settings</a></li>
			</ul>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<!-- Begin page content -->
			<div style="width: 1200; margin: 0 auto; background-color: #fff">
				<div role="tabpanel">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" 
							<c:if test="${stat=='open'}"> class="active"</c:if>>
							<a href="/${uno}/${pno}/issues/open">Open</a></li>
						<li role="presentation"
							<c:if test="${stat=='closed'}"> class="active"</c:if>>
							<a href="/${uno}/${pno}/issues/closed">Closed</a></li>
						<li role="presentation"
							<c:if test="${stat=='all'}"> class="active"</c:if>>
							<a href="/${uno}/${pno}/issues/all">All</a></li>
						<li style="position: absolute; right: 200px;">
							<a href="/${uno}/${pno}/issues/new" class="btn btn-success">+
								New Issues</a></li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content well">
						<input type="hidden" id="userNo" name="userNo" value="">
						<input type="hidden" id="mno" name="mno" value="">
						<input type="hidden" id="lno" name="lno" value="">
						<input type="hidden" id="weight" name="weight" value="">
						<div class="btn-group">
							<a href="#" class="btn btn-default"><span id="selectedAssign">Assignee</span></a> <a href="#"
								class="btn btn-default dropdown-toggle" data-toggle="dropdown"
								aria-expanded="false"><span class="caret"
								style="height: 10px; margin-top: 10px;"></span></a>
							<ul class="dropdown-menu">
								<c:forEach var="users" items="${userList}">
									<li class="userNo1">
									<a alt="${users.uno}" href="#">${users.uname}</a></li>
								</c:forEach>
							</ul>
						</div>
						<!-- <div class="btn-group">
							<a href="#" class="btn btn-default">Assignee</a> <a href="#"
								class="btn btn-default dropdown-toggle" data-toggle="dropdown"
								aria-expanded="false"><span class="caret"
								style="height: 10px; margin-top: 10px;"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li class="divider"></li>
								<li><a href="#">4</a></li>
							</ul>
						</div> -->
						<div class="btn-group">
							<a href="#" class="btn btn-default"><span id="selectedMilestone">Milestone</span></a> <a href="#"
								class="btn btn-default dropdown-toggle" data-toggle="dropdown"
								aria-expanded="false"><span class="caret"
								style="height: 10px; margin-top: 10px;"></span></a>
							<ul class="dropdown-menu">
								<c:forEach var="milestone" items="${allMilestoneList}">
								<li class="milestoneNo"><a id="milestoneNo" alt="${milestone.mno}" href="#">${milestone.mtitle}</a></li>
								</c:forEach>
							</ul>
						</div>
						<div class="btn-group">
							<a href="#" class="btn btn-default"><span id="selectedLabel">Label</span></a> <a href="#"
								class="btn btn-default dropdown-toggle" data-toggle="dropdown"
								aria-expanded="false"><span class="caret"
								style="height: 10px; margin-top: 10px;"></span></a>
							<ul class="dropdown-menu">
								<c:forEach var="label" items="${allLabelList}">
									<li class="labelNo"><a id="labelNo" alt="${label.lno}" href="#" style="text-color: ${label.lbgcolor}">${label.ltitle}</a></li>
								</c:forEach>
							</ul>
						</div>
						<div class="btn-group">
							<a href="#" class="btn btn-default"><span id="selectedWeight">Weight</span></a> <a href="#"
								class="btn btn-default dropdown-toggle" data-toggle="dropdown"
								aria-expanded="false"><span class="caret"
								style="height: 10px; margin-top: 10px;"></span></a>
							<ul class="dropdown-menu">
								<% for (int i = 1; i < 10; i++) { %>
									<li class="weight"><a href="#"><%= i %></a></li>
								<% } %>
							</ul>
						</div>
						<a href="#" id="searchBtn" class="btn btn-info">Search</a>
					</div>
					<form name="frm" id="frm" method="post">
						<input type="hidden" name="isCheckCbListAll" value="F">

						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th><div class="checkboxAll">
											<label> <input type="checkbox" name="cbListAll"
												onclick="checkCbListAll()">
											</label>
										</div></th>
									<th>Issue Title</th>
									<th>Milestone Title</th>
									<th>Label</th>
									<th>Weight</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="issues" items="${issuesList}" varStatus="status">
									<input type="hidden" name="issueState"
										value="${issues.istatement }">
									<tr class="warning">
										<td><div class="checkbox">
												<label> <input type="checkbox" name="cbList"
													value="${issues.ino }">
												</label>
											</div></td>
										<td><a
											href="/${issues.uno}/${issues.pno}/issue/${issues.ino}">${issues.ititle}</a><br>
											${issues.idescription }</td>
										<td><a
											href="/${issues.uno}/${issues.pno}/milestone/${issues.mno}">${issues.mtitle}</a></td>

										<td><c:forEach var="labels" items="${issues.labels}">
												<a href="#"><span class="label color-label has_tooltip"
													style="background-color:
												${labels.lbgcolor}; color: #FFFFFF"
													title="" data-container="body" data-original-title="">${labels.ltitle}</span></a>
											</c:forEach></td>

										<td>${issues.iweight}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</form>
				</div>
				Issues${uname} ${pno}
			</div>
		</div>
		<script type="text/javascript">
			$('.dropdown-menu > .userNo1 > a').bind('click', function() {
				var userName = $(this).text();
				var userNo = $(this).attr("alt");
				console.log(userNo);
				$("#userNo").val(userNo);
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
			$('.dropdown-menu > .weight > a').bind('click', function() {
				var weight = $(this).text();
				console.log(weight);
				$("#weight").val(weight);
				$("#selectedWeight").text(weight);
			});
		
			$('#searchBtn').click(function() {
				$('#searchBtn').attr("href", "/${uno}/${pno}/issues/${stat}/search?userNo=" 
						+ $("#userNo").val() + "&mno=" + $("#mno").val()
						+ "&lno=" + $("#lno").val() + "&weight=" + $("#weight").val());
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
		<jsp:include
			page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />