<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp" />
<div class="container-fluid">
<div class="row">
<div id="col">
<div class="col-sm-2 col-md-2 sidebar">
	<ul class="nav nav-sidebar" style="height: 30px; text-align: center;">
		<li><a href="/">Go to DashBoard</a></li>
	</ul>
	<ul class="nav nav-sidebar">
		<li><a href="/${uno}/${pno}">Project</a></li>
	</ul>
	<ul class="nav nav-sidebar">
		<li><a href="/${uno}/${pno}/milestones/open">Milestones</a></li>
		<li class="active"><a href="/${uno}/${pno}/issues/open">Issues</a></li>
		<li><a href="/${uno}/${pno}/labels">Labels</a></li>
	</ul>
	<ul class="nav nav-sidebar">
		<li><a href="">Settings</a></li>
	</ul>
</div>
</div>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
<!-- Begin page content -->
<div style="width: 1200; margin: 0 auto; background-color: #fff">
<table class="table">
<tr>
<td style="width: 900px">
	<c:if test="${issues.istatement=='000'}"><span class="label label-success">Open</span></c:if>
	<c:if test="${issues.istatement=='001'}"><span class="label label-danger">Closed</span></c:if>
	Issue #${issues.ino}
	<div style="float: right;">
	<c:if test="${issues.istatement=='000'}">
	<a href="/issues/close/${uno}/${pno}/${ino}" class="btn btn-warning">Close Issue</a>
	</c:if>
	<c:if test="${issues.istatement=='001'}">
	<a href="/issues/reopen/${uno}/${pno}/${ino}" class="btn btn-danger">Reopen Issue</a>
	</c:if>
	<a href="/issues/edit/${uno}/${pno}/${ino}" class="btn btn-default">Edit</a>
	</div>
</td>
<style type="text/css">
.text1 {
   color : #54565b;
}
</style>
<td rowspan="4" class="active">
	<span class="text1">Assignee</span><br/> ${issues.uname} <br/><hr>
	<span class="text1">Milestone</span><br/>${issues.mtitle} <br/><hr>
	<span class="text1">Weight</span><br/>${issues.iweight} <br/>
	<span class="text1">Label</span><br/>
	<c:forEach var="labels" items="${issues.labels}">
		<span class="label color-label has_tooltip"
			style="
			background-color:${labels.lbgcolor}; color: #FFFFFF; font-size: 15px;
			font-weight: normal;
			padding:5px;
			border-radius: 5px;"
			title="" data-container="body" data-original-title="">${labels.ltitle}</span>
	</c:forEach>
</td>
</tr>
<tr><td>
	<h4>${issues.ititle}</h4>  	
	${issues.idescription}
	<c:forEach var="file" items="${fileList}">
		<input type="hidden" id="fno" value="${file.fno }">
		<a href="/issue/downloadFile/${file.fno}" style="color:#4d94c4">${file.originalName }</a> 
		(${file.fileSize}kb)
	</c:forEach>
</td></tr>
<tr>
	<td><div class="list-group"></div></td>
</tr>
<tr>
	<td>
		<ul class="nav nav-tabs">
			<li class="active"><a href="#home" data-toggle="tab"
				aria-expanded="true">Write</a></li>
		</ul>
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade active in" id="home">
				<textarea class="form-control" rows="3" id="content"
					name="content"></textarea>
			</div>
		</div><br/>
		<a href="#" class="btn btn-success" id="cInsertBtn" onclick="doCreateCmt()">Add Comment</a>
		<c:if test="${issues.istatement=='000'}">
		<a href="/issues/close/${uno}/${pno}/${ino}" class="btn btn-warning">Close Issue</a>
		</c:if>
		<c:if test="${issues.istatement=='001'}">
		<a href="/issues/reopen/${uno}/${pno}/${ino}" class="btn btn-danger">Reopen Issue</a>
		</c:if>
	</td>
</tr>
</table>
<script type="text/javascript">
$(document).ready(function() { 
	$('.list-group').load("/getCommentList/${issues.ino}");
});

// 한줄댓글 입력 메소드
function doCreateCmt() {
	// 댓글 내용이 필수이므로 검사
	if ($('#content').val() == "") {
		alert("댓글이 없습니다.. 댓글을 입력하세요!");
		$('#content').focus();
		return;
	}
	// 버튼 중복 클릭 방지
	$('#cInsertBtn').attr('disabled', 'disabled');
	$.post('/comment/regist', {
		content : $('#content').val(),
		uno : '${user_no}',
		ino : '${issues.ino}'
	}, function(data) {
		// 내용 비우기
		$('#content').val("");

		// 다시 클릭이 가능하게끔
		$('#cInsertBtn').attr("disabled", false);

		// 입력이 완료가 됐으므로 다시 리스트 불러오기
		$('.list-group').load("/getCommentList/${issues.ino}");
	});
}

// 선택한 name 요소에 따라 댓글 삭제 or 기존 댓글 폼 없애고 수정폼 만들기
$(document).on("click", "table#commentTable a", function() {
	if ($(this).attr("name") == "pDel"){
                    if (confirm("정말 삭제하시겠습니까?") == true){    //확인
                    	var cno = $(this).prev().prev().prev().prev().val();
                    	$.post('/remove/comment', {
    						"cno" : cno
    					}, function(data) {
    						$('.list-group').load("/getCommentList/${issues.ino}");
    					}); 
                    } else {// 취소
                        return;
                    }
                } else if ($(this).attr("name") == "pEdit"){
                    // 자기 부모의 tr을 알아낸다.
                    var parentElement = $(this).parent().parent();
                    
                    // 기존 입력 되있던 댓글내용과 cno 추출
                    var text = $(this).next().next().text();
                    var cno = $(this).prev().prev().prev().val();
                    
                    // 부모의 하단에 댓글편집 창을 삽입
                    var commentEditor = "<input type='hidden' name='cno' id='cno' value='" + cno + "'>" +
                    "<textarea class='form-control' rows='3' id='content2' name='content2'>" + text + "</textarea>" +
                    "<input type='button' class='btn btn-info' id='cUpdateBtn' value='SAVE COMMENT'>" +
                    "<input type='button' class='btn btn-default' id='cCancelBtn' value='CENCEL'>";
                                           
                    parentElement.after(commentEditor);
                    
                    // 기존 댓글의 폼을 없앤다.
                    parentElement.remove();
                }
	
	// 댓글 수정폼 없애기
	$("#cCancelBtn").click(function() {
		$('.list-group').load("/getCommentList/${issues.ino}");
	});
	
	// 댓글 수정
	$("#cUpdateBtn").on('click', function() {
		var content2 = $(this).prev().val();
		var cno = $(this).prev().prev().val();
		$.post('/update/comment', {
			"cno" : cno,
			"content2" :content2
		}, function(data) {
			$('.list-group').load("/getCommentList/${issues.ino}");
		});
	});
});

</script>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />