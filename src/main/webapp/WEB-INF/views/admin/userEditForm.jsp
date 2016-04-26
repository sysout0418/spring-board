<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header2_header.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header3_menu_dash.jsp" />
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper site-min-height">
		<form class="form-horizontal" name="frm" id="frm" method="post" action="/admin/users/edit">
			<input type="hidden" id="uno" name="uno" value="${userInfo.uno}">
			<c:choose>
				<c:when test="${userInfo.enabled == 1}">
					<input type="hidden" id="checkAdmit" name="checkAdmit" value="1">
				</c:when>
				<c:otherwise>
					<input type="hidden" id="checkAdmit" name="checkAdmit" value="0">
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${userInfo.expired == 'Y'}">
					<input type="hidden" id="checkExpired" name="checkExpired" value="Y">
				</c:when>
				<c:otherwise>
					<input type="hidden" id="checkExpired" name="checkExpired" value="N">
				</c:otherwise>
			</c:choose>
			<fieldset>
				<h3>
					<i class="fa fa-angle-right"></i> User Edit
				</h3>
				<div class="col-lg-12">
    			<div class="row">
            		<div class="col-md-12">
                		<div class="content-panel">
				<div class="form-group">
					<label for="inputEmail" class="col-lg-2 control-label">이메일(ID)</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="uemail"
							readonly="readonly" value="${userInfo.uemail}">
					</div>
				</div>

				<div class="form-group">
					<label for="inputName" class="col-lg-2 control-label">이름</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="uname" name="uname"
							value="${userInfo.uname}">
					</div>
				</div>

				<div class="form-group">
					<label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰
						번호</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="uphoneno" name="uphoneno"
							value="${userInfo.uphoneno}">
					</div>
				</div>

				<div class="form-group">
					<label for="select" class="col-lg-2 control-label">부서</label>
					<div class="col-lg-10">
						<select class="form-control" id="udepartment" name="udepartment">
							<c:forEach var="depart" items="${departmentList}">
								<option
									<c:if test="${userInfo.udepartmentName == depart.CODE_NAME}">selected="selected"</c:if> value="${depart.CODE}">${depart.CODE_NAME}</option>
							</c:forEach>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label for="select" class="col-lg-2 control-label">권한</label>
					<div class="col-lg-10">
						<select class="form-control" id="authority" name="authority">
							<c:forEach var="authority" items="${authorityList}">
								<c:choose>
									<c:when test="${authority.authority == 'ROLE_USER'}">
										<option
											<c:if test="${userInfo.authority == authority.authority}">selected="selected"</c:if>>일반
											회원</option>
									</c:when>
									<c:when test="${authority.authority == 'ROLE_MANAGER'}">
										<option
											<c:if test="${userInfo.authority == authority.authority}">selected="selected"</c:if>>프로젝트
											매니저</option>
									</c:when>
									<c:otherwise>
										<option
											<c:if test="${userInfo.authority == authority.authority}">selected="selected"</c:if>>관리자</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label for="inputEmail" class="col-lg-2 control-label">가입
						승인 상태</label>
					<div class="col-lg-10" id="isAdmit">
						<c:choose>
							<c:when test="${userInfo.enabled == 1}">
								<a href="#" id="deny" class="btn btn-success btn-xs"
									alt="${userInfo.uno}">승인</a>
							</c:when>
							<c:otherwise>
								<a href="#" id="admit" class="btn btn-warning btn-xs"
									alt="${userInfo.uno}">미승인</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

				<div class="form-group">
					<label for="inputEmail" class="col-lg-2 control-label">탈퇴
						여부</label>
					<div class="col-lg-10" id="isDel">
						<c:choose>
							<c:when test="${userInfo.expired == 'Y'}">
								<a href="#" id="reco" class="btn btn-info btn-xs"
									alt="${userInfo.uno}">Y</a>
							</c:when>
							<c:otherwise>
								<a href="#" id="del" class="btn btn-danger btn-xs"
									alt="${userInfo.uno}">N</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

				<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2">
						<button type="reset" class="btn btn-default"
							onclick="history.back(-1)">Cancel</button>
						<button type="submit" class="btn btn-primary">Submit</button>
					</div>
				</div>
				</div>
				</div>
				</div>
				</div>
			</fieldset>
		</form>
	</section>
