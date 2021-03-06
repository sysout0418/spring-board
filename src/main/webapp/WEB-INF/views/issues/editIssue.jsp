<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	int i = 0;
%>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header2_header.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header3_menu_project.jsp" />
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper site-min-height">
		<h3><i class="fa fa-angle-right"></i> Edit Issue</h3>
   		<div class="col-lg-12">
    			<div class="row">
            		<div class="col-md-12">
                		<div class="content-panel">
		<form:form class="form-horizontal" method="post"
			action="/issues/edit" commandName="Issues" enctype="multipart/form-data">
			<input type="hidden" value="${ino}" name="ino" id="ino">
			<input type="hidden" value="${pno}" name="pno" id="pno">
			<input type="hidden" value="${issues.uno}" name="uno" id="uno">
			<%-- <input type="hidden" value="${issues.iweight}" name="iweight" id="iweight"> --%>
			<input type="hidden" value="${issues.lno}" name="lno" id="lno">
			<input type="hidden" value="${issues.mno}" name="mno" id="mno">
			<c:forEach var="user" items="${allUserList}">
				<c:if test="${user.uno == user_no}">
					<input type="hidden" value="${user.uname}" name="myname" id="myname" alt="${user.uno}">
				</c:if>
			</c:forEach>
			<fieldset>
				<div class="form-group">
					<label for="inputTitle" class="col-lg-2 control-label">Title</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="ititle"
							name="ititle" placeholder="Issue Title"
							value="${issues.ititle}" required="required" maxlength="50">
					</div>
				</div>

				<div class="form-group">
					<label for="inputDesc" class="col-lg-2 control-label">Description</label>
					<div class="col-lg-10">
						<textarea class="form-control" rows="8" id="idescription"
							name="idescription" required="required">${issues.idescription}</textarea>
						<span class="help-block">help 설명</span>
						<section id="filecontent">
							<c:choose>
								<c:when test="${!empty fileList}">
									<c:forEach var="file" items="${fileList}" varStatus="var">
										<p>
											<input type="hidden" id="fno" name="fno" value="${file.fno}">
											<a href="#this" id="name_${file.fno}" name="name_${file.fno}">${file.originalName}</a>
											(${file.fileSize}kb) <a href="#this" class="btn"
												id="delete_${file.fno}" name="delete_${file.fno}">삭제</a>
											<input type="file" id="file_${file.fno}" name="file_${file.fno}">
										</p>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<span class="help-block">파일 첨부는 최대 1개 입니다.</span>
									<!-- File Upload -->
									<label class="control-label">Select File</label>
									<input id="input-1a" type="file" name="file" class="file" data-show-preview="false" data-show-upload="false">
									<!-- // File Upload -->
								</c:otherwise>
							</c:choose>
						</section>
					</div>
				</div>

				<div class="form-group">
					<label for="inputAssignee" class="col-lg-2 control-label">Assignee</label>
					<div class="btn-group">
						<a class="btn btn-default btn-width"
							style="text-align: left; margin-left: 15px;"><span
							id="selectedAssign"> 
							<c:choose>
								<c:when test="${!empty issues.uname}">
									${issues.uname}
								</c:when>
								<c:when test="${empty issues.uname}">
									Select Assignee
								</c:when>
							</c:choose>
						</span></a> <a class="btn btn-default dropdown-toggle"
							data-toggle="dropdown"><span class="caret"
							style="height: 10px; margin-top: 10px;"></span></a>
						<a href="#" class="btn btn-default" id="assigntome" style="margin-left: 10px;">ASSIGN TO ME</a>
						<ul class="dropdown-menu" style="margin-left: 15px;">
							<c:forEach var="users" items="${userList}">
								<c:choose>
									<c:when test="${users == 'none'}">
										<li><a>No user participating in this project</a></li>
									</c:when>
									<c:otherwise>
										<li class="userNo1"><a alt="${users.uno}">${users.uname}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputMilestone" class="col-lg-2 control-label">Milestone</label>
					<div class="btn-group">
						<a class="btn btn-default btn-width"
							style="text-align: left; margin-left: 15px;"><span
							id="selectedMilestone"> 
							<c:choose>
								<c:when test="${!empty issues.mtitle}">
									${issues.mtitle}
								</c:when>
								<c:when test="${empty issues.mtitle}">
									Select Milestone
								</c:when>
							</c:choose>
						</span></a> <a class="btn btn-default dropdown-toggle"
							data-toggle="dropdown"><span class="caret"
							style="height: 10px; margin-top: 10px;"></span></a>
						<a href="/${uno}/${pno}/milestones/new" class="btn btn-default" id="assigntome" style="margin-left: 10px;">Create New Milestone</a>
						<ul class="dropdown-menu" style="margin-left: 15px;">
							<c:forEach var="milestone" items="${milestoneList}">
								<c:choose>
									<c:when test="${milestone == 'none'}">
										<li><a>No milestone to show</a></li>
									</c:when>
									<c:otherwise>
										<li class="milestoneNo"><a alt="${milestone.mno}">${milestone.mtitle}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputLabels" class="col-lg-2 control-label">Weight</label>
					<div class="btn-group">
						<a class="btn btn-default btn-width"
							style="text-align: left; margin-left: 15px;">
							<span id="selectedLabel">
							<c:choose>
								<c:when test="${!empty issues.ltitle}">
									${issues.ltitle}
								</c:when>
								<c:when test="${empty issues.ltitle}">
									Select Weight
								</c:when>
							</c:choose>
							</span></a>
							<a class="btn btn-default dropdown-toggle" data-toggle="dropdown">
							<span class="caret" style="height: 10px; margin-top: 10px;"></span></a>
						<ul class="dropdown-menu" style="margin-left: 15px;">
							<c:forEach var="labels" items="${labelList}" varStatus="status">
								<li class="labelNo"><a alt="${labels.lno}">${labels.ltitle}</a></li>
							</c:forEach>
						</ul>
						<!-- <div style="margin-left: 15px; margin-top: 50px;">
							<input style="width: 0px; height: 33px;"
								class="form-control input-lg" type="text" id="inputLarge">
						</div> -->
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputDuedate" class="col-lg-2 control-label">Due Date</label>
					<div class="btn-group" style="margin-left: 15px;">
						<input type="text" id="iduedate" name="iduedate" required="required" readonly="readonly" value="${issues.iduedate }"/>
					</div>
				</div>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br>
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
		</div>
		</div>
		</section>
		</section>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />
<script type="text/javascript">
$(document).ready(function(){
	$("a[name^='delete']").on("click", function(e){ //삭제 버튼
		e.preventDefault();
		$(this).parent().remove();
	});
});

$(function() {
	$( "#iduedate" ).datepicker({
		altFormat : "mm/dd/yy",
		minDate: 0
	});
});

$("#assigntome").click(function() {
	var userName = $("#myname").val();
	var userNo = $("#myname").attr("alt");
	console.log(userNo);
	$("#uno").val(userNo);
	$("#selectedAssign").text(userName);
});

/* $('#inputLarge').textext({
	plugins : 'tags'
}); */

/* $('.labelNo > a').bind('click', function() {
	var text = $(this).text();
	var lno = $(this).attr("alt");
	$('#inputLarge').textext()[0].tags().addTags([ text ]);
	$('.text-tags > .text-tag').last().append("<input type=hidden id=lno1 value="+lno+">");
}); */

/* $('#submit').click(function() {
	var lno = "";
	$('.text-tags > .text-tag > #lno1').each(function() {
		if ($(this).val() != '') {
			lno += $(this).val() + ",";
		}
	});
	if (lno != "") {
		$('#lno').val(lno.substring(0, lno.length - 1));
	}
}); */

$('.dropdown-menu > .userNo1 > a').bind('click', function() {
	var userName = $(this).text();
	var userNo = $(this).attr("alt");
	console.log(userNo);
	$("#uno").val(userNo);
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
	var lno = $(this).attr("alt");
	console.log(lTitle);
	$("#lno").val(lno);
	$("#selectedLabel").text(lTitle);
});

/* $('.dropdown-menu > .weight > a').bind('click', function() {
	var weight = $(this).text();
	//var weight = $(this).attr("alt");
	//console.log(userNo);
	$("#iweight").val(weight);
	$("#selectedWeight").text(weight);
}); */

// file upload를 위한 function
/* var count = 0;
$(function(){
	$('#addfile').click(function(event){
		if (count < 1) {
			$("#fileNum").val(Number($("#fileNum").val())+1);
			console.log($("#fileNum").val());
			$("<div id='item_"+count+"'/>")
			.append($('<input type="file" id="fileup" name="fileup'+count+'"/>'))
	           .append($("<input type='button' value='삭제' onclick='removeForm("+count+")'/>"))
			.appendTo('#filecontent');
			count++;
		} else {
			alert("파일 업로드는 최대 1개 입니다..");
		}
	});
}); */

/* function removeForm(count){
	$("#fileNum").val(Number($("#fileNum").val())-1);
	console.log($("#fileNum").val());
	$('#item_'+count).remove();
} */
</script>