<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header_project.jsp"/>
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

<!-- Begin page content -->
<div style="width:1200; margin:0 auto; background-color: #fff">
    <h4>New Milestones</h4>  	
	<form:form method="post" action="/milestones/regist" commandName="milestone" enctype="multipart/form-data">
	<table class="table">
		<tr>
			<td>Title</td>
			<td><form:input path="mtitle" cssClass="form-control"/></td>
			<td rowspan="2">Due Date</td>
			<td rowspan="2"><div id="datepicker"><form:hidden path="mduedate" id="date"/></div></td>
		</tr>
		<tr>
			<td style="border-color: #fff">Description</td>
			<td style="border-color: #fff"><form:textarea path="mdescription" rows="8" cssClass="form-control"/>
			<!-- <input type="file" name="file" multiple="multiple"/> -->
			<!-- Fine Uploader DOM Element -->
    		<div id="fine-uploader-manual-trigger"></div>
    		<!-- // Fine Uploader DOM Element -->
			</td>
		</tr>
		<tr>
			<td colspan="4"><input class="btn btn-success" type="submit" value="Create milestone"></td>
		</tr>
		<tr><td colspan="4"><input type="hidden" value="${uno}" name="uno"/><input type="hidden" value="${pno}" name="pno"/></td></tr>
	</table>
	</form:form>
</div>
 <script>
$(function() {
  $( "#datepicker" ).datepicker({
	 altField: "#date",
	 altFormat : "mm/dd/yy"
  });
});

/* $('#fine-uploader-manual-trigger').fineUploader({
    template: 'qq-template-manual-trigger',
    request: {
        endpoint: '/uploadFiles/milestone/${uno}',
        // inputName: "fileup" + count
    },
    thumbnails: {
        placeholders: {
            waitingPath: '/resources/img/waiting-generic.png',
            notAvailablePath: '/resources/img/not_available-generic.png'
        }
    },
    autoUpload: true,
}); */

$('#fine-uploader-manual-trigger').fineUploader({
    template: 'qq-template-manual-trigger',
    request: {
        endpoint: '/uploadFiles/milestone/${uno}'
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

</script>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>