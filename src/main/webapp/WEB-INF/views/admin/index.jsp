<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header2_header.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header3_menu_dash.jsp" />

<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper site-min-height">
		<h3>
			<i class="fa fa-angle-right"></i> Admin
		</h3>
		<div class="col-lg-12">
			<div class="row">
				<!-- 라벨 설정 ui -->
				<div class="col-md-12">
					<div class="content-panel tasks-widget">
						<h4>
							<i class="fa fa-angle-right"></i> Label 목록
						</h4>
						<hr>
						<div class="panel-body">
							<div class="task-content">

								<ul class="task-list">
									<c:forEach var="label" items="${labelList}">
										<li class="">
											<div class="task-checkbox">
												<input type="checkbox" class="list-child"
													value="${label.lno}" name="checkList">
											</div>
											<div class="task-title">
												<%-- <span class="task-title-sp">${label.ltitle}</span> --%>
												<!-- <span class="badge bg-important">Now</span> -->
												<span class="label color-label has_tooltip task-title-sp"
													style="background-color:
															${label.lbgcolor}; color: #FFFFFF"
													title="" data-container="body" data-original-title="">${label.ltitle}</span>
												<div class="pull-right">
													<!-- <button class="btn btn-success btn-xs">
														<i class=" fa fa-check"></i>
													</button> -->
													<button class="btn btn-primary btn-xs">
														<i class="fa fa-pencil"></i>
													</button>
													<button class="btn btn-danger btn-xs">
														<i class="fa fa-trash-o "></i>
													</button>
												</div>
											</div>
										</li>
									</c:forEach>
									<li id="newLabelForm" style="display: none;">
										<div class="form-inline">
											<div class="form-group">
												<label class="sr-only" for="labelTitle">Label Title</label>
												<input type="text" class="form-control"
													id="labelTitle" placeholder="Label Title" maxlength="15">
											</div>&nbsp;&nbsp;&nbsp;
											<div class="form-group">
												<label class="sr-only" for="labelColor">Label Color</label>
												<input type="text" class="form-control"
													id="labelColor" placeholder="Label Color" maxlength="6">
											</div>
										</div>
									</li>
								</ul>
							</div>

							<!-- <div class=" add-task-row">
								<a class="btn btn-success btn-sm pull-left"
									href="todo_list.html#">Add New Tasks</a> <a
									class="btn btn-default btn-sm pull-right"
									href="todo_list.html#">See All Tasks</a>
							</div> -->
						</div>
						&nbsp;<button type="button" class="btn btn-warning" id="addLabelBtn" style="">Add Label</button>
						&nbsp;<button type="button" class="btn btn-theme" id="saveLabelBtn" style="display: none;">Save Label</button>
						&nbsp;<button type="button" class="btn btn-theme" id="editLabelBtn" style="display: none;">Edit Label</button>
						&nbsp;<button type="button" class="btn btn-theme" id="deleteLabelBtn" style="display: none;">Delete Label</button>
					</div>
				</div>
				<!-- // 라벨 설정 UI -->

				<div class="col-md-12 mt">
					<div class="content-panel">
						<h4>
							<i class="fa fa-angle-right"></i> 신규 가입회원
						</h4>
						&nbsp;총 회원 수 ${countUsers}명
						<hr>
						<form id="frm" name="frm" method="post">
							<input type="hidden" name="uno" id="uno" value="" />
							<table class="table table-hover">
								<thead>
									<tr>
										<th>#</th>
										<th>이름</th>
										<th>휴대폰 번호</th>
										<th>부서</th>
										<th>이메일</th>
										<th>가입일</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${user}" var="user">
										<tr>
											<td>${user.rownum1}</td>
											<td>${user.uname}</td>
											<td>${user.uphoneno}</td>
											<td>${user.udepartment}</td>
											<td>${user.uemail}</td>
											<td>${user.uregdate}</td>
											<td><a href="#" id="getUserNo"
												class="btn btn-primary btn-xs" role="button"
												alt="${user.uno}"><i class="fa fa-pencil"></i></a> <a
												href="#" id="del" class="btn btn-danger btn-xs"
												role="button" alt="${user.uno}"><i
													class="fa fa-trash-o "></i></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</form>
						&nbsp;<a class="btn btn-warning" href="/admin/users" role="button">View
							all users</a>
					</div>
					<!-- /content-panel -->
				</div>
				<!-- /col-md-12 -->
				<div class="col-md-12 mt">
					<div class="content-panel">
						<h4>
							<i class="fa fa-angle-right"></i> 신규 프로젝트
						</h4>
						&nbsp;총 프로젝트 수 ${countProjects}개
						<hr>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>#</th>
									<th>프로젝트명</th>
									<th>등록일</th>
									<th>만기일</th>
									<th>담당자</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${project}" var="project">
									<tr>
										<td>${project.rownum2}</td>
										<td>${project.pname}</td>
										<td>${project.pregdate}</td>
										<td>${project.pduedate}</td>
										<td>${project.uname}</td>
										<td><a href="/${project.uno}/${project.pno}"
											class="btn btn-success btn-xs" role="button"><i
												class="fa fa-check"></i></a> <a
											href="/update?pno=${project.pno}"
											class="btn btn-primary btn-xs" role="button"><i
												class="fa fa-pencil"></i></a> <a
											href="/DeleteProject?pno=${project.pno}"
											class="btn btn-danger btn-xs" role="button"><i
												class="fa fa-trash-o "></i></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						&nbsp;<a class="btn btn-warning" href="/admin/projects"
							role="button">View all projects</a>
					</div>
					<!-- /content-panel -->
				</div>
				<!-- /col-md-12 -->
			</div>
			<!-- /row -->
		</div>
	</section>
</section>
<!-- /MAIN CONTENT -->

<!--main content end-->
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />
<script>
	$(function() {
		var f = document.frm;

		$('#del').bind('click', function() {
			console.log($(this).attr('alt'));
			$('#uno').val($(this).attr('alt'));
			if (confirm("정말로 해당 회원을 탈퇴 처리 하시겠습니까?")) {
				f.action = "/admin/users/delete";
				f.submit();
			}
		});

		$('#getUserNo').bind('click', function() {
			var uno = $(this).attr("alt");
			console.log(uno);
			f.action = "/admin/users/editForm/" + uno;
			f.submit();
		});

		$('input.list-child').change(function() {
			console.log(1);
			if ($(this).is(':checked')) {
				console.log(2);
				$(this).parents('li').addClass("task-done");
				console.log(3);
			} else {
				console.log(4);
				$(this).parents('li').removeClass("task-done");
			}
		});
		
		$('#addLabelBtn').click(function() {
			$('#addLabelBtn').attr('style', 'display: none;');
			
			$('#saveLabelBtn').attr('style', 'display: ""');
			$('#newLabelForm').attr('style', 'display: ""');
		});
		
		$('#saveLabelBtn').click(function() {
			$('#saveLabelBtn').attr('style', 'display: none;');
			$('#newLabelForm').attr('style', 'display: none;');
			
			$('#addLabelBtn').attr('style', 'display: ""');
		});
		
		$('input:name["checkList"]').click(function() {
			$('#addLabelBtn').attr('style', 'display: none;');
			$('#saveLabelBtn').attr('style', 'display: none;');
			$('#newLabelForm').attr('style', 'display: none;');
			
			$('#editLabelBtn').attr('style', 'display: none;');
			$('#deleteLabelBtn').attr('style', 'display: none;');
		});
	});
</script>