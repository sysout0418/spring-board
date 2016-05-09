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
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header2_header.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header3_menu_project.jsp" />
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper site-min-height">
		<h3><i class="fa fa-angle-right"></i> New Issue</h3>
   		<div class="col-lg-12">
    			<div class="row">
            		<div class="col-md-12">
                		<div class="content-panel">
	<form:form class="form-horizontal" method="post"
		action="/issues/regist" commandName="Issues" enctype="multipart/form-data">
		<input type="hidden" value="${uno}" name="uno" id="uno">
		<input type="hidden" value="${pno}" name="pno" id="pno">
		<c:choose>
			<c:when test="${!empty mno and !empty mtitle}">
				<input type="hidden" value="${mno}" id="mno" name="mno">
			</c:when>
			<c:otherwise>
				<input type="hidden" value="" id="mno" name="mno">
			</c:otherwise>
		</c:choose>
		<!-- <input type="hidden" value="" name="iweight" id="iweight"> -->
		<input type="hidden" value="2" name="lno" id="lno">
		<c:forEach var="user" items="${allUserList}">
			<c:if test="${user.uno == uno}">
				<input type="hidden" value="${user.uname}" name="myname" id="myname" alt="${user.uno}">
			</c:if>
		</c:forEach>
		<fieldset>
			<div class="form-group">
				<label for="inputTitle" class="col-lg-2 control-label">Title</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" id="ititle"
						name="ititle" placeholder="Issue Title" required="required" maxlength="50">
				</div>
			</div>

			<div class="form-group">
				<label for="inputDesc" class="col-lg-2 control-label">Description</label>
				<div class="col-lg-10">
					<textarea class="form-control" rows="8" id="idescription"
						name="idescription" required="required"></textarea>
					<span class="help-block">파일 첨부는 최대 1개 입니다.</span>
					<!-- File Upload -->
					<label class="control-label">Select File</label>
					<input id="input-1a" type="file" name="file" class="file" data-show-preview="false" data-show-upload="false">
					<!-- // File Upload -->
				</div>
			</div>
			<div class="form-group">
				<label for="inputAssignee" class="col-lg-2 control-label">Assignee</label>
				<div class="btn-group">
					<a href="#" class="btn btn-default btn-width"
						style="text-align: left; margin-left: 15px;"><span id="selectedAssign">Select
						Assignee</span></a> <a href="#" class="btn btn-default dropdown-toggle"
						data-toggle="dropdown"><span class="caret"
						style="height: 10px; margin-top: 10px;"></span></a>
					<a href="#" class="btn btn-default" id="assigntome" style="margin-left: 10px;">ASSIGN TO ME</a>
					<ul class="dropdown-menu">
						<c:forEach var="users" items="${userList}">
							<c:choose>
								<c:when test="${users == 'none'}">
									<li><a href="#">No user participating in this project</a></li>
								</c:when>
								<c:otherwise>
									<li class="userNo1"><a href="#" alt="${users.uno}">${users.uname}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="form-group">
				<label for="inputMilestone" class="col-lg-2 control-label">Milestone</label>
				<div class="btn-group">
					<a href="#" class="btn btn-default btn-width" style="text-align: left; margin-left: 15px;">
						<c:choose>
							<c:when test="${!empty mno and !empty mtitle}">
								<span id="selectedMilestone">${mtitle}</span>
							</c:when>
							<c:otherwise>
								<span id="selectedMilestone">Select Milestone</span>
							</c:otherwise>
						</c:choose>
					</a> 
					<a href="#" class="btn btn-default dropdown-toggle"
						data-toggle="dropdown"><span class="caret"
						style="height: 10px; margin-top: 10px;"></span></a>
					<a href="/${uno}/${pno}/milestones/new" class="btn btn-default" id="assigntome" style="margin-left: 10px;">Create New Milestone</a>
					<ul class="dropdown-menu">
						<c:forEach var="milestone" items="${milestoneList}">
							<c:choose>
								<c:when test="${milestone == 'none'}">
									<li><a href="#">No milestone to show</a></li>
								</c:when>
								<c:otherwise>
									<li class="milestoneNo"><a href="#" alt="${milestone.mno}">${milestone.mtitle}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="form-group">
				<label for="inputWeight" class="col-lg-2 control-label">Weight</label>
				<div class="btn-group">
					<a href="#" class="btn btn-default btn-width"
						style="text-align: left; margin-left: 15px;"><span
						id="selectedLabel">Select Weight</span></a> <a href="#"
						class="btn btn-default dropdown-toggle" data-toggle="dropdown"><span
						class="caret" style="height: 10px; margin-top: 10px;"></span></a>
					<ul class="dropdown-menu">
						<c:forEach var="labels" items="${labels}" varStatus="status">
							<li class="labelNo"><a href="#" alt="${labels.lno}">${labels.ltitle}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="form-group">
				<label for="inputDuedate" class="col-lg-2 control-label">Due Date</label>
				<div class="btn-group" style="margin-left: 15px;">
					<input type="text" class="form-control" id="iduedate" name="iduedate" required="required">
				</div>
			</div>
			<%-- <div class="form-group">
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
			</div> --%>
			<br>
			<br>
			<br>
			<br>
			<br>
			<div class="form-group">
				<div class="col-lg-10 col-lg-offset-2">
					<button type="button" class="btn btn-default" onclick="history.back()">Cancel</button>
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
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />
<script type="text/javascript">
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
	$('.text-tags > .text-tag').last().append(
			"<input type=hidden id=lno1 value="+lno+">");
}); */

/* $('#submit').click(function() {
	var lno = "";
	$('.text-tags > .text-tag > #lno1').each(function() {
		lno += $(this).val() + ",";
	});
	$('#lno').val(lno.substring(0, lno.length - 1));
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
	console.log(lno);
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
/* var count =0;
$(function(){
	$('#addfile').click(function(event){
		$("#fileNum").val(Number($("#fileNum").val())+1);
		console.log($("#fileNum").val());
		$("<div id='item_"+count+"'/>")
		.append($('<input type="file" id="fileup" name="fileup'+count+'"/>'))
        .append($("<input type='button' value='삭제' onclick='removeForm("+count+")'/>"))
		.appendTo('#filecontent');
		count++;
	});
}); */
/* function removeForm(count){
	$("#fileNum").val(Number($("#fileNum").val())-1);
	console.log($("#fileNum").val());
	$('#item_'+count).remove();
} */

/* Your code to create an instance of Fine Uploader and bind to the DOM/template */
/* $('#fine-uploader-manual-trigger').fineUploader({
    template: 'qq-template-manual-trigger',
    request: {
        endpoint: '/uploadFiles/issue/${uno}'
        // inputName: "fileup" + count
    },
    thumbnails: {
        placeholders: {
            waitingPath: '/resources/img/waiting-generic.png',
            notAvailablePath: '/resources/img/not_available-generic.png'
        }
    },
    validation: {
        allowedExtensions: ['jpeg', 'jpg', 'txt'],
        itemLimit: 1,
        sizeLimit: 51200 // 50 kB = 50 * 1024 bytes
    },
    autoUpload: true,
}); */

/* $('#fine-uploader-manual-trigger').fineUploader({
    template: 'qq-template-manual-trigger',
    request: {
        endpoint: '/uploadFiles/issue/${uno}'
    },
    thumbnails: {
        placeholders: {
            waitingPath: '/resources/img/waiting-generic.png',
            notAvailablePath: '/resources/img/not_available-generic.png'
        }
    },
    validation: {
        itemLimit: 1,
        sizeLimit: 10240000
        // 10mb = 10 * 1024 bytes
    }
}); */

/* $('#trigger-upload').click(function() {
	$('#fine-uploader-manual-trigger').fineUploader('uploadStoredFiles');
	$('#trigger-upload').attr('alt', "1");
}); */
</script>