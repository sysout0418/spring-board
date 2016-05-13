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
				<div class="col-md-12">
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
				
				<!-- 라벨 설정 ui -->
				<div class="col-md-12 mt">
					<div class="content-panel tasks-widget">
						<h4>
							<i class="fa fa-angle-right"></i> Label 관리
						</h4>
						<hr>
						<div class="panel-body">
							<div class="task-content">
								<!-- label list -->
							</div>
						</div>
						&nbsp;
						<button type="button" class="btn btn-warning" id="addLabelBtn"
							data-toggle="modal" data-target="#myModal" style="">Add
							Label</button>
						<button type="button" class="btn btn-theme" id="editLabelBtn"
							style="display: none;" data-toggle="modal" data-target="#myModal2">Edit Label</button>
						<button type="button" class="btn btn-theme" id="deleteLabelBtn"
							style="display: none;">Delete Label</button>
						<button type="button" class="btn btn-theme" id="cancelLabelBtn"
							style="display: none;">Cancel</button>
					</div>
				</div>
				<!-- // 라벨 설정 UI -->
				
			</div>
			<!-- /row -->
		</div>
	</section>
</section>
<!-- /MAIN CONTENT -->

<!--main content end-->

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true"
	style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">Label 등록</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label class="sr-only" for="labelTitle">Label Title</label> <input
						type="text" class="form-control" id="labelTitle"
						placeholder="Label Title" maxlength="15">
				</div>
				<!-- color picker -->
				<div class="form-group">
					<label for="wheel-demo">Label Color</label> <input type="text"
						id="wheel-demo" class="form-control demo" data-control="wheel"
						value="#ff99ee">
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" id="registLabelBtn" class="btn btn-primary"
					data-dismiss="modal">Regist</button>
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
				<h4 class="modal-title" id="myModalLabel">Label 수정</h4>
			</div>
			<div class="modal-body">
				<input type="hidden" id="lnoForUpdate" name="lnoForUpdate" value="">
				<div class="form-group">
					<label class="sr-only" for="labelTitle">Label Title</label>
					<input type="text" class="form-control" id="labelTitle2" placeholder="Label Title" maxlength="15">
				</div>
				<!-- color picker -->
				<div class="form-group">
					<label for="wheel-demo">Label Color</label> <input type="text"
						id="wheel-demo2" class="form-control demo" data-control="wheel"
						value="">
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" id="updateLabelBtn" class="btn btn-primary"
					data-dismiss="modal">Update</button>
			</div>
		</div>
	</div>
</div>

<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />
<script type="text/javascript">
	// color picker
	$(function() {
		var colpick = $('.demo').each(function() {
			$(this).minicolors({
				control : $(this).attr('data-control') || 'hue',
				inline : $(this).attr('data-inline') === 'true',
				letterCase : 'lowercase',
				opacity : false,
				change : function(hex, opacity) {
					if (!hex)
						return;
					if (opacity)
						hex += ', ' + opacity;
					try {
						console.log(hex);
					} catch (e) {
					}
					$(this).select();
				},
				theme : 'bootstrap'
			});
		});

		var $inlinehex = $('#inlinecolorhex h3 small');
		$('#inlinecolors').minicolors({
			inline : true,
			theme : 'bootstrap',
			change : function(hex) {
				if (!hex)
					return;
				$inlinehex.html(hex);
			}
		});
	});
	//////////////////////////////////////////////////////

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

			$('#editLabelBtn').attr('style', 'display: "";');
			$('#deleteLabelBtn').attr('style', 'display: "";');
			$('#cancelLabelBtn').attr('style', 'display: "";');
		} else if (checkCnt > 1) {
			$('#addLabelBtn').attr('style', 'display: none;');
			$('#editLabelBtn').attr('style', 'display: none;');

			$('#deleteLabelBtn').attr('style', 'display: "";');
			$('#cancelLabelBtn').attr('style', 'display: "";');
		} else {
			$('#editLabelBtn').attr('style', 'display: none;');
			$('#deleteLabelBtn').attr('style', 'display: none;');
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
		
		// 실행 취소버튼
		$('#cancelLabelBtn').click(function() {
			getLabelList();
			$('#addLabelBtn').attr('style', 'display: "";');

			$('#registLabelBtn').attr('style', 'display: none;');
			$('#saveLabelBtn').attr('style', 'display: none;');
			$('#saveLabelBtn2').attr('style', 'display: none;');
			$('#editLabelBtn').attr('style', 'display: none;');
			$('#deleteLabelBtn').attr('style', 'display: none;');
			$('#newLabelForm').attr('style', 'display: none;');
			$('#cancelLabelBtn').attr('style', 'display: none;');
		});
		
		// 라벨 등록 버튼
		$('#registLabelBtn').click(function() {
			// 유효성 체크
			if ($('#labelTitle').val() == "") {
				alert("라벨 이름이 없습니다.. 입력하세요!");
				$('#labelTitle').focus();
				return;
			} else if ($('#wheel-demo').val() == "") {
				alert("라벨 색상이 없습니다.. 입력하세요!");
				$('#wheel-demo').focus();
				return;
			}
			
			// ajax로 label 등록
			$.post('/label/regist', {
				lTitle : $('#labelTitle').val(),
				lBgColor : $('#wheel-demo').val()
			}, function(data) {
				// 내용 초기화
				$('#labelTitle').val("");
				$('#wheel-demo').val("#ff99ee");
				$('.minicolors-swatch > .minicolors-swatch-color').attr('style', 'background-color: #ff99ee;');

				// 입력이 완료가 됐으므로 다시 리스트 불러오기
				getLabelList();
			});
		});
		
		// 라벨 수정폼 여는 버튼
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

						// 찾은 lno, ltitle, lbgcolor 변수에 저장
						lno = $(this).val();
						lBgColor = lTitleAndlBgColor.substring(0, 7);
						lTitle = lTitleAndlBgColor.substring(7, lTitleAndlBgColor.length);
					});
				}
			});
			
			$('#lnoForUpdate').val(lno);
			$('#labelTitle2').val(lTitle);
			$('#wheel-demo2').val(lBgColor);
			$('.minicolors-swatch > .minicolors-swatch-color').attr('style', 'background-color: ' + lBgColor + ";");
		});
		
		// 라벨 수정 버튼
		$('#updateLabelBtn').click(function() {
			// 유효성 체크
			if ($('#labelTitle2').val() == "") {
				alert("라벨 이름이 없습니다.. 입력하세요!");
				$('#labelTitle2').focus();
				return;
			} else if ($('#wheel-demo2').val() == "") {
				alert("라벨 색상이 없습니다.. 입력하세요!");
				$('#wheel-demo2').focus();
				return;
			}
			
			// ajax로 label 등록
			$.post('/label/update', {
				lno : $('#lnoForUpdate').val(),
				lTitle : $('#labelTitle2').val(),
				lBgColor : $('#wheel-demo2').val()
			}, function(data) {
				// 내용 초기화
				$('#labelTitle2').val("");
				$('#wheel-demo2').val("");
				//$('.minicolors-swatch > .minicolors-swatch-color').attr('style', 'background-color: #ff99ee;');

				// 입력이 완료가 됐으므로 다시 리스트 불러오기
				getLabelList();
			});
		});
		
		// 선택한 라벨 삭제 버튼
		$('#deleteLabelBtn').click(function() {
			$(document).ready(function() {
				if(confirm('정말로 선택하신 라벨을 삭제 하시겠습니까?')) {
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
								$('#addLabelBtn').attr('style','display: "";');
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
		
		// 라벨 수정 폼 열기2
		$(document).on('click', '#editLabelBtn2', function() {
			var labelInfo = $(this).attr('alt');
			var labelInfoToArray = labelInfo.split(",");
			
			$('#lnoForUpdate').val(labelInfoToArray[0]);
			$('#labelTitle2').val(labelInfoToArray[1]);
			$('#wheel-demo2').val(labelInfoToArray[2]);
			$('.minicolors-swatch > .minicolors-swatch-color').attr('style', 'background-color: ' + labelInfoToArray[2] + ";");
		});
		
		// 라벨 삭제2
		$(document).on('click', '#deleteLabelBtn2', function() {
			var lno = $(this).attr('alt');
			if(confirm('정말로 이 라벨을 삭제 하시겠습니까?')) {
				var lnoList = [];
				lnoList.push(lno);
				
				var allData = {
					"checkArray" : lnoList
				};
				// ajax 통신으로 label 삭제
				$.ajax({
					url : "/label/delete",
					type : 'GET',
					data : allData,
					success : function(data) {
						getLabelList();
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert("에러 발생이군? \n" + textStatus + " : " + errorThrown);
					}
				});
			} else {
				return;
			}
		});
	});
</script>