<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	int i = 0;
%>
<style>
.btn-width {
	width: 200px;
}
</style>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp" />
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-2 col-md-2 sidebar">
			<ul class="nav nav-sidebar" style="height: 30px; text-align: center;">
				<li><a href="/">Go to DashBoard</a></li>
			</ul>
			<ul class="nav nav-sidebar">
				<li><a href="/${uno}/${pno}">Project<span class="sr-only">(current)</span></a></li>
			</ul>
			<ul class="nav nav-sidebar">
				<li><a href="/${uno}/${pno}/milestones/open">Milestones</a></li>
				<li class="active"><a href="/${uno}/${pno}/issues/open">Issues</a></li>
			</ul>
			<ul class="nav nav-sidebar">
				<li><a href="">Settings</a></li>
			</ul>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<!-- Begin page content -->
			<div style="width: 1200; margin: 0 auto; background-color: #fff">
				<form:form class="form-horizontal" method="post"
					action="/issues/regist" commandName="Issues">
					<input type="hidden" value="" name="userNo" id="userNo">
					<input type="hidden" value="${pno}" name="pno" id="pno">
					<input type="hidden" value="" id="mno" name="mno">
					<input type="hidden" value="" name="weight" id="weight">
					<input type="hidden" value="" name="lno" id="lno">
					<fieldset>
						<legend class="page-header">
							<h3>New Issue</h3>
						</legend>
						<div class="form-group">
							<label for="inputTitle" class="col-lg-2 control-label">Title</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" id="ititle"
									name="ititle" placeholder="Issue Title">
							</div>
						</div>

						<div class="form-group">
							<label for="inputDesc" class="col-lg-2 control-label">Description</label>
							<div class="col-lg-10">
								<textarea class="form-control" rows="8" id="idescription"
									name="idescription"></textarea>
								<span class="help-block">help 설명</span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputAssignee" class="col-lg-2 control-label">Assignee</label>
							<div class="btn-group">
								<a href="#" class="btn btn-default btn-width"
									style="text-align: left; margin-left: 15px;"><span id="selectedAssign">select
									assignee</span></a> <a href="#" class="btn btn-default dropdown-toggle"
									data-toggle="dropdown"><span class="caret"
									style="height: 10px; margin-top: 10px;"></span></a>
								<ul class="dropdown-menu">
									<c:forEach var="users" items="${userList}">
										<li class="userNo1"><a href="#" alt="${users.uno }">${users.uname}</a></li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class="form-group">
							<label for="inputMilestone" class="col-lg-2 control-label">Milestone</label>
							<div class="btn-group">
								<a href="#" class="btn btn-default btn-width"
									style="text-align: left; margin-left: 15px;"><span id="selectedMilestone">Select
									Milestone</span></a> <a href="#" class="btn btn-default dropdown-toggle"
									data-toggle="dropdown"><span class="caret"
									style="height: 10px; margin-top: 10px;"></span></a>
								<ul class="dropdown-menu">
									<c:forEach var="milestone" items="${allMilestoneList}">
										<li class="milestoneNo"><a href="#" alt="${milestone.mno}">${milestone.mtitle}</a></li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class="form-group">
							<label for="inputWeight" class="col-lg-2 control-label">Weight</label>
							<div class="btn-group">
								<a href="#" class="btn btn-default btn-width"
									style="text-align: left; margin-left: 15px;"><span
									id="selectedWeight">Select Weight</span></a> <a href="#"
									class="btn btn-default dropdown-toggle" data-toggle="dropdown"><span
									class="caret" style="height: 10px; margin-top: 10px;"></span></a>
								<ul class="dropdown-menu">
									<% for (i = 1; i < 10; i++) {%>
										<li class="weight"><a href="#" id="weight<%=i%>"><%=i%></a></li>
									<%}%>
								</ul>
							</div>
						</div>
						<div class="form-group">
							<label for="inputLabels" class="col-lg-2 control-label">Labels</label>
							<div class="btn-group">
								<a href="#" class="btn btn-default btn-width"
									style="text-align: left; margin-left: 15px;"><span id="selectedLabel">Select Labels</span></a><a
									href="#" class="btn btn-default dropdown-toggle"
									data-toggle="dropdown"><span class="caret"
									style="height: 10px; margin-top: 10px;"></span></a>
								<ul class="dropdown-menu">
									<c:forEach var="labels" items="${labels}" varStatus="status">
										<li class="labelNo"><a href="#" alt="${labels.lno}">${labels.ltitle}</a></li>
									</c:forEach>
								</ul>
								<div style="margin-left: 15px; margin-top: 50px;">
									<input style="width: 0px; height: 33px;" class="form-control input-lg" type="text" id="inputLarge">
								</div>
							</div>
						</div>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<button type="reset" class="btn btn-default">Cancel</button>
								<button type="submit" id="submit" class="btn btn-primary">Submit</button>
							</div>
						</div>
					</fieldset>
				</form:form>
			</div>
		</div>
		<script type="text/javascript">
			$('#inputLarge').textext({
				plugins : 'tags'
			});

			$('.labelNo > a').bind('click', function() {
				var text = $(this).text();
				var lno = $(this).attr("alt");
				$('#inputLarge').textext()[0].tags().addTags([ text ]);
				$('.text-tags > .text-tag').last().append(
						"<input type=hidden id=lno1 value="+lno+">");
			});

			$('#submit').click(function() {
				var lno = "";
				$('.text-tags > .text-tag > #lno1').each(function() {
					lno += $(this).val() + ",";
				});
				$('#lno').val(lno.substring(0, lno.length - 1));
			});

			/* function handler() {
				console.log("handler 호출됨");
				var text = $(this).text();
				var lno = $(this).attr("alt");
				$('#inputLarge').textext()[0].tags().addTags([ text ]);
				$('.text-tags > .text-tag').last().append(
						"<input type=hidden id=lno1 value="+lno+">");
			} */

			/* function handler2() {
				console.log("handler2 호출됨");
				var lno = "";
				$('.text-tags > .text-tag > #lno1').each(function() {
					lno += $(this).val() + ",";
				});
				$('#lno').val(lno.substring(0, lno.length - 1));
			} */

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
			
			$('.dropdown-menu > .weight > a').bind('click', function() {
				var weight = $(this).text();
				//var weight = $(this).attr("alt");
				//console.log(userNo);
				$("#weight").val(weight);
				$("#selectedWeight").text(weight);
			});
			
			/* $('.dropdown-menu > .labelNo > a').bind('click', function() {
				var lTitle = $(this).text();
				var labelNo = $(this).attr("alt");
				console.log(labelNo);
				$("#lno").val(labelNo);
				$("#selectedLabel").text(lTitle);
			}); */
		</script>
		<jsp:include
			page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />