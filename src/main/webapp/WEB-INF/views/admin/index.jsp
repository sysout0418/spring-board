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
								<!-- label list -->

							</div>

							<!-- <div class=" add-task-row">
								<a class="btn btn-success btn-sm pull-left"
									href="todo_list.html#">Add New Tasks</a> <a
									class="btn btn-default btn-sm pull-right"
									href="todo_list.html#">See All Tasks</a>
							</div> -->
						</div>
						&nbsp;
						<button type="button" class="btn btn-warning" id="addLabelBtn"
							style="">Add Label</button>
						<button type="button" class="btn btn-theme" id="registLabelBtn"
							style="display: none;">Regist Label</button>
						<button type="button" class="btn btn-theme" id="saveLabelBtn"
							style="display: none;">Save Label</button>
						<button type="button" class="btn btn-theme" id="editLabelBtn"
							style="display: none;">Edit Label</button>
						<button type="button" class="btn btn-theme" id="deleteLabelBtn"
							style="display: none;">Delete Label</button>
						<button type="button" class="btn btn-theme" id="cancelLabelBtn"
							style="display: none;">Cancel</button>
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
	$(document).ready(function() {
		getLabelList();
	});

	function getLabelList() {
		$('.task-content').load("/getLabelList");
	}

	$(document).on('change', 'input.list-child', function() {
		if ($(this).is(':checked')) {
			$(this).parents('li').addClass("task-done");
		} else {
			$(this).parents('li').removeClass("task-done");
		}

		var chk = document.getElementsByName("checkList");
		var checkCnt = 0; // 체크된 체크박스의 개수
		for (var i = 0; i < chk.length; i++) {
			if (chk[i].checked == true) {
				checkCnt++;
			}
		}

		if (checkCnt == 1) {
			$('#addLabelBtn').attr('style', 'display: none;');
			$('#registLabelBtn').attr('style', 'display: none;');
			$('#newLabelForm').attr('style', 'display: none;');

			$('#editLabelBtn').attr('style', 'display: "";');
			$('#deleteLabelBtn').attr('style', 'display: "";');
			$('#cancelLabelBtn').attr('style', 'display: "";');
		} else if (checkCnt > 1) {
			$('#addLabelBtn').attr('style', 'display: none;');
			$('#registLabelBtn').attr('style', 'display: none;');
			$('#newLabelForm').attr('style', 'display: none;');
			$('#editLabelBtn').attr('style', 'display: none;');

			$('#deleteLabelBtn').attr('style', 'display: "";');
			$('#cancelLabelBtn').attr('style', 'display: "";');
		} else {
			$('#editLabelBtn').attr('style', 'display: none;');
			$('#deleteLabelBtn').attr('style', 'display: none;');
			$('#registLabelBtn').attr('style', 'display: none;');
			$('#newLabelForm').attr('style', 'display: none;');
			$('#cancelLabelBtn').attr('style', 'display: none;');

			$('#addLabelBtn').attr('style', 'display: "";');
		}
	});

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

		$('#addLabelBtn').click(function() {
			$('#addLabelBtn').attr('style', 'display: none;');

			$('#registLabelBtn').attr('style', 'display: ""');
			$('#newLabelForm').attr('style', 'display: ""');
			$('#cancelLabelBtn').attr('style', 'display: ""');
		});

		$('#cancelLabelBtn').click(function() {
			getLabelList();
			$('#addLabelBtn').attr('style', 'display: "";');

			$('#registLabelBtn').attr('style', 'display: none;');
			$('#editLabelBtn').attr('style', 'display: none;');
			$('#deleteLabelBtn').attr('style', 'display: none;');
			$('#newLabelForm').attr('style', 'display: none;');
			$('#cancelLabelBtn').attr('style', 'display: none;');
		});

		$('#registLabelBtn').click(function() {
			// rgb 정규표현식
			var rgbExp = /#[0-9a-zA-F]{6}/;

			// 라벨 내용이 필수이므로 검사
			if ($('#labelTitle').val() == "") {
				alert("라벨 이름이 없습니다.. 입력하세요!");
				$('#labelTitle').focus();
				return;
			} else if ($('#labelColor').val() == "") {
				alert("라벨 색상이 없습니다.. 입력하세요!");
				$('#labelColor').focus();
				return;
			} else if (!rgbExp.test($('#labelColor').val())) {
				alert("라벨 색상은 RGB 색상표 규칙을 따라야 합니다. \n ex) #FF00FF");
				return;
			}

			// 버튼 중복 클릭 방지
			$('#registLabelBtn').attr('disabled', 'disabled');

			// ajax로 label 등록
			$.post('/label/regist', {
				lTitle : $('#labelTitle').val(),
				lBgColor : $('#labelColor').val()
			}, function(data) {
				// 내용 비우기
				$('#labelTitle').val("");
				$('#labelColor').val("");

				// 다시 클릭이 가능하게끔
				$('#registLabelBtn').attr("disabled", false);

				// display control
				$('#registLabelBtn').attr('style', 'display: none;');
				$('#newLabelForm').attr('style', 'display: none;');
				$('#cancelLabelBtn').attr('style', 'display: none;');
				$('#addLabelBtn').attr('style', 'display: ""');

				// 입력이 완료가 됐으므로 다시 리스트 불러오기
				getLabelList();
			});
		});

		$('#editLabelBtn').click(function() {
			var lno = '';
			var lTitleAndlBgColor = '';
			var lTitle = '';
			var lBgColor = '';
			
			$(document).ready(function() {
				if ($('input:checkbox[name="checkList"]').is(":checked")) {
					$('input[name="checkList"]:checked').each(function(i) {
						// 현재 체크된 체크박스의 li를 찾는다
						var li = $(this).parent().parent();
						
						// ltitle과 lbgcolor을 찾는다
						lTitleAndlBgColor = $(this).parent().next().children().attr('alt');
						
						// 찾은 ltitle과 lbgcolor을 변수에 저장
						lBgColor = lTitleAndlBgColor.substring(0, 7);
						lTitle = lTitleAndlBgColor.substring(7, lTitleAndlBgColor.length);
						
						// 현재 체크된 체크박스의 li를 없앤다
						li.empty();
						
						// 라벨 수정폼을 append한다.
						li.append('<div class="form-inline">'
								+ '<div class="form-group"><label class="sr-only" for="labelTitle">Label Title</label>'
								+ '<input type="text" class="form-control" id="labelTitle2" placeholder="Label Title" value="' + lTitle + '" maxlength="15"></div>'
								+ '&nbsp;&nbsp;&nbsp;'
								+ '<div class="form-group"><label class="sr-only" for="labelColor">Label Color</label>'
								+ '<input type="text" class="form-control" id="labelColor2" placeholder="Label Color" value="' + lBgColor + '" maxlength="7"></div></div>');
						
						// edit 버튼과 delete 버튼을 숨기고 save 버튼을 나타낸다
						$('#editLabelBtn').attr('style', 'display: none;');
						$('#deleteLabelBtn').attr('style', 'display: none;');
						$('#saveLabelBtn').attr('style', 'display: "";');
						
						// 현재 체크된 체크박스의 lno를 변수에 저장
						lno = $(this).val();
						
						// saveLabelBtn 클릭시 label update
						$('#saveLabelBtn').click(function() {
							// rgb 정규표현식
							var rgbExp = /#[0-9a-zA-F]{6}/;
							
							// 라벨 내용이 필수이므로 검사
							if ($('#labelTitle2').val() == "") {
								alert("라벨 이름이 없습니다.. 입력하세요!");
								$('#labelTitle2').focus();
								return;
							} else if ($('#labelColor2').val() == "") {
								alert("라벨 색상이 없습니다.. 입력하세요!");
								$('#labelColor2').focus();
								return;
							} else if (!rgbExp.test($('#labelColor2').val())) {
								alert("라벨 색상은 RGB 색상표 규칙을 따라야 합니다. \n ex) #FF00FF");
								return;
							}

							// 버튼 중복 클릭 방지
							$('#saveLabelBtn').attr('disabled', 'disabled');
							
							// ajax 통신으로 label update
							$.post('/label/update', {
								"lno" : lno,
								"lTitle" : $('#labelTitle2').val(),
								"lBgColor" : $('#labelColor2').val()
							},
							function(data) {
								getLabelList();
								$('#addLabelBtn').attr('style', 'display: "";');
								
								$('#saveLabelBtn').attr('style', 'display: none;');
								$('#cancelLabelBtn').attr('style', 'display: none;');
							});
						});
					});
				}
			});
		});

		$('#deleteLabelBtn').click(function() {
			$(document).ready(function() {
				if (confirm("정말로 선택하신 Label을 삭제하시겠습니까?")) {
					if ($('input:checkbox[name="checkList"]').is(":checked")) {
						// 체크한 lno list
						var lnoList = [];
						
						// for문 돌면서 체크한 lno value값을 배열변수에 저장
						$('input[name="checkList"]:checked').each(function(i) {
							lnoList.push($(this).val());
						});
						
						// 유니크한 배열로 만듬
						var uniqueLnoList = lnoList.reduce(function(a, b) {
							if (a.indexOf(b) < 0)
								a.push(b);
							return a;
						}, []);
						
						// 체크박스 값들(배열)을 name/value 형태로 담는다.
						var allData = {
							"checkArray" : uniqueLnoList
						};
						
						// ajax 통신으로 label 삭제
						$.ajax({
							url : "/label/delete",
							type : 'GET',
							data : allData,
							success : function(data) {
								getLabelList();
								$('#editLabelBtn').attr('style', 'display: none;');
								$('#deleteLabelBtn').attr('style', 'display: none;');
								$('#cancelLabelBtn').attr('style', 'display: none;');
								$('#addLabelBtn').attr('style', 'display: "";');
							},
							error : function(jqXHR, textStatus, errorThrown) {
								alert("에러 발생이군? \n" + textStatus + " : " + errorThrown);
							}
						});
					}
				} else {
					return;
				}
			});
		});

	});
</script>