</section>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />
<script type="text/javascript">
$(function() {
	$(document).on("click", "#del", function() {
		console.log($(this).attr('alt'));
		$('#uno').val($(this).attr('alt'));
		if (confirm("정말로 해당 회원을 탈퇴 처리 하시겠습니까?")) {
			//f.action = "/admin/users/delete";
			//f.submit();
			$('#isDel').empty();
			$('#isDel').append('<a href="#" id="reco" class="btn btn-info btn-xs" alt="${userInfo.uno}">Y</a>');
			$('#checkExpired').val("Y");
		}
	});
	
	$(document).on("click", "#reco", function() {
		console.log($(this).attr('alt'));
		$('#uno').val($(this).attr('alt'));
		if (confirm("정말로 해당 회원을 복구 처리 하시겠습니까?")) {
			//f.action = "/admin/users/recover";
			//f.submit();
			$('#isDel').empty();
			$('#isDel').append('<a href="#" id="del" class="btn btn-danger btn-xs" alt="${userInfo.uno}">N</a>');
			$('#checkExpired').val("N");
		}
	});
	
	$(document).on("click", "#admit", function() {
		console.log($(this).attr('alt'));
		$('#uno').val($(this).attr('alt'));
		if (confirm("해당 회원을 가입 승인 처리 하시겠습니까?")) {
			//f.action = "/admin/users/admit";
			//f.submit();
			$('#isAdmit').empty();
			$('#isAdmit').append('<a href="#" id="deny" class="btn btn-success btn-xs" alt="${userInfo.uno}">승인</a>');
			$('#checkAdmit').val("1");
		}
	});
	
	$(document).on("click", "#deny", function() {
		console.log($(this).attr('alt'));
		$('#uno').val($(this).attr('alt'));
		if (confirm("해당 회원을 가입 거절 처리 하시겠습니까?")) {
			//f.action = "/admin/users/deny";
			//f.submit();
			$('#isAdmit').empty();
			$('#isAdmit').append('<a href="#" id="admit" class="btn btn-warning btn-xs" alt="${userInfo.uno}">미승인</a>');
			$('#checkAdmit').val("0");
		}
	});
});

$(function() {
	var f = document.frm;
	
	/* $('#del').bind('click', function() {
		console.log($(this).attr('alt'));
		$('#uno').val($(this).attr('alt'));
		if (confirm("정말로 해당 회원을 탈퇴 처리 하시겠습니까?")) {
			//f.action = "/admin/users/delete";
			//f.submit();
			$('#isDel').empty();
			$('#isDel').append('<a href="#" id="reco" class="btn btn-info btn-xs" alt="${userInfo.uno}">Y</a>');
		}
	}); */
	
	/* $('#reco').bind('click', function() {
		console.log($(this).attr('alt'));
		$('#uno').val($(this).attr('alt'));
		if (confirm("정말로 해당 회원을 복구 처리 하시겠습니까?")) {
			//f.action = "/admin/users/recover";
			//f.submit();
			$('#isDel').empty();
			$('#isDel').append('<a href="#" id="del" class="btn btn-danger btn-xs" alt="${userInfo.uno}">N</a>');
		}
	}); */
	
	/* $('#admit').bind('click', function() {
		console.log($(this).attr('alt'));
		$('#uno').val($(this).attr('alt'));
		if (confirm("해당 회원을 가입 승인 처리 하시겠습니까?")) {
			//f.action = "/admin/users/admit";
			//f.submit();
			$('#isAdmit').empty();
			$('#isAdmit').append('<a href="#" id="deny" class="btn btn-success btn-xs" alt="${userInfo.uno}">승인</a>');
		}
	}); */
	
	/* $('#deny').bind('click', function() {
		console.log($(this).attr('alt'));
		$('#uno').val($(this).attr('alt'));
		if (confirm("해당 회원을 가입 거절 처리 하시겠습니까?")) {
			//f.action = "/admin/users/deny";
			//f.submit();
			$('#isAdmit').empty();
			$('#isAdmit').append('<a href="#" id="admit" class="btn btn-warning btn-xs" alt="${userInfo.uno}">미승인</a>');
		}
	}); */
	
});
</script>