<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp" />
<div class="container-fluid">
	<div class="row">
		<div id="col">
			<div class="col-sm-2 col-md-2 sidebar">
				<ul class="nav nav-sidebar"
					style="height: 30px; text-align: center;">
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
				<form class="form-horizontal">
					<fieldset>
						<legend>
							<c:choose>
								<c:when test="${issues.istatement == '000'}">
									<a href="/issues/close/${uno}/${pno}/${ino}"
										class="btn btn-warning"
										style="position: absolute; right: 260px;">Close Issue</a> 
								</c:when>
								<c:when test="${issues.istatement == '001'}">
									<a href="/issues/reopen/${uno}/${pno}/${ino}"
										class="btn btn-warning"
										style="position: absolute; right: 260px;">Reopen Issue</a> 
								</c:when>
							</c:choose>
								<a href="/issues/edit/${uno}/${pno}/${ino}" class="btn btn-info"
								style="position: absolute; right: 200px;">Edit</a>
							<h3>Issue Detail</h3>
						</legend>
						<div class="jumbotron">
							<div>
								<c:choose>
									<c:when test="${issues.istatement == '000'}">
										<span class="label label-success">Open</span> Issue
								</c:when>
									<c:when test="${issues.istatement == '001'}">
										<span class="label label-success">Closed</span> Issue
								</c:when>
								</c:choose>
								#${issues.ino}
							</div>
							<h2>${issues.ititle}</h2>
							<p>${issues.idescription}</p>
							<c:forEach var="file" items="${fileList}">
		                        <input type="hidden" id="fno" value="${file.fno }">
		                        <a href="/issue/downloadFile/${file.fno}">${file.originalName }</a> 
		                        (${file.fileSize}kb) <br>
                    		</c:forEach>
						</div>

						<div class="panel panel-danger">
							<div class="panel-heading">
								<h3 class="panel-title">Assignee</h3>
							</div>
							<div class="panel-body">${issues.uname}</div>
						</div>

						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">Milestone</h3>
							</div>
							<div class="panel-body">${issues.mtitle}</div>
						</div>

						<div class="panel panel-success">
							<div class="panel-heading">
								<h3 class="panel-title">Labels</h3>
							</div>
							<div class="panel-body">
								<c:forEach var="labels" items="${issues.labels}">
									<span class="label color-label has_tooltip"
										style="background-color:${labels.lbgcolor}; color: #FFFFFF"
										title="" data-container="body" data-original-title="">${labels.ltitle}</span>
								</c:forEach>
							</div>
						</div>

						<div class="panel panel-warning">
							<div class="panel-heading">
								<h3 class="panel-title">Weight</h3>
							</div>
							<div class="panel-body">${issues.iweight}</div>
						</div>

						<div class="list-group">
							
						</div>

						<ul class="nav nav-tabs">
							<li class="active"><a href="#home" data-toggle="tab"
								aria-expanded="true">Write</a></li>
							<li class=""><a href="#profile" data-toggle="tab"
								aria-expanded="false">Preview</a></li>
						</ul>
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane fade active in" id="home">
								<textarea class="form-control" rows="3" id="content"
									name="content"></textarea>
							</div>
							<div class="tab-pane fade" id="profile">
								<p>preview</p>
							</div>
						</div>
						
						<a href="#" class="btn btn-success" id="cInsertBtn"
							onclick="doCreateCmt()">Comment</a>
					</fieldset>
				</form>
			</div>
			<script type="text/javascript">
				$(document).ready(function() { 
					$('.list-group').load("/getCommentList/${issues.ino}");
				});

				// 한줄댓글 입력 메소드
				function doCreateCmt() {
					// 한줄댓글 내용이 필수이므로 검사
					if ($('#content').val() == "") {
						alert("댓글이 없슴다.");
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