<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	int i = 0;
%>
<script type="text/template" id="qq-template-manual-trigger">
	<div class="qq-uploader-selector qq-uploader" qq-drop-area-text="Drop files here">
		<div class="qq-total-progress-bar-container-selector qq-total-progress-bar-container">
			<div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-total-progress-bar-selector qq-progress-bar qq-total-progress-bar"></div>
		</div>
		<div class="qq-upload-drop-area-selector qq-upload-drop-area" qq-hide-dropzone>
			<span class="qq-upload-drop-area-text-selector"></span>
		</div>
		<div class="buttons">
			<div class="qq-upload-button-selector qq-upload-button">
				<div>Select files</div>
			</div>
		</div>
		<span class="qq-drop-processing-selector qq-drop-processing">
			<span>Processing dropped files...</span>
			<span class="qq-drop-processing-spinner-selector qq-drop-processing-spinner"></span>
		</span>
		<ul class="qq-upload-list-selector qq-upload-list" aria-live="polite" aria-relevant="additions removals">
			<li>
				<div class="qq-progress-bar-container-selector">
					<div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-progress-bar-selector qq-progress-bar"></div>
				</div>
				<span class="qq-upload-spinner-selector qq-upload-spinner"></span>
				<img class="qq-thumbnail-selector" qq-max-size="100" qq-server-scale>
				<span class="qq-upload-file-selector qq-upload-file"></span>
				<span class="qq-edit-filename-icon-selector qq-edit-filename-icon" aria-label="Edit filename"></span>
				<input class="qq-edit-filename-selector qq-edit-filename" tabindex="0" type="text">
				<span class="qq-upload-size-selector qq-upload-size"></span>
				<button type="button" class="qq-btn qq-upload-cancel-selector qq-upload-cancel">Cancel</button>
				<button type="button" class="qq-btn qq-upload-retry-selector qq-upload-retry">Retry</button>
				<button type="button" class="qq-btn qq-upload-delete-selector qq-upload-delete">Delete</button>
				<span role="status" class="qq-upload-status-text-selector qq-upload-status-text"></span>
			</li>
		</ul>

		<dialog class="qq-alert-dialog-selector">
			<div class="qq-dialog-message-selector"></div>
			<div class="qq-dialog-buttons">
				<button type="button" class="qq-cancel-button-selector">Close</button>
			</div>
		</dialog>

		<dialog class="qq-confirm-dialog-selector">
			<div class="qq-dialog-message-selector"></div>
			<div class="qq-dialog-buttons">
				<button type="button" class="qq-cancel-button-selector">No</button>
				<button type="button" class="qq-ok-button-selector">Yes</button>
			 </div>
		</dialog>

		<dialog class="qq-prompt-dialog-selector">
			<div class="qq-dialog-message-selector"></div>
			<input type="text">
			<div class="qq-dialog-buttons">
				<button type="button" class="qq-cancel-button-selector">Cancel</button>
				<button type="button" class="qq-ok-button-selector">Ok</button>
			</div>
		</dialog>
	</div>
</script>

<style>
.btn-width {
	width: 200px;
}
#trigger-upload {
	color: white;
	background-color: #00ABC7;
	font-size: 14px;
	padding: 7px 20px;
	background-image: none;
}

#fine-uploader-manual-trigger .qq-upload-button {
	margin-right: 15px;
}

#fine-uploader-manual-trigger .buttons {
	width: 36%;
}

#fine-uploader-manual-trigger .qq-uploader .qq-total-progress-bar-container {
	width: 60%;
}
</style>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header_project.jsp" />
<!-- Begin page content -->
<div style="width: 1200; margin: 0 auto; background-color: #fff">
	<form:form class="form-horizontal" method="post"
		action="/issues/regist" commandName="Issues" enctype="multipart/form-data">
		<input type="hidden" value="${uno}" name="uno" id="uno">
		<input type="hidden" value="${pno}" name="pno" id="pno">
		<input type="hidden" value="" id="mno" name="mno">
		<input type="hidden" value="" name="iweight" id="iweight">
		<input type="hidden" value="" name="lno" id="lno">
		<fieldset>
			<legend class="page-header">
				<h4>New Issue</h4>
			</legend>
			<div class="form-group">
				<label for="inputTitle" class="col-lg-2 control-label">Title</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" id="ititle"
						name="ititle" placeholder="Issue Title" required="required">
				</div>
			</div>

			<div class="form-group">
				<label for="inputDesc" class="col-lg-2 control-label">Description</label>
				<div class="col-lg-10">
					<textarea class="form-control" rows="8" id="idescription"
						name="idescription" required="required"></textarea>
					<span class="help-block">help 설명</span>
					<!-- <input type="button" id="addfile" value='파일추가'/>
					<section id="filecontent"></section> -->
					<!-- Fine Uploader DOM Element -->
    				<div id="fine-uploader-manual-trigger"></div>
    				<!-- // Fine Uploader DOM Element -->
				</div>
			</div>
			<div class="form-group">
				<label for="inputAssignee" class="col-lg-2 control-label">Assignee</label>
				<div class="btn-group">
					<a href="#" class="btn btn-default btn-width"
						style="text-align: left; margin-left: 15px;"><span id="selectedAssign">Select
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
					<button type="button" class="btn btn-default" onclick="history.back()">Cancel</button>
					<button type="submit" id="submit" class="btn btn-primary">Submit</button>
				</div>
			</div>
		</fieldset>
	</form:form>
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

$('.dropdown-menu > .weight > a').bind('click', function() {
	var weight = $(this).text();
	//var weight = $(this).attr("alt");
	//console.log(userNo);
	$("#iweight").val(weight);
	$("#selectedWeight").text(weight);
});

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

$('#fine-uploader-manual-trigger').fineUploader({
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
        allowedExtensions: ['jpeg', 'jpg', 'txt', 'xls', 'xlsx', 'hwp', 'exe', 'zip', 'doc'],
        itemLimit: 1,
        sizeLimit: 10000000
        // 10mb = 10 * 1024 bytes
    }
});

/* $('#trigger-upload').click(function() {
	$('#fine-uploader-manual-trigger').fineUploader('uploadStoredFiles');
	$('#trigger-upload').attr('alt', "1");
}); */
</script>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />