<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:useBean id="pageBean"
	class="com.nbreds.projectPlanning.common.util.PageBean" scope="request" />
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
			<i class="fa fa-angle-right"></i> All Projects
		</h3>
		<div class="col-lg-12">
			<div class="row">
				<div class="col-md-12">
					<div class="content-panel">
						&nbsp;총 프로젝트 수 ${countProjects}개
						<hr>
						<form name="frm" id="frm" method="post">
							<div class="form-inline">
								<select class="form-control" id="group" name="key">
									<option value="all" <%=pageBean.getKey("all")%>>모두</option>
									<option value="pname" <%=pageBean.getKey("pname")%>>프로젝트명</option>
									<option value="uname" <%=pageBean.getKey("uname")%>>담당자</option>
								</select> <input type="text" class="form-control" placeholder="Search"
									name="word" id="word" value="${pageBean.word}">
								<button type="button" class="btn btn-warning"
									onclick="javascript:pagelist(1)">검색</button>
							</div>
							<br> <input type="hidden" name="pageNo" id="pageNo"
								value="${pageBean.pageNo}" />
							<table class="table table-hover">
								<thead>
									<tr>
										<th><input type="checkbox" id="allCheck"></th>
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
											<td><input type="checkbox" value="${project.pno}"
												id="pno" name="pno"></td>
											<td><a href="/${project.uno}/${project.pno}">${project.pname}</a></td>
											<td>${project.pregdate}</td>
											<td>${project.pduedate}</td>
											<td>${project.uname}</td>
											<td><a href="/${project.uno}/${project.pno}"
												class="btn btn-success btn-xs" role="button">
												<i class="fa fa-check"></i></a>
												<a href="/update/${project.pno}"
												class="btn btn-primary btn-xs" role="button">
												<i class="fa fa-pencil"></i></a>
												<a href="#" alt="/DeleteProject?pno=${project.pno}" id="prjDelBtn"
												class="btn btn-danger btn-xs" role="button" data-toggle="modal" data-target="#myModal">
												<i class="fa fa-trash-o "></i></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							&nbsp;
							<button type="button" class="btn btn-theme03" onclick="delList()">선택삭제</button>
							<!-- 페이징 -->
							<div align="center">${pageBean.pagelink}</div>
						</form>
					</div>
					<!-- /content-panel -->
				</div>
				<!-- /col-md-12 -->
			</div>
			<!-- /row -->
		</div>
	</section>
	<!--wrapper -->
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
				<h4 class="modal-title" id="myModalLabel">Warning</h4>
			</div>
			<div class="modal-body">
				<p>해당 프로젝트를 삭제 하시겠습니까?</p>
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
				<p>삭제할 프로젝트를 선택하세요.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />
<script type="text/javascript">
	function pagelist(page) {
		$("#pageNo").val(page);
		$("#frm").get(0).action = "/admin/projects";
		$("#frm").get(0).submit();
	}

	$(function() {
		$("#allCheck").click(function() {
			if ($("#allCheck").prop("checked")) {
				$("input[type=checkbox]").prop("checked", true);
			} else {
				$("input[type=checkbox]").prop("checked", false);
			}
		})
	})

	$(document).on('click', '#prjDelBtn', function() {
		var delUrl = $(this).attr('alt');
		$('#okBtn').click(function() {
			location.href = delUrl;
		});
	});
	
	function delList() {
		var f = document.frm;
		var items = "";

		if (!f.pno)
			return false;

		if (typeof (f.pno.length) == "undefined") {
			if (f.pno.checked)
				items = f.pno.value;
		} else {
			for (var i = 0; i < f.pno.length; i++) {
				if (f.pno[i].checked) {
					items += ((items) ? "," : "") + f.pno[i].value;
				}
			}
		}

		if (items == "") {
			$('#myModal2').modal('show');
		} else {
			$('#myModal').modal('show');
			$('#okBtn').click(function() {
				f.action = "/admin/projects/delete";
				f.submit();
			});
		}
	}
</script>