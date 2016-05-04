<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header2_header.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header3_menu_project.jsp" />
<style>
.panel-shadow {
	box-shadow: rgba(0, 0, 0, 0.3) 7px 7px 7px;
}

.panel-white {
	border: 1px solid #dddddd;
}

.panel-white  .panel-heading {
	color: #333;
	background-color: #fff;
	border-color: #ddd;
}

.panel-white  .panel-footer {
	background-color: #fff;
	border-color: #ddd;
}

.post .post-heading {
	height: 95px;
	padding: 20px 15px;
}

.post .post-heading .avatar {
	width: 60px;
	height: 60px;
	display: block;
	margin-right: 15px;
}

.post .post-heading .meta .title {
	margin-bottom: 0;
}

.post .post-heading .meta .title a {
	color: black;
}

.post .post-heading .meta .title a:hover {
	color: #aaaaaa;
}

.post .post-heading .meta .time {
	margin-top: 8px;
	color: #999;
}

.post .post-image .image {
	width: 100%;
	height: auto;
}

.post .post-description {
	padding: 15px;
}

.post .post-description p {
	font-size: 14px;
}

.post .post-description .stats {
	margin-top: 20px;
}

.post .post-description .stats .stat-item {
	display: inline-block;
	margin-right: 15px;
}

.post .post-description .stats .stat-item .icon {
	margin-right: 8px;
}

.post .post-footer {
	border-top: 1px solid #ddd;
	padding: 15px;
}

.post .post-footer .input-group-addon a {
	color: #454545;
}

.post .post-footer .comments-list {
	padding: 0;
	margin-top: 20px;
	list-style-type: none;
}

.post .post-footer .comments-list .comment {
	display: block;
	width: 100%;
	margin: 20px 0;
}

.post .post-footer .comments-list .comment .avatar {
	width: 35px;
	height: 35px;
}

.post .post-footer .comments-list .comment .comment-heading {
	display: block;
	width: 100%;
}

.post .post-footer .comments-list .comment .comment-heading .user {
	font-size: 14px;
	font-weight: bold;
	display: inline;
	margin-top: 0;
	margin-right: 10px;
}

.post .post-footer .comments-list .comment .comment-heading .time {
	font-size: 12px;
	color: #aaa;
	margin-top: 0;
	display: inline;
}

.post .post-footer .comments-list .comment .comment-body {
	margin-left: 50px;
}

.post .post-footer .comments-list .comment>.comments-list {
	margin-left: 50px;
}
</style>
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<section id="main-content">
	<section class="wrapper site-min-height">
		<h3>
			<i class="fa fa-angle-right"></i> Detail Issue
		</h3>
		<div class="col-lg-12">
			<div class="row">
				<div class="col-md-12">
					<div class="content-panel">
						<table class="table">
							<tr>
								<td style="width: 900px"><c:if
										test="${issues.istatement=='000'}">
										<span class="label label-success">Open</span>
									</c:if> <c:if test="${issues.istatement=='001'}">
										<span class="label label-danger">Closed</span>
									</c:if> Issue #${issues.ino}
									<div style="float: right;">
										<a href="/issues/edit/${user_no}/${pno}/${ino}"
											class="btn btn-default">Edit</a>
										<c:if test="${issues.istatement=='000'}">
											<a href="/issues/close/${uno}/${pno}/${ino}"
												class="btn btn-warning">Close Issue</a>
										</c:if>
										<c:if test="${issues.istatement=='001'}">
											<a href="/issues/reopen/${uno}/${pno}/${ino}"
												class="btn btn-default">Reopen Issue</a>
										</c:if>
										<a href="/issues/remove/${uno}/${pno}/${ino}"
											class="btn btn-danger">Remove</a>
									</div></td>
								<style type="text/css">
.text1 {
	color: #54565b;
}
</style>
								<td rowspan="4" class="active"><span class="text1">Assignee</span><br />
									${issues.uname} <br />
									<hr> <span class="text1">Milestone</span><br />${issues.mtitle}
									<br />
									<hr> <%-- <span class="text1">Weight</span><br/>${issues.iweight} <br/> --%>
									<span class="text1">Weight</span><br /> <%-- <c:forEach var="labels" items="${issues.labels}"> --%>
									<span class="label color-label has_tooltip"
									style="background-color:${issues.lbgcolor}; 
		color: #FFFFFF; 
		font-size: 15px;
		font-weight: normal;
		padding:5px;
		border-radius: 5px;"
									title="" data-container="body" data-original-title="">${issues.ltitle}</span>
									<%-- </c:forEach> --%></td>
							</tr>
							<tr>
								<td>
									<h4>${issues.ititle}</h4> ${issues.idescription} <c:forEach
										var="file" items="${fileList}">
										<input type="hidden" id="fno" value="${file.fno}">
										<a href="/issue/downloadFile/${file.fno}"
											style="color: #4d94c4"><i class="fa fa-paperclip"
											aria-hidden="true"></i>${file.originalName}</a> 
		(${file.fileSize}kb)
	</c:forEach>
								</td>
							</tr>
							<tr>
								<td>
									<div class="input-group">
										<input class="form-control" placeholder="Add a comment"
											type="text" id="content" name="content"> <span
											class="input-group-addon"> <a href="#" id="cInsertBtn"
											onclick="doCreateCmt()"><i class="fa fa-edit"></i></a>
										</span>
									</div>
								</td>
							</tr>
							<tr>
								<td>
								<div class="post">
										<div class="post-footer">
											<ul class="comments-list">
												<li class="comment"><a class="pull-left" href="#">
														<img class="avatar"
														src="http://bootdey.com/img/Content/user_1.jpg"
														alt="avatar">
												</a>
													<div class="comment-body">
														<div class="comment-heading">
															<h4 class="user">Gavino Free</h4>
															<h5 class="time">5 minutes ago</h5>
														</div>
														<p>Sure, oooooooooooooooohhhhhhhhhhhhhhhh</p>
													</div></li>
													<li class="comment">
														<div class="comment-body pull-right">
															<a href="#">
																<img class="avatar" src="http://bootdey.com/img/Content/user_1.jpg" alt="avatar">
															</a>
															<div class="comment-heading">
																<h4 class="user">Gavino Free</h4>
																<h5 class="time">5 minutes ago</h5>
															</div>
															<p>Sure, oooooooooooooooohhhhhhhhhhhhhhhh</p>
														</div>
													</li>
											</ul>
										</div>
									</div>
								<div class="list-group"></div>
									</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
	</section>
</section>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />
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
	$(document)
			.on(
					"click",
					"table#commentTable a",
					function() {
						if ($(this).attr("name") == "pDel") {
							if (confirm("정말 삭제하시겠습니까?") == true) { //확인
								var cno = $(this).prev().prev().prev().prev()
										.val();
								$.post('/remove/comment', {
									"cno" : cno
								}, function(data) {
									$('.list-group').load(
											"/getCommentList/${issues.ino}");
								});
							} else {// 취소
								return;
							}
						} else if ($(this).attr("name") == "pEdit") {
							// 자기 부모의 tr을 알아낸다.
							var parentElement = $(this).parent().parent();

							// 기존 입력 되있던 댓글내용과 cno 추출
							var text = $(this).next().next().text();
							var cno = $(this).prev().prev().prev().val();

							// 부모의 하단에 댓글편집 창을 삽입
							var commentEditor = "<input type='hidden' name='cno' id='cno' value='" + cno + "'>"
									+ "<textarea class='form-control' rows='3' id='content2' name='content2'>"
									+ text
									+ "</textarea>"
									+ "<input type='button' class='btn btn-info' id='cUpdateBtn' value='SAVE COMMENT'>"
									+ "<input type='button' class='btn btn-default' id='cCancelBtn' value='CENCEL'>";

							parentElement.after(commentEditor);

							// 기존 댓글의 폼을 없앤다.
							parentElement.remove();
						}

						// 댓글 수정폼 없애기
						$("#cCancelBtn").click(
								function() {
									$('.list-group').load(
											"/getCommentList/${issues.ino}");
								});

						// 댓글 수정
						$("#cUpdateBtn")
								.on(
										'click',
										function() {
											var content2 = $(this).prev().val();
											var cno = $(this).prev().prev()
													.val();
											$
													.post(
															'/update/comment',
															{
																"cno" : cno,
																"content2" : content2
															},
															function(data) {
																$('.list-group')
																		.load(
																				"/getCommentList/${issues.ino}");
															});
										});
					});
</script>