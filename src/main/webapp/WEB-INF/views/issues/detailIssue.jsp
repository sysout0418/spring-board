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
.text1 {
	color: #54565b;
}
</style>
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true"
	style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">Warning</h4>
			</div>
			<div class="modal-body">
				<p>정말로 이 이슈를 Close 하시겠습니까?</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" id="okBtn" class="btn btn-primary"
					data-dismiss="modal">Yes</button>
			</div>
		</div>
	</div>
</div>
<!-- Modal2 -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true"
	style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">Warning</h4>
			</div>
			<div class="modal-body">
				<p>정말로 이 이슈를 Open 하시겠습니까?</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" id="okBtn2" class="btn btn-primary"
					data-dismiss="modal">Yes</button>
			</div>
		</div>
	</div>
</div>
<!-- Modal3 -->
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true"
	style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">Warning</h4>
			</div>
			<div class="modal-body">
				<p>정말로 이 이슈를 삭제 하시겠습니까?</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" id="okBtn3" class="btn btn-primary"
					data-dismiss="modal">Yes</button>
			</div>
		</div>
	</div>
</div>
<!-- Modal4 -->
<div class="modal fade" id="myModal4" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true"
	style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">Warning</h4>
			</div>
			<div class="modal-body">
				<p>정말로 이 댓글을 삭제 하시겠습니까?</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" id="okBtn4" class="btn btn-primary"
					data-dismiss="modal">Yes</button>
			</div>
		</div>
	</div>
</div>
<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="col-lg-9">
			<div class="row">
				<div class="col-md-12">
					<h3>
						<i class="fa fa-angle-right"></i> Project #${pno} / Issue #${ino} / ${issues.ititle}
					</h3>
					<div class="content-panel">
						<table class="table">
							<tr>
								<td><c:if test="${issues.istatement=='000'}">
										<span class="label label-success">Open</span>
									</c:if> <c:if test="${issues.istatement=='001'}">
										<span class="label label-danger">Closed</span>
									</c:if> Issue #${issues.ino}
									<div style="float: right;">
										<a href="/issues/edit/${issues.uno}/${pno}/${ino}"
											class="btn btn-default">Edit</a>
										<c:if test="${issues.istatement=='000'}">
											<a href="#" id="issueCloseBtn" alt="/issues/close/${uno}/${pno}/${ino}"
												data-toggle="modal" data-target="#myModal"
												class="btn btn-warning">Close Issue</a>
										</c:if>
										<c:if test="${issues.istatement=='001'}">
											<a href="#" id="issueOpenBtn" alt="/issues/reopen/${uno}/${pno}/${ino}"
												data-toggle="modal" data-target="#myModal2"
												class="btn btn-default">Reopen Issue</a>
										</c:if>
										<a href="#" id="issueDelBtn" alt="/issues/remove/${uno}/${pno}/${ino}"
											data-toggle="modal" data-target="#myModal3"
											class="btn btn-danger">Remove</a>
									</div></td>
							</tr>
							<tr>
								<td>
									<h4>${issues.ititle}</h4> ${issues.idescription}
									<c:forEach
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
											type="text" id="content" name="content"> 
										<span class="input-group-addon" id="cInsertBtn" onclick="doCreateCmt()" style="cursor: pointer;">
											<a href="#"><i class="fa fa-edit"></i></a>
										</span>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="list-group">
										
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-3 ds">
			<!--COMPLETED ACTIONS DONUTS CHART-->
			<h3>ISSUE DESCRIPTION</h3>

			<div class="desc">
						<h4 class="green">
							<i class="fa fa-paint-brush"></i> ${issues.ititle}
						</h4>
						${issues.idescription}<br>
						<br>
						<p>
							<b>마일스톤</b><br> ${issues.mtitle}<br>
						</p>
						<p>
							<b>이슈 등록일</b><br> ${issues.iregdate}<br>
						</p>
						<p>
							<b>이슈 만기일</b><br> ${issues.iduedate}<br>
						</p>
						<p>
							<b>담당자</b><br> ${issues.uname}<br>
						</p>
						<span class="label label-default" style="background-color: ${issues.lbgcolor};">${issues.ltitle}</span><br><br>
				</div>

							<!-- CALENDAR-->
                        <div id="calendar" class="mb">
                            <div class="panel green-panel no-margin">
                                <div class="panel-body">
                                    <div id="date-popover" class="popover top" style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">
                                        <div class="arrow"></div>
                                        <h3 class="popover-title" style="disadding: none;"></h3>
                                        <div id="date-popover-content" class="popover-content"></div>
                                    </div>
                                    <div id="my-calendar"></div>
                                </div>
                            </div>
                        </div><!-- / calendar -->

		</div>
	</section>
</section>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />
<script type="text/javascript">
	$("#okBtn").click(function() {
		location.href = $('#issueCloseBtn').attr('alt');
	});
	
	$("#okBtn2").click(function() {
		location.href = $('#issueOpenBtn').attr('alt');
	});
	
	$("#okBtn3").click(function() {
		location.href = $('#issueDelBtn').attr('alt');
	});

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

	$(document).on('click', '.post-description > #stat > a', function() {
		var cno = '';
		if ($(this).attr("name") == "pDel") {
			cno = $(this).next().val();
			$('#okBtn4').click(function() {
				$.post('/remove/comment', {
					"cno" : cno
				}, function(data) {
					$('.list-group').load("/getCommentList/${issues.ino}");
				});
			});
		} else if ($(this).attr("name") == "pEdit") {
			// 자기 부모의 tr을 알아낸다.
			var parentElement = $(this).parent().parent(); // <div class="post-description"> ... </div>
			
			// 기존 입력 되있던 댓글내용과 cno 추출
			var text = $(this).parent().prev().text();
			console.log(text);
			cno = $(this).next().next().val();
			console.log(cno);
			
			// 부모의 하단에 댓글편집 창을 삽입
			var commentEditor = "<input type='hidden' name='cno' id='cno' value='" + cno + "'>"
					+ "<textarea class='form-control' rows='3' id='content2' name='content2'>"
					+ text
					+ "</textarea><br>"
					+ "&nbsp;<a class='btn btn-warning btn-xs' id='cUpdateBtn'><i class='fa fa-pencil'></i> Update</a>&nbsp;"
					+ "<a class='btn btn-default btn-xs' id='cCancelBtn'><i class='fa fa-trash-o'></i> Cancel</a>";
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
			var content2 = $(this).prev().prev().val();
			cno = $(this).prev().prev().prev().val();
			$.post('/update/comment', {
				"cno" : cno,
				"content2" : content2
			},
			function(data) {
				$('.list-group').load("/getCommentList/${issues.ino}");
			});
		});
	});
	
</script>
	<script type="application/javascript">
        $(document).ready(function () {
            $("#date-popover").popover({html: true, trigger: "manual"});
            $("#date-popover").hide();
            $("#date-popover").click(function (e) {
                $(this).hide();
            });
        
            $("#my-calendar").zabuto_calendar({
                action: function () {
                    return myDateFunction(this.id, false);
                },
                action_nav: function () {
                    return myNavFunction(this.id);
                }
            });
        });
        
        
        function myNavFunction(id) {
            $("#date-popover").hide();
            var nav = $("#" + id).data("navigation");
            var to = $("#" + id).data("to");
            console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
        }
    </script>