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
			<h3>NOTIFICATIONS</h3>

			<!-- First Action -->
			<div class="desc">
				<div class="thumb">
					<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
				</div>
				<div class="details">
					<p>
						<muted>2 Minutes Ago</muted>
						<br> <a href="#">James Brown</a> subscribed to your
						newsletter.<br>
					</p>
				</div>
			</div>
			<!-- Second Action -->
			<div class="desc">
				<div class="thumb">
					<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
				</div>
				<div class="details">
					<p>
						<muted>3 Hours Ago</muted>
						<br> <a href="#">Diana Kennedy</a> purchased a year
						subscription.<br>
					</p>
				</div>
			</div>
			<!-- Third Action -->
			<div class="desc">
				<div class="thumb">
					<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
				</div>
				<div class="details">
					<p>
						<muted>7 Hours Ago</muted>
						<br> <a href="#">Brandon Page</a> purchased a year
						subscription.<br>
					</p>
				</div>
			</div>
			<!-- Fourth Action -->
			<div class="desc">
				<div class="thumb">
					<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
				</div>
				<div class="details">
					<p>
						<muted>11 Hours Ago</muted>
						<br> <a href="#">Mark Twain</a> commented your post.<br>
					</p>
				</div>
			</div>
			<!-- Fifth Action -->
			<div class="desc">
				<div class="thumb">
					<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
				</div>
				<div class="details">
					<p>
						<muted>18 Hours Ago</muted>
						<br> <a href="#">Daniel Pratt</a> purchased a wallet in your
						store.<br>
					</p>
				</div>
			</div>

			<!-- CALENDAR-->
			<div id="calendar" class="mb">
				<div class="panel green-panel no-margin">
					<div class="panel-body">
						<div id="date-popover" class="popover top"
							style="cursor: pointer; margin-left: 33%; margin-top: -50px; width: 175px; display: none;"
							data-original-title="" title="">
							<div class="arrow"></div>
							<h3 class="popover-title" style="disadding: none;"></h3>
							<div id="date-popover-content" class="popover-content"></div>
						</div>
						<div id="zabuto_calendar_ojb">
							<div class="zabuto_calendar" id="zabuto_calendar_ojb">
								<table class="table">
									<tbody>
										<tr class="calendar-month-header">
											<th><div class="calendar-month-navigation"
													id="zabuto_calendar_ojb_nav-prev">
													<span><span
														class="fa fa-chevron-left text-transparent"></span></span>
												</div></th>
											<th colspan="5"><span>May 2016</span></th>
											<th><div class="calendar-month-navigation"
													id="zabuto_calendar_ojb_nav-next">
													<span><span
														class="fa fa-chevron-right text-transparent"></span></span>
												</div></th>
										</tr>
										<tr class="calendar-dow-header">
											<th>Mon</th>
											<th>Tue</th>
											<th>Wed</th>
											<th>Thu</th>
											<th>Fri</th>
											<th>Sat</th>
											<th>Sun</th>
										</tr>
										<tr class="calendar-dow">
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td id="zabuto_calendar_ojb_2016-05-01" class="dow-clickable"><div
													id="zabuto_calendar_ojb_2016-05-01_day" class="day">1</div></td>
										</tr>
										<tr class="calendar-dow">
											<td id="zabuto_calendar_ojb_2016-05-02" class="dow-clickable"><div
													id="zabuto_calendar_ojb_2016-05-02_day" class="day">2</div></td>
											<td id="zabuto_calendar_ojb_2016-05-03" class="dow-clickable"><div
													id="zabuto_calendar_ojb_2016-05-03_day" class="day">3</div></td>
											<td id="zabuto_calendar_ojb_2016-05-04" class="dow-clickable"><div
													id="zabuto_calendar_ojb_2016-05-04_day" class="day">4</div></td>
											<td id="zabuto_calendar_ojb_2016-05-05" class="dow-clickable"><div
													id="zabuto_calendar_ojb_2016-05-05_day" class="day">5</div></td>
											<td id="zabuto_calendar_ojb_2016-05-06" class="dow-clickable"><div
													id="zabuto_calendar_ojb_2016-05-06_day" class="day">6</div></td>
											<td id="zabuto_calendar_ojb_2016-05-07" class="dow-clickable"><div
													id="zabuto_calendar_ojb_2016-05-07_day" class="day">7</div></td>
											<td id="zabuto_calendar_ojb_2016-05-08" class="dow-clickable"><div
													id="zabuto_calendar_ojb_2016-05-08_day" class="day">8</div></td>
										</tr>
										<tr class="calendar-dow">
											<td id="zabuto_calendar_ojb_2016-05-09" class="dow-clickable"><div
													id="zabuto_calendar_ojb_2016-05-09_day" class="day">9</div></td>
											<td id="zabuto_calendar_ojb_2016-05-10" class="dow-clickable"><div
													id="zabuto_calendar_ojb_2016-05-10_day" class="day">10</div></td>
											<td id="zabuto_calendar_ojb_2016-05-11" class="dow-clickable"><div
													id="zabuto_calendar_ojb_2016-05-11_day" class="day">11</div></td>
											<td id="zabuto_calendar_ojb_2016-05-12" class="dow-clickable"><div
													id="zabuto_calendar_ojb_2016-05-12_day" class="day">12</div></td>
											<td id="zabuto_calendar_ojb_2016-05-13" class="dow-clickable"><div
													id="zabuto_calendar_ojb_2016-05-13_day" class="day">13</div></td>
											<td id="zabuto_calendar_ojb_2016-05-14" class="dow-clickable"><div
													id="zabuto_calendar_ojb_2016-05-14_day" class="day">14</div></td>
											<td id="zabuto_calendar_ojb_2016-05-15" class="dow-clickable"><div
													id="zabuto_calendar_ojb_2016-05-15_day" class="day">15</div></td>
										</tr>
										<tr class="calendar-dow">
											<td id="zabuto_calendar_ojb_2016-05-16" class="dow-clickable"><div
													id="zabuto_calendar_ojb_2016-05-16_day" class="day">16</div></td>
											<td id="zabuto_calendar_ojb_2016-05-17" class="dow-clickable"><div
													id="zabuto_calendar_ojb_2016-05-17_day" class="day">17</div></td>
											<td id="zabuto_calendar_ojb_2016-05-18" class="dow-clickable"><div
													id="zabuto_calendar_ojb_2016-05-18_day" class="day">18</div></td>
											<td id="zabuto_calendar_ojb_2016-05-19" class="dow-clickable"><div
													id="zabuto_calendar_ojb_2016-05-19_day" class="day">19</div></td>
											<td id="zabuto_calendar_ojb_2016-05-20" class="dow-clickable"><div
													id="zabuto_calendar_ojb_2016-05-20_day" class="day">20</div></td>
											<td id="zabuto_calendar_ojb_2016-05-21" class="dow-clickable"><div
													id="zabuto_calendar_ojb_2016-05-21_day" class="day">21</div></td>
											<td id="zabuto_calendar_ojb_2016-05-22" class="dow-clickable"><div
													id="zabuto_calendar_ojb_2016-05-22_day" class="day">22</div></td>
										</tr>
										<tr class="calendar-dow">
											<td id="zabuto_calendar_ojb_2016-05-23" class="dow-clickable"><div
													id="zabuto_calendar_ojb_2016-05-23_day" class="day">23</div></td>
											<td id="zabuto_calendar_ojb_2016-05-24" class="dow-clickable"><div
													id="zabuto_calendar_ojb_2016-05-24_day" class="day">24</div></td>
											<td id="zabuto_calendar_ojb_2016-05-25" class="dow-clickable"><div
													id="zabuto_calendar_ojb_2016-05-25_day" class="day">25</div></td>
											<td id="zabuto_calendar_ojb_2016-05-26" class="dow-clickable"><div
													id="zabuto_calendar_ojb_2016-05-26_day" class="day">26</div></td>
											<td id="zabuto_calendar_ojb_2016-05-27" class="dow-clickable"><div
													id="zabuto_calendar_ojb_2016-05-27_day" class="day">27</div></td>
											<td id="zabuto_calendar_ojb_2016-05-28" class="dow-clickable"><div
													id="zabuto_calendar_ojb_2016-05-28_day" class="day">28</div></td>
											<td id="zabuto_calendar_ojb_2016-05-29" class="dow-clickable"><div
													id="zabuto_calendar_ojb_2016-05-29_day" class="day">29</div></td>
										</tr>
										<tr class="calendar-dow">
											<td id="zabuto_calendar_ojb_2016-05-30" class="dow-clickable"><div
													id="zabuto_calendar_ojb_2016-05-30_day" class="day">30</div></td>
											<td id="zabuto_calendar_ojb_2016-05-31" class="dow-clickable"><div
													id="zabuto_calendar_ojb_2016-05-31_day" class="day">31</div></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
								<div class="legend" id="zabuto_calendar_ojb_legend">
									<span class="legend-text"><span
										class="badge badge-event">00</span> Special event</span><span
										class="legend-block"><ul class="legend">
											<li class="event"></li>
											<span>Regular event</span>
										</ul></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- / calendar -->

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

	$(document).on('click', '.post-description > #stat > a', function() {
		if ($(this).attr("name") == "pDel") {
			if (confirm("정말 삭제하시겠습니까?") == true) { //확인
				var cno = $(this).next().val();
				$.post('/remove/comment', {
					"cno" : cno
				}, function(data) {
					$('.list-group').load("/getCommentList/${issues.ino}");
				});
			} else {// 취소
				return;
			}
		} else if ($(this).attr("name") == "pEdit") {
			// 자기 부모의 tr을 알아낸다.
			var parentElement = $(this).parent().parent(); // <div class="post-description"> ... </div>
			
			// 기존 입력 되있던 댓글내용과 cno 추출
			var text = $(this).parent().prev().text();
			console.log(text);
			var cno = $(this).next().next().val();
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
			var cno = $(this).prev().prev().prev().val();
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